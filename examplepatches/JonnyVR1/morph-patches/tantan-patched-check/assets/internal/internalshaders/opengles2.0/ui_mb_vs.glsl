//******************************************************************************

// @File         2d_vs.glsl

// @Version      1.0

// @Description  used for 2d element such as ui etc.

// @HISTORY:

//******************************************************************************/

attribute vec3		Position0;
attribute vec2		Texcoord0;
attribute vec4		Color0;

uniform highp vec2 	TargetSize;

varying vec2		VSOutScreenPos;

void main(void)
{
	gl_Position.xyz = Position0;
	gl_Position.z = 0.0;
	gl_Position.w = 1.0;
	VSOutScreenPos = 0.5 * TargetSize * (gl_Position.xy + vec2(1.0, 1.0));
}

