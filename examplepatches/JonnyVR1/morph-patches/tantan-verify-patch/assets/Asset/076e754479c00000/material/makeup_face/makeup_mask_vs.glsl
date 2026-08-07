attribute vec2		Position0;
attribute vec2		Texcoord0;
varying vec2		textureCoordinate;
varying vec2 		sucaiTextureCoordinate;
varying vec2        segmaskTextureCoordinate;
const 	mat4		uSTMatrix = mat4(
									1.0, 0.0, 0.0, 0.0,
									0.0, 1.0, 0.0, 0.0,
									0.0, 0.0, 1.0, 0.0,
									0.0, 0.0, 0.0, 1.0);

uniform float       bSegEnable;
uniform mat4        uSegMatrix;
uniform vec2        ViewportSize;
uniform vec2        segImageSize;
uniform float       segFlipX;

void main(void)
{
	gl_Position = vec4(Position0, 0.0, 1.0);
	textureCoordinate = vec2(Position0.x * 0.5 + 0.5 , 1.0 - (Position0.y * 0.5 + 0.5));
    sucaiTextureCoordinate = (uSTMatrix * vec4(Texcoord0, 0.0, 1.0)).xy;
    sucaiTextureCoordinate.y = 1.0 - sucaiTextureCoordinate.y;

	if (bSegEnable > 0.0) {
        vec2 orgTexCoordinate = vec2(textureCoordinate.x * ViewportSize.x, textureCoordinate.y * ViewportSize.y);
        if (segFlipX > 0.5) {
            orgTexCoordinate.x = ViewportSize.x - orgTexCoordinate.x;
        }
        vec2 segmaskCoord =  (uSegMatrix * vec4(orgTexCoordinate.x, orgTexCoordinate.y, 1.0, 0.0)).xy;
        segmaskTextureCoordinate = vec2(segmaskCoord.x / segImageSize.x, segmaskCoord.y / segImageSize.y);
    }

#ifdef GLTEXTURE_FLIP_Y
    textureCoordinate.y = 1.0 - textureCoordinate.y;
#endif
}