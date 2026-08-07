//******************************************************************************

// @File         dance_cloth_flow_ps.glsl

// @Version      1.0

// @Created      2020, 2, 25

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
_ALPHATEST_						
_ALPHABLEND_
FLOW_RGBA
FLOW_DISCOLOUR
*/

#include "common_ps.glsl"

//------------------------------------------
// parameters
//------------------------------------------
uniform highp vec3		EyePos;
uniform highp float		TimeSinceFirstTick;
uniform highp vec4 		g_Color;
uniform sampler2D		g_MainTex;
uniform sampler2D		g_MaskTex;
uniform sampler2D		g_MaskTex2;
uniform samplerCube		g_CubeReflect;
uniform sampler2D		g_NormalTex;
uniform sampler2D		g_FlowTex;
uniform highp vec4		g_FlowTex_ST;
uniform highp vec4		g_SpecColorCloth;
uniform highp float		g_ShininessCloth;
uniform highp vec4		g_FresnelWeightAlphaC;
uniform highp vec4		g_DarknessLightness;
uniform highp float		g_ReflectAlpha;
uniform highp vec4		g_GlobalLightness;
uniform highp vec4		g_LightIntensityAmbient;
uniform highp vec4		g_LightDirectionCloth;
uniform highp vec4		g_FlowSpeed;
uniform highp vec4		g_FlowColor;
uniform highp float		g_SwitchUV;

#ifdef _ALPHATEST_
uniform highp float		g_Cutoff;
#endif

#ifdef FLOW_DISCOLOUR
uniform highp vec4		g_FlowColor2;
#endif

//------------------------------------------
// Varyings
//------------------------------------------
varying mediump vec4	_uv;
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
	
#ifdef _ALPHATEST_
	if ((c.a - g_Cutoff) < 0.0)
	{
		discard;
	}
	c.a = 1.0; // For Render Icon
#endif

	lowp vec4 mask = texture2D(g_MaskTex, _uv.xy);	
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
	
	//---------------------------------------------------------	
	highp vec4 _Time = vec4(TimeSinceFirstTick / 20.0, TimeSinceFirstTick, TimeSinceFirstTick * 2.0, TimeSinceFirstTick * 3.0);
#ifdef FLOW_DISCOLOUR
	highp float isUV0 = step(g_SwitchUV, 0.5);
	highp float isUV1 = step(0.5, g_SwitchUV);
	highp vec2 uv2 = vec2(_uv.xy * isUV0 + _uv.zw * isUV1);
	highp float Temp1 = mod(_Time.y * g_FlowSpeed.x, 6.0);
	highp float TimFactor = step(4.0, Temp1);
	highp float Temp2 = mod(_Time.y * g_FlowSpeed.x, 2.0);
	highp float TimeInFactor = min(1.0, Temp2) * (1.0 - TimFactor);
	highp float Temp3 = mod(_Time.y * g_FlowSpeed.x, 2.0);
	highp float TimeOutFactor = min(1.0, (2.0 - Temp3)) * 2.0 * (1.0 - TimFactor);
	highp float	Temp4 = mod(_Time.y * g_FlowSpeed.x, 6.0);
	highp float TimeColorFactor = step(2.0, Temp4);
	highp vec2 _EmissionTexUV = (uv2 + vec2(0.0, TimeInFactor));

	lowp vec4 flowcol = texture2D(g_FlowTex, (_EmissionTexUV.xy * g_FlowTex_ST.xy + g_FlowTex_ST.zw));
	highp float _EmissionTexColor = TimeInFactor * flowcol.r;
	highp vec3 emissive = ((_EmissionTexColor * (flowcol.g * g_FlowSpeed.y)) * ((g_FlowColor.rgb * TimeColorFactor) + (g_FlowColor2.rgb * abs(1.0 - TimeColorFactor))) * (TimeOutFactor));
#else
	#ifdef FLOW_RGBA
	highp float isUV0 = step(g_SwitchUV, 0.5);
	highp float isUV1 = step(0.5, g_SwitchUV);
	highp vec2 uv2 = vec2(_uv.xy * isUV0 + _uv.zw * isUV1);
	#else
	highp vec2 uv2 = vec2(_uv.zw);
	#endif
	
	highp vec2 flowuv = vec2(uv2.x + _Time.x * g_FlowSpeed.x, uv2.y + _Time.y * g_FlowSpeed.y);
	lowp vec4 flowcol = texture2D(g_FlowTex, (flowuv.xy * g_FlowTex_ST.xy + g_FlowTex_ST.zw));
	lowp vec4 flowalpha	= texture2D(g_FlowTex, uv2.xy);
#endif	
	//---------------------------------------------------------
			
	// Specular & Reflect & flow
#ifdef FLOW_DISCOLOUR
	c.rgb += specCloth * normalAmount * mask2.r + refc.rgb * mask.b * g_ReflectAlpha * normalAmount + emissive;
#else
	#ifdef FLOW_RGBA
	c.rgb += specCloth * normalAmount * mask2.r + refc.rgb * mask.b * g_ReflectAlpha * normalAmount + flowcol.rgb * flowalpha.a * g_FlowColor.rgb * g_FlowSpeed.z;
	#else
	c.rgb += specCloth * normalAmount * mask2.r + refc.rgb * mask.b * g_ReflectAlpha * normalAmount + flowcol.r * flowalpha.g * g_FlowColor.rgb * g_FlowSpeed.z;
	#endif
#endif
	
	// fresnel (FRESNEL_CLOTH)	
	highp float wVNDot = abs(worldVNDot);
	c.rgb = mix(c.rgb, g_FresnelWeightAlphaC.zzz, g_FresnelWeightAlphaC.y * (1.0 - XSaturate(wVNDot / g_FresnelWeightAlphaC.x)));
					
	c *= g_GlobalLightness;
	
	gl_FragColor = c;
}