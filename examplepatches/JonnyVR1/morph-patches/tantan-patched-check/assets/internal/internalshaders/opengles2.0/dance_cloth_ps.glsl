//******************************************************************************

// @File         dance_cloth_ps.glsl

// @Version      1.0

// @Created      2020, 2, 25

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
_ALPHATEST_						
_ALPHABLEND_
ONE_COLOR
TWO_COLOR	
REFLECT
ANIM_REFLECT
*/

#include "common_ps.glsl"

//------------------------------------------
// parameters
//------------------------------------------
uniform highp vec3		EyePos;
uniform highp vec4 		g_Color;
uniform sampler2D		g_MainTex;
uniform sampler2D		g_MaskTex2;
uniform sampler2D		g_NormalTex;
uniform highp vec4		g_LightDirectionCloth;
uniform highp vec4		g_SpecColorCloth;
uniform highp float		g_ShininessCloth;
uniform highp vec4		g_LightIntensityAmbient;
uniform highp vec4		g_FresnelWeightAlphaC;
uniform highp vec4		g_GlobalLightness;

#ifdef _ALPHATEST_
uniform highp float		g_Cutoff;
#endif

#if defined(ONE_COLOR) || defined(TWO_COLOR) || defined(REFLECT) || defined(ANIM_REFLECT)
uniform sampler2D		g_MaskTex;
#endif

#if defined(ONE_COLOR) || defined(TWO_COLOR)
uniform highp vec4		g_ModelColor0;
uniform highp float		g_ColorBrightness;
#endif

#ifdef TWO_COLOR
uniform highp vec4 		g_ModelColor1;
#endif

#if (defined(ONE_COLOR) || defined(TWO_COLOR)) && !defined(_ALPHATEST_) && !defined(_ALPHABLEND_)
uniform highp float		g_BloomFactorHDR;
#endif

#if defined(REFLECT) || defined(ANIM_REFLECT)
uniform samplerCube		g_CubeReflect;
uniform highp float		g_ReflectAlpha;
#endif

//------------------------------------------
// Varyings
//------------------------------------------
varying mediump vec4	_uv;
#ifdef ANIM_REFLECT
varying mediump vec4	_uv2;
#endif
varying highp vec3		_worldN;
varying highp vec3		_worldV;
varying highp float		_SHLighting;
varying highp vec3		_tangentWorld;
varying highp vec3		_binormalWorld;

void main (void)
{
	mediump vec4 c = texture2D(g_MainTex, _uv.xy) * g_Color;		
	lowp vec4 mask2 = texture2D(g_MaskTex2, _uv.xy);
	
#if defined(_ALPHATEST_) || defined(_ALPHABLEND_)
	c.a = mask2.g * g_Color.a;
#else
	c.a = 1.0; // For Render Icon
#endif
	
#ifdef _ALPHATEST_	
	if ((c.a - g_Cutoff) < 0.0)
	{
		discard;
	}
#endif
	
#if defined(ONE_COLOR) || defined(TWO_COLOR) || defined(REFLECT)
	lowp vec4 mask = texture2D(g_MaskTex, _uv.xy);
#endif
	
#if defined(ONE_COLOR) || defined(TWO_COLOR)	
	mediump float c_alpha = 1.0 - mask.r;	
	mediump float c_Gray = c.r * 0.299 + c.g * 0.587 + c.b * 0.114; 
	mediump vec3 col0 = c_Gray * g_ModelColor0.rgb;

	#ifdef ONE_COLOR
	c.rgb = mix(c.rgb, col0, g_ModelColor0.a) * mask.r * g_ColorBrightness + c.rgb * c_alpha;
	#endif

	#ifdef TWO_COLOR
	mediump vec3 col1 = c_Gray * g_ModelColor1.rgb;
	mediump float c_alpha2 = max(1.0 - mask.r - mask.g, 0.0);
	c.rgb = (mix(c.rgb, col0, g_ModelColor0.a) * mask.r + mix(c.rgb, col1, g_ModelColor1.a) * mask.g) * g_ColorBrightness + c.rgb * c_alpha2;

	#endif
#endif
	
	highp vec3 normal = glb_SamplerNormalMap_ApplyStrength(g_NormalTex, _uv.xy, 1.0);
			
	highp vec3 worldN = normalize(_worldN);
	highp mat3 tangent2World = mat3(normalize(_tangentWorld), normalize(_binormalWorld), worldN);
    highp vec3 normalDirection = normalize(tangent2World * normal);
			
	highp vec3 viewDirection = normalize((EyePos.xyz - _worldV));
	highp float worldVNDot = dot(viewDirection, worldN);

	mediump vec3 CamSpaceLightDir = normalize(viewDirection - g_LightDirectionCloth.xyz).xyz;
	highp vec3 refl = reflect(-CamSpaceLightDir, normalDirection);

	highp float RefDot = max(0.0, dot(refl, viewDirection));
	lowp float normalAmount = abs(dot(normalDirection, CamSpaceLightDir));

	highp vec3 specCloth = g_SpecColorCloth.rgb * g_SpecColorCloth.a * pow(RefDot, g_ShininessCloth);

	c.rgb *= (g_LightIntensityAmbient.x * normalAmount + g_LightIntensityAmbient.y);
	c.rgb *= _SHLighting;
			
	// Specular & Reflect
	c.rgb += specCloth * normalAmount * mask2.r;	
#ifdef REFLECT
	lowp vec4 refc = textureCube(g_CubeReflect, refl);
	c.rgb += refc.rgb * mask.b * g_ReflectAlpha * normalAmount;
#elif defined(ANIM_REFLECT)
	lowp vec4 refc = textureCube(g_CubeReflect, refl);
	lowp vec4 animReflectMask = texture2D(g_MaskTex, _uv2.zw);
	lowp vec4 animMask = texture2D(g_MaskTex, _uv2.xy);
	c.rgb += animMask.b * refc.rgb * animReflectMask.r * g_ReflectAlpha * normalAmount;
#endif
			
	// fresnel (FRESNEL_CLOTH)	
	highp float wVNDot = abs(worldVNDot);
	c.rgb = mix(c.rgb, g_FresnelWeightAlphaC.zzz, g_FresnelWeightAlphaC.y * (1.0 - XSaturate(wVNDot / g_FresnelWeightAlphaC.x)));
			
	c *= g_GlobalLightness;
	
#if (defined(ONE_COLOR) || defined(TWO_COLOR)) && !defined(_ALPHATEST_) && !defined(_ALPHABLEND_)
	c.a = g_BloomFactorHDR;
#endif
	
	gl_FragColor = c;
}