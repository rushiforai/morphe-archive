//******************************************************************************

// @File         model_ps.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is model_vs.glsl.

// @HISTORY:

//******************************************************************************/

#include "common_ps.glsl"

uniform sampler2D		g_DiffuseSampler;
varying highp vec2		VSOutTexcoord0;

void main (void)
{
	if(VSOutTexcoord0.x < 0.0 || VSOutTexcoord0.x > 1.0
	|| VSOutTexcoord0.y < 0.0 || VSOutTexcoord0.y > 1.0)
	{
		gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);
	}
	else
	{
		gl_FragColor = texture2D(g_DiffuseSampler, VSOutTexcoord0);
	}
}