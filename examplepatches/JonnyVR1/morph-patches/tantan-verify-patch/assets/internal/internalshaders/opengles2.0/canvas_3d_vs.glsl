//******************************************************************************

// @File         canvas_3d_vs.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is canvas_3d_vs.glsl.

// @HISTORY:

//******************************************************************************/
attribute		vec3		Position0;
attribute		vec4		Color0;
#ifdef _CANVAS_USE_LIT_
attribute		vec3		Normal0;
#endif
#ifdef _CANVAS_USE_TEX_
attribute		vec2		Texcoord0;
#endif

uniform			mat4		WorldViewProjMatrix;
#ifdef _CANVAS_USE_LIT_
uniform			vec3		LightDir;
#endif

varying			vec4		VSOutColor0;
#ifdef _CANVAS_USE_TEX_
varying			vec2		VSOutTexcoord0;
#endif


void main(void)
{
	gl_Position = WorldViewProjMatrix * vec4(Position0, 1.0);

	VSOutColor0 = Color0.bgra;
#ifdef _CANVAS_USE_LIT_
	VSOutColor0 = VSOutColor0 * clamp(dot(normalize(Normal0), LightDir), 0.3, 0.9);
	VSOutColor0.a = 1.0;
#endif
#ifdef _CANVAS_USE_TEX_
	VSOutTexcoord0 = Texcoord0;
#endif
}


