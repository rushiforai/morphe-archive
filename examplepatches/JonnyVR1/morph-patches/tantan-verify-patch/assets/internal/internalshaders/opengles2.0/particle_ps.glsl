//******************************************************************************

// @File         particle_ps.glsl

//******************************************************************************/

#include "common_ps.glsl"

#ifdef _FOG_ENABLE_
#include "fogcommon.glsl"
#endif

uniform sampler2D	g_DiffuseSampler;

varying highp vec4	VSOutColor0;
varying highp vec2	VSOutTexcoord0;

#ifdef _FOG_ENABLE_
varying highp vec3	VSOutWorldPosition;
uniform highp vec3	EyePos;
#endif

#ifdef _SCREENMASK_ENABLE
uniform highp vec4	ScreenMaskRegion;
#endif

#ifdef COLOR_TONE
uniform highp vec4 g_ToneColor;
uniform highp float g_ToneColorIntensity;
#endif

void main(void)
{
#ifdef _SCREENMASK_ENABLE
	if(gl_FragCoord.x < ScreenMaskRegion.x 
		|| gl_FragCoord.y < ScreenMaskRegion.y 
		|| gl_FragCoord.x > ScreenMaskRegion.z
		|| gl_FragCoord.y > ScreenMaskRegion.w)
	{
		gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);
		return;
	}
#endif
#ifdef _FOG_ENABLE_
	highp vec4 resultColor = SampleDiffuseTexture(g_DiffuseSampler, VSOutTexcoord0) * VSOutColor0;
	if (EnableFog > 0.5)
	{
		highp vec4 FogColor = ComputeCompositeFog(VSOutWorldPosition, EyePos);
		resultColor.xyz = vec3(mix(resultColor.xyz, FogColor.xyz, FogColor.a));
	}
	gl_FragColor = resultColor;
#else	
	gl_FragColor = SampleDiffuseTexture(g_DiffuseSampler, VSOutTexcoord0) * VSOutColor0;
#endif
#ifdef COLOR_TONE
	gl_FragColor = gl_FragColor * g_ToneColor * g_ToneColorIntensity;
#endif
}
