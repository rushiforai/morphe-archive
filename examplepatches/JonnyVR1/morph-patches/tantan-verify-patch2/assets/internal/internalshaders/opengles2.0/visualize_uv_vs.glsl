//******************************************************************************

// @File         visualize_uv_vs.glsl

// @Version      1.0

// @Created      2021, 12, 27

// @Description

// @HISTORY

//******************************************************************************/

#include "common_vs.glsl"

attribute vec2		Position0;

uniform mat4		WorldViewProjMatrix;

void main(void)
{
	vec4 pos = vec4(Position0.xy, 0.0, 1.0);
	pos.xy = pos.xy * 1.999 - vec2(0.9995);
	gl_Position = pos;
}

