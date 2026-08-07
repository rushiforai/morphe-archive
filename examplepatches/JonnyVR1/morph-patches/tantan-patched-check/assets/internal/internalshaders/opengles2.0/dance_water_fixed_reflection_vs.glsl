//******************************************************************************

// @File         dance_water_fixed_reflection_vs.glsl

// @Version      1.0

// @Created      2020, 3, 9

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
*/

#include "common_vs.glsl"

attribute vec3		Position0;
attribute vec4		Normal0;
attribute vec2		Texcoord0;

uniform mat4		WorldViewProjMatrix;
uniform mat4		WorldMatrix;

uniform vec4		g_LowBaseTex_ST;

varying vec2		_uv;
varying vec3		_worldPos;

void main(void)
{
	_uv.xy = Texcoord0.xy;
	
	vec4 pos = vec4(Position0, 1.0);
	gl_Position = WorldViewProjMatrix * pos;
	_worldPos = (WorldMatrix * pos).xyz;
}

