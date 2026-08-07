attribute vec2		Position0;
attribute vec2		Texcoord0;
varying vec2		VSOutTexCoord;
varying vec2        maskCoordinate;

void main(void)
{
	gl_Position = vec4(Position0, 0.0, 1.0);
	VSOutTexCoord = vec2(Position0.x * 0.5 + 0.5 , 1.0 - (Position0.y * 0.5 + 0.5));
	maskCoordinate = vec2(Texcoord0.x, 1.0 - Texcoord0.y);

#ifdef GLTEXTURE_FLIP_Y
	VSOutTexCoord.y = 1.0 - VSOutTexCoord.y;
#endif 
}