uniform sampler2D	SourceTexture;

varying highp vec2	VSOutTexCoord;
varying highp vec4	VSOutTexCoord01;
varying highp vec4	VSOutTexCoord23;
varying highp vec4	VSOutTexCoord45;

void main(void)
{
	highp vec4 color = vec4(0.0, 0.0, 0.0, 0.0);
	color += 0.226 * texture2D(SourceTexture, VSOutTexCoord);  
    color += 0.195 * texture2D(SourceTexture, VSOutTexCoord01.xy);  
    color += 0.195 * texture2D(SourceTexture, VSOutTexCoord01.zw);  
    color += 0.121 * texture2D(SourceTexture, VSOutTexCoord23.xy);  
    color += 0.121 * texture2D(SourceTexture, VSOutTexCoord23.zw);  
    color += 0.065 * texture2D(SourceTexture, VSOutTexCoord45.xy);  
    color += 0.065 * texture2D(SourceTexture, VSOutTexCoord45.zw);  
	gl_FragColor = color;
}
