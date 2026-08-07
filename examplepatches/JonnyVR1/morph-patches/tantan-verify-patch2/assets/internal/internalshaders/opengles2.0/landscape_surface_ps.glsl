//******************************************************************************

// @File         landscape_ps.glsl

// @Version       1.0

// @Created      2020, 1, 20

// @Description  This file is landscape_ps.glsl.

// @HISTORY:

//******************************************************************************/

/* Macros in this shader:
*/

#include "common_ps.glsl"

precision highp float;

#if defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)  
highp float LightCommon_RadialAttenuation(highp vec3 WorldLightVector, highp float FalloffExponent)
{
	highp float NormalizeDistanceSquared = dot(WorldLightVector, WorldLightVector);
	return pow(1.0 - XSaturate(NormalizeDistanceSquared), FalloffExponent);
}

highp float LightCommon_SpotAttenuation(highp vec3 L, highp vec3 SpotDirection, highp vec2 SpotAngles)
{
	highp float ConeAngleFalloff = XSaturate((dot(L, SpotDirection) - SpotAngles.x) * SpotAngles.y);
	return ConeAngleFalloff * ConeAngleFalloff;
}
#endif

#ifdef _SHADOW_ENABLE_
#include "common_shadowtest_ps.glsl"
#endif

#ifdef _FOG_ENABLE_
#include "fogcommon.glsl"
#endif

uniform sampler2D WeightTex0;
uniform sampler2D PaintTex0;
uniform sampler2D PaintTex1;
uniform sampler2D PaintTex2;
uniform sampler2D PaintTex3;

varying vec3 outDebugColor;
varying vec3 NormalWorld;
varying vec2 PaintTexCoord_xy;
varying vec2 PaintTexCoord_xz;
varying vec2 PaintTexCoord_yz;
varying vec2 WeightTexCoord;
varying vec2 HeightTexCoord;

varying highp vec3		VSOutViewDir;	// In world space
varying highp vec3		VSOutLightDir;	// In world space

#if defined(_SHADOW_ENABLE_) || defined(_FOG_ENABLE_) || defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)    
varying highp vec3		VSOutWorldPosition;
#endif
#ifdef _SHADOW_ENABLE_
varying highp vec4		VSOutScreenPosition;
#endif

//------------------------------------------
// System parameters
//------------------------------------------
#if defined(_DIRECTION_LIGHT_) || defined(_SPOT_LIGHT_)
uniform highp vec3		LightDir;
#endif

#if defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)
uniform highp float 	g_PointLight_FalloffExponent;
uniform highp vec4		g_PointLight_PosAndInvRadius;
#endif
#ifdef _SPOT_LIGHT_
uniform highp vec2		g_SpotLight_SpotAngele;
#endif

uniform highp vec3		SunLight;
uniform highp vec3		Ambient1;
uniform highp vec3		Ambient2;
uniform highp vec3		EyePos;
//uniform highp float		g_fDiffusePower;
//uniform highp float		g_bSSAOValid;

#ifdef _ALPHABLEND_
uniform highp float		g_Opacity;
#endif

uniform sampler2D		g_SSAOMaskSampler;


vec3 CalculateFinalColor(sampler2D tex, vec2 uvScale, vec3 BlendWeights)
{
	vec3 xColor = texture2D(tex, PaintTexCoord_yz * uvScale).rgb;
	vec3 yColor = texture2D(tex, PaintTexCoord_xz * uvScale).rgb;
	vec3 zColor = texture2D(tex, PaintTexCoord_xy * uvScale).rgb;
	return xColor * BlendWeights.x + yColor * BlendWeights.y + zColor * BlendWeights.z;
}

