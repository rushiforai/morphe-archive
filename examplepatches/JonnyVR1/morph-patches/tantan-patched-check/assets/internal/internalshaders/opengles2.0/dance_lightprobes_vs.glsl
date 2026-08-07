//******************************************************************************

// @File         dance_lightprobes_vs.glsl

// @Version      1.0

// @Created      2020, 3, 10

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
_SKIN_
_MORPH_
*/

#include "common_vs.glsl"

attribute vec3		Position0;
attribute vec4		Normal0;
attribute vec2		Texcoord0;

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

uniform vec4		g_LightIntensityAmbient;
uniform vec4		g_LightDirectionCloth;

varying vec2		_uv;
varying float		_vLight;

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
#else
	vec4 pos = vec4(Position0.xyz, 1.0);
	vec4 normal = vec4(Normal0.xyz, 0.0);
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
#endif // #ifdef _SKIN_

	gl_Position = WorldViewProjMatrix * pos;
	_uv.xy = Texcoord0;
	
	highp vec3 worldN = normalize((WorldMatrix * normal).xyz);
	highp vec3 worldV = (WorldMatrix * pos).xyz;
	vec3 viewDirection = normalize(EyePos.xyz - worldV);
	vec3 CamSpaceLightDir = normalize(viewDirection - g_LightDirectionCloth.xyz).xyz;
	_vLight = (g_LightIntensityAmbient.x * abs(dot(CamSpaceLightDir, worldN)) * 0.6 + g_LightIntensityAmbient.y * 1.2); 
}

