//******************************************************************************

// @File         dance_water_ps.glsl

// @Version      1.0

// @Created      2020, 3, 9

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
*/

#include "common_ps.glsl"

//------------------------------------------
// parameters
//------------------------------------------
uniform highp float		TimeSinceFirstTick;
uniform highp vec3		EyePos;
uniform highp vec4		g_Color;
uniform sampler2D		g_MainTex;
uniform sampler2D		g_MainAlphaTex;
uniform sampler2D		g_NormalMap;
uniform highp vec4		g_NormalTiling;
uniform highp vec4 		g_NormalDirection;
uniform highp float		g_FresnelScale;

//------------------------------------------
// Varyings
//------------------------------------------
varying mediump vec2	_uv;
varying highp vec3		_worldPos;

void main (void)
{
	highp float _Time = TimeSinceFirstTick / 20.0;
	mediump vec4 NormalUV = (_worldPos.xyxy + vec4(_Time, _Time, _Time, _Time) * g_NormalDirection.xyzw) * g_NormalTiling.xyzw;
	mediump vec3 Normal = (glb_SamplerNormalMap_ApplyStrength(g_NormalMap, NormalUV.xy, 1.0) + glb_SamplerNormalMap_ApplyStrength(g_NormalMap, NormalUV.zw, 1.0)) * 0.5;
	
	mediump vec2 uv = vec2(_uv.x, 1.0 - _uv.y) + Normal.xy * g_FresnelScale;
	uv.y = 1.0 - uv.y;
		
	mediump vec4 MainColor = texture2D(g_MainTex, uv) * g_Color;
	mediump float MainAlpha = texture2D(g_MainAlphaTex, uv).r;
	MainColor.a = g_Color.a * MainAlpha;

	gl_FragColor = MainColor;
}