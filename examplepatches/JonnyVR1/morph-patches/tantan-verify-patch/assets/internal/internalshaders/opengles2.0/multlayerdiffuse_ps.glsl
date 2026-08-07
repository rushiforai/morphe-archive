//******************************************************************************

// @File         multlayerdisfuse.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is model_vs.glsl.

// @HISTORY:

//******************************************************************************/

#include "common_ps.glsl"
#include "lightcommon_ps.glsl"

#ifdef _SHADOW_ENABLE_
#include "common_shadowtest_ps.glsl"
#endif

#ifdef _FOG_ENABLE_
#include "fogcommon.glsl"
#endif

/* Macros in this shader:
_ALPHATEST_						
_ALPHABLEND_
_SHADOW_ENABLE_
_FOG_ENABLE_
NORMAL_ENABLE				
UNLIT_ENABLE
DIFFUSE_WARP_ENABLE
UV_PANNER
UV_SEQUENCE
SPECULAR_ENABLE
SPECULAR_MAP_ENABLE
REFLECT_SPHEREMAP_ENABLE
MULT_LAYER_DIFFUSE_0
MULT_LAYER_DIFFUSE_1
MULT_LAYER_DIFFUSE_2
MULT_LAYER_DIFFUSE_3
*/

//-----------------------------------------------------------------
//System parameter
//-----------------------------------------------------------------
uniform highp vec3		EyePos;
#if defined (UV_PANNER) || defined(UV_SEQUENCE)
uniform highp float		TimeSinceFirstTick;
#endif

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

uniform sampler2D		g_DiffuseSampler;
uniform highp vec4		g_colInputDiffuse_0;
uniform highp vec4		g_colInputDiffuse_1;
uniform highp vec4		g_colInputDiffuse_2;
uniform highp vec4		g_colInputDiffuse_3;
uniform sampler2D		g_LayerDiffuseSampler_1;
uniform sampler2D		g_LayerDiffuseSampler_2;
uniform sampler2D		g_LayerDiffuseSampler_3;

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

highp vec4 MergeMultDiffuseTexture(sampler2D texture, highp vec4 colInputDiffuse, highp vec2 uv, highp vec4 BaseCol)
{    
#ifdef _USING_ETC1_
	highp vec4 TexColor;
	highp float v = clamp(uv.y, 0.01, 0.99);
	TexColor.rgb = texture2D(texture, vec2(uv.x, v * 0.5)).rgb;
	TexColor.a = texture2D(texture, vec2(uv.x, v * 0.5 + 0.5)).r;
#else // #ifdef_USING_ETC1_
	highp vec4 TexColor = texture2D(texture, uv);
#endif // #ifdef_USING_ETC1_                             
    return vec4(colInputDiffuse.rgb * TexColor.rgb * TexColor.a + BaseCol.rgb * (1.0 - TexColor.a), TexColor.a + BaseCol.a);     
}

