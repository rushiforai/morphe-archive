attribute vec2		Position0;
attribute vec2		Texcoord0;

varying vec2		VSOutTexCoord;

void main(void)
{
	gl_Position = vec4(Position0, 0.0, 1.0);
	VSOutTexCoord = Texcoord0;
#ifdef GLTEXTURE_FLIP_Y
	VSOutTexCoord.y = 1.0 - VSOutTexCoord.y;
#endif 
}