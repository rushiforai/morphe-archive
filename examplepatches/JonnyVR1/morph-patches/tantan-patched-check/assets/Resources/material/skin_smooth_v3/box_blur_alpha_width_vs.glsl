attribute vec2		Position0;
attribute vec2		Texcoord0;
varying vec2		VSOutTexCoord;

varying vec4 textureShift_1;
varying vec4 textureShift_2;
varying vec4 textureShift_3;
varying vec4 textureShift_4;

uniform vec2 stepOffset2;
uniform vec2 ViewportSize;

void main(void)
{
	gl_Position = vec4(Position0, 0.0, 1.0);
    VSOutTexCoord = Texcoord0;
#ifdef GLTEXTURE_FLIP_Y
	VSOutTexCoord.y = 1.0 - VSOutTexCoord.y;
#endif 

	vec2 singleStepOffset = stepOffset2 / (ViewportSize * 0.45);
	textureShift_1 = vec4(VSOutTexCoord.xy - singleStepOffset, VSOutTexCoord.xy + singleStepOffset);
	textureShift_2 = vec4(VSOutTexCoord.xy - 2.0 * singleStepOffset, VSOutTexCoord.xy + 2.0 * singleStepOffset);
	textureShift_3 = vec4(VSOutTexCoord.xy - 3.0 * singleStepOffset, VSOutTexCoord.xy + 3.0 * singleStepOffset);
	textureShift_4 = vec4(VSOutTexCoord.xy - 4.0 * singleStepOffset, VSOutTexCoord.xy + 4.0 * singleStepOffset);
}