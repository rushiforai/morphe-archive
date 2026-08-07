//******************************************************************************

// @File         model_vs.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is model_vs.glsl.

// @HISTORY:

//******************************************************************************/

/* Macros in this shader:
_SKIN_
*/

#include "common_vs.glsl"


attribute vec3		Position0;
attribute vec4		Normal0;
attribute vec2		Texcoord0;
attribute vec4		Tangent0;

uniform mat4		WorldViewProjMatrix;
uniform mat4        WorldViewMatrix;

varying vec2		VSOutTexcoord0;
varying vec3		VSOutNormal0;
varying vec3        VSOutTangent;
varying vec3        VSOutBinormal;

#ifdef _SKIN_	
#define MAX_MESH_BONE 30
attribute vec4		BlendWeight0;
attribute vec4		BlendIndices0;
uniform vec4		BlendMatrix[MAX_MESH_BONE * 3];
#endif	

#ifdef _MORPH_
attribute vec3 		Texcoord7;   			// morphed position
attribute vec3 		Texcoord8;				// morphed MorphedTangentZ
attribute vec3 		Texcoord9;				// morphed MorphedTangentX
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
#endif	 

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

#else // #ifdef _SKIN_

	vec3 normal = InNormal.xyz;
	vec3 tangent = InTangent.xyz;

#endif // #ifdef _SKIN_

	gl_Position = WorldViewProjMatrix * Inpos;
	
	VSOutTexcoord0 = Texcoord0;

	// To write "mat3(WorldMatrix)" will make the compiler of PowerVR GLES simulator reporting warning C7536. So we cast the vector instead. Hope it will be optimized.
	VSOutNormal0 = (WorldViewMatrix * vec4(normal, 0.0)).xyz;
	//VSOutNormal0 = normalize(VSOutNormal0);
	VSOutTangent = (WorldViewMatrix * vec4(tangent.xyz, 0.0)).xyz;		// The tangent here is actually tangent
	//VSOutTangent = normalize(VSOutTangent);
	VSOutBinormal = cross(VSOutTangent, VSOutNormal0) * (Normal0.w - 127.5); //Normal0.w [0或255] 需要后面的normalize  0.0078431 = 1/127.5
	VSOutBinormal = normalize(VSOutBinormal); // 不单位化，会有光斑
}