void main (void)
{
	// UV
	highp vec2 Texcoord0 = VSOutTexcoord0;
	
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

	// Diffuse texture
    highp vec4 colBaseTex = vec4(0.0,0.0,0.0,0.0);   
    
#if defined(MULT_LAYER_DIFFUSE_0)
    colBaseTex = SampleDiffuseTexture(g_DiffuseSampler, Texcoord0);
    colBaseTex.rgb = colBaseTex.rgb * g_colInputDiffuse_0.rgb;
    
#elif defined(MULT_LAYER_DIFFUSE_1)
    colBaseTex = SampleDiffuseTexture(g_DiffuseSampler, Texcoord0);
    colBaseTex.rgb = colBaseTex.rgb * g_colInputDiffuse_0.rgb;
    colBaseTex = MergeMultDiffuseTexture(g_LayerDiffuseSampler_1, g_colInputDiffuse_1, Texcoord0, colBaseTex);  
    
#elif defined(MULT_LAYER_DIFFUSE_2)
    colBaseTex = SampleDiffuseTexture(g_DiffuseSampler, Texcoord0);
    colBaseTex.rgb = colBaseTex.rgb * g_colInputDiffuse_0.rgb;
    colBaseTex = MergeMultDiffuseTexture(g_LayerDiffuseSampler_1, g_colInputDiffuse_1, Texcoord0, colBaseTex); 
    colBaseTex = MergeMultDiffuseTexture(g_LayerDiffuseSampler_2, g_colInputDiffuse_2, Texcoord0, colBaseTex);    
    
#elif defined(MULT_LAYER_DIFFUSE_3)  
    colBaseTex = SampleDiffuseTexture(g_DiffuseSampler, Texcoord0);
    colBaseTex.rgb = colBaseTex.rgb * g_colInputDiffuse_0.rgb;
    colBaseTex = MergeMultDiffuseTexture(g_LayerDiffuseSampler_1, g_colInputDiffuse_1, Texcoord0, colBaseTex);  
    colBaseTex = MergeMultDiffuseTexture(g_LayerDiffuseSampler_2, g_colInputDiffuse_2, Texcoord0, colBaseTex); 
    colBaseTex = MergeMultDiffuseTexture(g_LayerDiffuseSampler_3, g_colInputDiffuse_3, Texcoord0, colBaseTex);  
#else
    colBaseTex = SampleDiffuseTexture(g_DiffuseSampler, Texcoord0);
#endif     

#ifdef _ALPHATEST_
	if (colBaseTex.a < 0.5)
		discard;
#endif // #ifdef _ALPHATEST_

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
	
	// Light factors
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

	// Ambient
#ifdef _DIRECTION_LIGHT_        
    highp float fAmbientLightFactor1 = XSaturate(-fNDL);
	highp float fAmbientLightFactor2 = 1.0 - XSaturate(abs(fNDL));
	highp vec3 colAmbient = Ambient1 * fAmbientLightFactor1 + Ambient2 * fAmbientLightFactor2;	
#endif       
    
    // Diffuse
#if defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)     
    // Distance attenuation
    highp vec3 worldToLight = (g_PointLight_PosAndInvRadius.xyz - VSOutWorldPosition);                
    highp vec3 ToLightRadius = worldToLight * g_PointLight_PosAndInvRadius.w;
    highp float lightRadial = LightCommon_RadialAttenuation(ToLightRadius, g_PointLight_FalloffExponent);                         
            
    #ifdef _SPOT_LIGHT_
        // Angle attenuation
        highp vec3 ToLightNormal = normalize(worldToLight);
        highp vec3 worldlightDir = normalize(LightDir);
        lightRadial *= LightCommon_SpotAttenuation(ToLightNormal, worldlightDir, g_SpotLight_SpotAngele);          
    #endif  
	
	lightRadial = XSaturate(lightRadial);
	highp vec3 colDiffuse = SunLight * fDiffuseFactor * lightRadial;
#else
	highp vec3 colDiffuse = SunLight * fDiffuseFactor;
#endif
    
	// Emissive
#ifdef EMISSIVE_ENABLE
	highp vec3 EmissiveColor = texture2D(g_EmissiveMaskSampler, Texcoord0).x * g_EmissiveColor.rgb;
	resultColor += EmissiveColor;
#endif

	// Reflectance
#if defined (_DIRECTION_LIGHT_) && defined(REFLECT_ENABLE)	
	highp vec3 CubeCoordinates = glb_CalcReflection(normal, VSOutViewDir);
	highp mat3 matT2W = mat3(normalize(VSOutTangent), normalize(VSOutBinormal), normalize(VSOutNormal0));
	CubeCoordinates = normalize(matT2W * CubeCoordinates);
	
	#ifndef REFLECT_SPHEREMAP_ENABLE	
		highp vec3 ReflectColor = textureCube(g_ReflectCubeSampler, CubeCoordinates).xyz;	
	#else		
		highp vec2 coord = vec2(-0.25 + atan(CubeCoordinates.z, CubeCoordinates.x) / 6.2831853, 0.5 - asin(CubeCoordinates.y) / 3.14159265);
		highp vec3 ReflectColor = texture2D(g_Reflect2DSampler, coord, -10.0).xyz;		
	#endif
	
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

	// Specular
#if defined(SPECULAR_MAP_ENABLE) //&& defined(_RENDER_QUALITY_HIGH_)
	highp vec4 colSpecularTex = texture2D(g_SpecularSampler, Texcoord0); //R:gloss G: power B: NULL
	highp float fSpecPower = g_Power * (colSpecularTex.g + 0.001);
	highp vec3 specColor = g_SpecularGlossiness * g_colMtlSpecular.rgb * colSpecularTex.r;
#endif

#ifdef SPECULAR_ENABLE
	highp float fSpecPower = g_Power;
	highp vec3 specColor = g_SpecularGlossiness * g_colMtlSpecular.rgb;
#endif

#if defined(SPECULAR_MAP_ENABLE) || defined(SPECULAR_ENABLE)
	#if defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)  
		highp vec3 colSpecular = specColor * pow(fVRDotL, fSpecPower) * lightRadial * SunLight;
	#else
		highp vec3 colSpecular = specColor * pow(fVRDotL, fSpecPower) * SunLight;
	#endif
#else
	highp vec3 colSpecular = vec3(0.0, 0.0, 0.0);
#endif

	// Shadow mask
#ifdef _DIRECTION_LIGHT_	
	#ifdef _SHADOW_ENABLE_
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
	#else
		resultColor += (colDiffuse + colAmbient) * colBaseTex.rgb + colSpecular;
	#endif
#else
	resultColor += colDiffuse * colBaseTex.rgb + colSpecular;
#endif	

#endif // #if defined(_RENDER_QUALITY_LOW_) || defined(UNLIT_ENABLE)

#ifdef _FOG_ENABLE_
	if (EnableFog > 0.5)
	{
		highp vec4 FogColor = ComputeCompositeFog(VSOutWorldPosition, EyePos);
		resultColor = vec3(mix(resultColor.xyz, FogColor.xyz, FogColor.a));
	}
#endif
	
#ifdef _ALPHABLEND_
	#ifdef AA_ENABLE
		gl_FragColor = vec4(resultColor, fNdotV * g_AACoefficient);
	#else
		gl_FragColor = vec4(resultColor, colBaseTex.a * g_Opacity);
	#endif
#else
	gl_FragColor = vec4(resultColor.rgb, 1.0);
#endif
}
