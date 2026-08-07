//******************************************************************************

// @File         custom_draw_mesh_ps.glsl

// @Version      1.0

// @Description  used to draw user custom mesh.

// @HISTORY:

//******************************************************************************/

#include "common_ps.glsl"


varying highp	vec2		VSOutTexcoord0;
uniform sampler2D			g_DiffuseTexture;


void main (void)
{	
	gl_FragColor = SampleDiffuseTexture(g_DiffuseTexture, VSOutTexcoord0);
}
