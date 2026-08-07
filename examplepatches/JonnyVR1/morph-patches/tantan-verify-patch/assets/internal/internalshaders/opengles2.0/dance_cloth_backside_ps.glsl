//******************************************************************************

// @File         dance_cloth_backside_ps.glsl

// @Version      1.0

// @Created      2020, 3, 6

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
uniform highp vec4 		g_Color;
uniform highp vec4		g_BackSideColor;
uniform sampler2D		g_MaskTex2;
uniform highp vec4		g_LightIntensityAmbient;
uniform highp vec4		g_GlobalLightness;

#ifdef _ALPHATEST_
uniform highp float		g_Cutoff;
#endif

//------------------------------------------
// Varyings
//------------------------------------------
varying mediump vec2	_uv;

void main (void)
{
	lowp vec4 col = g_BackSideColor * g_Color;
	
#ifdef _ALPHATEST_
	lowp vec4 mask2 = texture2D(g_MaskTex2, _uv.xy);
	col.a = mask2.g * g_Color.a;
	if ((col.a - g_Cutoff) < 0.0)
	{
		discard;
	}
#endif

	col.rgb *= (g_LightIntensityAmbient.x + g_LightIntensityAmbient.y);
	col *= g_GlobalLightness;
	gl_FragColor = col;
}