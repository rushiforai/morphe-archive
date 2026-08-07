attribute vec4 Texcoord0;

varying vec2   VSOutTexCoord;
void main(void)
{
	gl_Position = vec4(Texcoord0.x, Texcoord0.y, 0.0, 1.0);
	VSOutTexCoord.xy = ((Texcoord0.xy * 0.5) + vec2(0.5)) + (Texcoord0.zw);
#ifndef GLTEXTURE_FLIP_Y
	VSOutTexCoord.y = 1.0 - VSOutTexCoord.y;
#endif
}