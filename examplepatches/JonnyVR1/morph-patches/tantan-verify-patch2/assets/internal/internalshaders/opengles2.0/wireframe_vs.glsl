//******************************************************************************

// @File         wireframe_vs.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is wireframe_vs.glsl.

// @HISTORY:

//******************************************************************************/

attribute	vec3	Position0;
attribute	vec4	Color0;

varying		vec4	VSOutColor0;

uniform		mat4	WorldViewProjMatrix;

void main(void)
{
	gl_Position = WorldViewProjMatrix * vec4(Position0, 1.0);

	VSOutColor0 = Color0.bgra;
}
