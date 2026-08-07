//******************************************************************************

// @File         particle_ps.glsl

//******************************************************************************/

#include "common_ps.glsl"

#ifdef _FOG_ENABLE_
#include "fogcommon.glsl"
#endif

uniform sampler2D	g_DiffuseSampler;
uniform highp vec4	g_TintColor;
uniform highp vec4 	g_ClipRange;
uniform highp float g_HSB_H;
uniform highp float g_HSB_S;
uniform highp float g_HSB_B;

varying highp vec4	VSOutColor0;
varying highp vec2	VSOutTexcoord0;
varying highp vec2	VSOutClipPosXY;

#ifdef _FOG_ENABLE_
varying highp vec3	VSOutWorldPosition;
uniform highp vec3	EyePos;
#endif

#ifdef _SCREENMASK_ENABLE
uniform highp vec4	ScreenMaskRegion;
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
	highp vec4 TexColor = SampleDiffuseTexture(g_DiffuseSampler, VSOutTexcoord0);
	highp vec4 FinalColor = 2.0 * TexColor * VSOutColor0 * g_TintColor;

	if (VSOutClipPosXY.x < g_ClipRange.x ||VSOutClipPosXY.x > g_ClipRange.z || VSOutClipPosXY.y < g_ClipRange.y || VSOutClipPosXY.y > g_ClipRange.w)
	{
		FinalColor.a = 0.0;
	}

	FinalColor.xyz = glb_HSB(FinalColor.xyz, g_HSB_H, g_HSB_S, g_HSB_B);
#ifdef _FOG_ENABLE_
	highp vec4 FogColor = ComputeCompositeFog(VSOutWorldPosition, EyePos);
	FinalColor.xyz = vec3(mix(FinalColor.xyz, FogColor.xyz, FogColor.a));
#endif

	gl_FragColor = FinalColor;
}
