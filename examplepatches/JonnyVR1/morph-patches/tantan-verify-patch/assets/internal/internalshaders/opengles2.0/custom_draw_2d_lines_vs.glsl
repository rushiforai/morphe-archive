//******************************************************************************

// @File         custom_draw_mesh_vs.glsl

// @Version      1.0

// @Description  used to draw user custom mesh.

// @HISTORY:

//******************************************************************************/

attribute vec3		Position0;
attribute vec2		Texcoord0;
attribute vec4		Color0;
varying  vec2		VSOutTexcoord0;
#ifdef _USING_UNIQUE_COLOR_
varying  vec4       VSOutColor0;
#endif

void main(void)
{
	gl_Position = vec4(Position0, 1.0);
	VSOutTexcoord0 = Texcoord0;
#ifdef _USING_UNIQUE_COLOR_
	VSOutColor0 = Color0;
#endif
}

