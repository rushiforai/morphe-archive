#include "common_ps.glsl"

uniform sampler2D	g_DiffuseSampler;
uniform highp vec4	g_TintColor;
uniform highp float g_HSB_H;
uniform highp float g_HSB_S;
uniform highp float g_HSB_B;
uniform highp vec4	ParticleColor;

varying highp vec2	VSOutTexcoord0;

#ifdef _SCREENMASK_ENABLE
uniform highp vec4	ScreenMaskRegion;
#endif

void main (void)
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
	highp vec4 FinalColor = 2.0 * TexColor * ParticleColor * g_TintColor;
	FinalColor.xyz = glb_HSB(FinalColor.xyz, g_HSB_H, g_HSB_S, g_HSB_B);
	gl_FragColor = FinalColor;
}