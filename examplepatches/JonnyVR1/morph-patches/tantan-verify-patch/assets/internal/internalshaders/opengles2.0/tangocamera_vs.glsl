//******************************************************************************

// @File         model_vs.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is model_vs.glsl.

// @HISTORY:

//******************************************************************************/

/* Macros in this shader:
_SKIN_							
*/

#include "common_vs.glsl"

attribute vec3		Position0;
attribute vec2		Texcoord0;

uniform mat4		WorldViewProjMatrix;

varying vec2		VSOutTexcoord0;

void main(void)
{
	gl_Position = WorldViewProjMatrix * vec4(Position0, 1.0);
	VSOutTexcoord0 = Texcoord0;
}

