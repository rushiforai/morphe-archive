//******************************************************************************

// @File         custom_draw_mesh_ps.glsl

// @Version      1.0

// @Description  used to draw user custom mesh.

// @HISTORY:

//******************************************************************************/

#include "common_ps.glsl"

varying highp	vec2		VSOutTexcoord0;
#ifdef _USING_TEXTURE_
uniform sampler2D			g_DiffuseTexture;
#endif

#ifdef _USING_UNIFORM_COLOR_
uniform vec4                g_LineColor;
#endif

#ifdef _USING_UNIQUE_COLOR_
varying vec4                VSOutColor0;
#endif

void main (void)
{	
    vec4 cl; 
#ifdef _USING_TEXTURE_
	cl = SampleDiffuseTexture(g_DiffuseTexture, VSOutTexcoord0);

#endif

#ifdef _USING_UNIQUE_COLOR_
    //adding unique color
    cl = cl * VSOutColor0;
#endif

#ifdef _USING_UNIFORM_COLOR_
	//adding uniform color
    cl = cl * g_LineColor;
#endif

    gl_FragColor = cl;
}
