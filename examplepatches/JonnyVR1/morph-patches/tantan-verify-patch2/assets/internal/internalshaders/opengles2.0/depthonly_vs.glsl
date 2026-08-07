//******************************************************************************

// @File         depthonly_vs.glsl

// @Version       1.0

// @Created      2017, 8, 23

// @Description  This file is depthonly_vs.glsl.

// @HISTORY:

//******************************************************************************/

/* Macros in this shader:
_SKIN_							
*/

#include "common_vs.glsl"

attribute vec3		Position0;
attribute vec2		Texcoord0;

uniform mat4		WorldViewProjMatrix;

varying vec4		VSOutPosition;
varying vec2		VSOutTexcoord0;

#ifdef _SKIN_	
	#define MAX_MESH_BONE 30
	attribute vec4	BlendWeight0;
	attribute vec4	BlendIndices0;
    uniform vec4	BlendMatrix[MAX_MESH_BONE * 3];
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
#endif

void main(void)
{
	 vec4 pos = vec4(Position0, 1.0);

#if defined(_SKIN_)

	float weightLast = 1.0 - BlendWeight0.x - BlendWeight0.y - BlendWeight0.z;
	ivec4 index = ivec4(BlendIndices0 * 3.0);	
	 vec3 posBlend = 
	    GetBlendPos(pos, index.x, BlendWeight0.x) +
	    GetBlendPos(pos, index.y, BlendWeight0.y) +
	    GetBlendPos(pos, index.z, BlendWeight0.z) +
	    GetBlendPos(pos, index.w, weightLast);
    pos.xyz = posBlend;

#endif // #ifdef _SKIN_

	gl_Position = WorldViewProjMatrix * pos;
	VSOutPosition = gl_Position;

	VSOutTexcoord0 = Texcoord0;
}

