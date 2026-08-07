//******************************************************************************

// @File         pbr_ps.glsl

// @Version      1.0

// @Created      2020, 7, 30

// @Description

//******************************************************************************/

/* Macros in this shader:
_ALPHATEST_						
_ALPHABLEND_
_TEXTURE_LOD_
BASE_LAYER_NORMAL
CLEAR_COAT
CLEAR_COAT_LAYER_NORMAL
CHANGE_COLOR
HIGH_QUALITY
*/

#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

precision highp float;

#include "common_ps.glsl"

//------------------------------------------
// parameters
//------------------------------------------
uniform highp vec3			EyePos;
uniform sampler2D 			g_DiffuseSampler;
uniform sampler2D 			g_ORMTex;
uniform highp float			g_Specular;

#ifdef CLEAR_COAT
uniform highp float			g_ClearCoat;
uniform highp float			g_ClearCoatRoughness;
#endif

#ifdef CHANGE_COLOR
uniform sampler2D			g_MaskTex;
uniform highp vec4			g_ChangeColor;
uniform highp float			g_ColorBrightness;
#endif

#ifdef _ALPHATEST_
uniform highp float			g_Cutoff;
#endif

// For IBL
uniform sampler2D 			momo_PreintegratedGF;
uniform highp float			g_LightIntensity;
uniform samplerCube 		g_IrradianceMap;

#if !defined(GL_EXT_shader_texture_lod) && defined(HIGH_QUALITY)
	uniform samplerCube		g_PrefilterEnvMap_Mip_0;
	uniform samplerCube		g_PrefilterEnvMap_Mip_2;
	uniform samplerCube		g_PrefilterEnvMap_Mip_4;
#else
	uniform samplerCube 	g_PrefilterEnvMap;
	#ifdef BASE_LAYER_NORMAL
		uniform sampler2D 	g_NormalTex;
	#endif
	#if	defined(CLEAR_COAT) && defined(CLEAR_COAT_LAYER_NORMAL)
		uniform sampler2D 	g_ClearCoatNormalTex;
	#endif
#endif

//------------------------------------------
// Varyings
//------------------------------------------
varying mediump vec2	_uv;
varying highp vec3		_worldN;
varying highp vec3		_worldV;
varying highp vec3		_tangentWorld;
varying highp vec3		_binormalWorld;

#if !defined(GL_EXT_shader_texture_lod) && defined(HIGH_QUALITY)
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
#endif

vec3 FilterCube(float mip, vec3 R)
{
#ifdef GL_EXT_shader_texture_lod
	return textureCubeLodEXT(g_PrefilterEnvMap, R, mip).rgb * g_LightIntensity;
#else	
	#ifdef HIGH_QUALITY
		ivec2 mipLevels;
		bool bLerp = false;
		float lerpFactor = 0.0;
		MipLevelMapping(mip, mipLevels, bLerp, lerpFactor);
	
		highp vec3 prefilterColor = SampleCube(mipLevels.x, R) * g_LightIntensity;
		if (bLerp)
		{
			highp vec3 prefilterColor_1 = SampleCube(mipLevels.y, R) * g_LightIntensity;
			prefilterColor = mix(prefilterColor, prefilterColor_1, lerpFactor);
		}
	#else
		highp vec3 prefilterColor = textureCube(g_PrefilterEnvMap, R, mip).rgb * g_LightIntensity;
	#endif
	
	return prefilterColor;
#endif	
}

