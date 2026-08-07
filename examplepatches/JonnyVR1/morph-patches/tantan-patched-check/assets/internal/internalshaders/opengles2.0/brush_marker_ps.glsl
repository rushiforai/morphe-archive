//******************************************************************************

// @File         brush_neon_ps.glsl

// @Version      1.0

// @Created      

// @Description  

// @HISTORY:

//******************************************************************************/
#include "common_ps.glsl"

varying		highp vec4	VSOutColor0;
varying		highp vec2	VSOutTexcoord0;
uniform 	highp float BrushLength;
uniform		sampler2D	DiffuseTexture;

void main(void)
{
	gl_FragColor = VSOutColor0;
}
