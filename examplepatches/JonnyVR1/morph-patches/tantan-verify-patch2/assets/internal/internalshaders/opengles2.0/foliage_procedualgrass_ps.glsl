//******************************************************************************

// @File         landscape_ps.glsl

// @Version       1.0

// @Created      2020, 1, 20

// @Description  This file is landscape_ps.glsl.

// @HISTORY:

//******************************************************************************/

/* Macros in this shader:
*/

#include "common_ps.glsl"

precision highp float;

uniform sampler2D GrassTexture;
uniform float Time;

varying highp vec2 v_UV;





void main()
{
	gl_FragColor = texture2D(GrassTexture, v_UV);	
	//gl_FragColor = vec4(DebugColor, 1.0);
}