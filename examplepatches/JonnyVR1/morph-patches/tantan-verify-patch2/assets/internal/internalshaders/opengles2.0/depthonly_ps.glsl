//******************************************************************************

// @File         depthonly_ps.glsl

// @Version       1.0

// @Created      2017, 8, 23

// @Description  This file is depthonly_ps.glsl.

// @HISTORY:

//******************************************************************************/

#include "common_ps.glsl"
uniform sampler2D		DiffuseSampler;

varying highp vec4		VSOutPosition;
varying highp vec2		VSOutTexcoord0;

void main (void)
{
#ifdef _ALPHATEST_
	highp vec4 colTex = SampleDiffuseTexture(DiffuseSampler, VSOutTexcoord0);
	if (colTex.a < 0.5)
	{
		discard;
	}
#endif

	gl_FragColor = vec4(1.0, 0.0, 0.0, 0.0);
	if (!gl_FrontFacing)
		gl_FragColor = vec4(0.0, 0.0, 1.0, 0.0);
}
