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

uniform sampler2D GrassTexture;

varying highp vec2 v_UV;
varying highp vec3 v_Normal;

void main()
{
	gl_FragColor = texture2D(GrassTexture, v_UV);
	//gl_FragColor = vec4(v_Normal, 1.0);
}