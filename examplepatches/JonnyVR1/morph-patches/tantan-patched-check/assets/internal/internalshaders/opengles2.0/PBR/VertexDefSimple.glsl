#ifndef _VERTEX_DEF_SIMPLE_GLSL_
#define _VERTEX_DEF_SIMPLE_GLSL_

uniform vec4 UniParam_VertexDef_InvNonUniformScale;

#include "VertexDefCommon.glsl"

#if VERTEX_SHADER

in vec3	Position0;
in vec2	Texcoord0;
in vec4	Color0;

out vec2 VSOutTexCoord0;
out vec4 VSOutColor;

struct VirStru_VertexDef_Intermediates
{
	vec4		Color;
};

VirStru_VertexDef_Intermediates VirFunc_VertexDef_GetIntermediates()
{
	VirStru_VertexDef_Intermediates Intermediates;
	Intermediates.Color = Color0;
	return Intermediates;
}

vec4 VirFunc_VertexDef_GetWorldPosition(VirStru_VertexDef_Intermediates Intermediates)
{
    return UniParam_VertexDef_LocalToWorld *vec4(Position0, 1.0);
}

// TODO
vec4 VirFunc_VertexDef_GetPreWorldPosition(VirStru_VertexDef_Intermediates Intermediates)
{
    return UniParam_VertexDef_PreLocalToWorld *vec4(Position0, 1.0);
}

Stru_VertexParam VirFunc_VertexDef_GetMaterialVertexParameters( VirStru_VertexDef_Intermediates Intermediates,
																				vec3 WorldPosition)
{
	Stru_VertexParam Result;
	Result.WorldPosition = WorldPosition;
	Result.VertexColor = Intermediates.Color;
	Result.TexCoord0 = Texcoord0;
	return Result;
}

void VirFunc_VertexDef_GetInterpolantsVSToPS(VirStru_VertexDef_Intermediates Intermediates)
{
	VSOutTexCoord0 = Texcoord0;
	VSOutColor = Intermediates.Color;
}

#endif //VERTEX_SHADER

#if PIXEL_SHADER

in vec2 VSOutTexCoord0;
in vec4 VSOutColor;

Stru_PixelParam VirFunc_VertexDef_GetMaterialPixelParameters()
{
	Stru_PixelParam Result = InternalFunc_MaterialInitPixelParameters();
	Result.TexCoord0 = VSOutTexCoord0;
	Result.VertexColor = VSOutColor;
	return Result;
}

#endif

#endif //_VERTEX_DEF_SIMPLE_GLSL_


