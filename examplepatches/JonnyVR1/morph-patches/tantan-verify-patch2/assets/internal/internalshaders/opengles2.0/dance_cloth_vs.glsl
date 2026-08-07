//******************************************************************************

// @File         dance_cloth_vs.glsl

// @Version      1.0

// @Created      2020, 2, 25

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
_SKIN_
_MORPH_
ONE_COLOR
TWO_COLOR
REFLECT
ANIM_REFLECT
*/

#include "common_vs.glsl"

attribute vec3		Position0;
attribute vec4		Normal0;
attribute vec4		Tangent0;
attribute vec2		Texcoord0;
attribute vec2		Texcoord1;

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
uniform mat4		WorldMatrix;
uniform vec3		EyePos;
uniform float		TimeSinceFirstTick;

uniform vec4		g_LightDirectionCloth;
uniform vec4		g_DarknessLightness;

#ifdef ANIM_REFLECT
uniform float 		g_ScrollX;
uniform float 		g_ScrollY;
uniform float 		g_SineAmplX;
uniform float 		g_SineAmplY;
uniform float 		g_SineFreqX;
uniform float 		g_SineFreqY;
uniform float 		g_MaskScrollX;
uniform float 		g_MaskScrollY;
uniform vec4		g_MaskTex_ST;
#endif

varying vec4		_uv;
#ifdef ANIM_REFLECT
varying vec4		_uv2;
#endif
varying vec3		_worldN;
varying vec3		_worldV;
varying float		_SHLighting;
varying vec3		_tangentWorld;
varying vec3		_binormalWorld;

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
vec3 GetBlendNormal(vec3 normal, int index, mediump float weight)
{
	vec3 normalBlend;
	normalBlend.x = dot(BlendMatrix[index].xyz, normal); 
	normalBlend.y = dot(BlendMatrix[index + 1].xyz, normal); 
	normalBlend.z = dot(BlendMatrix[index + 2].xyz, normal); 
    normalBlend *= weight;
    return normalBlend;
}
#endif

void main(void)
{
#ifdef _MORPH_
	vec4 pos = vec4(Texcoord7.xyz, 1.0);
	vec4 normal = vec4(Texcoord8.xyz, 0.0);
	vec4 tangent = vec4(Texcoord9.xyz, 0.0);
#else
	vec4 pos = vec4(Position0.xyz, 1.0);
	vec4 normal = vec4(Normal0.xyz, 0.0);
	vec4 tangent = vec4(Tangent0.xyz, 0.0);
#endif  // #ifdef _MORPH_

#if defined(_SKIN_)
	float weightLast = 1.0 - BlendWeight0.x - BlendWeight0.y - BlendWeight0.z;

	ivec4 index = ivec4(BlendIndices0 * 3.0);
	
	pos.xyz = 
	    GetBlendPos(pos, index.x, BlendWeight0.x) +
	    GetBlendPos(pos, index.y, BlendWeight0.y) +
	    GetBlendPos(pos, index.z, BlendWeight0.z) +
	    GetBlendPos(pos, index.w, weightLast);

	normal.xyz = 
	    GetBlendNormal(normal.xyz, index.x, BlendWeight0.x) +
	    GetBlendNormal(normal.xyz, index.y, BlendWeight0.y) +
	    GetBlendNormal(normal.xyz, index.z, BlendWeight0.z) +
	    GetBlendNormal(normal.xyz, index.w, weightLast);

	tangent.xyz = 
		GetBlendNormal(tangent.xyz, index.x, BlendWeight0.x) +
		GetBlendNormal(tangent.xyz, index.y, BlendWeight0.y) +
		GetBlendNormal(tangent.xyz, index.z, BlendWeight0.z) +
		GetBlendNormal(tangent.xyz, index.w, weightLast);
#endif // #ifdef _SKIN_

	gl_Position = WorldViewProjMatrix * pos;
	_uv.xy = Texcoord0;
	_uv.zw = Texcoord1;
	
#ifdef ANIM_REFLECT
	highp float _Time = TimeSinceFirstTick / 20.0;
	vec2 texcoord = vec2(Texcoord1.x, 1.0 - Texcoord1.y);
	vec2 trans_uv1 = (texcoord * g_MaskTex_ST.xy + g_MaskTex_ST.zw);
	_uv2.xy = trans_uv1 + fract(vec2(g_ScrollX, g_ScrollY) * _Time);
	_uv2.x += sin(_Time * g_SineFreqX) * g_SineAmplX;
	_uv2.y += sin(_Time * g_SineFreqY) * g_SineAmplY;
	_uv2.zw = trans_uv1 + fract(vec2(g_MaskScrollX, g_MaskScrollY) * _Time);
	_uv2.y = 1.0 - _uv.y;
	_uv2.w = 1.0 - _uv.w;
#endif
	
	_worldN = normalize((WorldMatrix * normal).xyz);
	_worldV = (WorldMatrix * pos).xyz;
	_tangentWorld = normalize((WorldMatrix * tangent).xyz);
	_binormalWorld = normalize(cross(_tangentWorld, _worldN) * Normal0.w);
	
	vec3 viewDirection = normalize(EyePos.xyz - _worldV);
	vec3 CamSpaceLightDir = normalize(viewDirection - g_LightDirectionCloth.xyz).xyz;
	float ldot = XSaturate(dot(CamSpaceLightDir, _worldN));
	_SHLighting = 1.0 - g_DarknessLightness.x * (1.0 - ldot);
	_SHLighting *= 1.0 + g_DarknessLightness.y * ldot;	
}

