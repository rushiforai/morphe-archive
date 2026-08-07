//******************************************************************************

// @File         landscape_vs.glsl

// @Version       1.0

// @Created      2020, 1, 20

// @Description  This file is landscape_vs.glsl.

// @HISTORY:

//******************************************************************************/

/* Macros in this shader:
_DIRECTION_LIGHT_
_POINT_LIGHT_		
_SPOT_LIGHT_
REFLECT_ENABLE
*/

#include "common_vs.glsl"

attribute vec3		Position0;
attribute vec4		Normal0;
attribute vec4		Tangent0;
attribute vec2		Texcoord0;

uniform mat4 WorldMatrix;
uniform mat4 ViewProjMatrix;

varying vec3 VertexWorldPosition;
varying vec2 v_UV;
varying vec3 v_Normal;


void main()
{
	v_UV = Texcoord0;
	v_Normal = Normal0.xyz;
	gl_Position =ViewProjMatrix * vec4(Position0, 1.0);
}
