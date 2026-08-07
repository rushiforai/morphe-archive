//******************************************************************************

// @File         model_vs.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is model_vs.glsl.

// @HISTORY:

//******************************************************************************/

attribute vec3		Position0;
attribute vec4		Normal0;
attribute vec4		Tangent0;
attribute vec2		Texcoord0;

uniform mat4		WorldViewProjMatrix;
uniform highp float	g_DestAspect;
uniform highp float	g_TextureAspect;
varying vec2		VSOutTexcoord0;

void main(void)
{
	gl_Position = WorldViewProjMatrix *  vec4(Position0, 1.0);
#ifdef VERTICLE
	highp float P = 0.5 * (1.0 - g_DestAspect / g_TextureAspect);
	VSOutTexcoord0 = vec2(Texcoord0.x, (Texcoord0.y - P) / (1.0 - 2.0 * P));	
#else
	highp float P = 0.5 * (1.0 - g_TextureAspect / g_DestAspect);
	VSOutTexcoord0 = vec2((Texcoord0.x - P) / (1.0 - 2.0 * P), Texcoord0.y);	
#endif
}

