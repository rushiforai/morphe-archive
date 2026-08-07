//******************************************************************************

// @File         model_ps.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is model_vs.glsl.

// @HISTORY:

//******************************************************************************/

/* Macros in this shader:
_ALPHATEST_						
_ALPHABLEND_
_SHADOW_ENABLE_	
_FOG_ENABLE_
_DIRECTION_LIGHT_	
_POINT_LIGHT_	
_SPOT_LIGHT_		
NORMAL_ENABLE					
UNLIT_ENABLE
DIFFUSE_WARP_ENABLE
REFLECT_ENABLE
EMISSIVE_ENABLE
DIFFUSE_TEX_MODULATION
UV_PANNER
UV_SEQUENCE
*/

#include "common_ps.glsl"
#include "lightcommon_ps.glsl"

#ifdef _SHADOW_ENABLE_
#include "common_shadowtest_ps.glsl"
#endif

#ifdef _FOG_ENABLE_
#include "fogcommon.glsl"
#endif

//------------------------------------------
// System parameters
//------------------------------------------
uniform highp vec3		EyePos;
//uniform highp float		g_fDiffusePower;
#if defined (UV_PANNER) || defined(UV_SEQUENCE)
uniform highp float		TimeSinceFirstTick;
#endif
//uniform highp float		g_bSSAOValid;

#if defined(SPECULAR_MAP_ENABLE) || defined(SPECULAR_ENABLE)
uniform highp float		g_Power;
uniform highp float		g_SpecularGlossiness;
uniform highp vec4		g_colMtlSpecular;
#endif

#ifdef SPECULAR_MAP_ENABLE
uniform sampler2D	 	g_SpecularSampler;
#endif

#ifdef DIFFUSE_WARP_ENABLE
uniform highp float		g_DiffuseWarp;
#endif

#if (defined (_DIRECTION_LIGHT_) && defined(REFLECT_ENABLE)) || defined(NORMAL_ENABLE)
uniform highp float		g_smoothNess;
#endif

#ifdef _ALPHABLEND_
uniform highp float		g_Opacity;
#endif

#ifdef UV_PANNER
uniform highp vec2		g_UVSpeed;
#endif

#ifdef UV_SEQUENCE
uniform highp vec2 		g_SequenceUVTile;
uniform highp float     g_SequenceActualNum;
uniform highp float		g_SequenceFPS;
#endif

#ifdef EMISSIVE_ENABLE
uniform sampler2D		g_EmissiveMaskSampler;
uniform highp vec4		g_EmissiveColor;
#endif

#ifdef NORMAL_ENABLE
uniform sampler2D		g_NormalSampler;
#endif

#ifdef REFLECT_ENABLE
#ifdef REFLECT_SPHEREMAP_ENABLE
uniform sampler2D 		g_Reflect2DSampler;
#else
uniform samplerCube 	g_ReflectCubeSampler;
#endif
uniform sampler2D	 	g_ReflectMaskSampler;
uniform highp float		g_UseReflectMaskSampler;
uniform highp float		g_ReflectParam;
#endif

#ifdef AA_ENABLE
uniform highp float		g_AACoefficient;
#endif

#ifdef DIFFUSE_TEX_MODULATION
uniform highp vec4		g_DiffuseTexModulation;
#endif

uniform sampler2D		g_DiffuseSampler;
uniform sampler2D		g_SSAOMaskSampler;

#ifdef MASK_TEXTURE_ENABLE
uniform sampler2D		g_ModelMaskSampler;
#endif

#ifdef _LIGHT_MAP_
uniform sampler2D		g_LightMapSampler;
uniform float			g_LightMapIntensity;
#	ifdef LIGHT_MAP_UV_OVERLAY
uniform highp vec3		g_LightMapResolution;
#	endif
#endif

//------------------------------------------
// Varyings
//------------------------------------------
varying highp vec2		VSOutTexcoord0;
//varying highp vec2		VSOutTexcoord1;
varying highp vec3		VSOutViewDir;	// In tangent space
varying highp vec3		VSOutLightDir;	// In tangent space
#if defined(_SHADOW_ENABLE_) || defined(_FOG_ENABLE_) || defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)    
varying highp vec3		VSOutWorldPosition;
#endif
#ifdef _SHADOW_ENABLE_
varying highp vec4		VSOutScreenPosition;
#endif

