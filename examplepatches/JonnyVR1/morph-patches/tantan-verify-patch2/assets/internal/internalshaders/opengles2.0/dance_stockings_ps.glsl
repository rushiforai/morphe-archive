//******************************************************************************

// @File         dance_stockings_ps.glsl

// @Version      1.0

// @Created      2020, 3, 1

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
ONE_COLOR
TWO_COLOR	
REFLECT
LEG_LUMINANCE
*/

#include "common_ps.glsl"

//------------------------------------------
// parameters
//------------------------------------------
uniform highp vec3		EyePos;
uniform sampler2D		g_SkinTex;
uniform sampler2D		g_MaskTex3;
uniform sampler2D		g_NormalTexSkin;
uniform sampler2D		g_MainTex;
uniform sampler2D		g_MaskTex2;
uniform sampler2D		g_NormalTexCloth;
uniform sampler2D		g_MaskTex;
uniform highp vec4		g_ClothColor;
uniform highp vec4		g_SpecColorCloth;
uniform highp float		g_ShininessCloth;
uniform highp vec4		g_LightIntensityAmbientCloth;
uniform highp vec4		g_LightDirectionCloth;
uniform highp vec4		g_FresnelWeightAlphaC;
uniform highp vec4		g_DarknessLightness;
uniform highp vec4		g_SkinColor;
uniform highp vec4		g_GlobalLightness;

#if defined(ONE_COLOR) || defined(TWO_COLOR) 
uniform highp vec4		g_ModelColor0;
uniform highp float		g_ColorBrightness;
#endif

#ifdef TWO_COLOR
uniform highp vec4 		g_ModelColor1;
#endif

#ifdef REFLECT
uniform samplerCube		g_CubeReflect;
uniform highp float		g_ReflectAlpha;
#endif

#ifdef LEG_LUMINANCE
uniform highp vec4		g_LegLuminance;
#endif

//------------------------------------------
// Varyings
//------------------------------------------
varying mediump vec2	_uv;
varying highp vec3		_worldN;
varying highp vec3		_worldV;
varying highp float		_SHLighting;
varying highp vec3		_tangentWorld;
varying highp vec3		_binormalWorld;

