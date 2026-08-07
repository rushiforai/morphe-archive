#include "PostProcessCommon.glsl"
#include "SubsurfaceProfileCommon.glsl"

in vec2 VSOutTexcoord;
in vec4 VSOutPosition;

out vec4 PSOutColor;

//-----------------------------------------------------------------------------------------------
uniform sampler2D	UniParam_PostProcess_LightingTexture;
uniform sampler2D	UniParam_PostProcess_ScateringOutTexture;
uniform sampler2D	UniParam_PostProcess_BaseColorTexture;
uniform sampler2D	UniParam_PostProcess_CustomTexture;

vec3 GetSubsurfaceProfileColor(int SubsurfaceProfileInt)
{
	return texelFetch(UniParam_SubsurfaceProfileTexture, ivec2(SSSS_SUBSURFACE_COLOR_OFFSET, SubsurfaceProfileInt), 0).rgb;
}

void ReconstructLighting(vec4 CenterSample, float DiffuseLuminance, out vec3 Diffuse, out vec3 Specular)
{
	float CombinedLuminance = InternalFunc_Luminance(CenterSample.rgb);
	float DiffuseFactor = clamp(DiffuseLuminance / CombinedLuminance, 0.0, 1.0);
	float SpecularFactor = 1.0 - DiffuseFactor;
	Diffuse = CenterSample.rgb * DiffuseFactor;
	Specular = CenterSample.rgb * SpecularFactor;
}

void main()
{
 	PSOutColor = vec4(1.0);

    vec2 BufferUV = VSOutTexcoord.xy;
  	vec4 CustomData = texture(UniParam_PostProcess_CustomTexture, BufferUV);
	int ShadingModelID = InternalFunc_DecodeShadingModelId(CustomData.g);
	int SubsurfaceProfileInt = int(CustomData.b);
  	vec4 lightcolor = texture(UniParam_PostProcess_LightingTexture, BufferUV);

  	if (!InternalFunc_UseSubsurfaceProfile(ShadingModelID))
	{
		PSOutColor = lightcolor;
		return;
	}

    vec3 SSSColor = texture(UniParam_PostProcess_ScateringOutTexture, BufferUV).rgb;
    vec3 StoredBaseColor = texture(UniParam_PostProcess_BaseColorTexture, BufferUV).rgb;

	vec3 DiffuseColor;
	vec3 SpecularColor;
    ReconstructLighting(lightcolor, CustomData.r, DiffuseColor, SpecularColor);

	vec3 SubsurfaceColor = GetSubsurfaceProfileColor(SubsurfaceProfileInt);
    vec3 SubsurfaceLighting = mix(DiffuseColor, SSSColor, SubsurfaceColor);

    PSOutColor = vec4(SubsurfaceLighting * StoredBaseColor + SpecularColor, 1.0);
    //PSOutColor = vec4(lightcolor.rgb, 1.0);
}
