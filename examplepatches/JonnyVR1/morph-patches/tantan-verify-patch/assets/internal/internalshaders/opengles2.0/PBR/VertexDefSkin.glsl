#ifndef _VERTEX_DEF_SKIN_GLSL_
#define _VERTEX_DEF_SKIN_GLSL_

uniform vec4 UniParam_VertexDef_BlendMatrix[30 * 3];
uniform vec4 UniParam_VertexDef_PreBlendMatrix[30 * 3];
uniform vec4 UniParam_VertexDef_InvNonUniformScale;

#include "VertexDefCommon.glsl"

#if VERTEX_SHADER

in vec3 Position0;
in vec4	Tangent0;
in vec4	Normal0;
in vec2	Texcoord0;
in vec2	Texcoord1;
in vec4	Color0;
in vec4	BlendWeight0;
in vec4	BlendIndices0;

#if GPU_MORPH_BLEND
in	vec4	MorphedPosition;
in	vec3	MorphedTangentZ;
in	vec3	MorphedTangentX;
#endif //GPU_MORPH_BLEND

out vec4 VSOutTangentToWorld0;
out vec4 VSOutTangentToWorld2;
out vec2 VSOutTexCoord0;
out vec2 VSOutTexCoord1;
out vec4 VSOutColor;

struct VirStru_VertexDef_Intermediates
{
	mat4x3		BlendMatrix;
	mat3		TangentToLocal;
	mat3		TangentToWorld;
	float		TangentToWorldSign;	
	vec4		Color;
};

mat4x3 InternalFunc_VertexDef_GetBoneMatrix(int Index)
{
	vec4 A = UniParam_VertexDef_BlendMatrix[Index * 3];
	vec4 B = UniParam_VertexDef_BlendMatrix[Index * 3 + 1];
	vec4 C = UniParam_VertexDef_BlendMatrix[Index * 3 + 2];
	return transpose(mat3x4(A, B, C));
}

mat4x3 InternalFunc_VertexDef_CalcBoneMatrix()
{
	float LastWeight = 1.0 - BlendWeight0.x - BlendWeight0.y - BlendWeight0.z;
	mat4x3 BoneMatrix = BlendWeight0.x * InternalFunc_VertexDef_GetBoneMatrix(int(BlendIndices0.x));
	BoneMatrix += BlendWeight0.y * InternalFunc_VertexDef_GetBoneMatrix(int(BlendIndices0.y));
	BoneMatrix += BlendWeight0.z * InternalFunc_VertexDef_GetBoneMatrix(int(BlendIndices0.z));
	BoneMatrix += LastWeight * InternalFunc_VertexDef_GetBoneMatrix(int(BlendIndices0.w));
	return BoneMatrix;
}

mat4x3 InternalFunc_VertexDef_GetPreBoneMatrix(int Index)
{
	vec4 A = UniParam_VertexDef_PreBlendMatrix[Index * 3];
	vec4 B = UniParam_VertexDef_PreBlendMatrix[Index * 3 + 1];
	vec4 C = UniParam_VertexDef_PreBlendMatrix[Index * 3 + 2];
	return transpose(mat3x4(A, B, C));
}

mat4x3 InternalFunc_VertexDef_CalcPreBoneMatrix()
{
	float LastWeight = 1.0 - BlendWeight0.x - BlendWeight0.y - BlendWeight0.z;
	mat4x3 BoneMatrix = BlendWeight0.x * InternalFunc_VertexDef_GetPreBoneMatrix(int(BlendIndices0.x));
	BoneMatrix += BlendWeight0.y * InternalFunc_VertexDef_GetPreBoneMatrix(int(BlendIndices0.y));
	BoneMatrix += BlendWeight0.z * InternalFunc_VertexDef_GetPreBoneMatrix(int(BlendIndices0.z));
	BoneMatrix += LastWeight * InternalFunc_VertexDef_GetPreBoneMatrix(int(BlendIndices0.w));
	return BoneMatrix;
}

mat3 InternalFunc_VertexDef_CalcSkinTangentToLocal(VirStru_VertexDef_Intermediates Intermediates )
{
	mat3 Result;
	vec4 TangentZ = Normal0;
	vec4 TangentX = Tangent0;

#if GPU_MORPH_BLEND
	TangentZ.xyz = MorphedTangentZ;
	TangentX.xyz = MorphedTangentX;

#endif //GPU_MORPH_BLEND
	mat3 BM = mat3(Intermediates.BlendMatrix[0].xyz, Intermediates.BlendMatrix[1].xyz, Intermediates.BlendMatrix[2].xyz);
	Result[0] = normalize(BM * TangentX.xyz);
	Result[2] = normalize(BM * TangentZ.xyz);
	Result[1] = cross(Result[2], Result[0]) * TangentZ.w;
	return Result;
}

