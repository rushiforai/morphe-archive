uniform sampler2D	SourceTexture;

varying vec2		VSOutTexCoord;

void main(void)
{
	gl_FragColor = texture2D(CopyTexture, VSOutTexCoord);
}
