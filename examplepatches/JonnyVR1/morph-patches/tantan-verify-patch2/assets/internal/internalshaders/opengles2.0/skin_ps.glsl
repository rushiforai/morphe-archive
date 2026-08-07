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

NORMAL_ENABLE					
UNLIT_ENABLE	
RECEIVE_SHADOW

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

//--------------------------------------------------------
// Conversion between RGB and HSL
//--------------------------------------------------------
highp float Epsilon = 1e-10;

highp vec4 lerp(in highp vec4 A, in highp vec4 B, in highp float l)
{
	highp vec4 result;
	result.x = A.x * (1.0 - l) + B.x * l;
	result.y = A.y * (1.0 - l) + B.y * l;
	result.z = A.z * (1.0 - l) + B.z * l;
	result.w = A.w * (1.0 - l) + B.w * l;
	return result;
}

highp vec3 rgb2hcv(in highp vec3 RGB)
{
	// Based on work by Sam Hocevar and Emil Persson
	highp vec4 P = lerp(vec4(RGB.b, RGB.g, -1.0, 2.0 / 3.0), vec4(RGB.g, RGB.b, 0.0, -1.0 / 3.0), step(RGB.b, RGB.g));
	highp vec4 Q = lerp(vec4(P.x, P.y, P.w, RGB.r), vec4(RGB.r, P.y, P.z, P.x), step(P.x, RGB.r));
	highp float C = Q.x - min(Q.w, Q.y);
	highp float H = abs((Q.w - Q.y) / (6.0 * C + Epsilon) + Q.z);
	return vec3(H, C, Q.x);
}

highp vec3 rgb2hsl(in highp vec3 RGB)
{
	highp vec3 HCV = rgb2hcv(RGB);
	highp float L = HCV.z - HCV.y * 0.5;
	highp float S = HCV.y / (1.0 - abs(L * 2.0 - 1.0) + Epsilon);
	return vec3(HCV.x, S, L);
}

highp vec3 hsl2rgb(highp vec3 c)
{
	c = vec3(fract(c.x), clamp(c.yz, 0.0, 1.0));
	highp vec3 rgb = clamp(abs(mod(c.x * 6.0 + vec3(0.0, 4.0, 2.0), 6.0) - 3.0) - 1.0, 0.0, 1.0);
	return c.z + c.y * (rgb - 0.5) * (1.0 - abs(2.0 * c.z - 1.0));
}

//------------------------------------------
// System parameters
//------------------------------------------
uniform highp vec3		EyePos;
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
uniform sampler2D		g_SkinWarpSampler;
uniform highp float		g_SaturationAdjust;
uniform highp float		g_LuminanceAdjust;

//------------------------------------------
// Varyings
//------------------------------------------
varying highp vec2	    VSOutTexcoord0;
//varying highp vec2	    VSOutTexcoord1;
varying highp vec3	    VSOutViewDir;
varying highp vec3	    VSOutLightDir;
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

//highp float FresnelReflectance (highp vec3 H, highp vec3 V, highp float F0)
//{
//	highp float base = 1.0 - dot( V, H );
//	highp float exponential = pow(base, 5.0);
//	return exponential + F0 * ( 1.0 - exponential );
//}

//highp float KS_Skin_Specular(highp vec3 N, highp vec3 L, highp vec3 V, highp float m, highp float rho_s/*, sampler2D beckmannTex*/)
//{
//	highp float result = 0.0;
//	highp float ndotl = dot( N, L );
//	if ( ndotl > 0.0 )
//	{
//		highp vec3 h = L + V; // Unnormalized half-way vector
//		highp vec3 H = normalize( h );
//		highp float ndoth = dot( N, H );
//		// Beckmann distribution
//		//highp float PH = pow( 2.0 * texture2D(beckmannTex, vec2(ndoth, 1.0 - m)).r, 10.0 );
//		highp float alpha = acos( ndoth );
//		highp float ta = tan( alpha );
//		highp float PH = 1.0 / ( m * m * pow( ndoth, 4.0 ) ) * exp( -( ta * ta ) / ( m * m ) );
//		highp float F = FresnelReflectance( H, V, 0.028 );
//		highp float frSpec = max( PH * F / dot( h, h ), 0.0 );
//		result = frSpec * ndotl * rho_s; // BRDF * dot(N,L) * rho_s
//	}
//	return result;
//}

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

	// Sample the diffuse texture.
	highp vec4 colBaseTex = SampleDiffuseTexture(g_DiffuseSampler, Texcoord0);
	
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

	highp float fNdotV = XSaturate(dot(normal, viewDir));
	highp float fVRDotL = XSaturate(dot(viewReflection, lightDir));

	// Ambient
#ifdef _DIRECTION_LIGHT_        
    highp float fAmbientLightFactor1 = XSaturate(-fNDL);
	highp float fAmbientLightFactor2 = 1.0 - XSaturate(abs(fNDL));
	highp vec3 colAmbient = Ambient1 * fAmbientLightFactor1 + Ambient2 * fAmbientLightFactor2;	
#endif     
	
	// Diffuse
	fNDL = fNDL * 0.5 + 0.5;
	highp vec3 colSkinTex = texture2D(g_SkinWarpSampler, vec2(fNDL, 0.5)).rgb;
	highp vec3 hsl = rgb2hsl(colSkinTex);
	hsl.y *= (1.0 + g_SaturationAdjust * 0.01);
	colSkinTex = hsl2rgb(hsl);
	colSkinTex *= (1.0 + g_LuminanceAdjust * 0.01);  
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
	highp vec3 colDiffuse = SunLight * colSkinTex * lightRadial;
#else
	highp vec3 colDiffuse = SunLight * colSkinTex;
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
	gl_FragColor = vec4(resultColor, colBaseTex.a * g_Opacity);
#else
	gl_FragColor = vec4(resultColor.rgb, 1.0);
#endif
}