//******************************************************************************

// @File         model_ps.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is model_vs.glsl.

// @HISTORY:

//******************************************************************************/


#include "common_ps.glsl"

/* Macros in this shader:
NORMAL_ENABLE			
*/

//------------------------------------------
// System parameters
//------------------------------------------
uniform highp vec3		SunLight;
uniform highp vec3		Ambient1;
uniform highp vec3		Ambient2;

#ifdef NORMAL_ENABLE
uniform highp float		g_smoothNess;
uniform sampler2D		g_NormalSampler;
#endif

#if defined(_ALPHABLEND_) && defined(TRANS_CLIPPING)
uniform highp float		g_TweakTransparency;
uniform highp float     g_ClippingLevel;
#endif

uniform sampler2D		g_DiffuseSampler;

uniform highp float     g_FresnelFill;      	// Fresnel填充范围
uniform highp float     g_FresnelIntensity; 	// Fresnel强度
uniform highp vec4      g_FresnelColor;     	// Fresnel颜色

uniform highp float     g_CartoonSelfShadowHardness;
uniform highp float     g_CartoonSelfShadowSize;
uniform highp float     g_CartoonSelfShadowIntensity;

uniform highp float     g_GlossIntensity; 
uniform highp float		g_Glossiness;  
uniform highp vec4      g_GlossColor;

uniform highp float     g_CartoonReduceWhite;	// 亮度
uniform highp float     g_CartoonSaturation;	// 饱和度 


//------------------------------------------
// Varyings
//------------------------------------------
varying highp vec2		VSOutTexcoord0;
//varying highp vec2		VSOutTexcoord1;
varying highp vec3		VSOutViewDir;
varying highp vec3		VSOutLightDir;
varying highp vec3		VSOutWorldPosition;
varying highp vec4		VSOutScreenPosition;

#ifdef REFLECT_ENABLE
varying highp vec3		VSOutNormal0;
varying highp vec3		VSOutTangent;
varying highp vec3		VSOutBinormal;
#endif

