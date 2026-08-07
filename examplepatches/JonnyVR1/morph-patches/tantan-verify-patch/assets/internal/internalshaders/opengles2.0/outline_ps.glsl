//******************************************************************************

// @File         outline_ps.glsl

// @Version       1.0

// @Created      2018, 11, 26

// @Description  This file is outline_ps.glsl.

// @HISTORY:

//******************************************************************************/
precision highp float;

uniform vec4 g_OutlineColor;

varying vec2 VSOutTexcoord;

void main (void)
{
    gl_FragColor = g_OutlineColor;
}
