//******************************************************************************

// @File         2d_vs.glsl

// @Version      1.0

// @Description  used for 2d element such as ui etc.

// @HISTORY:

//******************************************************************************/

attribute vec4		Position0;
attribute vec4		Texcoord0;
attribute vec4		Color0;

uniform  mat4		WorldViewProjMatrix;

varying  vec4		VSOutColor0;
varying  vec2		VSOutTexcoord0;
varying  vec2       WorldPos;
void main(void)
{
	VSOutColor0 = Color0.bgra;
	VSOutTexcoord0 = Texcoord0.xy;
	WorldPos    = Position0.xy;
	gl_Position = WorldViewProjMatrix * vec4(Position0.xyz, 1.0);
	gl_Position.z = 0.0;
}

