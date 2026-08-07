precision highp float;

#include "common_ps.glsl"
#include "lightcommon_ps.glsl"

#ifdef _SHADOW_ENABLE_
#include "common_shadowtest_ps.glsl"
#endif

//------------------------------------------
// parameters
//------------------------------------------
uniform highp vec3	EyePos;
uniform sampler2D	g_BaseTex;
uniform highp vec4	g_BaseColor;
uniform highp float	g_MetallicScale;
uniform highp float	g_RoughnessScale;
uniform highp float g_AOScale;
uniform highp float	g_AOStrength;
uniform highp float	g_Specular;
uniform highp float	g_AmbientReflectionStrength;
uniform highp float g_ToneMappingLuminance;

#if defined(SAMPLE_METALLIC) || defined(SAMPLE_ROUGHNESS) || defined(SAMPLE_OCCLUSION)
uniform sampler2D	g_MSATex;
#endif

#ifdef USE_NORMAL
uniform sampler2D	g_NormalTex;
uniform highp float	g_BumpScale;
#endif

#ifdef USE_DETAIL_NORMAL
uniform sampler2D	g_DetailNormalTex;
uniform highp float	g_DetailNormalUVScale;
uniform highp float	g_DetailBumpScale;
#endif

#ifdef USE_SKIN_SSS
uniform highp float	g_Curvature;
uniform highp float	g_TranslucencyPower;
uniform highp float	g_TranslucencyStrength;
uniform highp float g_Distortion;
uniform highp float g_BackScatter;
uniform highp vec4	g_SubsurfaceColor;
uniform sampler2D	g_SSSTex;
uniform sampler2D	g_SkinLUTTex;
#endif

// For IBL
uniform sampler2D 	momo_PreintegratedGF;
uniform highp float	g_EnvLightIntensity;
uniform samplerCube g_IrradianceMap;
uniform samplerCube	g_PrefilterEnvMap_Mip_0;
uniform samplerCube	g_PrefilterEnvMap_Mip_2;
uniform samplerCube	g_PrefilterEnvMap_Mip_4;

//------------------------------------------
// varyings
//------------------------------------------
varying highp vec2	_uv;
varying highp vec3	_positionWS;
varying highp vec4	_positionCS;
varying highp vec3	_normalWS;
varying highp vec3	_tangentWS;
varying highp vec3	_binormalWS;

struct SurfaceData
{
    vec3 	albedo;
	float  	metallic;
    float  	roughness;
    float   specular; 
    float  	occlusion;
    vec3 	normalTS;
};

#ifdef USE_SKIN_SSS
struct AdditionalSurfaceData
{
    float 	translucency;
    float 	skinMask;
    float 	curvature;
};
#endif

struct Light
{
    vec3	direction;
    vec3   	color;
    float  	distanceAttenuation;
    float   shadowAttenuation;
};

struct LightingData
{
    vec3    giColor;
    vec3    lightingColor;
};

//------------------------------------------
// functions
//------------------------------------------
vec3 SRGBToLinear(vec3 sRGB)
{
    return pow(sRGB.rgb, vec3(2.2));
}

vec3 LinearToSRGB(vec3 color)
{
    return pow(color.rgb, vec3(0.45));
}

