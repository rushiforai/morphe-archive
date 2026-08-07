//******************************************************************************

// @File         dance_scene_ps.glsl

// @Version      1.0

// @Created      2020, 3, 16

// @Description

// @HISTORY

//******************************************************************************/

#include "common_ps.glsl"

#if defined(_FOG_ENABLE_) && defined(_ALPHABLEND_)
#include "fogcommon.glsl"
#endif

//------------------------------------------
// parameters
//------------------------------------------
uniform highp vec3		EyePos;
uniform sampler2D		g_DiffuseSampler;
#if (defined(_ALPHATEST_) || defined(_ALPHABLEND_)) && defined(SEPARATE_ALPHA)
uniform sampler2D		g_DiffuseAlphaTex;
#endif

#ifdef _ALPHATEST_
uniform highp float		g_Cutoff;
#endif

//------------------------------------------
// Varyings
//------------------------------------------
varying mediump vec2	_uv;
varying mediump vec2	_uv2;
varying highp vec3		_worldV;

void main (void)
{	
	highp vec4 baseTex = SampleDiffuseTexture(g_DiffuseSampler, _uv.xy);
		
#if (defined(_ALPHATEST_) || defined(_ALPHABLEND_)) && defined(SEPARATE_ALPHA)
	baseTex.a = texture2D(g_DiffuseAlphaTex, _uv.xy).x;
#endif

#ifdef _ALPHATEST_	
	if ((baseTex.a - g_Cutoff) < 0.0)
	{
		discard;
	}
#endif
	
	highp vec4 finalColor = baseTex;

	// Fog
#if defined(_FOG_ENABLE_) && defined(_ALPHABLEND_)
	highp vec4 FogColor = ComputeCompositeFog(_worldV, EyePos);
	finalColor.rgb = vec3(mix(finalColor.rgb, FogColor.rgb, FogColor.a));
#endif
	
	gl_FragColor = finalColor;
}