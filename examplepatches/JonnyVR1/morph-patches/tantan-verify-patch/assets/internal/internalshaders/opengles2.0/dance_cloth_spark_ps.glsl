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
uniform sampler2D		g_SparkTex;
uniform highp vec4		g_SparkTex_ST;
uniform highp vec4		g_SpecColorCloth;
uniform highp float		g_ShininessCloth;
uniform highp vec4		g_FresnelWeightAlphaC;
uniform highp vec4		g_DarknessLightness;
uniform highp float		g_ReflectAlpha;
uniform highp vec4		g_GlobalLightness;
uniform highp vec4		g_LightIntensityAmbient;
uniform highp vec4		g_LightDirectionCloth;
uniform highp float		g_SparkRange;
uniform highp float		g_SparkValue;
uniform highp vec4		g_SparkColor;

#ifdef _ALPHATEST_
uniform highp float		g_Cutoff;
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
	highp vec2 uv2 = vec2(_uv.zw);
	highp float TimeFactor = (_Time.r * (g_SparkValue * 2.0 - 1.0) );
	highp vec2 Spark_UV1 = vec2(uv2.x + TimeFactor * (-1.0), uv2.y + TimeFactor * (-1.0));
	highp vec4 Spark_1 = texture2D(g_SparkTex, (Spark_UV1.xy * g_SparkTex_ST.xy + g_SparkTex_ST.zw));
	highp vec2 Spark_UV2 = vec2(uv2.x + TimeFactor, uv2.y + TimeFactor);
	highp vec4 Spark_2 = texture2D(g_SparkTex, (Spark_UV2.xy * g_SparkTex_ST.xy + g_SparkTex_ST.zw));
	highp vec4 Spark_A = texture2D(g_SparkTex, (_uv.xy * g_SparkTex_ST.xy + g_SparkTex_ST.zw));
	highp vec3 spark = ((g_SparkRange * Spark_1.r * Spark_2.g) * Spark_A.b) * g_SparkColor.rgb;
	//---------------------------------------------------------
			
	// Specular & Reflect & flow
	c.rgb += specCloth * normalAmount * mask2.r + refc.rgb * mask.b * g_ReflectAlpha * normalAmount + spark;
	
	// fresnel (FRESNEL_CLOTH)	
	highp float wVNDot = abs(worldVNDot);
	c.rgb = mix(c.rgb, g_FresnelWeightAlphaC.zzz, g_FresnelWeightAlphaC.y * (1.0 - XSaturate(wVNDot / g_FresnelWeightAlphaC.x)));
					
	c *= g_GlobalLightness;
	
	gl_FragColor = c;
}