void InitializeLitSurfaceData(vec2 uv, out SurfaceData outSurfaceData
#ifdef USE_SKIN_SSS
, out AdditionalSurfaceData outAdditionalSurfaceData
#endif
)
{
    outSurfaceData.albedo = SRGBToLinear(texture2D(g_BaseTex, uv).rgb) * g_BaseColor.rgb;
    
    vec3 MRA = vec3(1.0, 1.0, 1.0);
    #if defined(SAMPLE_METALLIC) || defined(SAMPLE_ROUGHNESS) || defined(SAMPLE_OCCLUSION)
	    vec3 sampleValue = SRGBToLinear(texture2D(g_MSATex, uv).rgb);
        #ifdef SAMPLE_METALLIC
            MRA.r = sampleValue.r;
        #endif
        #ifdef SAMPLE_ROUGHNESS
            MRA.g = sampleValue.g;
        #endif
        #ifdef SAMPLE_OCCLUSION
            MRA.b = sampleValue.b;
        #endif
    #endif
    outSurfaceData.metallic = MRA.r * g_MetallicScale;
    outSurfaceData.roughness = MRA.g * g_RoughnessScale;
	outSurfaceData.occlusion = mix(1.0, MRA.b * g_AOScale, g_AOStrength);
    outSurfaceData.specular = g_Specular;

	#ifdef USE_NORMAL
		outSurfaceData.normalTS = glb_SamplerNormalMap_ApplyStrength(g_NormalTex, uv, g_BumpScale);
	#else
		outSurfaceData.normalTS = vec3(0.0, 0.0, 1.0);
	#endif
	
    #ifdef USE_DETAIL_NORMAL    
        vec2 detailUV = uv * g_DetailNormalUVScale;
        vec3 detailNormalTS = glb_SamplerNormalMap_ApplyStrength(g_DetailNormalTex, detailUV, g_DetailBumpScale);
        outSurfaceData.normalTS = normalize(outSurfaceData.normalTS + detailNormalTS);
    #endif

#ifdef USE_SKIN_SSS
    vec3 SSS = SRGBToLinear(texture2D(g_SSSTex, uv).rgb);
    outAdditionalSurfaceData.translucency = SSS.g * g_TranslucencyStrength;
    outAdditionalSurfaceData.skinMask = SSS.r;
    outAdditionalSurfaceData.curvature = SSS.b * g_Curvature;
#endif
}

float BRDF_D_GGX( float Roughness, float NoH )
{
    const float PI = 3.1415926535897932;
	float m = Roughness * Roughness;
	float m2 = m * m;
	float d = ( NoH * m2 - NoH ) * NoH + 1.0001;
	return m2 / ( PI * d * d );
}

vec3 BRDF_F_Schlick( vec3 SpecularColor, float VoH )
{
	float Fc = pow(1.0 - VoH, 5.0);
	return clamp( 50.0 * SpecularColor.g, 0.0, 1.0) * Fc + (1.0 - Fc) * SpecularColor;
}

float BRDF_Vis_Schlick( float Roughness, float NoV, float NoL )
{
	float k = Roughness * Roughness * 0.5;
	float Vis_SchlickV = NoV * (1.0 - k) + k;
	float Vis_SchlickL = NoL * (1.0 - k) + k;
	return 0.25 / ( Vis_SchlickV * Vis_SchlickL );
}

vec3 DirectBRDFSpecular(vec3 specularColor, float roughness, vec3 N, vec3 L, vec3 V, float NoL)
{
    vec3 H = normalize(V + L);
	float NoV = abs(dot(N, V)) + 1e-5;
	float NoH = clamp(dot(N, H), 0.0, 1.0);
	float VoH = clamp(dot(V, H), 0.0, 1.0);

	float D = BRDF_D_GGX(roughness, NoH);
	float Vis = BRDF_Vis_Schlick(roughness, NoV, NoL);
	vec3 F = BRDF_F_Schlick(specularColor, VoH);

	return D * F * Vis;
}

vec3 LightingPhysicallyBased(vec3 diffuseColor, vec3 specularColor, float roughness, Light light, vec3 pixelNormalWS, vec3 viewDirectionWS, float NdotL
#ifdef USE_SKIN_SSS
, float NdotLUnclamped, float curvature, float skinMask
#endif
)
{
    #ifdef USE_SKIN_SSS
        #ifdef GLTEXTURE_FLIP_Y
            vec2 lutUV = vec2( NdotLUnclamped * 0.5 + 0.5, 1.0 - curvature );
        #else
            vec2 lutUV = vec2( NdotLUnclamped * 0.5 + 0.5, curvature );
        #endif
        vec3 diffuseLighting = diffuseColor * texture2D( g_SkinLUTTex, lutUV).rgb;
        diffuseLighting = mix(diffuseColor * NdotL, diffuseLighting, skinMask);
    #else
        vec3 diffuseLighting = diffuseColor * NdotL;
    #endif
    vec3 specularTerm = DirectBRDFSpecular(specularColor, roughness, pixelNormalWS, light.direction, viewDirectionWS, NdotL);
    return (specularTerm * NdotL + diffuseLighting) * light.color * light.distanceAttenuation * light.shadowAttenuation;
}

vec3 SampleSH(vec3 direction)
{
	return textureCube(g_IrradianceMap, direction).rgb;
}

