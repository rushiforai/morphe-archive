//******************************************************************************

// @File         dance_lightprobes_ps.glsl

// @Version      1.0

// @Created      2020, 3, 10

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
_ALPHATEST_						
_ALPHABLEND_
ONE_COLOR
TWO_COLOR	
*/

#include "common_ps.glsl"

//------------------------------------------
// parameters
//------------------------------------------
uniform highp vec3		EyePos;
uniform highp vec4 		g_Color;
uniform sampler2D		g_MainTex;
uniform highp vec4		g_GlobalLightness;

#ifdef _ALPHATEST_
uniform highp float		g_Cutoff;
#endif

#if defined(_ALPHATEST_) || defined(_ALPHABLEND_)
uniform sampler2D		g_MaskTex2;
#endif

#if defined(ONE_COLOR) || defined(TWO_COLOR)
uniform sampler2D		g_MaskTex;
uniform highp vec4		g_ModelColor0;
uniform highp float		g_ColorBrightness;
#endif

#ifdef TWO_COLOR
uniform highp vec4 		g_ModelColor1;
#endif

//------------------------------------------
// Varyings
//------------------------------------------
varying mediump vec2	_uv;
varying highp float		_vLight;

void main (void)
{
	mediump vec4 c = texture2D(g_MainTex, _uv.xy) * g_Color;		
	
#if defined(_ALPHATEST_) || defined(_ALPHABLEND_)
	lowp vec4 mask2 = texture2D(g_MaskTex2, _uv.xy);
	c.a = mask2.g * g_Color.a;
#endif
	
#ifdef _ALPHATEST_	
	if ((c.a - g_Cutoff) < 0.0)
	{
		discard;
	}
#endif
	
#if defined(ONE_COLOR) || defined(TWO_COLOR)
	lowp vec4 mask = texture2D(g_MaskTex, _uv.xy);
	mediump float c_Gray = c.r * 0.299 + c.g * 0.587 + c.b * 0.114; 	
	mediump vec3 col0 = c_Gray * g_ModelColor0.rgb;

	#ifdef ONE_COLOR
	mediump float c_alpha = 1.0 - mask.r;
	c.rgb = mix(c.rgb, col0, g_ModelColor0.a) * mask.r * g_ColorBrightness + c.rgb * c_alpha;
	#endif

	#ifdef TWO_COLOR
	mediump float c_alpha2 = 1.0 - min(1.0, mask.r + mask.g);
	mediump vec3 col1 = c_Gray * g_ModelColor1.rgb;
	c.rgb = (mix(c.rgb, col0, g_ModelColor0.a) * mask.r + mix(c.rgb, col1, g_ModelColor1.a) * mask.g) * g_ColorBrightness + c.rgb * c_alpha2;
	#endif
#endif
	
	c.rgb *= _vLight;	
	c *= g_GlobalLightness;
	
	gl_FragColor = c;
}