attribute vec2		Position0;
attribute vec2		Texcoord0;

varying vec2		VSOutTexCoord;

const 	mat4		uSTMatrix = mat4(
									1.0, 0.0, 0.0, 0.0,
									0.0, 1.0, 0.0, 0.0,
									0.0, 0.0, 1.0, 0.0,
									0.0, 0.0, 0.0, 1.0);

varying vec4		textureShift_1;
varying vec4		textureShift_2;

uniform vec2		ViewportSize;
uniform vec2		stepOffset;

void main(void)
{
	gl_Position = vec4(Position0, 0.0, 1.0);
	VSOutTexCoord = vec2(Position0.x * 0.5 + 0.5 , 1.0 - (Position0.y * 0.5 + 0.5));

#ifdef GLTEXTURE_FLIP_Y
    VSOutTexCoord.y = 1.0 - VSOutTexCoord.y;
#endif

	vec2 renderSize = ViewportSize * 0.45; //vec2(324.0, 576.0);
	vec2 singleStepOffset = stepOffset / renderSize;
	textureShift_1 = vec4(VSOutTexCoord.xy - singleStepOffset, VSOutTexCoord.xy + singleStepOffset);
	textureShift_2 = vec4(VSOutTexCoord.xy - 2.0 * singleStepOffset, VSOutTexCoord.xy + 2.0 * singleStepOffset);
}