void MipLevelMapping(float mip, out ivec2 mipLevels, out bool bLerp, out float lerpFactor)
{	
	float mipLevel = clamp(mip, 0.0, 5.0);
	
	if (mipLevel >= 0.0 && mipLevel < 1.0)
	{
		bLerp = false;
		mipLevels.x = 0;
		mipLevels.y = 0;
	}
	else if (mipLevel >= 1.0 && mipLevel < 2.0)
	{
		bLerp = true;
		lerpFactor = fract(mipLevel);
		mipLevels.x = 0;
		mipLevels.y = 2;		
	}
	else if (mipLevel >= 2.0 && mipLevel < 3.0)
	{		
		bLerp = false;
		mipLevels.x = 2;
		mipLevels.y = 2;
	}
	else if (mipLevel >= 3.0 && mipLevel < 4.0)
	{
		bLerp = true;
		lerpFactor = fract(mipLevel);
		mipLevels.x = 2;
		mipLevels.y = 4;
	}
	else
	{
		bLerp = false;
		mipLevels.x = 4;
		mipLevels.y = 4;
	}
}

vec3 SampleCube(int mipLevel, vec3 R)
{
	if (mipLevel == 0)
	{
		return textureCube(g_PrefilterEnvMap_Mip_0, R).rgb;
	}
	else if (mipLevel == 2)
	{
		return textureCube(g_PrefilterEnvMap_Mip_2, R).rgb;
	}
	else
	{
		return textureCube(g_PrefilterEnvMap_Mip_4, R).rgb;
	}
}

vec3 FilterCube(float mip, vec3 R)
{
	ivec2 mipLevels;
	bool bLerp = false;
	float lerpFactor = 0.0;
	MipLevelMapping(mip, mipLevels, bLerp, lerpFactor);
	
	highp vec3 prefilterColor = SampleCube(mipLevels.x, R) * g_EnvLightIntensity;
	if (bLerp)
	{
		highp vec3 prefilterColor_1 = SampleCube(mipLevels.y, R) * g_EnvLightIntensity;
		prefilterColor = mix(prefilterColor, prefilterColor_1, lerpFactor);
	}
	
	return prefilterColor;
}

vec3 ApproximateIBL(vec3 diffuseColor, vec3 specularColor, float roughness, vec3 V, vec3 N, float occlusion, float specOcclusion)
{	
	// Diffuse
	vec3 diffuse = SampleSH(N) * diffuseColor * occlusion * g_EnvLightIntensity;
	
	// Specular
	float NoV = dot(N, V);
	vec3 R = 2.0 * NoV * N - V;
	NoV = clamp(NoV, 0.0, 1.0);
	float mipLevel = 3.0 - 1.15 * log2(roughness); // computation of mip level is from ue4
	mipLevel = 8.0 - mipLevel;		
	vec3 prefilterColor = FilterCube(mipLevel, R);
	vec2 preintegratedBRDF = texture2D(momo_PreintegratedGF, vec2(NoV, roughness)).xy;
	vec3 specular = prefilterColor * specOcclusion * (specularColor * preintegratedBRDF.x + clamp(50.0 * specularColor.g, 0.0, 1.0) * vec3(preintegratedBRDF.y));

	return diffuse + specular;
}

Light GetLight()
{
    Light light;

	light.color = SunLight;
	light.distanceAttenuation = 1.0;
	light.shadowAttenuation = 1.0;

#if defined(_DIRECTION_LIGHT_)   
	light.direction = normalize(LightDir);
	#if defined(_SHADOW_ENABLE_)
		if (ShadowValid > 0.0)
		{	
			vec2 ScreenUV = _positionCS.xy / _positionCS.w * 0.5 + 0.5;
			light.shadowAttenuation = ShadowTest(_positionWS, _positionCS.w, ScreenUV);
		}
	#endif
#elif defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)
	// Distance attenuation
	vec3 worldToLight = (g_PointLight_PosAndInvRadius.xyz - _positionWS); 
	light.direction = normalize(worldToLight);
	vec3 ToLightRadius = worldToLight * g_PointLight_PosAndInvRadius.w;
	light.distanceAttenuation = LightCommon_RadialAttenuation(ToLightRadius, g_PointLight_FalloffExponent);                         
            
	#ifdef _SPOT_LIGHT_
		// Angle attenuation
		vec3 worldlightDir = normalize(LightDir);
		light.distanceAttenuation *= LightCommon_SpotAttenuation(light.direction, worldlightDir, g_SpotLight_SpotAngele);          
	#endif  
	
	light.distanceAttenuation = XSaturate(light.distanceAttenuation);
#endif

    return light;
}