void main (void)
{
	// UV
	highp vec2 Texcoord0 = VSOutTexcoord0;

	// Sample the diffuse texture.
	highp vec4 colBaseTex = SampleDiffuseTexture(g_DiffuseSampler, Texcoord0);

#ifdef _ALPHATEST_
	if (colBaseTex.a < 0.5)
		discard;
#endif // #ifdef _ALPHATEST_

#if defined(_ALPHABLEND_) && defined(TRANS_CLIPPING)
    highp float Set_MainTexAlpha = colBaseTex.a;
    highp float Set_Clipping = clamp(Set_MainTexAlpha + g_ClippingLevel, 0.0, 1.0);
    if (Set_Clipping < 0.5)
        discard;
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
	highp vec3 colDiffuse = vec3(0.0, 0.0, 0.0);
	highp vec3 colAmbient = vec3(0.0, 0.0, 0.0);
	highp vec3 colSpecular = vec3(0.0, 0.0, 0.0);
    highp vec3 FresnelColorValue = vec3(0.0,0.0,0.0);

	// Light factors
	highp vec3 lightDir = normalize(VSOutLightDir);
	highp vec3 viewDir  = normalize(VSOutViewDir);
	//highp vec3 viewReflection = glb_CalcReflection(normal, viewDir);

	highp float fNDL = dot(normal, lightDir);    
    highp float fDiffuseFactor = XSaturate(fNDL);     
    
#ifdef _DIRECTION_LIGHT_      
    //Ambient
    //highp float fAmbientLightFactor1 = XSaturate(-fNDL);
	//highp float fAmbientLightFactor2 = 1.0 - XSaturate(abs(fNDL));
	//colAmbient = Ambient1 * fAmbientLightFactor1 + Ambient2 * fAmbientLightFactor2;	
#else
    discard;   // material is unlit, Do not enter this process；
#endif   
  
    highp float     _HardEdgeFresnel = 1.0;  // fresnel是否硬边
    highp float     _FresnelOnLight = 0.0;   // 是否在阴影区显示菲涅尔  0 ：有fresnel 1 : 无fresnel
    highp float     _FresnelOnShadow = 0.0;  // 是否在光照区显示菲涅尔  0 ：有fresnel 1 : 无fresnel          
    highp float     _SelfShadowatViewDirection = 0.0;
    highp float     _fSpecularSoft = 0.0;    // 柔和高光 0 : 硬化边缘  1 ：为柔和边缘          
    
    // 由光照暗区+硬边值计算暗区值
    highp float _SelfShadowHardness = clamp(g_CartoonSelfShadowHardness, 0.0, 1.0);	// 自阴影区边界硬化值  
    highp float _SelfShadowSize = clamp(g_CartoonSelfShadowSize, 0.0, 1.0); 
    
    highp float fDiffuseValue = 0.5 * dot(mix(lightDir, viewDir, _SelfShadowatViewDirection ), normal) + 0.5 * mix(2.8, 0.79, _SelfShadowSize);
    fDiffuseValue = clamp(fDiffuseValue, 0.0, 1.0);
    fDiffuseValue = smoothstep(mix(0.3, 0.899, _SelfShadowHardness), 0.9, fDiffuseValue);
    
    // 风格化着色基础色 
    highp float _SelfShadowIntensity = clamp(g_CartoonSelfShadowIntensity, 0.0, 1.0);        
    highp float fShadowValue = mix (1.0, fDiffuseValue, _SelfShadowIntensity);   
   
    highp vec3 colorSelfShadow = clamp(vec3(1.0) - 0.56 / colBaseTex.xyz, 0.0, 1.0) * (1.0 - fShadowValue);  
    colorSelfShadow = colBaseTex.xyz * mix(vec3(fShadowValue), colorSelfShadow, 0.65) * 2.86;  
    colDiffuse = colorSelfShadow * colBaseTex.xyz; 
    
#ifdef CARTOON_FRESNEL 
    // 菲涅耳强度值
    highp float fFresnel_Var = pow((1.0 - max(0.0, dot(normal, viewDir))), exp2((1.0 - g_FresnelFill)));  
    highp float fHardEdgeFresnel_Var = mix(fFresnel_Var, smoothstep( 0.38, 0.4, fFresnel_Var ), _HardEdgeFresnel); 
       
    highp float fresTemp = mix(0.0, fHardEdgeFresnel_Var, (mix(1.0, fDiffuseValue, _FresnelOnLight) * mix(1.0, (1.0 - fDiffuseValue), _FresnelOnShadow))); 
    fresTemp = fHardEdgeFresnel_Var * fresTemp;        
    FresnelColorValue = g_FresnelColor.xyz * fresTemp * g_FresnelIntensity;    
#endif    
    
#ifdef CARTOON_SPECULAR    
    // Specular
    highp float fSpecularValue = pow (max(0.0, dot(normal, normalize(viewDir + lightDir))), exp2(mix (-2.0, 15.0, g_Glossiness)));     
    highp float _SoftGloss_var = mix(smoothstep(0.79, 0.9, fSpecularValue * 3.0), fSpecularValue, _fSpecularSoft);
    colSpecular = _SoftGloss_var * g_GlossColor.xyz * g_GlossIntensity;           
#endif
    
    colAmbient = colBaseTex.rgb * Ambient2.rgb; 
    highp vec3 ResColor1 = (colDiffuse + colSpecular + FresnelColorValue) * SunLight;       
    
    // 亮度控制
    highp vec3 MaxWhite = vec3(1.0 - g_CartoonReduceWhite); 
    colAmbient = clamp(min(colAmbient, MaxWhite), 0.0, 1.0);      
    ResColor1 = clamp(min(ResColor1, MaxWhite), 0.0, 1.0);        
    
    // 饱和度控制    
    highp float fInvSaturation = 1.0 - g_CartoonSaturation; 
    highp vec3 SaturationColor = vec3(0.3, 0.59, 0.11);
    ResColor1 = mix(ResColor1, vec3(dot(ResColor1, SaturationColor)), fInvSaturation);       
    colAmbient = mix(colAmbient, vec3(dot(colAmbient, SaturationColor)), fInvSaturation);    
    
    resultColor = colAmbient + ResColor1;
    
#endif	// #if defined(_RENDER_QUALITY_LOW_) || defined(UNLIT_ENABLE)

#if defined(_ALPHABLEND_) && defined(TRANS_CLIPPING)
    highp float Set_Opacity = clamp((Set_MainTexAlpha + g_TweakTransparency), 0.0, 1.0);
	gl_FragColor = vec4(resultColor, Set_Opacity);
#else
	gl_FragColor = vec4(resultColor.rgb, 1.0);
#endif 
    
}