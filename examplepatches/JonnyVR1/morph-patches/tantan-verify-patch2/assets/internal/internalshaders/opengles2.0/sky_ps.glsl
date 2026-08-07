//******************************************************************************

// @File         model_ps.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is model_vs.glsl.

// @HISTORY:

//******************************************************************************/


#include "common_ps.glsl"


/* Macros in this shader:
*/

//-----------------------------------------------------------------
// Parameter
//-----------------------------------------------------------------

//Textures
uniform sampler2D		g_DiffuseSampler;

//Varyings
varying highp vec2		VSOutTexcoord0;

void main (void)
{    
#if defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)
    discard;  // Prevent being rendered multiple times 
#endif

	// Sample the diffuse texture.
	highp vec4 colBaseTex = SampleDiffuseTexture(g_DiffuseSampler, VSOutTexcoord0);

	gl_FragColor = vec4(colBaseTex.rgb, 1.0);
}
