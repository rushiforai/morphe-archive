#include "PostProcessCommon.glsl"
#include "SubsurfaceProfileCommon.glsl"

in vec2 VSOutTexcoord;
in vec4 VSOutPosition;

out vec4 PSOutColor;

#define	SSSS_N_KERNELWEIGHTCOUNT SSSS_KERNEL0_SIZE
#define	SSSS_N_KERNELWEIGHTOFFSET SSSS_KERNEL0_OFFSET
const vec4 View_BufferBilinearUVMinMax = vec4(0.00027,0.00056,0.99866,0.99722);

//vec4 Kernels[13];

//-----------------------------------------------------------------------------------------------
uniform vec2		UniParam_SSSScatering_ViewportDirectionUV;
uniform vec2		UniParam_SSSScatering_Param; // x:DistanceToProjectionWindow/KernelSize*0.5, y:DistanceToProjectionWindow
uniform sampler2D	UniParam_PostProcess_SSSScateringInputTexture;
uniform sampler2D	UniParam_PostProcess_CustomTexture;

vec4 SampleSetup(vec2 BufferUV)
{
	BufferUV = clamp(BufferUV, View_BufferBilinearUVMinMax.xy, View_BufferBilinearUVMinMax.zw);
	return texture(UniParam_PostProcess_SSSScateringInputTexture, BufferUV);
}

float GetSubsurfaceStrength(vec2 UV)
{
	return texture(UniParam_PostProcess_CustomTexture, UV).a;
}

int SSSSSampleProfileId(vec2 UV)
{
	return int(texture(UniParam_PostProcess_CustomTexture, UV).b);
}

vec4 GetSubsurfaceProfileKernel(int SampleIndex, int SubsurfaceProfileInt)
{
	//return texelFetch(UniParam_SubsurfaceProfileTexture, ivec2(SampleIndex, SubsurfaceProfileInt), 0);
    return texture(UniParam_SubsurfaceProfileTexture, vec2(float(SampleIndex) / float(SSSS_PROFILE_TEXTURE_WIDTH), float(SubsurfaceProfileInt) / float(SUBSURFACE_PROFILE_MAX_NUM)));
    //return Kernels[SampleIndex - SSSS_KERNEL0_OFFSET];
}

vec3 GetSubsurfaceProfileBoundaryColorBleed(int SubsurfaceProfileInt)
{
	vec4 Color = texture(UniParam_SubsurfaceProfileTexture, vec2(float(SSSS_BOUNDARY_COLOR_BLEED_OFFSET) / float(SSSS_PROFILE_TEXTURE_WIDTH), float(SubsurfaceProfileInt) / float(SUBSURFACE_PROFILE_MAX_NUM)));
	return Color.rgb;
}

