#ifndef _INDIRECT_LIGHTING_COMMON_GLSL_
#define _INDIRECT_LIGHTING_COMMON_GLSL_

//--------------------------------------------------------------------------------------------
// Lightmap
#if LIGHT_MAP_ENABLE
uniform vec2 UniParam_LightingCache_LightmapResolution;
uniform float UniParam_LightingCache_LightmapIntensity;
uniform sampler2D UniParam_LightingCache_LightmapTexture;

#if HDR_LIGHT_MAP
vec3 DecodeRGBE(vec4 rgbe)
{
	float ir = rgbe.x * 255.0;
	float ig = rgbe.y * 255.0;
	float ib = rgbe.z * 255.0;
	float ie = rgbe.w * 255.0; 
	float power = pow(2.0, ie - 128.0 - 8.0);
	return vec3(ir * power, ig * power, ib * power);
}
vec3 GetLightmapLighting(vec2 LightmapTexCoord)
{
	return DecodeRGBE(texture(UniParam_LightingCache_LightmapTexture, LightmapTexCoord.xy).rgba) * UniParam_LightingCache_LightmapIntensity;
}
#else
vec3 GetLightmapLighting(vec2 LightmapTexCoord)
{
	return texture(UniParam_LightingCache_LightmapTexture, LightmapTexCoord.xy).rgb * UniParam_LightingCache_LightmapIntensity;
}
#endif // HDR_LIGHT_MAP
#endif // LIGHT_MAP_ENABLE


//--------------------------------------------------------------------------------------------
// Sky diffuse lighting
#if SKY_DIFFUSE_ENABLE
uniform samplerCube UniParam_SkyDiffuse_CubeTexture;
uniform vec3 UniParam_SkyDiffuse_LightColor;

vec3 GetSkyDiffuseLighting(vec3 DiffuseColor, vec3 Normal)
{
	vec3 lightColor = texture(UniParam_SkyDiffuse_CubeTexture, Normal).rgb * UniParam_SkyDiffuse_LightColor;
	return lightColor * DiffuseColor;
}
#endif


//--------------------------------------------------------------------------------------------
// IBL lighting
#if IBL_ENABLE
uniform samplerCube UniParam_ReflectionEnvironment_CubeTexture;
uniform float UniParam_ReflectionEnvironment_MipNum;
uniform float UniParam_ReflectionEnvironment_Intensity;
uniform sampler2D UniParam_ReflectionEnvironment_PreIntegratedGFTexture;

float ComputeReflectionCaptureMipFromRoughness(float Roughness)
{
	// Heuristic that maps roughness to mip level
	// This is done in a way such that a certain mip level will always have the same roughness, regardless of how many mips are in the texture
	// Using more mips in the cubemap just allows sharper reflections to be supported
	float LevelFrom1x1 = 1.0 - 1.2 * log2(max(Roughness, 0.001));
	return UniParam_ReflectionEnvironment_MipNum - 1.0 - LevelFrom1x1;
}

vec3 GatherSpecularIBL(samplerCube ReflectionCube, vec3 ReflectionVector, float Roughness)
{
    float AbsoluteSpecularMip = ComputeReflectionCaptureMipFromRoughness(Roughness);
    vec4 SpecularIBLSample = textureLod(ReflectionCube, ReflectionVector, AbsoluteSpecularMip);

    return SpecularIBLSample.xyz * UniParam_ReflectionEnvironment_Intensity;
}

vec2 EnvBRDF(sampler2D PreIntegratedGF, vec3 N, vec3 V, float Roughness)
{
    float NoV = dot(N, V);
    return texture(PreIntegratedGF, vec2(NoV, Roughness)).xy;
}

vec3 GetReflectionEnvironment(vec3 SpecularColor, vec3 N, vec3 V, vec3 ReflectionVector, float Roughness)
{
	vec3 SpecularLight = GatherSpecularIBL(UniParam_ReflectionEnvironment_CubeTexture, ReflectionVector, Roughness);
    vec2 PreintegratedBRDF = EnvBRDF(UniParam_ReflectionEnvironment_PreIntegratedGFTexture, N, V, Roughness);
    return SpecularLight * (SpecularColor * PreintegratedBRDF.x + clamp(50.0 * SpecularColor.g, 0.0, 1.0) * vec3(PreintegratedBRDF.y));
}
#endif // IBL_ENABLE

#endif //_FORWARD_SHADING_LIGHT_COMMON_GLSL_