void main (void)
{
	// SKIN_PARAM_DEFINES
	const lowp vec4 _Color = vec4(0.588,0.588,0.588,1);
	const lowp vec4 _SpecColorSkin = vec4(0.808,0.46,0.38,0.25);
	const mediump float _ShininessSkin = 1.0;
	const mediump vec3 _LightIntensityAmbientSkin = vec3(0.6,1.25,0.1);
	const mediump vec3 _LightDirectionSkin = vec3(0.0,-0.25,0.0);
	
	// CLOTH_SKIN_BASE
	lowp vec4 color_ref_m = texture2D(g_MaskTex, _uv);
	lowp vec4 cloth_m = texture2D(g_MaskTex2, _uv);
	lowp vec4 skin_m = texture2D(g_MaskTex3, _uv);
	lowp vec4 skin_c = texture2D(g_SkinTex, _uv) * _Color;
	lowp vec4 cloth_c = texture2D(g_MainTex, _uv) * g_ClothColor;
	highp vec3 skin_n = glb_SamplerNormalMap_ApplyStrength(g_NormalTexSkin, _uv.xy, 1.0);
	highp vec3 cloth_n = glb_SamplerNormalMap_ApplyStrength(g_NormalTexCloth, _uv.xy, 1.0);

	lowp float skin_Gray = skin_c.r * 0.299 + skin_c.g * 0.587 + skin_c.b * 0.114; 
	lowp vec3 c_Skin = mix(mix(skin_c.rgb, g_SkinColor.rgb * skin_Gray, g_SkinColor.a), skin_c.rgb, skin_m.b);
	
#ifdef TWO_COLOR
	// CLOTH_MODEL_COLOR2
	lowp float cloth_Gray = cloth_c.r * 0.299 + cloth_c.g * 0.587 + cloth_c.b * 0.114;
	mediump vec3 col0 = cloth_Gray *  g_ModelColor0.rgb;
	mediump vec3 col1 = cloth_Gray *  g_ModelColor1.rgb;
	mediump float c_alpha = 1.0 - min(1.0, color_ref_m.r + color_ref_m.g);

	lowp vec3 c_Cloth = (mix(cloth_c.rgb, col0, g_ModelColor0.a) * color_ref_m.r +
						mix(cloth_c.rgb, col1, g_ModelColor1.a) * color_ref_m.g) * g_ColorBrightness + cloth_c.rgb * c_alpha; 
#elif defined(ONE_COLOR)
	// CLOTH_MODEL_COLOR1
	lowp float cloth_Gray = cloth_c.r * 0.299 + cloth_c.g * 0.587 + cloth_c.b * 0.114;
	#ifdef LEG_LUMINANCE
	cloth_c.rgb = mix(cloth_c.rgb, g_LegLuminance.rgb * cloth_Gray, g_LegLuminance.a);
	#endif
	lowp vec3 c_Cloth = mix(cloth_c.rgb, cloth_Gray *  g_ModelColor0.rgb, g_ModelColor0.a) * g_ColorBrightness;
	c_Cloth = mix(cloth_c.rgb, c_Cloth, color_ref_m.r);
#else
	// CLOTH_NO_MODEL_COLOR
	lowp vec3 c_Cloth = cloth_c.rgb;
#endif
	
	// CLOTH_SKIN_LIGHT
	highp vec3 worldN = normalize(_worldN);
	highp mat3 tangent2World = mat3(normalize(_tangentWorld), normalize(_binormalWorld), worldN);
	highp vec3 skin_normalDirection = normalize(tangent2World * skin_n);
	highp vec3 cloth_normalDirection = normalize(tangent2World * cloth_n);	
	highp vec3 viewDirection = normalize((EyePos.xyz - _worldV));
	highp float worldVNDot = dot(viewDirection, worldN);
	
	highp vec3 LightDirectionLerp = mix(_LightDirectionSkin, g_LightDirectionCloth.xyz, cloth_m.g);
	highp vec3 CamSpaceLightDir = normalize(viewDirection - LightDirectionLerp).xyz;
	highp vec3 refl = reflect(-CamSpaceLightDir, cloth_normalDirection);
	
	highp float RefDot = max(0.0, dot(refl, viewDirection));
	lowp float skin_normalAmount = abs(dot(skin_normalDirection, CamSpaceLightDir));
	lowp float cloth_normalAmount = abs(dot(cloth_normalDirection, CamSpaceLightDir));

	highp vec3 specSkin = skin_normalAmount * _SpecColorSkin.rgb * _SpecColorSkin.a * pow(RefDot, _ShininessSkin) * skin_m.r;
	highp vec3 specCloth = cloth_normalAmount * g_SpecColorCloth.rgb * g_SpecColorCloth.a * pow(RefDot, g_ShininessCloth) * cloth_m.r;

	mediump float skin_l = (_LightIntensityAmbientSkin.x * skin_normalAmount + _LightIntensityAmbientSkin.y + _LightIntensityAmbientSkin.z * skin_m.g);
	mediump float cloth_l = (g_LightIntensityAmbientCloth.x * cloth_normalAmount + g_LightIntensityAmbientCloth.y) * _SHLighting;

	mediump vec4 final_c;
	final_c.rgb = mix(skin_l * c_Skin, cloth_l * c_Cloth, cloth_m.g);
	final_c.a = 1.0; // For Render Icon 
	
	// Specular & Reflect
#ifdef REFLECT
	// SPECULAR_REFLECT
	lowp vec4 refc = textureCube(g_CubeReflect, refl) * cloth_normalAmount;
	final_c.rgb += mix(specSkin, specCloth + refc.rgb * color_ref_m.b * g_ReflectAlpha, cloth_m.g);
#else
	// SPECULAR_ONLY
	final_c.rgb += mix(specSkin, specCloth, cloth_m.g);
#endif
	
	// fresnel (FRESNEL_CLOTH_ONLY)
	highp float wVNDot = abs(worldVNDot);
	final_c.rgb = mix( final_c.rgb, mix( final_c.rgb, g_FresnelWeightAlphaC.zzz, g_FresnelWeightAlphaC.y * (1.0 - XSaturate(wVNDot / g_FresnelWeightAlphaC.x))), cloth_m.g);

	final_c *= g_GlobalLightness;
	gl_FragColor = final_c;
	
}