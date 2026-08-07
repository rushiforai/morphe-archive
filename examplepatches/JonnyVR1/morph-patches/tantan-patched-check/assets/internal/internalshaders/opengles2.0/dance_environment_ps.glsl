//******************************************************************************

// @File         dance_environment_ps.glsl

// @Version      1.0

// @Created      2020, 3, 12

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:					
_ALPHABLEND_
TWO_LAYER
ALPHA_BLEND_TWO_LAYER
*/

#include "common_ps.glsl"

//------------------------------------------
// parameters
//------------------------------------------
uniform sampler2D		g_MainTex;
#if defined(_ALPHABLEND_) || defined(ALPHA_BLEND_TWO_LAYER)
uniform sampler2D		g_MainTexAlpha;
#endif
#if defined(TWO_LAYER) || defined(ALPHA_BLEND_TWO_LAYER)
uniform sampler2D		g_DetailTex;
#endif
#ifdef USE_LIGHTMAP
uniform sampler2D		g_LightmapTex;
#endif

//------------------------------------------
// Varyings
//------------------------------------------
#if defined(TWO_LAYER) || defined(ALPHA_BLEND_TWO_LAYER)
varying mediump vec4	_uv;
#else
varying mediump vec2	_uv;
#endif
#ifdef USE_LIGHTMAP
varying mediump vec2	_lmap;
#endif
varying lowp vec4		_color;

void main (void)
{
	lowp vec4 o = vec4(0.0, 0.0, 0.0, 1.0);
	lowp vec4 tex = texture2D(g_MainTex, _uv.xy);
	
#if defined(TWO_LAYER) || defined(ALPHA_BLEND_TWO_LAYER)
	lowp vec4 tex2 = texture2D(g_DetailTex, _uv.zw);
#endif
	
#if defined(_ALPHABLEND_) || defined(ALPHA_BLEND_TWO_LAYER)
	tex.a = texture2D(g_MainTexAlpha, _uv.xy).r;
#endif

#ifdef ALPHA_BLEND_TWO_LAYER
	o.rgb = tex2.rgb * tex.a + (1.0 - tex.a) * tex.rgb;
	o *= _color;
#elif defined(TWO_LAYER)
	o = tex * tex2 * _color;
#else
	o = tex * _color;
#endif
	
#ifdef USE_LIGHTMAP
	o.rgb *= texture2D(g_LightmapTex, _lmap).rgb;
#endif
	
	gl_FragColor = o;
}