highp vec3 ApproximateIBL(highp vec3 diffuseColor, highp vec3 specularColor, highp vec3 V, highp float roughness, highp vec3 N, highp float roughness_cc, highp vec3 N_cc)
{	
	//Diffuse
	vec3 diffuse = textureCube(g_IrradianceMap, N).rgb * diffuseColor * g_LightIntensity;
	
	//Specular
	highp float NoV = dot(N, V);
	highp vec3 R = 2.0 * NoV * N - V;
	NoV = clamp(NoV, 0.0, 1.0);
	highp float mipLevel = 3.0 - 1.15 * log2(roughness); // computation of mip level is from ue4
	mipLevel = 8.0 - mipLevel;		
	vec3 prefilterColor = FilterCube(mipLevel, R);
	highp vec2 preintegratedBRDF = texture2D(momo_PreintegratedGF, vec2(NoV, roughness)).xy;
	vec3 specular = prefilterColor * (specularColor * preintegratedBRDF.x + clamp(50.0 * specularColor.g, 0.0, 1.0) * vec3(preintegratedBRDF.y));

#ifdef CLEAR_COAT
	//Clearcoat, the clear coat layer assumes an IOR of 1.5 (4% reflectance)
	float NoV_cc = max(0.0, dot(N_cc, V));
    vec3 R_cc = 2.0 * NoV_cc * N_cc - V;
	NoV_cc = clamp(NoV_cc, 0.0, 1.0);
	mipLevel = 3.0 - 1.15 * log2(roughness_cc); // computation of mip level is from ue4
	mipLevel = 8.0 - mipLevel; 
	prefilterColor = FilterCube(mipLevel, R_cc);
    preintegratedBRDF = texture2D(momo_PreintegratedGF, vec2(NoV_cc, roughness_cc)).xy;
	vec3 clearcoat = prefilterColor * (0.08 * vec3(g_Specular) * preintegratedBRDF.x + clamp(50.0 * specularColor.g, 0.0, 1.0) * vec3(preintegratedBRDF.y)) * g_ClearCoat;

	return diffuse + specular + clearcoat;	
#else
	return diffuse + specular;
#endif
}

void main (void)
{
	vec4 c = SampleDiffuseTexture(g_DiffuseSampler, _uv);
	float opacity = c.a;
	
#ifdef _ALPHATEST_	
	if ((opacity - g_Cutoff) < 0.0)
	{
		discard;
	}
#endif

#ifdef CHANGE_COLOR
	vec4 mask = texture2D(g_MaskTex, _uv);
	float c_Gray = c.r * 0.299 + c.g * 0.587 + c.b * 0.114; 
	vec3 col = c_Gray * g_ChangeColor.rgb;
	c.rgb = mix(c.rgb, col, g_ChangeColor.a) * mask.r * g_ColorBrightness + c.rgb * (1.0 - mask.r);
#endif

	vec3 baseColor = c.rgb;
	baseColor = pow(baseColor, vec3(2.2));
#ifdef _ALPHABLEND_
	baseColor = baseColor * opacity;
#endif
		
	vec3 orm = texture2D(g_ORMTex, _uv).xyz;
	float metallic = orm.z;
	float roughness = orm.y;
	float ao = orm.x;
	//metallic = 1.0;
	//roughness = 0.0;
	//ao = 1.0;
	
	highp vec3 diffuseColor = baseColor - baseColor * metallic;
	highp vec3 specularColor = mix(0.08 * vec3(g_Specular), baseColor, vec3(metallic));
	
	vec3 V = normalize((EyePos.xyz - _worldV));
	
	vec3 worldN = normalize(_worldN);
	mat3 tangent2World = mat3(normalize(_tangentWorld), normalize(_binormalWorld), worldN);
	
#if (!defined(GL_EXT_shader_texture_lod) && defined(HIGH_QUALITY)) || !defined(BASE_LAYER_NORMAL)
	vec3 N = worldN;
#else
	vec3 tangentSpaceNormal = glb_SamplerNormalMap_ApplyStrength(g_NormalTex, _uv, 1.0);	
    vec3 N = normalize(tangent2World * tangentSpaceNormal);	
#endif
	
#ifdef CLEAR_COAT
	#if (!defined(GL_EXT_shader_texture_lod) && defined(HIGH_QUALITY)) || !defined(CLEAR_COAT_LAYER_NORMAL)
		vec3 N_ClearCoat = worldN;
	#else
		vec3 tangentSpaceClearCoatNormal = glb_SamplerNormalMap_ApplyStrength(g_ClearCoatNormalTex, _uv, 1.0);
		vec3 N_ClearCoat = normalize(tangent2World * tangentSpaceClearCoatNormal);	
	#endif
	highp vec3 color = ApproximateIBL(diffuseColor, specularColor, V, roughness, N, g_ClearCoatRoughness, N_ClearCoat);
#else	
	highp vec3 color = ApproximateIBL(diffuseColor, specularColor, V, roughness, N, roughness, N);
#endif

	color = color * ao;
	color = pow(color, vec3(1.0 / 2.2));
	
	gl_FragColor = vec4(color, opacity);
}