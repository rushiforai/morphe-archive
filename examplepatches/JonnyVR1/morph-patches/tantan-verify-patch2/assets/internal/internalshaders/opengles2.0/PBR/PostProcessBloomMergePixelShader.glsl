#include "PostProcessCommon.glsl"

in vec4 VSOutTexcoord0;
in vec4 VSOutTexcoord1;
in vec4 VSOutTexcoord2;
in vec4 VSOutTexcoord3;
in vec4 VSOutTexcoord4;
in vec4 VSOutTexcoord5;
in vec4 VSOutTexcoord6;
in vec4 VSOutPosition;

out vec4 PSOutColor;

uniform vec3 UniParam_BloomMerge_BloomColor;
uniform sampler2D UniParam_BloomSetup_Texture;
uniform sampler2D UniParam_BloomUp_Texture;
void main()
{
    float W = 1.0/7.0;
    vec3 A0 = texture(UniParam_BloomSetup_Texture, VSOutTexcoord0.xy).rgb * W;
	vec3 A1 = texture(UniParam_BloomSetup_Texture, VSOutTexcoord1.xy).rgb * W;
	vec3 A2 = texture(UniParam_BloomSetup_Texture, VSOutTexcoord2.xy).rgb * W;
	vec3 A3 = texture(UniParam_BloomSetup_Texture, VSOutTexcoord3.xy).rgb * W;
	vec3 A4 = texture(UniParam_BloomSetup_Texture, VSOutTexcoord4.xy).rgb * W;
	vec3 A5 = texture(UniParam_BloomSetup_Texture, VSOutTexcoord5.xy).rgb * W;
	vec3 A6 = texture(UniParam_BloomSetup_Texture, VSOutTexcoord6.xy).rgb * W;
    vec3 Bloom2 = 0.2 * (A0 + A1 + A2 + A3 + A4 + A5 + A6) * UniParam_BloomMerge_BloomColor;
    vec3 Up = 0.2 * texture(UniParam_BloomUp_Texture, VSOutTexcoord6.xy).rgb;
    PSOutColor.rgb = Up + Bloom2;
	PSOutColor.a = 1.0;
}