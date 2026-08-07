//******************************************************************************

// @File         brush_ribbon_ps.glsl

// @Version      1.0

// @Created      

// @Description  

// @HISTORY:

//******************************************************************************/
#include "common_ps.glsl"

varying		highp vec4	VSOutColor0;
varying		highp vec2	VSOutTexcoord0;
uniform 	highp float Time;
uniform		highp float g_TileU;
uniform		highp float g_IndexU;
uniform		sampler2D	DiffuseTexture;

void main(void)
{
	highp vec2 texcoord = VSOutTexcoord0;
	texcoord.x = (texcoord.x + g_IndexU) / g_TileU;
	texcoord.y = texcoord.y - Time;
	
	gl_FragColor= SampleDiffuseTexture(DiffuseTexture, texcoord) * VSOutColor0;
	if(gl_FragColor.a < 0.333)
	{
		discard;
	}
}
