uniform sampler2D		CopyTexture;

varying highp vec2		VSOutTexCoord;

void main(void)
{
	gl_FragColor = texture2D(CopyTexture, VSOutTexCoord);
	//gl_FragColor = vec4(0.0, 1.0, 0.0, 1.0);
}