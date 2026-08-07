#include "PostProcessCommon.glsl"
#include "SubsurfaceProfileCommon.glsl"

in vec2 VSOutTexcoord;
in vec4 VSOutPosition;

out vec4 PSOutColor;

//-----------------------------------------------------------------------------------------------
//Copy
uniform sampler2D	UniParam_PostProcess_LightingTexture;
uniform sampler2D	UniParam_PostProcess_CustomTexture;
uniform sampler2D	UniParam_PostProcess_DepthTexture;

vec3 ReconstructLighting(vec4 CenterSample, float DiffuseLuminance)
{
	vec3 CombinedColor = CenterSample.rgb;
	float CombinedLuminance = InternalFunc_Luminance(CombinedColor);
	float DiffuseFactor = clamp(DiffuseLuminance / CombinedLuminance, 0.0, 1.0);
	vec3 Ret = CombinedColor * DiffuseFactor;
	return Ret;
}

vec4 SetupSubsurfaceForOnePixel(vec2 UVSceneColor)
{ 
	vec4 CustomData = texture(UniParam_PostProcess_CustomTexture, UVSceneColor);
    int ShadingModelID = InternalFunc_DecodeShadingModelId(CustomData.g);	
    vec4 Ret = vec4(0.0);
    if (InternalFunc_UseSubsurfaceProfile(ShadingModelID))
    {
		float DiffuseLuminance = CustomData.r;
		vec4 CenterSample = texture(UniParam_PostProcess_LightingTexture, UVSceneColor);	
        Ret.rgb = ReconstructLighting(CenterSample, DiffuseLuminance);
		Ret.rgb = vec3(DiffuseLuminance);
		Ret.a = 1.0;
    }
    return Ret;
}

void main()
{
	PSOutColor = SetupSubsurfaceForOnePixel(VSOutTexcoord);
	if (PSOutColor.a > 0.0)
	{
		PSOutColor.a = InternalFunc_ConvertFromDeviceZ(texture(UniParam_PostProcess_DepthTexture, VSOutTexcoord).r);
	}
}
