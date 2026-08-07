attribute vec3 Position0;
uniform mat4 FrustumComponentToClip;

void main(void)
{
	gl_Position = FrustumComponentToClip * vec4(Position0, 1.0);
}


