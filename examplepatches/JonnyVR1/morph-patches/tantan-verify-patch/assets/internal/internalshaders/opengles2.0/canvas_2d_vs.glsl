//******************************************************************************

// @File         canvas_2d_vs.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is canvas_2d_vs.glsl.

// @HISTORY:

//******************************************************************************/

attribute	vec4	Position0;
attribute	vec2	Texcoord0;
attribute	vec4	Color0;
varying		vec4	VSOutColor0;
varying		vec2	VSOutTexcoord0;


void main(void)
{
	gl_Position.xy = Position0.xy ;
	gl_Position.z = 0.0;
	gl_Position.w = 1.0;

	VSOutColor0 = Color0.bgra;

	VSOutTexcoord0 = Texcoord0;
}
