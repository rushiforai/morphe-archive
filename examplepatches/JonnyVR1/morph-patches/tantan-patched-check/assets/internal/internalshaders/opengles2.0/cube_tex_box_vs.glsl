//******************************************************************************

// @File         cube_tex_box_vs.glsl

// @Version      1.0

// @Description  cinematic screen effect

// @HISTORY:

//******************************************************************************/

attribute vec3		Position0;//the cube-vertex dir indicated for the cube-texture
attribute vec2		Texcoord0;
varying  vec3		VSOutCubeTexDir;
varying vec2        VSOutTexcoord0;
uniform mat4 WorldViewProjMatrix;

void main(void)
{
	gl_Position = WorldViewProjMatrix * vec4(Position0, 1.0);
    VSOutCubeTexDir = Position0;
	VSOutTexcoord0 = Texcoord0;
}

