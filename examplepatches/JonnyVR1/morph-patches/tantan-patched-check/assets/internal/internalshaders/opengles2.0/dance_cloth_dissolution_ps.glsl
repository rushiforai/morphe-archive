//******************************************************************************

// @File         dance_cloth_dissolution_ps.glsl

// @Version      1.0

// @Created      2020, 2, 25

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
_ALPHATEST_						
_ALPHABLEND_
ANIM_REFLECT
*/

#include "common_ps.glsl"

//------------------------------------------
// parameters
//------------------------------------------
uniform highp vec3		EyePos;
uniform highp float		TimeSinceFirstTick;
uniform highp vec4 		g_Color;
uniform sampler2D		g_MainTex;
uniform highp vec4		g_MainTex_ST;
uniform sampler2D		g_MaskTex;
uniform sampler2D		g_MaskTex2;
uniform samplerCube		g_CubeReflect;
uniform sampler2D		g_NormalTex;
uniform sampler2D		g_DissolutionTex;
uniform highp vec4		g_DissolutionTex_ST;
uniform highp vec4		g_SpecColorCloth;
uniform highp float		g_ShininessCloth;
uniform highp vec4		g_FresnelWeightAlphaC;
uniform highp vec4		g_DarknessLightness;
uniform highp float		g_ReflectAlpha;
uniform highp float		g_Cutoff;
uniform highp vec4		g_GlobalLightness;
uniform highp vec4		g_LightIntensityAmbient;
uniform highp vec4		g_LightDirectionCloth;
uniform highp vec4		g_DissolutionSpeed;
uniform highp vec4		g_DissolutionColor;
uniform highp vec4		g_DissolutionColor2;
uniform highp float		g_SwitchUV;
uniform highp float		g_Edge;
uniform highp float		g_EdgeLeve;
uniform highp float		g_MaskLeve;
uniform highp float		g_ColourLeve;
uniform highp float		g_FlowSpeed;

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
	
	c.a = mask2.g * g_Color.a;
	
#if defined(_ALPHATEST_)
	if ((c.a - g_Cutoff) < 0.0)
	{
		discard;
	}
	c.a = 1.0; // For Render Icon
#endif

#ifdef ANIM_REFLECT
	lowp vec4 mask = texture2D(g_MaskTex, _uv2.zw);
	lowp vec4 animMask = texture2D(g_MaskTex, _uv2.xy);
#else
	lowp vec4 mask = texture2D(g_MaskTex, _uv.xy);
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
	
	lowp vec4 refc = textureCube(g_CubeReflect, refl);
	
	c.rgb *= (g_LightIntensityAmbient.x * normalAmount + g_LightIntensityAmbient.y);
	c.rgb *= _SHLighting;
	
	//-----------------------------------------------------------
	// Emissive
	highp vec4 _Time = vec4(TimeSinceFirstTick / 20.0, TimeSinceFirstTick, TimeSinceFirstTick * 2.0, TimeSinceFirstTick * 3.0);
	highp float isUV0 = step(g_SwitchUV, 0.5);
	highp float isUV1 = step(0.5, g_SwitchUV);
	highp vec2 uv2 = vec2(_uv.xy * isUV0 + _uv.zw * isUV1);
	highp vec4 node_2013 = _Time;
	highp vec2 node_9484 = (uv2 + (node_2013.r * g_FlowSpeed) * vec2(1.0, -1.0));
	highp vec4 _EmissionTex2_var = texture2D(g_DissolutionTex, (node_9484.xy * g_DissolutionTex_ST.xy + g_DissolutionTex_ST.zw));

	highp float moveTemp_0_1 = mod(_Time.y * g_DissolutionSpeed.x, 1.0);
	highp float Temp = mod(_Time.y * 2.0 * g_DissolutionSpeed.x, 2.0);
	highp float Temp2 = (2.0 - Temp);
	highp float moveTemp_0_1_0 = Temp * step(Temp, 1.0) + Temp2 * step(Temp2, 1.0);
	highp float node_9407_if_leA = step(moveTemp_0_1, _EmissionTex2_var.g);
	highp float node_9407_if_leB = step(_EmissionTex2_var.g, moveTemp_0_1);
	highp float node_8969 = 0.0;
	highp float node_5614 = 1.0;
	highp float node_9407_x = mix((node_9407_if_leA * node_8969) + (node_9407_if_leB * node_5614), node_8969, node_9407_if_leA * node_9407_if_leB);
	highp vec3 node_9407 = vec3(node_9407_x, node_9407_x, node_9407_x);
	highp float node_7175_if_leA = step((g_Edge * moveTemp_0_1), _EmissionTex2_var.g);
	highp float node_7175_if_leB = step(_EmissionTex2_var.g, (g_Edge * moveTemp_0_1));
	highp vec4 _EmissionTex_var = texture2D(g_DissolutionTex, (uv2.xy * g_DissolutionTex_ST.xy + g_DissolutionTex_ST.zw));
	highp vec4 _MainTex_var = texture2D(g_MainTex, (_uv.xy * g_MainTex_ST.xy + g_MainTex_ST.zw));
	highp vec3 emissive = (_MainTex_var.rgb *
				(
					(
						(
							node_9407 + (g_EdgeLeve * (mix((node_7175_if_leA * node_8969) + (node_7175_if_leB * node_5614), node_8969, node_7175_if_leA * node_7175_if_leB) - node_9407))
							) * moveTemp_0_1_0 * ((_EmissionTex_var.r * g_MaskLeve) * g_DissolutionColor.rgb)
						) + (_EmissionTex_var.r * g_DissolutionColor2.rgb * g_ColourLeve)
					)
				);
	//-----------------------------------------------------------
			
	// Specular & Reflect & flow
#ifdef ANIM_REFLECT	
	c.rgb += specCloth * normalAmount * mask2.r + animMask.b * refc.rgb * mask.r * g_ReflectAlpha * normalAmount + emissive;
#else
	c.rgb += specCloth * normalAmount * mask2.r + refc.rgb * mask.b * g_ReflectAlpha * normalAmount + emissive;
#endif
			
	// fresnel (FRESNEL_CLOTH)	
	highp float wVNDot = abs(worldVNDot);
	c.rgb = mix(c.rgb, g_FresnelWeightAlphaC.zzz, g_FresnelWeightAlphaC.y * (1.0 - XSaturate(wVNDot / g_FresnelWeightAlphaC.x)));
					
	c *= g_GlobalLightness;
	
	gl_FragColor = c;
}