VirStru_VertexDef_Intermediates VirFunc_VertexDef_GetIntermediates()
{
	VirStru_VertexDef_Intermediates Intermediates;
	Intermediates.BlendMatrix = InternalFunc_VertexDef_CalcBoneMatrix();
	Intermediates.TangentToLocal = InternalFunc_VertexDef_CalcSkinTangentToLocal(Intermediates);
	Intermediates.TangentToWorld = Intermediates.TangentToWorld = InternalFunc_VertexDef_CalcTangentToWorld(Intermediates.TangentToLocal, UniParam_VertexDef_LocalToWorld, UniParam_VertexDef_InvNonUniformScale.xyz);
	Intermediates.TangentToWorldSign = Normal0.w;
	Intermediates.Color = Color0;

	return Intermediates;
}

vec4 VirFunc_VertexDef_GetWorldPosition( VirStru_VertexDef_Intermediates Intermediates)
{
#if GPU_MORPH_BLEND
	vec4 Position = MorphedPosition;
#else //!GPU_MORPH_BLEND
	vec4 Position = vec4(Position0, 1.0f);
#endif //GPU_MORPH_BLEND
	Position = vec4(Intermediates.BlendMatrix * Position, 1.0);
	return UniParam_VertexDef_LocalToWorld * Position;
}

// TODO
vec4 VirFunc_VertexDef_GetPreWorldPosition( VirStru_VertexDef_Intermediates Intermediates)
{
#if GPU_MORPH_BLEND
	vec4 Position = MorphedPosition;
#else //!GPU_MORPH_BLEND
	vec4 Position = vec4(Position0, 1.0f);
#endif //GPU_MORPH_BLEND
	mat4x3 PreBlendMatrix = InternalFunc_VertexDef_CalcPreBoneMatrix();
	vec4 PrePosition = vec4(PreBlendMatrix * Position, 1.0);
	return UniParam_VertexDef_PreLocalToWorld * PrePosition;
}

Stru_VertexParam VirFunc_VertexDef_GetMaterialVertexParameters(VirStru_VertexDef_Intermediates Intermediates, vec3 WorldPosition)
{
	Stru_VertexParam Result;
	Result.WorldPosition = WorldPosition;
    Result.WorldNormal = Intermediates.TangentToWorld[2];
	Result.TangentToWorld = Intermediates.TangentToWorld;
	Result.VertexColor = Intermediates.Color;
	Result.TexCoord0 = Texcoord0;
	Result.TexCoord1 = Texcoord1;
	return Result;
}

void VirFunc_VertexDef_GetInterpolantsVSToPS(VirStru_VertexDef_Intermediates Intermediates)
{
	VSOutTexCoord0 = Texcoord0;
	VSOutTexCoord1 = Texcoord1;
	VSOutColor = Intermediates.Color;
    VSOutTangentToWorld0 = vec4(Intermediates.TangentToWorld[0], 0.0f);
	VSOutTangentToWorld2 = vec4(Intermediates.TangentToWorld[2], Intermediates.TangentToWorldSign);
}

#endif //VERTEX_SHADER

#if PIXEL_SHADER

precision highp float;

in vec4 VSOutTangentToWorld0;
in vec4 VSOutTangentToWorld2;
in vec2 VSOutTexCoord0;
in vec2 VSOutTexCoord1;
in vec4 VSOutColor;

Stru_PixelParam VirFunc_VertexDef_GetMaterialPixelParameters()
{
	Stru_PixelParam Result = InternalFunc_MaterialInitPixelParameters();
	Result.TexCoord0 = VSOutTexCoord0;
	Result.TexCoord1 = VSOutTexCoord1;
	Result.UnMirrored = VSOutTangentToWorld2.w;
	Result.VertexColor = VSOutColor;
	Result.TangentToWorld = InternalFunc_MaterialAssembleTangentToWorld( VSOutTangentToWorld0.xyz, VSOutTangentToWorld2 );
	return Result;
}

#endif

#endif //_VERTEX_DEF_SKIN_GLSL_