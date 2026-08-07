//******************************************************************************

// @File         dance_environment_vs.glsl

// @Version      1.0

// @Created      2020, 3, 12

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
_SKIN_
_MORPH_
TWO_LAYER
ALPHA_BLEND_TWO_LAYER
USE_LIGHTMAP
NO_VERTEX_COLOR
*/

#include "common_vs.glsl"

attribute vec3		Position0;
attribute vec2		Texcoord0;
attribute vec2		Texcoord1;
attribute vec3		Color0;

#ifdef _SKIN_	
#define MAX_MESH_BONE 30
attribute vec4		BlendWeight0;
attribute vec4		BlendIndices0;
uniform vec4		BlendMatrix[MAX_MESH_BONE * 3];
#endif	

#ifdef _MORPH_
attribute vec3 		Texcoord7;   			// Morphed position
attribute vec3 		Texcoord8;				// Morphed MorphedTangentZ
attribute vec3 		Texcoord9;				// Morphed MorphedTangentX
#endif

uniform mat4		WorldViewProjMatrix;
uniform float		TimeSinceFirstTick;

uniform vec4		g_MainTex_ST;
uniform vec4		g_LightmapTex_ST;

uniform float 		g_ScrollX;
uniform float 		g_ScrollY;
uniform float 		g_SineAmplX;
uniform float 		g_SineAmplY;
uniform float 		g_SineFreqX;
uniform float 		g_SineFreqY;
uniform vec4		g_Color;
uniform float		g_Multiplier;

#if defined(TWO_LAYER) || defined(ALPHA_BLEND_TWO_LAYER)
uniform vec4		g_DetailTex_ST;
uniform float 		g_Scroll2X;
uniform float 		g_Scroll2Y;
uniform float 		g_SineAmplX2;
uniform float 		g_SineAmplY2;
uniform float 		g_SineFreqX2;
uniform float 		g_SineFreqY2;
#endif

#if defined(TWO_LAYER) || defined(ALPHA_BLEND_TWO_LAYER)
varying vec4		_uv;
#else
varying vec2		_uv;
#endif
#ifdef USE_LIGHTMAP
varying vec2		_lmap;
#endif
varying vec4		_color;

#ifdef _SKIN_
vec3 GetBlendPos(vec4 pos, int index, mediump float weight)
{
	vec3 posBlend;
	posBlend.x = dot(BlendMatrix[index], pos); 
	posBlend.y = dot(BlendMatrix[index + 1], pos); 
	posBlend.z = dot(BlendMatrix[index + 2], pos); 
    posBlend *= weight;
    return posBlend;
}
#endif

void main(void)
{
#ifdef _MORPH_
	vec4 pos = vec4(Texcoord7.xyz, 1.0);
#else
	vec4 pos = vec4(Position0.xyz, 1.0);
#endif  // #ifdef _MORPH_

#if defined(_SKIN_)
	float weightLast = 1.0 - BlendWeight0.x - BlendWeight0.y - BlendWeight0.z;

	ivec4 index = ivec4(BlendIndices0 * 3.0);
	
	pos.xyz = 
	    GetBlendPos(pos, index.x, BlendWeight0.x) +
	    GetBlendPos(pos, index.y, BlendWeight0.y) +
	    GetBlendPos(pos, index.z, BlendWeight0.z) +
	    GetBlendPos(pos, index.w, weightLast);
#endif // #ifdef _SKIN_

	gl_Position = WorldViewProjMatrix * pos;
	
    // TimeSinceFirstTick没有传进来，所以其实没有用到
	//float _Time = TimeSinceFirstTick / 20.0;
	
	vec4 uv;
	uv.xy = (Texcoord0.xy * g_MainTex_ST.xy + g_MainTex_ST.zw);// + fract(vec2(g_ScrollX, g_ScrollY) * _Time);	
	//uv.x += sin(_Time * g_SineFreqX) * g_SineAmplX;
	//uv.y += sin(_Time * g_SineFreqY) * g_SineAmplY;
	_uv.xy = uv.xy;
	
#if defined(TWO_LAYER) || defined(ALPHA_BLEND_TWO_LAYER)
	uv.zw = (Texcoord0.xy * g_DetailTex_ST.xy + g_DetailTex_ST.zw);// + fract(vec2(g_Scroll2X, g_Scroll2Y) * _Time);
	//uv.z += sin(_Time * g_SineFreqX2) * g_SineAmplX2;
	//uv.w += sin(_Time * g_SineFreqY2) * g_SineAmplY2;
	_uv.zw = uv.zw;
#endif

#ifdef USE_LIGHTMAP
	_lmap = Texcoord1.xy * g_LightmapTex_ST.xy + g_LightmapTex_ST.zw;
#endif
	
#ifdef NO_VERTEX_COLOR
	_color = vec4(g_Multiplier, g_Multiplier, g_Multiplier, g_Multiplier);
#else
	_color = g_Multiplier * g_Color * vec4(Color0, 1.0);
#endif
}

