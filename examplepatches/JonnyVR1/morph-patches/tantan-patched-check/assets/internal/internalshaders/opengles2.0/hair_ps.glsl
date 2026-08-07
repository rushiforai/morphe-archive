//******************************************************************************

// @File         model_ps.glsl

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
*/

highp vec3 _ShfitTangent(highp vec3 T, highp vec3 N, highp float shift)
{
	highp vec3 vNewT = T + N * shift;
	return vNewT;
}

highp float _StrandSpecularTex(sampler2D LUTSampler, highp vec3 T, highp vec3 H, highp vec3 V, highp vec3 L, highp float fExp)
{
	highp float fDotTH = dot(T, H)*0.5+0.5;
	highp vec2 LUTTexCoord = vec2(fDotTH,fExp);
	highp float fLUT = texture2D(LUTSampler, LUTTexCoord).x;
	return fLUT;
}

//------------------------------------------
// System parameters
//------------------------------------------

#if defined(SPECULAR_MAP_ENABLE) || defined(SPECULAR_ENABLE)
//uniform highp float		g_Power;
uniform highp float		g_SpecularGlossiness;
//uniform highp vec4		g_colMtlSpecular;
#endif

#ifdef SPECULAR_MAP_ENABLE
uniform sampler2D	 	g_SpecularSampler;
#endif

#if (defined (_DIRECTION_LIGHT_) && defined(REFLECT_ENABLE)) || defined(NORMAL_ENABLE)
uniform highp float		g_smoothNess;
#endif

#ifdef _ALPHABLEND_
uniform highp float		g_Opacity;
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

uniform sampler2D		g_DiffuseSampler;
uniform sampler2D		g_SSAOMaskSampler;
uniform sampler2D		g_HairLUTSampler;
uniform highp float		g_SpecularBaseShift;

//------------------------------------------
// Varyings
//------------------------------------------
varying highp vec2		VSOutTexcoord0;
//varying highp vec2		VSOutTexcoord1;
varying highp vec3		VSOutViewDir;
varying highp vec3		VSOutLightDir;
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

void main (void)
{
	// Sample the diffuse texture.
	highp vec4 colBaseTex = SampleDiffuseTexture(g_DiffuseSampler, VSOutTexcoord0);

#ifdef _ALPHATEST_
	if (colBaseTex.a < 0.5)
		discard;
#endif // #ifdef _ALPHATEST_

#if defined(_RENDER_QUALITY_LOW_) || defined(UNLIT_ENABLE)

	highp vec3 resultColor = colBaseTex.rgb * 1.1;

#else // #if defined(_RENDER_QUALITY_LOW_) || defined(UNLIT_ENABLE)
	
	highp vec3 resultColor = vec3(0.0, 0.0, 0.0);

	highp vec3 lightDir = normalize(VSOutLightDir);
	highp vec3 viewDir = normalize(VSOutViewDir);

    // Normal
#ifdef NORMAL_ENABLE
	highp vec3 normal = glb_SamplerNormalMap(g_NormalSampler, VSOutTexcoord0, g_smoothNess);
#else
	highp vec3 normal = vec3(0.0, 0.0, 1.0);
#endif

	highp vec3 tangent = vec3(0.0, 1.0, 0.0);
	highp float fNDotL = dot(normal, lightDir);	

	// Ambient
	highp vec3 colAmbient = vec3(0.0, 0.0, 0.0);
#ifdef _DIRECTION_LIGHT_        
    highp float fAmbientLightFactor1 = XSaturate(-fNDotL);
	highp float fAmbientLightFactor2 = 1.0 - XSaturate(abs(fNDotL));
	colAmbient = Ambient1 * fAmbientLightFactor1 + Ambient2 * fAmbientLightFactor2;	
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
	highp vec3 colDiffuse = XSaturate(mix(0.25, 1.0, max(fNDotL, 0.0))) * SunLight * lightRadial;
#else
	highp vec3 colDiffuse = XSaturate(mix(0.25, 1.0, max(fNDotL, 0.0))) * SunLight;
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
		ReflectColor *= texture2D(g_ReflectMaskSampler, VSOutTexcoord0).x;
	}
	else
	{
		ReflectColor *= g_ReflectParam;
	}
	
	ReflectColor *= g_smoothNess;
	resultColor += ReflectColor;
#endif   

	// Specular
	highp vec3 colSpecular = vec3(0.0, 0.0, 0.0);
#if defined(SPECULAR_MAP_ENABLE) || defined(SPECULAR_ENABLE)
	highp vec4 hairShift = vec4(0.0, 0.7, 0.4, 0.3);
	highp vec3 colSpec1 = vec3(0.576, 0.576, 0.576);
	highp vec3 colSpec2 = vec3(0.576, 0.576, 0.576);
		
	highp float fBaseShift = g_SpecularBaseShift;
	highp float fSpecularMask = g_SpecularGlossiness;
		
	#if defined(SPECULAR_MAP_ENABLE)
		highp vec4 colSpecTex = texture2D(g_SpecularSampler, VSOutTexcoord0);
		fSpecularMask *= colSpecTex.r;
	#endif

	highp vec3 t1 = _ShfitTangent(tangent, normal, fBaseShift + hairShift.x);
	highp vec3 t2 = _ShfitTangent(tangent, normal, fBaseShift + hairShift.y);
	highp vec3 h = normalize(lightDir + viewDir);

	highp vec3 colSpecular1 = colSpec1 * _StrandSpecularTex(g_HairLUTSampler, t1, h, viewDir, lightDir, hairShift.z);
	highp vec3 colSpecular2 = colSpec2 * _StrandSpecularTex(g_HairLUTSampler, t2, h, viewDir, lightDir, hairShift.w);

	highp float specularAttenuation = XSaturate(1.75 * dot(normal, lightDir) + 0.25);
	
#if defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)  
	colSpecular = (colSpecular1 + colSpecular2) * fSpecularMask * SunLight * specularAttenuation * lightRadial;
#else
	colSpecular = (colSpecular1 + colSpecular2) * fSpecularMask * SunLight * specularAttenuation;
#endif

#endif  // #if defined(SPECULAR_MAP_ENABLE) || defined(SPECULAR_ENABLE)

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
			//	fShadowMask *= XSaturate(dot(WorldNormal, lightDir) * 6.0 - 0.2); // ���������ģ�ͱ���ƽ������£���Ӱ����������
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

	// SSAO mask
	//if (g_bSSAOValid > 0.0)
	//{
	//	highp vec2 ScreenUV = VSOutScreenPosition.xy / VSOutScreenPosition.w * 0.5 + 0.5;
	//	highp float fSSAOMask = texture2D(g_SSAOMaskSampler, ScreenUV).x;
	//	resultColor *= fSSAOMask;
	//} 

#endif // #if defined(_RENDER_QUALITY_LOW_) || defined(UNLIT_ENABLE)

#ifdef _FOG_ENABLE_
	if (EnableFog > 0.5)
	{
		highp vec4 FogColor = ComputeCompositeFog(VSOutWorldPosition, EyePos);
		resultColor = vec3(mix(resultColor.xyz, FogColor.xyz, FogColor.a));
	}
#endif
	
#ifdef _ALPHABLEND_
	gl_FragColor = resultColor;
#else
	gl_FragColor = vec4(resultColor.rgb, 1.0);
#endif
}
