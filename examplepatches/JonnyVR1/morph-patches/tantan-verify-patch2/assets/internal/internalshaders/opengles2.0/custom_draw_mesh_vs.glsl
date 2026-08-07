//******************************************************************************

// @File         custom_draw_mesh_vs.glsl

// @Version      1.0

// @Description  used to draw user custom mesh.

// @HISTORY:

//******************************************************************************/

attribute vec3		Position0;
attribute vec2		Texcoord0;

uniform  mat4		WorldViewProjMatrix;

varying  vec2		VSOutTexcoord0;

void main(void)
{
	VSOutTexcoord0 = Texcoord0;
	gl_Position = WorldViewProjMatrix * vec4(Position0, 1.0);
}

