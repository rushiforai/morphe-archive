//******************************************************************************

// @File         mask_ps.glsl

// @Version      1.0

// @Created      2020, 1, 21

// @Description  This file is mask_ps.glsl.

// @HISTORY:

//******************************************************************************/

/* Macros in this shader:
_ALPHATEST_
*/

#include "common_ps.glsl"

uniform highp vec4		g_CucolorisColor;
uniform sampler2D		g_DiffuseSampler;

varying highp vec2		VSOutTexcoord0;

void main(void)
{
#ifdef _ALPHATEST_
	// UV×ø±ê
	highp vec2 Texcoord0 = VSOutTexcoord0;
	// Sample the diffuse texture.
	highp vec4 colBaseTex = SampleDiffuseTexture(g_DiffuseSampler, Texcoord0);
	if (colBaseTex.a < 0.5)
		discard;
#endif // #ifdef _ALPHATEST_
  
	gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
}
