//Get Player Input
key_Left = keyboard_check(vk_left);
key_Right = keyboard_check(vk_right);
key_Jump = 0;
if(keyboard_check_pressed(vk_space)) {
	key_Jump = keyboard_check_pressed(vk_space);
} else if(keyboard_check_pressed(vk_up)) {
	key_Jump = keyboard_check_pressed(vk_up);
}

//Set Movement
var move = key_Right - key_Left;
var jump = key_Jump;

horizontalSpeed = move * walkSpeed;
verticalSpeed = verticalSpeed + grv;

//Jumping
if (place_meeting(x,y+1,obj_floor)) {
	verticalSpeed = - jump*12;
} 

//Horizontal Collision
if (place_meeting(x+horizontalSpeed,y,obj_floor)) {
	while (!place_meeting(x+sign(horizontalSpeed),y,obj_floor)) {
		x = x + sign(horizontalSpeed);
	}
	horizontalSpeed = 0;
}
x = x + horizontalSpeed;

//Vertical Collision
if (place_meeting(x,y+verticalSpeed,obj_floor)) {
	while (!place_meeting(x,y+verticalSpeed,obj_floor)) {
		y = y + sign(verticalSpeed);
	}
	verticalSpeed = 0;
}
y = y + verticalSpeed;