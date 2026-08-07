//******************************************************************************

// @File         dance_water_pool_ps.glsl

// @Version      1.0

// @Created      2020, 5, 9

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
*/

#include "common_ps.glsl"
//#include "fogcommon.glsl"

//------------------------------------------
// parameters
//------------------------------------------
uniform highp float		TimeSinceFirstTick;
uniform highp vec4      g_CustomLightColor;
uniform highp vec4		g_CustomLightDir;
uniform sampler2D       g_noise01;
uniform highp vec4      g_noise01_ST;
uniform sampler2D       g_noise02;
uniform highp vec4      g_noise02_ST;
uniform sampler2D       g_noise03;
uniform highp vec4      g_noise03_ST;
uniform sampler2D       g_noise04;
uniform highp vec4      g_noise04_ST;
uniform sampler2D       g_main;
uniform highp vec4      g_main_ST;
uniform lowp vec4       g_maincolor;
uniform highp float     g_alpha;

//------------------------------------------
// Varyings
//------------------------------------------
varying mediump vec2	_uv0;
varying highp vec4		_posWorld;
varying highp vec3		_normalDir;

void main (void)
{
    highp vec3 normalDir = normalize(_normalDir);
	highp vec3 lightDirection = normalize(g_CustomLightDir.xyz);
	
	if (!gl_FrontFacing)
		normalDir = -normalDir;  // Reverse normal if this is a backface
	
    //// Diffuse:
    highp float NdotL = max(0.0, dot( normalDir, lightDirection ));
    lowp vec3 directDiffuse = max( 0.0, NdotL) * g_CustomLightColor.xyz;
	highp vec4 _Time = vec4(TimeSinceFirstTick / 20.0, TimeSinceFirstTick, TimeSinceFirstTick * 2.0, TimeSinceFirstTick * 3.0);
    highp vec2 node_203 = (_uv0 + _Time.g * vec2(0.01, -0.01));
    lowp vec4 _main_var = texture2D(g_main, (node_203 * g_main_ST.xy + g_main_ST.zw));
    lowp vec3 diffuse = directDiffuse * (g_maincolor.rgb * _main_var.rgb);
	
    //// Emissive:
    highp vec2 node_5707 = (_uv0 + _Time.g * vec2(0.0, -0.05));
    lowp vec4 _noise01_var = texture2D(g_noise01, (node_5707 * g_noise01_ST.xy + g_noise01_ST.zw));
    highp vec2 node_1635 = (_uv0 + _Time.g * vec2(-0.05, -0.02));
    lowp vec4 _noise02_var = texture2D(g_noise02, (node_1635 * g_noise02_ST.xy + g_noise02_ST.zw));
    highp vec2 node_3750 = (_uv0 + (_noise01_var.r * _noise02_var.r * 0.2));
    lowp vec4 _noise03_var = texture2D(g_noise03, (node_3750 * g_noise03_ST.xy + g_noise03_ST.zw));
    highp vec2 node_2862 = (_uv0 + _Time.g * vec2(0.0, -0.01));
    lowp vec4 _noise04_var = texture2D(g_noise04, (node_2862 * g_noise04_ST.xy + g_noise04_ST.zw));
    lowp float node_1729 = (_noise03_var.r * _noise04_var.r);
    lowp vec3 emissive = vec3(node_1729, node_1729, node_1729);
	
    //// Final Color:
    lowp vec3 finalColor = diffuse + emissive;
    gl_FragColor = vec4(finalColor, g_alpha);
}