// vec3 ACESToneMapping(vec3 color, float adapted_lum)
// {
//     const mat3 sRGB_2_AP0 = {
//         0.4397010, 0.3829780, 0.1773350,
//         0.0897923, 0.8134230, 0.0967616,
//         0.0175440, 0.1115440, 0.8707040
//     };
//     color = sRGB_2_AP0 * x;

// 	const float A = 2.51;
// 	const float B = 0.03;
// 	const float C = 2.43;
// 	const float D = 0.59;
// 	const float E = 0.14;

// 	color *= adapted_lum;
// 	return (color * (A * color + B)) / (color * (C * color + D) + E);
// }

void main(void)
{
	// Get the surface description
    SurfaceData surfaceData;
    #ifdef USE_SKIN_SSS
        AdditionalSurfaceData additionalSurfaceData;
    #endif
    InitializeLitSurfaceData(_uv, surfaceData
        #ifdef USE_SKIN_SSS
            , additionalSurfaceData
        #endif
    );

    vec3 diffuseColor = surfaceData.albedo - surfaceData.albedo * surfaceData.metallic;
    vec3 specularColor = mix(0.08 * vec3(surfaceData.specular), surfaceData.albedo, vec3(surfaceData.metallic));

    vec3 viewDirectionWS = normalize(EyePos - _positionWS);  
    vec3 tangentWS = normalize(_tangentWS);
    vec3 binormalWS = normalize(_binormalWS);
    vec3 normalWS = normalize(_normalWS);
    mat3 ToW = mat3(tangentWS, binormalWS, normalWS);
    vec3 pixelNormalWS = normalize(ToW * surfaceData.normalTS);

	LightingData lightingData;
	lightingData.giColor = vec3(0.0);
	lightingData.lightingColor = vec3(0.0);

	// Fetch light
    Light light = GetLight();

#if defined(_STATIONARY_LIGHT_) || defined(_MOVABLE_LIGHT_)
	// Direct Lighting
    float NdotLUnclamped = dot(normalWS, light.direction);
    float NdotL = XSaturate( dot(pixelNormalWS, light.direction) );
    lightingData.lightingColor += LightingPhysicallyBased(
        diffuseColor, specularColor, surfaceData.roughness, light, pixelNormalWS, viewDirectionWS, NdotL
        #ifdef USE_SKIN_SSS
            , NdotLUnclamped, additionalSurfaceData.curvature, additionalSurfaceData.skinMask
        #endif
        );

    #ifdef USE_SKIN_SSS
	    // Subsurface Scattering
        vec3 transLightDir = light.direction + pixelNormalWS * g_Distortion;
        float transDot = dot( transLightDir, -viewDirectionWS );
        transDot = exp2(XSaturate(transDot) * g_TranslucencyPower - g_TranslucencyPower);
        lightingData.lightingColor += additionalSurfaceData.skinMask * g_SubsurfaceColor.rgb * transDot * (1.0 - XSaturate(NdotLUnclamped)) * light.color * additionalSurfaceData.translucency;
    #endif
#endif

#if defined(_DIRECTION_LIGHT_) 
	// GI
    lightingData.giColor += ApproximateIBL(diffuseColor, specularColor, surfaceData.roughness, viewDirectionWS, pixelNormalWS, surfaceData.occlusion, g_AmbientReflectionStrength);
	
    #ifdef USE_SKIN_SSS
	    // Backscattering
        lightingData.giColor += g_BackScatter * SampleSH(-_normalWS) * surfaceData.albedo * surfaceData.occlusion * additionalSurfaceData.translucency * g_SubsurfaceColor.rgb * additionalSurfaceData.skinMask;
    #endif
#endif

    vec3 resultColor = lightingData.lightingColor + lightingData.giColor;
    resultColor = LinearToSRGB(resultColor);

    // Tonemapping
    //resultColor = ACESToneMapping(resultColor, g_ToneMappingLuminance);

    gl_FragColor = vec4(resultColor, 1.0);
}