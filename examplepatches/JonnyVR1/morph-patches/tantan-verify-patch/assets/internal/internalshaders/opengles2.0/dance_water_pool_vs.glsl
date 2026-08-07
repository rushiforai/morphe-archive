//******************************************************************************

// @File         dance_water_pool_vs.glsl

// @Version      1.0

// @Created      2020, 5, 9

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
*/

#include "common_vs.glsl"

attribute vec3		Position0;
attribute vec3      Normal0;
attribute vec2		Texcoord0;

uniform mat4		WorldViewProjMatrix;
uniform mat4		WorldMatrix;

varying vec2		_uv0;
varying vec4		_posWorld;
varying vec3		_normalDir;

void main(void)
{
	_uv0.xy = Texcoord0.xy;
	
	vec4 pos = vec4(Position0, 1.0);
	gl_Position = WorldViewProjMatrix * pos;
	_posWorld = WorldMatrix * pos;
    _normalDir = (WorldMatrix * vec4(Normal0, 0.0)).xyz;
}

