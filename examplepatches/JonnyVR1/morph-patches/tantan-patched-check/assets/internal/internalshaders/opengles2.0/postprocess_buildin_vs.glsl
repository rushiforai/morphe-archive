attribute vec2		Position0;
attribute vec2		Texcoord0;
uniform highp float	g_Aspect;
varying vec2		VSOutTexCoord;
varying vec2		VSOutVignetteSpace;

highp vec2 VignetteSpace(highp vec2 Pos, highp float AspectRatio)
{
	// could be optimized but this computation should be done in the vertex shader (3 or 4 vertices)
	highp float Scale = 1.414 / sqrt(1.0 + AspectRatio * AspectRatio);
	return Pos * vec2(1.0, AspectRatio) * Scale;
}

void main(void)
{
	gl_Position = vec4(Position0, 0.0, 1.0);
	VSOutTexCoord = Texcoord0;
#if defined(NEW_VERSION) && defined(GLTEXTURE_FLIP_Y)
	VSOutTexCoord.y = 1.0 - VSOutTexCoord.y;
#endif
	VSOutVignetteSpace = VignetteSpace((VSOutTexCoord - vec2(0.5, 0.5)), g_Aspect);
}