#ifndef _VERTEX_DEF_LOCAL_GLSL_
#define _VERTEX_DEF_LOCAL_GLSL_

uniform vec4 UniParam_VertexDef_InvNonUniformScale;

#include "VertexDefCommon.glsl"

#if VERTEX_SHADER

in vec3	Position0;
in vec4	Tangent0;
in vec4	Normal0;
in vec2	Texcoord0;
in vec2	Texcoord1;
#if LIGHT_MAP_ENABLE
in vec2 Texcoord2; // Light map
#endif
in vec4	Color0;

#if GPU_MORPH_BLEND
in	vec4	MorphedPosition;
in	vec3	MorphedTangentZ;
in	vec3	MorphedTangentX;
#endif //GPU_MORPH_BLEND

#if USE_INSTANCE
in vec4 Attribute0;
in vec4 Attribute1;
in vec4 Attribute2;
#endif

out vec4 VSOutTangentToWorld0;
out vec4 VSOutTangentToWorld2;
out vec2 VSOutTexCoord0;
out vec2 VSOutTexCoord1;
#if LIGHT_MAP_ENABLE
out vec2 VSOutLightmapTexCoord;
#endif
out vec4 VSOutColor;

struct VirStru_VertexDef_Intermediates
{
	mat3		TangentToLocal;
	mat3		TangentToWorld;
	float		TangentToWorldSign;
	vec4		Color;
#if USE_INSTANCE
    mat4x3      LocalToWorld;    
#endif
};

mat3 InternalFunc_VertexDef_CalcTangentToLocal()
{
	mat3 Result;
	vec4 TangentZ = Normal0;
	vec4 TangentX = Tangent0;

#if GPU_MORPH_BLEND
	TangentZ.xyz = MorphedTangentZ;
	TangentX.xyz = MorphedTangentX;
#endif //GPU_MORPH_BLEND

	Result[0] = normalize(TangentX.xyz);
	Result[2] = normalize(TangentZ.xyz);
	Result[1] = cross(Result[2], Result[0]) * TangentZ.w;
	return Result;
}

VirStru_VertexDef_Intermediates VirFunc_VertexDef_GetIntermediates()
{
	VirStru_VertexDef_Intermediates Intermediates;

	Intermediates.TangentToLocal = InternalFunc_VertexDef_CalcTangentToLocal();

#if USE_INSTANCE
    Intermediates.LocalToWorld = transpose(mat3x4(Attribute0, Attribute1, Attribute2));
    Intermediates.TangentToWorld = InternalFunc_VertexDef_CalcTangentToWorld(Intermediates.TangentToLocal, Intermediates.LocalToWorld, UniParam_VertexDef_InvNonUniformScale.xyz);
#else
    Intermediates.TangentToWorld = InternalFunc_VertexDef_CalcTangentToWorld(Intermediates.TangentToLocal, UniParam_VertexDef_LocalToWorld, UniParam_VertexDef_InvNonUniformScale.xyz);
#endif
    
	Intermediates.TangentToWorldSign = Normal0.w;
	Intermediates.Color = Color0;

	return Intermediates;
}

vec4 VirFunc_VertexDef_GetWorldPosition(VirStru_VertexDef_Intermediates Intermediates)
{
#if GPU_MORPH_BLEND
	vec4 Position = MorphedPosition;
#else //!GPU_MORPH_BLEND
	vec4 Position = vec4(Position0, 1.0f);
#endif //GPU_MORPH_BLEND
#if USE_INSTANCE
    return vec4(Intermediates.LocalToWorld * Position, 1.0);
#else
    return UniParam_VertexDef_LocalToWorld * Position;
#endif
}

// TODO: Instanced not supported by now.
vec4 VirFunc_VertexDef_GetPreWorldPosition(VirStru_VertexDef_Intermediates Intermediates)
{
#if GPU_MORPH_BLEND
	vec4 Position = MorphedPosition;
#else //!GPU_MORPH_BLEND
	vec4 Position = vec4(Position0, 1.0f);
#endif //GPU_MORPH_BLEND
#if USE_INSTANCE
    return vec4(Intermediates.LocalToWorld * Position, 1.0);
#else
    return UniParam_VertexDef_PreLocalToWorld * Position;
#endif
}

Stru_VertexParam VirFunc_VertexDef_GetMaterialVertexParameters( VirStru_VertexDef_Intermediates Intermediates,
																				vec3 WorldPosition)
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
#if LIGHT_MAP_ENABLE
	VSOutLightmapTexCoord = Texcoord2;
#endif
	VSOutColor = Intermediates.Color;
	VSOutTangentToWorld0 = vec4(Intermediates.TangentToWorld[0], 0.0f);
	VSOutTangentToWorld2 = vec4(Intermediates.TangentToWorld[2], Intermediates.TangentToWorldSign);
}

#endif //VERTEX_SHADER

#if PIXEL_SHADER

in vec4 VSOutTangentToWorld0;
in vec4 VSOutTangentToWorld2;
in vec2 VSOutTexCoord0;
in vec2 VSOutTexCoord1;
#if LIGHT_MAP_ENABLE
in vec2 VSOutLightmapTexCoord;
#endif
in vec4 VSOutColor;

Stru_PixelParam VirFunc_VertexDef_GetMaterialPixelParameters()
{
	Stru_PixelParam Result = InternalFunc_MaterialInitPixelParameters();
	Result.TexCoord0 = VSOutTexCoord0;
	Result.TexCoord1 = VSOutTexCoord1;
#if LIGHT_MAP_ENABLE
	Result.LightmapTexCoord = VSOutLightmapTexCoord;
#endif
	Result.UnMirrored = VSOutTangentToWorld2.w;
	Result.VertexColor = VSOutColor;
	Result.TangentToWorld = InternalFunc_MaterialAssembleTangentToWorld( VSOutTangentToWorld0.xyz, VSOutTangentToWorld2 );
	return Result;
}

#endif

#endif //_VERTEX_DEF_LOCAL_GLSL_


