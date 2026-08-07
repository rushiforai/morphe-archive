#ifndef _MATERIAL_COMMON_GLSL_
#define _MATERIAL_COMMON_GLSL_

#include "Common.glsl"

uniform mat4 UniParam_VertexDef_LocalToWorld;
uniform mat4 UniParam_VertexDef_PreLocalToWorld;
uniform mat4 UniParam_VertexDef_WorldToLocal;
uniform float UniParam_MaterialCommon_TwoSidedSign;
uniform float UniParam_MaterialCommon_ShadingType;
uniform int UniParam_MaterialCommon_SSSIndex;

float InternalFunc_Material_GetFloatFacingSign(bool bFrontface)
{
	return bFrontface ? 1.0f : -1.0f;
}

struct Stru_VertexParam
{
	vec3 WorldPosition;
	vec3 WorldNormal;
	mat3 TangentToWorld;
	vec4 VertexColor;
	vec2 TexCoord0;
	vec2 TexCoord1;
};

struct Stru_PixelParam
{
	vec2 TexCoord0;
	vec2 TexCoord1;
#if LIGHT_MAP_ENABLE
	vec2 LightmapTexCoord;
#endif
	vec4 VertexColor;
	vec3 TangentNormal;
	vec3 WorldNormal;
	vec3 ReflectionVector;
	vec3 CameraVector;
	vec3 LightVector;
	vec4 SVPosition;
	float UnMirrored;
	float TwoSidedSign;
	mat3 TangentToWorld;
	vec3 WorldPosition;
};

vec3 InternalFunc_Material_ReflectionAboutCustomWorldNormal(Stru_PixelParam PixelParameters,
														vec3 WorldNormal,
														bool NormalizeInputNormal)
{
	if (NormalizeInputNormal)
	{
		WorldNormal = normalize(WorldNormal);
	}

	return WorldNormal * dot(WorldNormal, PixelParameters.CameraVector) * 2.0f - PixelParameters.CameraVector;
}

#include "VertexDef.glsl"

vec3 InternalFunc_MaterialTransformLocalVectorToWorld(Stru_VertexParam Parameters, vec3 InLocalVector)
{
	mat3 LocalToWorld;
	LocalToWorld[0] = UniParam_VertexDef_LocalToWorld[0].xyz;
    LocalToWorld[1] = UniParam_VertexDef_LocalToWorld[1].xyz;
    LocalToWorld[2] = UniParam_VertexDef_LocalToWorld[2].xyz;
	return LocalToWorld * InLocalVector;
}

vec3 InternalFunc_MaterialTransformLocalVectorToWorld(Stru_PixelParam Parameters, vec3 InLocalVector)
{
	mat3 LocalToWorld;
	LocalToWorld[0] = UniParam_VertexDef_LocalToWorld[0].xyz;
    LocalToWorld[1] = UniParam_VertexDef_LocalToWorld[1].xyz;
    LocalToWorld[2] = UniParam_VertexDef_LocalToWorld[2].xyz;
	return LocalToWorld * InLocalVector;
}

vec3 InternalFunc_MaterialTransformLocalPositionToWorld(Stru_VertexParam Parameters, vec3 InLocalPosition)
{
	vec4 WorldPos = UniParam_VertexDef_LocalToWorld * vec4(InLocalPosition, 1.0f);
	return WorldPos.xyz;
}

vec3 InternalFunc_MaterialTransformLocalPositionToWorld(Stru_PixelParam Parameters, vec3 InLocalPosition)
{
	vec4 WorldPos = UniParam_VertexDef_LocalToWorld * vec4(InLocalPosition, 1.0f);
	return WorldPos.xyz;
}

vec3 InternalFunc_MaterialGetObjectWorldPosition(Stru_VertexParam Parameters)
{
	return UniParam_VertexDef_LocalToWorld[3].xyz;
}

vec3 InternalFunc_MaterialGetObjectWorldPosition(Stru_PixelParam Parameters)
{
	return UniParam_VertexDef_LocalToWorld[3].xyz;
}

#include "Material.glsl"

vec3 InternalFunc_MaterialGetNormal(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return UserFunc_GetNormal(PixelParameters, SharedVariables);
}

// TangentNormal, WorldNormal and ReflectionVector in PixelParameters are invalid.
void InternalFunc_MaterialCalculateSharedVariables(Stru_PixelParam PixelParameters, inout Stru_SharedVariables SharedVariables)
{
	UserFunc_GetSharedVariables(PixelParameters, SharedVariables);
}

