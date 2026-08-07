
uniform sampler2D		SceneColorTexture;
uniform sampler2D		SceneDepthTexture;

varying highp vec2		VSOutTexCoord;

void main(void)
{
	highp vec2 texcoord = VSOutTexCoord;
#ifdef _FLIP_V_
	texcoord.y = 1.0 - texcoord.y;
#endif
	highp vec3 Color = texture2D(SceneColorTexture, texcoord).rgb;
	highp float Depth = texture2D(SceneDepthTexture, texcoord).r;
	gl_FragColor = vec4(Color.r, Color.g, Color.b, Depth);
}