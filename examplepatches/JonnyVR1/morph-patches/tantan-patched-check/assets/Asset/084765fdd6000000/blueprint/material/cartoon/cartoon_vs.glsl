attribute vec2		Position0;
attribute vec2		Texcoord0;

varying vec2		VSOutTexCoord;
varying vec2		VSEffectOutTexCoord;

uniform float		effectEnable;
uniform float       effectFlipX;
uniform vec2 		ViewportSize;
uniform vec2 		effectMaskSize;

uniform mat4		warpMat;

void main(void)
{
	gl_Position = vec4(Position0, 0.0, 1.0);
	VSOutTexCoord = Texcoord0;

	if (effectEnable > 0.5) {
		vec2 orgTextCoordinate = vec2(VSOutTexCoord.x * ViewportSize.x, VSOutTexCoord.y * ViewportSize.y);
        if (effectFlipX > 0.5) {
            orgTextCoordinate.x = ViewportSize.x - orgTextCoordinate.x;
        }
		vec2 effectMaskCoord = (warpMat * vec4(orgTextCoordinate.x, orgTextCoordinate.y, 1.0, 0.0)).xy;
		VSEffectOutTexCoord = vec2(effectMaskCoord.x / effectMaskSize.x, effectMaskCoord.y / effectMaskSize.y);
	}

#ifdef GLTEXTURE_FLIP_Y
	VSOutTexCoord.y = 1.0 - VSOutTexCoord.y;
#endif 
}
