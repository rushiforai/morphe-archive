//******************************************************************************

// @File         model_ps.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is model_vs.glsl.

// @HISTORY:

//******************************************************************************/


#include "common_ps.glsl"


/* Macros in this shader:
_ALPHATEST_						
_ALPHABLEND_					

NORMAL_ENABLE					
UNLIT_ENABLE					

*/

//Textures
uniform sampler2D		g_YSampler;
uniform sampler2D		g_CbcrSampler;

//Varyings
varying highp vec2	VSOutTexcoord0;

void main (void)
{

	// Sample the diffuse texture.
	highp vec4 y_color = SampleDiffuseTexture(g_YSampler, VSOutTexcoord0);
    highp vec4 cbcr_color = SampleDiffuseTexture(g_CbcrSampler, VSOutTexcoord0);
    highp float y = y_color.x * 255.0;
    highp float cb = cbcr_color.x * 255.0 - 128.0;
    highp float cr = cbcr_color.a * 255.0 - 128.0;
    highp float R = (1.402 * cr + y) / 255.0;
    highp float G = (-0.344 * cb - 0.714 * cr + y) / 255.0;
    highp float B = (1.772 * cb + y) / 255.0;
    gl_FragColor = vec4(R, G, B, 1.0);
}
