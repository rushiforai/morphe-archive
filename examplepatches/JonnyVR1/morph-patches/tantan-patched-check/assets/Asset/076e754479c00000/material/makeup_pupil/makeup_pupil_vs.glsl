attribute vec3		Position0;
attribute vec2		Texcoord0;
varying vec2		textureCoordinate;
varying vec2 		sucaiTextureCoordinate;
varying float		weight;

void main(void)
{
	gl_Position = vec4(Position0.xy, 0.0, 1.0);
	textureCoordinate = vec2(Position0.x * 0.5 + 0.5 , 1.0 - (Position0.y * 0.5 + 0.5));
	sucaiTextureCoordinate = Texcoord0;
	weight = Position0.z;

#ifdef GLTEXTURE_FLIP_Y
	textureCoordinate.y = 1.0 - textureCoordinate.y;
#endif
}