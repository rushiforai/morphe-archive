#include "PostProcessCommon.glsl"

in vec4 VSOutTexcoord0;
in vec4 VSOutTexcoord1;
in vec4 VSOutTexcoord2;
in vec4 VSOutTexcoord3;
in vec4 VSOutTexcoord4;
in vec4 VSOutTexcoord5;
in vec4 VSOutTexcoord6;
in vec4 VSOutTexcoord7;
out vec4 PSOutColor;

uniform sampler2D UniParam_BloomDown_Texture;

void main()
{
    vec3 N0 = texture(UniParam_BloomDown_Texture, VSOutTexcoord0.xy).rgb;
	vec3 N1 = texture(UniParam_BloomDown_Texture, VSOutTexcoord0.zw).rgb;
	vec3 N2 = texture(UniParam_BloomDown_Texture, VSOutTexcoord1.xy).rgb;
	vec3 N3 = texture(UniParam_BloomDown_Texture, VSOutTexcoord1.zw).rgb;
	vec3 N4 = texture(UniParam_BloomDown_Texture, VSOutTexcoord2.xy).rgb;
	vec3 N5 = texture(UniParam_BloomDown_Texture, VSOutTexcoord2.zw).rgb;
	vec3 N6 = texture(UniParam_BloomDown_Texture, VSOutTexcoord3.xy).rgb;
	vec3 N7 = texture(UniParam_BloomDown_Texture, VSOutTexcoord3.zw).rgb;
	vec3 N8 = texture(UniParam_BloomDown_Texture, VSOutTexcoord4.xy).rgb;
	vec3 N9 = texture(UniParam_BloomDown_Texture, VSOutTexcoord4.zw).rgb;
	vec3 N10 = texture(UniParam_BloomDown_Texture, VSOutTexcoord5.xy).rgb;
	vec3 N11 = texture(UniParam_BloomDown_Texture, VSOutTexcoord5.zw).rgb;
	vec3 N12 = texture(UniParam_BloomDown_Texture, VSOutTexcoord6.xy).rgb;
	vec3 N13 = texture(UniParam_BloomDown_Texture, VSOutTexcoord6.zw).rgb;
	vec3 N14 = texture(UniParam_BloomDown_Texture, VSOutTexcoord7.xy).rgb;
	
	PSOutColor.rgb = (N0 + N1 + N2 + N3 + N4 + N5 + N6 + N7 + N8 + N9 + N10 + N11 + N12 + N13 + N14) * (1.0/15.0);
	PSOutColor.a = 0.0;
}
