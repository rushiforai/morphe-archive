//******************************************************************************

// @File         model_vs.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is model_vs.glsl.

// @HISTORY:

//******************************************************************************/

#include "common_vs.glsl"

attribute vec3		Position0;

uniform mat4		ViewProjMatrix;
uniform mat4		WorldMatrix;

void main(void)
{
	vec4 Inpos = vec4(Position0, 1.0);	
	gl_Position = ViewProjMatrix * WorldMatrix * Inpos;
}