vec4 SampleLayerTexture()
{
	float Weight0 = dot(texture2D(WeightTex0, WeightTexCoord), vec4(1.0, 0.0, 0.0, 0.0));	
	float Weight1 = dot(texture2D(WeightTex0, WeightTexCoord), vec4(0.0, 1.0, 0.0, 0.0));		
	float Weight2 = dot(texture2D(WeightTex0, WeightTexCoord), vec4(0.0, 0.0, 1.0, 0.0));	
	float Weight3 = dot(texture2D(WeightTex0, WeightTexCoord), vec4(0.0, 0.0, 0.0, 1.0));
	//debugColor = texture2D(WeightTex0, WeightTexCoord);
	
	vec4 BaseColor = vec4(0.0);
	
	vec3 BlendWeights = abs(NormalWorld);
	//BlendWeights.x = 0.0;
	//BlendWeights.z = 0.0;	
	BlendWeights = BlendWeights / (BlendWeights.x + BlendWeights.y + BlendWeights.z);
	
	
	BaseColor += texture2D(PaintTex0, PaintTexCoord_xz) * Weight0;// CalculateFinalColor(PaintTex0, vec2(1.0), BlendWeights);
	BaseColor += texture2D(PaintTex1, PaintTexCoord_xz) * Weight1;// CalculateFinalColor(PaintTex1, vec2(1.0), BlendWeights);
	BaseColor += texture2D(PaintTex2, PaintTexCoord_xz) * Weight2;// CalculateFinalColor(PaintTex2, vec2(1.0), BlendWeights);
	BaseColor += texture2D(PaintTex3, PaintTexCoord_xz) * Weight3;//  CalculateFinalColor(PaintTex3, vec2(1.0), BlendWeights);
	
	//vec3 xColor = texture(PaintTex4, PaintTexCoord_yz).rgb;
	//vec3 yColor = texture(PaintTex4, PaintTexCoord_xz).rgb;
	//vec3 zColor = texture(PaintTex4, PaintTexCoord_xy).rgb;
	//BlendWeights.z = 0.0f;
	//BlendWeights = BlendWeights / (BlendWeights.x + BlendWeights.y + BlendWeights.z);
	//BaseColor += (xColor * BlendWeights.x + yColor * BlendWeights.y) * Weight4 / WeightSum;
	
	return BaseColor;
}


void main()
{
	vec3 Normal = normalize(NormalWorld);	
	vec4 colBaseTex = SampleLayerTexture();
	
#ifdef _ALPHATEST_
	if (colBaseTex.a < 0.5)
		discard;
#endif // #ifdef _ALPHATEST_

	highp vec3 resultColor = vec3(0.0, 0.0, 0.0);
	
	// Light factors
	highp vec3 lightDir = normalize(VSOutLightDir);
	highp vec3 viewDir  = normalize(VSOutViewDir);
	highp vec3 viewReflection = glb_CalcReflection(Normal, viewDir);
	highp float fNDL = dot(Normal, lightDir);

	highp float fDiffuseFactor = XSaturate(fNDL);

	highp float fNdotV = XSaturate(dot(Normal, viewDir));
	highp float fVRDotL = XSaturate(dot(viewReflection, lightDir));
	
#ifdef _DIRECTION_LIGHT_        
    highp float fAmbientLightFactor1 = XSaturate(-fNDL);
	highp float fAmbientLightFactor2 = 1.0 - XSaturate(abs(fNDL));
	highp vec3 colAmbient = Ambient1 * fAmbientLightFactor1 + Ambient2 * fAmbientLightFactor2;	
#endif   

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


	highp vec3 colSpecular = vec3(0.0, 0.0, 0.0);

#ifdef _DIRECTION_LIGHT_
	#ifdef _SHADOW_ENABLE_
		highp float fShadowMask = 1.0;
		highp vec3 ShadowColor = vec3(0.0, 0.0, 0.0);
		if (ShadowValid > 0.0)
		{	
			highp vec2 ScreenUV = VSOutScreenPosition.xy / VSOutScreenPosition.w * 0.5 + 0.5;
			fShadowMask = ShadowTest(VSOutWorldPosition, VSOutScreenPosition.w, ScreenUV);
			//#ifndef DIFFUSE_WARP_ENABLE
				//	fShadowMask *= XSaturate(dot(WorldNormal, lightDir) * 6.0 - 0.2); // ????????????????????????????????????????
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

#ifdef _FOG_ENABLE_
	if (EnableFog > 0.5)
	{
		highp vec4 FogColor = ComputeCompositeFog(VSOutWorldPosition, EyePos);
		resultColor = vec3(mix(resultColor.xyz, FogColor.xyz, FogColor.a));
	}
#endif
	
#ifdef _ALPHABLEND_
	gl_FragColor = vec4(resultColor, colBaseTex.a * g_Opacity);
#else
	gl_FragColor = vec4(resultColor.rgb, 1.0);
#endif
}
