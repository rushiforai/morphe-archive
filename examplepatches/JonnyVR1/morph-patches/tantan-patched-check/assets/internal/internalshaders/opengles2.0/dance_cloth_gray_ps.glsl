//******************************************************************************

// @File         dance_cloth_gray_ps.glsl

// @Version      1.0

// @Created      2020, 3, 4

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
*/

#include "common_ps.glsl"

//------------------------------------------
// parameters
//------------------------------------------
uniform sampler2D		g_MainTex;

//------------------------------------------
// Varyings
//------------------------------------------
varying mediump vec2	_uv;

void main (void)
{
	gl_FragColor = SampleDiffuseTexture(g_MainTex, _uv.xy) * vec4(0.3,0.3,0.3,1);		
}