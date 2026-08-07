attribute vec3		Position0;
attribute vec4		Normal0;
attribute vec2		Texcoord0;

uniform mat4		WorldViewProjMatrix;

varying  vec2		VSOutTexcoord0;

void main(void)
{
	vec4 pos = vec4(Position0.xyz, 1.0);

	gl_Position = WorldViewProjMatrix * pos;
	
	VSOutTexcoord0 = Texcoord0;
}

