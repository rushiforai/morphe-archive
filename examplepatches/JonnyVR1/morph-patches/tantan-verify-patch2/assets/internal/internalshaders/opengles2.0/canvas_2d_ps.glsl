//******************************************************************************

// @File         canvas_2d_ps.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is canvas_2d_ps.glsl.

// @HISTORY:

//******************************************************************************/
#include "common_ps.glsl"
uniform		sampler2D		FontTexture;
varying		highp vec4		VSOutColor0;
varying		highp vec2		VSOutTexcoord0;

void main(void)
{
#ifdef _TEXTURE_
	highp vec4 vColor = SampleDiffuseTexture(FontTexture, VSOutTexcoord0);
	gl_FragColor = vColor * VSOutColor0;
#endif //_TEXTURE_

#ifdef _COLOR_
	gl_FragColor = VSOutColor0;
#endif //_COLOR_
}
