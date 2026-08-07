//******************************************************************************

// @File         dance_scene_ps.glsl

// @Version      1.0

// @Created      2020, 3, 16

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
_ALPHATEST_						
_ALPHABLEND_
REFLECT
EMISSIVE
TWINKLE
UV_ANIM
SEPARATE_ALPHA
*/

#include "common_ps.glsl"

#if defined(_FOG_ENABLE_) && defined(_ALPHABLEND_)
#include "fogcommon.glsl"
#endif

//------------------------------------------
// parameters
//------------------------------------------
uniform highp vec3		EyePos;

uniform sampler2D		g_DiffuseSampler;		// Maybe has alpha channel
#if (defined(_ALPHATEST_) || defined(_ALPHABLEND_)) && defined(SEPARATE_ALPHA)
uniform sampler2D		g_DiffuseAlphaTex;
#endif
uniform sampler2D		g_LightmapTex;
uniform highp float		g_LightmapIntensity;
#if defined(REFLECT) || defined(EMISSIVE)
uniform sampler2D		g_MaskTex;
#endif

#ifdef TEX_AO
uniform sampler2D		g_AOTex;
uniform highp float		g_AOContrast;
#endif

#ifdef REFLECT
uniform samplerCube		g_CubeReflect;
uniform highp float		g_ReflectAlpha;
#endif

#ifdef EMISSIVE
uniform sampler2D		g_EmissiveTex0;
uniform sampler2D		g_EmissiveTex1;
uniform highp vec4 		g_EmissiveTex_ST;
uniform highp vec4 		g_EmissiveColor;
uniform highp float		g_EmissiveIntensity;
#ifdef TWINKLE
uniform highp float		g_TwinkleSpeed;
#endif
#ifdef UV_ANIM
uniform highp vec2		g_UVAnimSpeed;
#endif
#endif

#ifdef _ALPHATEST_
uniform highp float		g_Cutoff;
#endif

//------------------------------------------
// Varyings
//------------------------------------------
varying mediump vec2	_uv;
varying mediump vec2	_uv2;
#ifdef REFLECT
varying highp vec3		_worldN;
varying highp vec3		_worldV;
#endif
#ifdef EMISSIVE
varying mediump vec2	_emissiveUV;
#ifdef TWINKLE
varying highp float		_emissiveScale;
#endif
#endif

void main (void)
{	
	lowp vec4 baseTex = SampleDiffuseTexture(g_DiffuseSampler, _uv.xy);
	
#if (defined(_ALPHATEST_) || defined(_ALPHABLEND_)) && defined(SEPARATE_ALPHA)
	baseTex.a = texture2D(g_DiffuseAlphaTex, _uv.xy).x;
#endif
	
#ifdef _ALPHATEST_	
	if ((baseTex.a - g_Cutoff) < 0.0)
	{
		discard;
	}
#endif
	
	lowp vec4 finalColor = vec4(0.0, 0.0, 0.0, baseTex.a);

	lowp vec4 bakedLight = texture2D(g_LightmapTex, _uv2.xy);
	finalColor.rgb += g_LightmapIntensity * (baseTex.rgb * bakedLight.rgb);

#ifdef TEX_AO
	lowp float ao = pow(texture2D(g_AOTex, _uv.xy).r, g_AOContrast);
	finalColor.rgb *= ao;
#endif

#if defined(REFLECT) || defined(EMISSIVE)
	lowp vec4 mask = texture2D(g_MaskTex, _uv.xy);
#endif
	
	// Reflect
#ifdef REFLECT
	highp vec3 worldNormal = normalize(_worldN);
	highp vec3 worldViewDir = normalize(EyePos - _worldV);
	highp vec3 worldViewRef = glb_CalcReflection(worldNormal, worldViewDir);
	lowp vec4 colRef = textureCube(g_CubeReflect, worldViewRef);
	finalColor.rgb += colRef.rgb * mask.r * g_ReflectAlpha;
#endif

	// Emissive
#ifdef EMISSIVE
	highp float emissiveIntensity = g_EmissiveIntensity;
	#ifdef TWINKLE
		emissiveIntensity *= _emissiveScale;
	#endif
	lowp vec4 colEmissive0 = texture2D(g_EmissiveTex0, _emissiveUV.xy);
	lowp vec4 colEmissive1 = texture2D(g_EmissiveTex1, _emissiveUV.xy);
	lowp vec4 colEmissive = (colEmissive0 * mask.g + colEmissive1 * mask.b) * g_EmissiveColor;
	finalColor.rgb += colEmissive.rgb * emissiveIntensity;
#endif

	// Fog
#if defined(_FOG_ENABLE_) && defined(_ALPHABLEND_)
	highp vec4 FogColor = ComputeCompositeFog(_worldV, EyePos);
	finalColor.rgb = vec3(mix(finalColor.rgb, FogColor.rgb, FogColor.a));
#endif
	
	gl_FragColor = finalColor;
}