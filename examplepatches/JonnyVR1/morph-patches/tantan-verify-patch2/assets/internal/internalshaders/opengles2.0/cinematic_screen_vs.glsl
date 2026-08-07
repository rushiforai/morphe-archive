//******************************************************************************

// @File         cinematic_screen_vs.glsl

// @Version      1.0

// @Description  cinematic screen effect

// @HISTORY:

//******************************************************************************/

attribute vec3		Position0;
attribute vec2		Texcoord0;
varying  vec2		VSOutTexcoord0;
varying  vec4		VSOutScreenPosition;

void main(void)
{
	VSOutTexcoord0 = Texcoord0;
	gl_Position = vec4(Position0, 1.0);
    VSOutScreenPosition = gl_Position;	
}

