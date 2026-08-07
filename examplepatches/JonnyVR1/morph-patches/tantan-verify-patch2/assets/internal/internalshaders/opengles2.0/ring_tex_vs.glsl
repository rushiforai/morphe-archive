//******************************************************************************

// @File         cinematic_screen_vs.glsl

// @Version      1.0

// @Description  cinematic screen effect

// @HISTORY:

//******************************************************************************/

attribute vec3		Position0;
attribute vec2		Texcoord0;
varying  vec2		VSOutTexcoord0;
uniform mat4        WorldViewProjMatrix;
void main(void)
{
	gl_Position = WorldViewProjMatrix * vec4(Position0, 1.0);
	VSOutTexcoord0 = Texcoord0;
}