vec4 SSSSBlurPS(vec2 texcoord, vec2 dir, int SubsurfaceProfileInt) 
{
	// Fetch color of current pixel.
    vec4 colorM = SampleSetup(texcoord);

	// we store the depth in alpha
	float OutDepth = colorM.a;

	colorM.a = (colorM.a > 0.0 ? 1.0 : 0.0);

	if (colorM.a <= 0.0)
	{
		return vec4(0.0);
	}
	
	// 0..1
    float SSSStrength = GetSubsurfaceStrength(texcoord);

	float SSSScaleX = UniParam_SSSScatering_Param.x * 0.01f;

	float scale = SSSScaleX / OutDepth;

    // Calculate the final step to fetch the surrounding pixels:
    vec2 finalStep = scale * dir;

	// ideally this comes from a half res buffer as well - there are some minor artifacts
	finalStep *= SSSStrength; // Modulate it using the opacity (0..1 range)

	// Accumulate the center sample:
    vec3 colorAccum = vec3(0.0);
	// >0 to avoid division by 0, not 100% correct to not visible
	vec3 colorInvDiv = vec3(0.00001f);

	// Center sample
	vec3 kernel0 = GetSubsurfaceProfileKernel(SSSS_N_KERNELWEIGHTOFFSET, SubsurfaceProfileInt).rgb;
	colorInvDiv += kernel0;
	colorAccum = colorM.rgb * kernel0;

	vec3 BoundaryColorBleed = GetSubsurfaceProfileBoundaryColorBleed(SubsurfaceProfileInt);

	for (int i = 1; i < SSSS_N_KERNELWEIGHTCOUNT; ++i)
	{
		vec4 Kernel = GetSubsurfaceProfileKernel(SSSS_N_KERNELWEIGHTOFFSET + i, SubsurfaceProfileInt);

		vec4 LocalAccum = vec4(0.0);

		vec2 UVOffset = Kernel.a * finalStep;

		for (int Side = -1; Side <= 1; Side += 2)
		{
			vec2 LocalUV = texcoord + UVOffset * float(Side);
			vec4 color = SampleSetup(LocalUV);
			float LocalDepth = color.a;
			color.a = (color.a > 0.0 ? 1.0 : 0.0);

			int LocalSubsurfaceProfileInt = SSSSSampleProfileId(LocalUV);
			vec3 ColorTint = LocalSubsurfaceProfileInt == SubsurfaceProfileInt ? vec3(1.0f) : BoundaryColorBleed;

        	// If the difference in depth is huge, we lerp color back to "colorM":
			float s = clamp(30.0f * UniParam_SSSScatering_Param.y * abs(OutDepth - LocalDepth), 0.0, 1.0);
			color.a *= (1.0 - s);

			// approximation, ideally we would reconstruct the mask with ComputeMaskFromDepthInAlpha() and do manual bilinear filter
			// needed?
			color.rgb *= color.a * ColorTint;

			// Accumulate left and right 
			LocalAccum += color;			
		}

		// Accumulate to final value (left and right sample with the same weight)
		colorAccum += Kernel.rgb * LocalAccum.rgb;
		colorInvDiv += Kernel.rgb * LocalAccum.a;
	}

	// normalize (some samples are rejected because of depth or the other material is no SSS, compensate for that)
	// done for each color channel to avoid color shift
	vec3 OutColor = colorAccum / colorInvDiv;

	// alpha stored the SceneDepth (0 if there is no subsurface scattering)
	return vec4(OutColor.rgb, OutDepth);
}

void main()
{
    /*Kernels[0] = vec4(0.029590, 0.068221, 0.069720, 0.000000);
    Kernels[1] = vec4(0.058824, 0.131880, 0.134564, 0.020833);
    Kernels[2] = vec4(0.107608, 0.165296, 0.165390, 0.083333);
    Kernels[3] = vec4(0.112897, 0.079700, 0.078591, 0.187500);
    Kernels[4] = vec4(0.073653, 0.043131, 0.042442, 0.333333);
    Kernels[5] = vec4(0.045442, 0.025105, 0.024554, 0.520833);
    Kernels[6] = vec4(0.030770, 0.013063, 0.012504, 0.750000);
    Kernels[7] = vec4(0.021527, 0.005171, 0.004785, 1.020833);
    Kernels[8] = vec4(0.015097, 0.001659, 0.001513, 1.333333);
    Kernels[9] = vec4(0.009893, 0.000602, 0.000552, 1.687500);
    Kernels[10] = vec4(0.005814, 0.000219, 0.000193, 2.083333);
    Kernels[11] = vec4(0.002998, 0.000058, 0.000048, 2.520833);
    Kernels[12] = vec4(0.000683, 0.000005, 0.000004, 3.000000);*/
    
	int ShadingModelID = InternalFunc_DecodeShadingModelId(texture(UniParam_PostProcess_CustomTexture, VSOutTexcoord).g);
	int ProfileIndex = int(texture(UniParam_PostProcess_CustomTexture, VSOutTexcoord).b);

	if (!InternalFunc_UseSubsurfaceProfile(ShadingModelID))
	{
        PSOutColor = SampleSetup(VSOutTexcoord);
		return;
	}

	PSOutColor = SSSSBlurPS(VSOutTexcoord, UniParam_SSSScatering_ViewportDirectionUV, ProfileIndex);
    //PSOutColor = SampleSetup(VSOutTexcoord);
    //PSOutColor = vec4(PSOutColor.a);

	if (UniParam_SSSScatering_ViewportDirectionUV.y > 0.5)
	{
		if (PSOutColor.a > 0.0)
		{
			PSOutColor.a = 1.0;
		}	
		else
		{
			PSOutColor.a = 0.0;
		}
	}
}
