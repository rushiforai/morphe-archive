#include "PostProcessCommon.glsl"

in vec2 VSOutTexcoord0;
in vec2 VSOutTexcoord1;
in vec2 VSOutTexcoord2;
in vec2 VSOutTexcoord3;

out vec4 PSOutColor;

uniform float UniParam_BloomSetup_Threshold;
uniform sampler2D UniParam_BloomSetup_SceneColorTexture;

void main()
{
    vec3 AverageColor = vec3(0.0);
    vec4 C0 = texture(UniParam_BloomSetup_SceneColorTexture, VSOutTexcoord0);
    vec4 C1 = texture(UniParam_BloomSetup_SceneColorTexture, VSOutTexcoord1);
    vec4 C2 = texture(UniParam_BloomSetup_SceneColorTexture, VSOutTexcoord2);
    vec4 C3 = texture(UniParam_BloomSetup_SceneColorTexture, VSOutTexcoord3);
    AverageColor.rgb = (C0.rgb * 0.25) + (C1.rgb * 0.25) + (C2.rgb * 0.25) + (C3.rgb * 0.25);
    AverageColor.rgb = max(AverageColor.rgb, vec3(0.0));
    float TotalLuminance = dot(AverageColor.rgb, vec3(0.3, 0.59, 0.11));
	float BloomLuminance = TotalLuminance - UniParam_BloomSetup_Threshold;
	float Amount = clamp(BloomLuminance * 0.5, 0.0, 1.0);
    PSOutColor.rgb = AverageColor * Amount;
	PSOutColor.a = 0.0;
}
