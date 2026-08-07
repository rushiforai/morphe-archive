//******************************************************************************

// @File         outline_vs.glsl

// @Version       1.0

// @Created      2018, 11, 26

// @Description  This file is outline_vs.glsl.

// @HISTORY:

//******************************************************************************/

/* Macros in this shader:
_SKIN_							
*/

#include "common_vs.glsl"


attribute vec3		Position0;
attribute vec4		Normal0;
//attribute vec2		Texcoord0;

uniform mat4		WorldViewProjMatrix;
//uniform mat4        WorldViewMatrix;
uniform mat4		WorldMatrix;
uniform mat4		ViewProjMatrix;
uniform vec3		EyePos;

uniform float		g_OffsetZ;
uniform float		g_NearestDistance;
uniform float		g_FarthestDistance;
uniform float		g_OutlineThickness;

varying vec4		VSOutPosition;
varying vec2        VSOutTexcoord;

#ifdef _SKIN_	
	#define MAX_MESH_BONE 30
	attribute vec4	BlendWeight0;
	attribute vec4	BlendIndices0;
    uniform vec4	BlendMatrix[MAX_MESH_BONE * 3];
#endif	

#ifdef _MORPH_
	attribute vec3 	Texcoord7;   			// morphed position
	attribute vec3 	Texcoord8;				// morphed MorphedTangentZ
	attribute vec3 	Texcoord9;				// morphed MorphedTangentX
#endif

#ifdef _SKIN_
vec3 GetBlendPos( vec4 pos, int index, mediump float weight)
{
	vec3 posBlend;
	posBlend.x = dot(BlendMatrix[index], pos); 
	posBlend.y = dot(BlendMatrix[index + 1], pos); 
	posBlend.z = dot(BlendMatrix[index + 2], pos); 
    posBlend *= weight;
    return posBlend;
}

vec3 GetBlendNormal( vec3 normal, int index, mediump float weight)
{
	vec3 normalBlend;
	normalBlend.x = dot(BlendMatrix[index].xyz,  normal); 
	normalBlend.y = dot(BlendMatrix[index + 1].xyz,  normal); 
	normalBlend.z = dot(BlendMatrix[index + 2].xyz,  normal); 
    normalBlend *= weight;
    return normalBlend;
}
#endif

void main(void)
{     

#ifdef _MORPH_
	vec4 pos = vec4(Texcoord7.xyz, 1.0);
	vec4 normal = vec4(Texcoord8.xyz, 1.0);
#else
	vec4 pos = vec4(Position0, 1.0);
	vec4 normal = vec4(Normal0.xyz, 0.0);
#endif	      
     
#if defined(_SKIN_)

	float weightLast = 1.0 - BlendWeight0.x - BlendWeight0.y - BlendWeight0.z;
	ivec4 index = ivec4(BlendIndices0 * 3.0);	
	vec3 posBlend = 
	    GetBlendPos(pos, index.x, BlendWeight0.x) +
	    GetBlendPos(pos, index.y, BlendWeight0.y) +
	    GetBlendPos(pos, index.z, BlendWeight0.z) +
	    GetBlendPos(pos, index.w, weightLast);
    pos.xyz = posBlend;

    vec3 nor = 
	    GetBlendNormal(Normal0.xyz, index.x, BlendWeight0.x) +
	    GetBlendNormal(Normal0.xyz, index.y, BlendWeight0.y) +
	    GetBlendNormal(Normal0.xyz, index.z, BlendWeight0.z) +
	    GetBlendNormal(Normal0.xyz, index.w, weightLast);                
    normal.xyz = nor;            
    normal = normalize(normal);
#endif // #ifdef _SKIN_       
    
	vec4 objPos = WorldMatrix * vec4(0.0, 0.0, 0.0, 1.0);
	float outlineWidth = g_OutlineThickness * 0.001 * smoothstep(g_FarthestDistance, g_NearestDistance, distance(objPos.xyz, EyePos));

	vec4 clipCameraPos = ViewProjMatrix *  vec4(EyePos.xyz, 1.0);
    float offsetZ = g_OffsetZ * 0.01;

    vec4 posRet = pos + normal * outlineWidth;    
    posRet = WorldViewProjMatrix * posRet; 
	posRet.z = posRet.z + offsetZ * clipCameraPos.z;  
	gl_Position = posRet;
      
}

