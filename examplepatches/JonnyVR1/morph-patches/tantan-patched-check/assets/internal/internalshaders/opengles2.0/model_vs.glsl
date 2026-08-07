//******************************************************************************

// @File         model_vs.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is model_vs.glsl.

// @HISTORY:

//******************************************************************************/

/* Macros in this shader:
_SKIN_
_MORPH_
_DIRECTION_LIGHT_
_POINT_LIGHT_		
_SPOT_LIGHT_
REFLECT_ENABLE
*/

#include "common_vs.glsl"

attribute vec3		Position0;
attribute vec4		Normal0;
attribute vec4		Tangent0;
attribute vec2		Texcoord0;
//attribute vec2		Texcoord1;

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

#ifdef _LIGHT_MAP_
attribute vec4		Texcoord2;				// Light Map UV
#endif

uniform mat4		WorldViewProjMatrix;
uniform mat4		WorldMatrix;
uniform vec3		EyePos;

// light 
#if defined(_DIRECTION_LIGHT_) || defined(_SPOT_LIGHT_)
uniform vec3		LightDir;
#endif
#if defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)
uniform vec4		g_PointLight_PosAndInvRadius;
#endif

varying vec2		VSOutTexcoord0;
//varying vec2		VSOutTexcoord1;

varying vec3		VSOutViewDir;			// In tangent space
varying vec3		VSOutLightDir;			// In tangent space
#if defined(_SHADOW_ENABLE_) || defined(_FOG_ENABLE_) || defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)    
varying vec3		VSOutWorldPosition;
#endif
#ifdef _SHADOW_ENABLE_
varying vec4		VSOutScreenPosition;	// For shadow
#endif

#ifdef REFLECT_ENABLE	
varying vec3    	VSOutTangent;
varying vec3    	VSOutBinormal;
varying vec3		VSOutNormal0;
#endif

#ifdef _LIGHT_MAP_
varying vec3		VSOutLightMapTexcoord;
#endif

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
	vec4 Inpos = vec4(Texcoord7.xyz, 1.0);
	vec4 InNormal = vec4(Texcoord8.xyz, 1.0);
	vec4 InTangent = vec4(Texcoord9.xyz, 1.0);
#else
	vec4 Inpos = vec4(Position0, 1.0);
	vec4 InNormal = Normal0;
	vec4 InTangent = Tangent0;
#endif  // #ifdef _MORPH_

#if defined(_SKIN_)

	float weightLast = 1.0 - BlendWeight0.x - BlendWeight0.y - BlendWeight0.z;

	ivec4 index = ivec4(BlendIndices0 * 3.0);
	
	vec3 posBlend = 
	    GetBlendPos(Inpos, index.x, BlendWeight0.x) +
	    GetBlendPos(Inpos, index.y, BlendWeight0.y) +
	    GetBlendPos(Inpos, index.z, BlendWeight0.z) +
	    GetBlendPos(Inpos, index.w, weightLast);
    Inpos.xyz = posBlend;

	vec3 normal = 
	    GetBlendNormal(InNormal.xyz, index.x, BlendWeight0.x) +
	    GetBlendNormal(InNormal.xyz, index.y, BlendWeight0.y) +
	    GetBlendNormal(InNormal.xyz, index.z, BlendWeight0.z) +
	    GetBlendNormal(InNormal.xyz, index.w, weightLast);

	vec3 tangent = 
		GetBlendNormal(InTangent.xyz, index.x, BlendWeight0.x) +
		GetBlendNormal(InTangent.xyz, index.y, BlendWeight0.y) +
		GetBlendNormal(InTangent.xyz, index.z, BlendWeight0.z) +
		GetBlendNormal(InTangent.xyz, index.w, weightLast);

#else

	vec3 normal = InNormal.xyz;
	vec3 tangent = InTangent.xyz;

#endif // #ifdef _SKIN_

	VSOutTexcoord0 = Texcoord0;
	//VSOutTexcoord1 = Texcoord1;

	
	gl_Position = WorldViewProjMatrix * Inpos;
	vec3 worldPos = (WorldMatrix * Inpos).xyz;
	
#if defined(_SHADOW_ENABLE_) || defined(_FOG_ENABLE_) || defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)    
	VSOutWorldPosition = worldPos;
#endif
	
#ifdef _SHADOW_ENABLE_
	VSOutScreenPosition = gl_Position;
#endif
	
	// View dir in world space
	VSOutViewDir = normalize(EyePos - worldPos);
	
	// Light dir in world space
#ifdef _DIRECTION_LIGHT_
    VSOutLightDir = LightDir;
#endif
#if defined (_POINT_LIGHT_) || defined(_SPOT_LIGHT_)
    VSOutLightDir = (g_PointLight_PosAndInvRadius.xyz - worldPos);
    VSOutLightDir = normalize(VSOutLightDir);
#endif 

	// To write "mat3(WorldMatrix)" will make the compiler of PowerVR GLES simulator reporting warning C7536. So we cast the vector instead. Hope it will be optimized.
	vec3 N = (WorldMatrix * vec4(normal, 0.0)).xyz;
	N = normalize(N);
	vec3 T = (WorldMatrix * vec4(tangent.xyz, 0.0)).xyz;
	T = normalize(T);
	vec3 B = cross(T, N) * Normal0.w;
	B = normalize(B);
	
	// View dir in tangent space
	vec3 viewDir;
	viewDir.x = dot(VSOutViewDir, T);
	viewDir.y = dot(VSOutViewDir, B);
	viewDir.z = dot(VSOutViewDir, N);
	VSOutViewDir = viewDir;	

	// Light dir in tangent space
	vec3 lightDir;
	lightDir.x = dot(VSOutLightDir, T);
	lightDir.y = dot(VSOutLightDir, B);
	lightDir.z = dot(VSOutLightDir, N);
	VSOutLightDir = lightDir;
	
#ifdef REFLECT_ENABLE	
	VSOutTangent = T;
	VSOutBinormal = B;
	VSOutNormal0 = N;
#endif

#ifdef _LIGHT_MAP_
	VSOutLightMapTexcoord = vec3(Texcoord2.x, Texcoord2.y, Texcoord2.z);
#endif
}

