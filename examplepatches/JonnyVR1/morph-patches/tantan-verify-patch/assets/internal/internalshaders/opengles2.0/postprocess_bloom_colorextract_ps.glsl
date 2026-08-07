uniform sampler2D	SourceTexture;
uniform highp float	ColorThresholdParam;
varying highp vec2	VSOutTexCoord;

void main(void)
{
	highp vec4 color = texture2D(SourceTexture, VSOutTexCoord);
	//gl_FragColor = clamp((color - ColorThresholdParam) / (1.0 -ColorThresholdParam), 0.0, 1.0);
	highp float brightness = dot(color.rgb, vec3(0.2126, 0.7152, 0.0722));
    gl_FragColor = step(ColorThresholdParam, brightness) * color;
}