#ifdef REFLECT_ENABLE
varying highp vec3		VSOutNormal0;
varying highp vec3		VSOutTangent;
varying highp vec3		VSOutBinormal;
#endif

#ifdef _LIGHT_MAP_
varying highp vec3		VSOutLightMapTexcoord;
#endif

int mod_int(int a, int b)
{
	return a - (b * (a/b));
}

highp vec3 decodeRGBE(highp vec4 rgbe)
{
	highp float ir = rgbe.x * 255.0;
	highp float ig = rgbe.y * 255.0;
	highp float ib = rgbe.z * 255.0;
	highp float ie = rgbe.w * 255.0; 
	highp float power = pow(2.0, ie - 128.0 - 8.0);
	return vec3(ir * power, ig * power, ib * power);
}

void main (void)
{
	// UV
	highp vec2 Texcoord0 = VSOutTexcoord0;
	
#ifdef FLIP_UV_VERTICAL
	Texcoord0.y = 1.0 - Texcoord0.y;
#endif
#ifdef FLIP_UV_HORIZONTAL
	Texcoord0.x = 1.0 - Texcoord0.x;
#endif

#ifdef UV_PANNER
	Texcoord0 = VSOutTexcoord0 + TimeSinceFirstTick * g_UVSpeed;
#endif

#ifdef UV_SEQUENCE
	highp vec2 SequenceUVTile = max(vec2(1.0, 1.0), floor(g_SequenceUVTile));
	highp float MaxIndex = max(1.0, min(g_SequenceActualNum, SequenceUVTile.x * SequenceUVTile.y));
	highp float index = floor(mod(TimeSinceFirstTick * g_SequenceFPS, MaxIndex));
	highp vec2 uv_index = floor(vec2(mod(index, SequenceUVTile.x), index / SequenceUVTile.x));
	Texcoord0 = vec2(1.0 / SequenceUVTile.x, 1.0 / SequenceUVTile.y) * (Texcoord0 + uv_index);
#endif

	// Sample the diffuse texture.
	highp vec4 colBaseTex = SampleDiffuseTexture(g_DiffuseSampler, Texcoord0);
	
#ifdef _ALPHATEST_
	if (colBaseTex.a < 0.5)
		discard;
#endif // #ifdef _ALPHATEST_

#ifdef DIFFUSE_TEX_MODULATION
	colBaseTex.rgb = colBaseTex.rgb * g_DiffuseTexModulation.rgb;
#endif

    // Normal
#ifdef NORMAL_ENABLE
	highp vec3 normal = glb_SamplerNormalMap(g_NormalSampler, Texcoord0, g_smoothNess);
#else
	highp vec3 normal = vec3(0.0, 0.0, 1.0);
#endif
	if (!gl_FrontFacing)
		normal = -normal;

#if defined(_RENDER_QUALITY_LOW_) || defined(UNLIT_ENABLE)

	highp vec3 resultColor = colBaseTex.rgb * 1.1;
	
#else
	
	highp vec3 resultColor = vec3(0.0, 0.0, 0.0);
	
	
	// Emissive.
#if defined(_DIRECTION_LIGHT_) && defined(EMISSIVE_ENABLE)
	highp vec3 EmissiveColor = texture2D(g_EmissiveMaskSampler, Texcoord0).x * g_EmissiveColor.rgb;
	resultColor += EmissiveColor;
#endif


	// Reflectance. 仅在方向光pass累积环境反射。
#if defined (_DIRECTION_LIGHT_) && defined(REFLECT_ENABLE)
	highp vec3 CubeCoordinates = glb_CalcReflection(normal, VSOutViewDir);
	highp mat3 matT2W = mat3(normalize(VSOutTangent), normalize(VSOutBinormal), normalize(VSOutNormal0));
	CubeCoordinates = normalize(matT2W * CubeCoordinates);
	
#	ifndef REFLECT_SPHEREMAP_ENABLE	
		highp vec3 ReflectColor = textureCube(g_ReflectCubeSampler, CubeCoordinates).xyz;	
#	else		
		highp vec2 coord = vec2(-0.25 + atan(CubeCoordinates.z, CubeCoordinates.x) / 6.2831853, 0.5 - asin(CubeCoordinates.y) / 3.14159265);
		highp vec3 ReflectColor = texture2D(g_Reflect2DSampler, coord, -10.0).xyz;		
#	endif
	
	if (g_UseReflectMaskSampler > 0.5)
	{
		ReflectColor *= texture2D(g_ReflectMaskSampler, Texcoord0).x;
	}
	else
	{
		ReflectColor *= g_ReflectParam;
	}
	
	ReflectColor *= g_smoothNess;
	resultColor += ReflectColor;
#endif 
	
	
	// Light factors.
	highp vec3 lightDir = normalize(VSOutLightDir);
	highp vec3 viewDir  = normalize(VSOutViewDir);
	highp vec3 viewReflection = glb_CalcReflection(normal, viewDir);
	highp float fNDL = dot(normal, lightDir);
#ifdef DIFFUSE_WARP_ENABLE
	highp float fDiffuseFactor = XSaturate((fNDL + g_DiffuseWarp) / (1.0 + g_DiffuseWarp));
#else
	highp float fDiffuseFactor = XSaturate(fNDL);
#endif
	highp float fNdotV = XSaturate(dot(normal, viewDir));
	highp float fVRDotL = XSaturate(dot(viewReflection, lightDir));


	// Ambient. 仅在方向光pass累积环境光；仅当mesh不支持lightmap映射时才模拟环境光。
#if defined(_DIRECTION_LIGHT_) && !defined(_LIGHT_MAP_)   
    highp float fAmbientLightFactor1 = XSaturate(-fNDL);
	highp float fAmbientLightFactor2 = 1.0 - XSaturate(abs(fNDL));
	highp vec3 colAmbient = Ambient1 * fAmbientLightFactor1 + Ambient2 * fAmbientLightFactor2;	
#else
	highp vec3 colAmbient = vec3(0.0, 0.0, 0.0);
#endif       
    
	
    // Diffuse. 只有固定光源或动态光源才计算diffuse光照。
#if defined(_STATIONARY_LIGHT_) || defined(_MOVABLE_LIGHT_)
#	if defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)     
		// Distance attenuation
		highp vec3 worldToLight = (g_PointLight_PosAndInvRadius.xyz - VSOutWorldPosition);                
		highp vec3 ToLightRadius = worldToLight * g_PointLight_PosAndInvRadius.w;
		highp float lightRadial = LightCommon_RadialAttenuation(ToLightRadius, g_PointLight_FalloffExponent);                         
            
#		ifdef _SPOT_LIGHT_
			// Angle attenuation
			highp vec3 ToLightNormal = normalize(worldToLight);
			highp vec3 worldlightDir = normalize(LightDir);
			lightRadial *= LightCommon_SpotAttenuation(ToLightNormal, worldlightDir, g_SpotLight_SpotAngele);          
#		endif  
	
		lightRadial = XSaturate(lightRadial);
		highp vec3 colDiffuse = SunLight * fDiffuseFactor * lightRadial;
#	else
		highp vec3 colDiffuse = SunLight * fDiffuseFactor;
#	endif
#else
	highp vec3 colDiffuse = vec3(0.0, 0.0, 0.0);
#endif
    	

	// Specular. 只有固定光源或动态光源才计算specular高光。
#if defined(SPECULAR_MAP_ENABLE) //&& defined(_RENDER_QUALITY_HIGH_)
	highp vec4 colSpecularTex = texture2D(g_SpecularSampler, Texcoord0); //R:gloss G: power B: NULL
	highp float fSpecPower = g_Power * (colSpecularTex.g + 0.001);
	highp vec3 specColor = g_SpecularGlossiness * g_colMtlSpecular.rgb * colSpecularTex.r;
#endif

#ifdef SPECULAR_ENABLE
	highp float fSpecPower = g_Power;
	highp vec3 specColor = g_SpecularGlossiness * g_colMtlSpecular.rgb;
#endif

#if (defined(SPECULAR_MAP_ENABLE) || defined(SPECULAR_ENABLE)) && (defined(_STATIONARY_LIGHT) || defined(_MOVABLE_LIGHT_))
#	if defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)  
		highp vec3 colSpecular = specColor * pow(fVRDotL, fSpecPower) * lightRadial * SunLight;
#	else
		highp vec3 colSpecular = specColor * pow(fVRDotL, fSpecPower) * SunLight;
#	endif
#else
	highp vec3 colSpecular = vec3(0.0, 0.0, 0.0);
#endif


	// Shadow mask. 只有方向光投射阴影；静态光源无需计算阴影，因为阴影已经烘焙在lightmap中。
#if defined(_DIRECTION_LIGHT_) && (defined(_STATIONARY_LIGHT_) || defined(_MOVABLE_LIGHT_))
#	ifdef _SHADOW_ENABLE_
		highp float fShadowMask = 1.0;
		highp vec3 ShadowColor = vec3(0.0, 0.0, 0.0);
		if (ShadowValid > 0.0)
		{	
			highp vec2 ScreenUV = VSOutScreenPosition.xy / VSOutScreenPosition.w * 0.5 + 0.5;
			fShadowMask = ShadowTest(VSOutWorldPosition, VSOutScreenPosition.w, ScreenUV);
			//#ifndef DIFFUSE_WARP_ENABLE
				//	fShadowMask *= XSaturate(dot(WorldNormal, lightDir) * 6.0 - 0.2); // 解决光线与模型表面平行情况下，阴影抖动的问题
			//#endif
			ShadowColor = ShadowColorAndStrength.rgb;	
		}
		resultColor += (colDiffuse * fShadowMask + colAmbient) * colBaseTex.rgb + colSpecular * fShadowMask;
		resultColor += ShadowColor * (1.0 - fShadowMask);
#	else
		resultColor += (colDiffuse + colAmbient) * colBaseTex.rgb + colSpecular;
#	endif
#else
	resultColor += colDiffuse * colBaseTex.rgb + colSpecular;
#endif	


	// Static lighting. 当mesh支持lightmap映射时，采样lightmap；仅在方向光pass累积静态光照。
#if defined(_LIGHT_MAP_) && defined(_DIRECTION_LIGHT_)
#	ifdef _LM_LDR_
		resultColor += colBaseTex.rgb * texture2D(g_LightMapSampler, VSOutLightMapTexcoord.xy).rgb * g_LightMapIntensity;
#	else
		resultColor += colBaseTex.rgb * decodeRGBE(texture2D(g_LightMapSampler, VSOutLightMapTexcoord.xy).rgba) * g_LightMapIntensity;
#	endif

#	ifdef LIGHT_MAP_UV_OVERLAY
		// Visualize light map UV
		const int cellSize = 1;
		int x = int(VSOutLightMapTexcoord.x * g_LightMapResolution.x);
		int y = int(VSOutLightMapTexcoord.y * g_LightMapResolution.y);
		highp float visColor = mod_int(x / cellSize, 2) == mod_int(y / cellSize, 2) ? 0.75 : 0.0;
		resultColor = mix(resultColor, vec3(visColor), 0.5);
#	endif
#endif


	// SSAO mask.
	//if (g_bSSAOValid > 0.0)
	//{
	//	highp vec2 ScreenUV = VSOutScreenPosition.xy / VSOutScreenPosition.w * 0.5 + 0.5;
	//	highp float fSSAOMask = texture2D(g_SSAOMaskSampler, ScreenUV).x;
	//	resultColor *= fSSAOMask;
	//}  


#ifdef _FOG_ENABLE_
	if (EnableFog > 0.5)
	{
		highp vec4 FogColor = ComputeCompositeFog(VSOutWorldPosition, EyePos);
		resultColor = vec3(mix(resultColor.xyz, FogColor.xyz, FogColor.a));
	}
#endif

#endif // #if defined(_RENDER_QUALITY_LOW_) || defined(UNLIT_ENABLE)

	
#ifdef _ALPHABLEND_
#	ifdef AA_ENABLE
		gl_FragColor = vec4(resultColor, fNdotV * g_AACoefficient);
#	else
#		ifdef MASK_TEXTURE_ENABLE
			highp float MaskAlpha = texture2D(g_ModelMaskSampler, Texcoord0).r;
#			ifdef FLIP_MASK_TEXTURE
				MaskAlpha = 1.0 - MaskAlpha;
#			endif
			gl_FragColor = vec4(resultColor, MaskAlpha);
#		else
			gl_FragColor = vec4(resultColor, colBaseTex.a * g_Opacity);
#		endif		
#	endif
#else
	gl_FragColor = vec4(resultColor.rgb, 1.0);
#endif

}