attribute vec2		Position0;
attribute vec2		Texcoord0;

varying vec2		VSOutTexCoord;
varying vec2		VSEffectOutTexCoord;

uniform float		effectEnable;
uniform vec2 		ViewportSize;
uniform vec2 		effectMaskSize;
uniform float flipx;
uniform mat4		warpMat;

void main(void)
{
	gl_Position = vec4(Position0, 0.0, 1.0);
	VSOutTexCoord = Texcoord0;
	vec2 orgTexCoordinate = vec2(VSOutTexCoord.x * ViewportSize.x, VSOutTexCoord.y * ViewportSize.y);
	if (flipx > 0.5) {
		orgTexCoordinate.x = ViewportSize.x - orgTexCoordinate.x;
	}
	vec2 segmaskCoord =  ( warpMat* vec4(orgTexCoordinate.x, orgTexCoordinate.y, 1.0, 0.0)).xy;
	VSEffectOutTexCoord = vec2(segmaskCoord.x / effectMaskSize.x, segmaskCoord.y / effectMaskSize.y);

#ifdef GLTEXTURE_FLIP_Y
	VSOutTexCoord.y = 1.0 - VSOutTexCoord.y;
#endif 
}