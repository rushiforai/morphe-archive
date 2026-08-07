attribute vec2		Position0;
attribute vec2		Texcoord0;
varying vec2		textureCoordinate;
varying vec2 		sucaiTextureCoordinate;
const 	mat4		uSTMatrix = mat4(
									1.0, 0.0, 0.0, 0.0,
									0.0, 1.0, 0.0, 0.0,
									0.0, 0.0, 1.0, 0.0,
									0.0, 0.0, 0.0, 1.0);

void main(void)
{
	gl_Position = vec4(Position0, 0.0, 1.0);
	textureCoordinate = vec2(Position0.x * 0.5 + 0.5 , 1.0 - (Position0.y * 0.5 + 0.5));
    sucaiTextureCoordinate = (uSTMatrix * vec4(Texcoord0, 0.0, 1.0)).xy;
    sucaiTextureCoordinate.y = 1.0 - sucaiTextureCoordinate.y;

#ifdef GLTEXTURE_FLIP_Y
    textureCoordinate.y = 1.0 - textureCoordinate.y;
#endif
}