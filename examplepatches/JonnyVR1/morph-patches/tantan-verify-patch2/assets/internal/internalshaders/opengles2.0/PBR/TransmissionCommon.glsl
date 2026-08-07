#ifndef _TRANSMISSION_COMMON_GLSL_
#define _TRANSMISSION_COMMON_GLSL_

#include "SubsurfaceProfileCommon.glsl"

struct TransmissionProfileParams
{
	float ExtinctionScale;
	float NormalScale;
	float ScatteringDistribution;
	float OneOverIOR;
};

TransmissionProfileParams GetTransmissionProfileParams(int SubsurfaceProfileInt)
{
	TransmissionProfileParams Result;

	// X:ExtinctionScale, Y:Normal Scale, Z:ScatteringDistribution, W:OneOverIOR
	//vec4 Data = texelFetch(UniParam_SubsurfaceProfileTexture, ivec2(SSSS_TRANSMISSION_OFFSET, SubsurfaceProfileInt), 0);
    vec4 Data = texture(UniParam_SubsurfaceProfileTexture, vec2(float(SSSS_TRANSMISSION_OFFSET) / float(SSSS_PROFILE_TEXTURE_WIDTH), float(SubsurfaceProfileInt) / float(SUBSURFACE_PROFILE_MAX_NUM)));

	Result.ExtinctionScale = Data.x;
	Result.NormalScale = Data.y;
	Result.ScatteringDistribution = Data.z;
	Result.OneOverIOR = Data.w;

	return Result;
}

vec4 GetTransmissionProfile(int SubsurfaceProfileInt, float Thickness)
{
	//ivec2 texSize = textureSize(UniParam_SubsurfaceProfileTexture, 0);
	//vec2 uv = vec2((float)SSSS_TRANSMISSION_PROFILE_OFFSET + Thickness / SSSS_MAX_TRANSMISSION_PROFILE_DISTANCE * float(SSSS_TRANSMISSION_PROFILE_SIZE - 1) + 0.5, 
    //               float(SubsurfaceProfileInt) + 0.5) 
    //            / vec2(float(texSize.x), float(texSize.y));
	//return textureLod(UniParam_SubsurfaceProfileTexture, uv, 0.0);

	float ProfileU = Thickness / SSSS_MAX_TRANSMISSION_PROFILE_DISTANCE * float(SSSS_TRANSMISSION_PROFILE_SIZE - 1);
	//return texelFetch(UniParam_SubsurfaceProfileTexture, ivec2(SSSS_TRANSMISSION_PROFILE_OFFSET + int(ProfileU), SubsurfaceProfileInt), 0);
    return texture(UniParam_SubsurfaceProfileTexture, vec2((float(SSSS_TRANSMISSION_PROFILE_OFFSET) + ProfileU) / float(SSSS_PROFILE_TEXTURE_WIDTH), float(SubsurfaceProfileInt) / float(SUBSURFACE_PROFILE_MAX_NUM)));
}

#endif