void InternalFunc_MaterialCalcPixelParameters(inout Stru_PixelParam Parameters,
											inout Stru_SharedVariables SharedVariables,
											bool bFrontFace,
											vec4 SvPosition,
											vec4 WorldPosition,
											vec4 WorldPosition_CamRelative,
											vec3 LightVector)
{
	Parameters.WorldPosition = WorldPosition.xyz;
	Parameters.SVPosition = SvPosition;
	Parameters.CameraVector = normalize(-WorldPosition_CamRelative.xyz);
	Parameters.LightVector = LightVector;
	Parameters.TwoSidedSign = InternalFunc_Material_GetFloatFacingSign(bFrontFace);

	InternalFunc_MaterialCalculateSharedVariables(Parameters, SharedVariables);

	Parameters.TangentNormal = InternalFunc_MaterialGetNormal(Parameters, SharedVariables);
	Parameters.TangentNormal *= Parameters.TwoSidedSign;
	Parameters.TangentNormal = normalize(Parameters.TangentNormal);
	Parameters.WorldNormal = normalize(InternalFunc_TransformTangentVectorToWorld(Parameters.TangentToWorld, Parameters.TangentNormal));
	Parameters.ReflectionVector = InternalFunc_Material_ReflectionAboutCustomWorldNormal(Parameters,
																					Parameters.WorldNormal,
																					false);

}

vec3 InternalFunc_MaterialGetWorldPositionOffset(Stru_VertexParam VertexParameters)
{
	return UserFunc_GetWorldPositionOffset(VertexParameters);
}

#if PIXEL_SHADER
void InternalFunc_MaterialClipping(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
#if MATERIAL_BLEND_MODE_MASKED
	if(UserFunc_GetOpacityMask(PixelParameters, SharedVariables) - UserFunc_GetOpacityClip() < 0.0)
	{
		discard;
	}
#endif //MATERIAL_BLEND_MODE_MASKED
}

float InternalFunc_MaterialGetOpacityMask(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return UserFunc_GetOpacityMask(PixelParameters, SharedVariables);
}

float InternalFunc_MaterialGetOpacityClip()
{
	return UserFunc_GetOpacityClip();
}

vec3 InternalFunc_MaterialGetBaseColor(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return  clamp(UserFunc_GetBaseColor(PixelParameters, SharedVariables), 0.0f, 1.0f) ;
}

float InternalFunc_MaterialGetMetallic(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return clamp(UserFunc_GetMetallic(PixelParameters, SharedVariables), 0.0f, 0.99f);
}

float InternalFunc_MaterialGetSpecular(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return  clamp(UserFunc_GetSpecular(PixelParameters, SharedVariables), 0.0f, 1.0f) ;
}

float InternalFunc_MaterialGetRoughness(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	float Roughness = clamp(UserFunc_GetRoughness(PixelParameters, SharedVariables), 0.0f, 1.0f) ;
	return max(0.01, Roughness);
}

vec3 InternalFunc_MaterialGetEmissive(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return max(UserFunc_GetEmissive(PixelParameters, SharedVariables), 0.0f);
}

float InternalFunc_MaterialGetOpacity(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return clamp(UserFunc_GetOpacity(PixelParameters, SharedVariables), 0.0f, 1.0f);
}

float InternalFunc_MaterialGetAmbientOcclusion(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return clamp(UserFunc_GetAmbientOcclusion(PixelParameters, SharedVariables), 0.0f, 1.0f);
}

#if MATERIAL_SHADING_MODEL_EYE
float InternalFunc_MaterialGetIrisMask(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	float IrisMask = UserFunc_GetIrisMask(PixelParameters, SharedVariables);
	return max(IrisMask, 0.0f);
}

float InternalFunc_MaterialGetIrisDistance(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	float IrisDistance = UserFunc_GetIrisDistance(PixelParameters, SharedVariables);
	return max(IrisDistance, 0.0f);
}

//vec3 InternalFunc_MaterialGetClearCoatBottomNormal(Stru_PixelParam PixelParameters)
//{
//	vec3 ClearCoatBottomNormal = UserFunc_GetClearCoatBottomNormal(PixelParameters);
//	return normalize(ClearCoatBottomNormal);
//}

vec3 InternalFunc_MaterialGetTangentOutput(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	vec3 Tangent = UserFunc_GetTangentOutput(PixelParameters, SharedVariables);
	return normalize(Tangent);
}
#endif

#if MATERIAL_SHADING_MODEL_CLOTH
float InternalFunc_MaterialGetCloth(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	float Cloth = UserFunc_GetCloth(PixelParameters, SharedVariables);
	return Cloth;
}
#endif

#endif

#endif
