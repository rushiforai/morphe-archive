//******************************************************************************

// @File         cucoloris_vs.glsl

// @Version      1.0

// @Created      2017, 3, 8

// @Description  This file is cucoloris_vs.glsl.

// @HISTORY:

//******************************************************************************/

/* Macros in this shader:
_SKIN_
_MORPH_
*/

#include "common_vs.glsl"

attribute vec3		Position0;
attribute vec2		Texcoord0;

uniform mat4		WorldViewProjMatrix;

varying vec2		VSOutTexcoord0;

#ifdef _SKIN_	
#define MAX_MESH_BONE 30
attribute vec4		BlendWeight0;
attribute vec4		BlendIndices0;
uniform vec4		BlendMatrix[MAX_MESH_BONE * 3];
#endif	

#ifdef _MORPH_
attribute vec3 		Texcoord7;   	// morphed position
attribute vec3 		Texcoord8;		// morphed MorphedTangentZ
attribute vec3 		Texcoord9;		// morphed MorphedTangentX
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
#endif

void main(void)
{
#ifdef _MORPH_
	vec4 Inpos = vec4(Texcoord7.xyz, 1.0);
#else
	vec4 Inpos = vec4(Position0, 1.0);
#endif	 

#ifdef _SKIN_
	float weightLast = 1.0 - BlendWeight0.x - BlendWeight0.y - BlendWeight0.z;

	ivec4 index = ivec4(BlendIndices0 * 3.0);

	vec3 posBlend =
		GetBlendPos(Inpos, index.x, BlendWeight0.x) +
		GetBlendPos(Inpos, index.y, BlendWeight0.y) +
		GetBlendPos(Inpos, index.z, BlendWeight0.z) +
		GetBlendPos(Inpos, index.w, weightLast);
	Inpos.xyz = posBlend;
#endif // #ifdef _SKIN_

	gl_Position = WorldViewProjMatrix * Inpos;
	
	VSOutTexcoord0 = Texcoord0;
}
