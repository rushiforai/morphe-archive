//precision highp float;

#ifndef DIR_LIGHT_MAX_CASCADE_NUM
#define DIR_LIGHT_MAX_CASCADE_NUM 2
#endif

#ifndef SPOT_LIGTH_MAX_SHADOW_NUM
#define SPOT_LIGTH_MAX_SHADOW_NUM 2
#endif

//uniform UniParamBlock_ShadowTest
//{
    // Common used by direction light and spot lights.
    uniform vec2        UniParam_ShadowTest_ShadowValid; // x:DirLight, y:SpotLight

	// Direction light.
	uniform int			UniParam_ShadowTest_DirLight_ShadowCascadeNum;
	uniform mat4		UniParam_ShadowTest_DirLight_ShadowMatrix[DIR_LIGHT_MAX_CASCADE_NUM];
	uniform vec4		UniParam_ShadowTest_DirLight_ShadowParam[DIR_LIGHT_MAX_CASCADE_NUM]; // x:SubjectDepth, y:MaxViewZ, z:DepthBias, w:SoftTransition
	uniform vec2		UniParam_ShadowTest_DirLight_ShadowTexelSizeAndKernelRadius[DIR_LIGHT_MAX_CASCADE_NUM]; // x:TexelSize, y:KernelRadius

	// Spot lights, 4 Lights at most.
	uniform mat4		UniParam_ShadowTest_SpotLight_ShadowMatrix[SPOT_LIGTH_MAX_SHADOW_NUM];
	uniform vec4		UniParam_ShadowTest_SpotLight_ShadowParam[SPOT_LIGTH_MAX_SHADOW_NUM]; // x:SubjectDepth, y:InvSubjectDepth, z:DepthBias, w:SoftTransition
	uniform vec2		UniParam_ShadowTest_SpotLight_ShadowTexelSizeAndKernelRadius[SPOT_LIGTH_MAX_SHADOW_NUM]; // x:TexelSize, y:KernelRadius
	
//};

uniform sampler2D	UniParam_ShadowTest_DirLight_ShadowDepthSampler0;
uniform sampler2D	UniParam_ShadowTest_DirLight_ShadowDepthSampler1;

uniform sampler2D	UniParam_ShadowTest_SpotLight_ShadowDepthSampler0;
uniform sampler2D	UniParam_ShadowTest_SpotLight_ShadowDepthSampler1;
//uniform sampler2D	UniParam_ShadowTest_SpotLight_ShadowDepthSampler2;
//uniform sampler2D	UniParam_ShadowTest_SpotLight_ShadowDepthSampler3;

vec2 PoissonDiscSamples[16];

//Input: It uses texture coords as the random number seed.
//Output: Random number: [0, 1).
float PseudoRandom(vec2 XY)
{
	return fract(sin(dot(XY, vec2(12.9898, 78.233))) * 43758.5453);
}

//int FindMinimalCascadeIndex(vec4 WorldPosition)
//{
//	int CascadeIndex = 0;
//	for (; CascadeIndex < ShadowCascadeNum; ++CascadeIndex)
//	{
//		vec4 ClipPosition = ShadowMatrix[CascadeIndex] * WorldPosition;
//		if (abs(ClipPosition.x) < 1.0 && abs(ClipPosition.y) < 1.0)
//		{
//			return CascadeIndex;
//		}
//	}
//	return CascadeIndex;
//}

int FindCascadeIndex(float ViewDepth)
{
	for (int i = 0; i < UniParam_ShadowTest_DirLight_ShadowCascadeNum; i++)
	{
		if (ViewDepth < UniParam_ShadowTest_DirLight_ShadowParam[i].y)
		{
			return i;
		}
	}

	return UniParam_ShadowTest_DirLight_ShadowCascadeNum;
}

void InitPoissonSamples()
{
	PoissonDiscSamples[0] = vec2(-0.613392, 0.617481); 		PoissonDiscSamples[1] = vec2(0.553514, -0.832698);
	PoissonDiscSamples[2] = vec2(0.806146, 0.578845); 		PoissonDiscSamples[3] = vec2(-0.724784, -0.673879);
	PoissonDiscSamples[4] = vec2(0.0372021, -0.0494094); 	PoissonDiscSamples[5] = vec2(0.0991546, 0.986755);
	PoissonDiscSamples[6] = vec2(0.975463, -0.18009); 		PoissonDiscSamples[7] = vec2(-0.989929, -0.00601214);
	PoissonDiscSamples[8] = vec2(-0.118931, -0.977599); 	PoissonDiscSamples[9] = vec2(0.271645, 0.451338);
	PoissonDiscSamples[10] = vec2(-0.479782, -0.197119); 	PoissonDiscSamples[11] = vec2(0.464705, -0.328227);
	PoissonDiscSamples[12] = vec2(-0.205359, 0.366375); 	PoissonDiscSamples[13] = vec2(0.0159612, -0.52324);
	PoissonDiscSamples[14] = vec2(0.621326, 0.132359); 		PoissonDiscSamples[15] = vec2(-0.32841, 0.941099);
}

#if MATERIAL_SHADING_MODEL_SUBSURFACE
float CalculateSSSOcclusion(float DepthInLight, float DepthInTexture, float Opacity, float DepthBias, float SubjectDepth)
{
	// calculate sss shadow
	float Thickness = max(DepthInTexture + DepthBias - DepthInLight, 0.0);
#if	MATERIAL_SHADING_MODEL_SUBSURFACE
	float Density = -0.05 * log(1.0 - min(Opacity, 0.999));
#endif
#if MATERIAL_SHADING_MODEL_HAIR
	float Density = 1.0;
#endif
	float Occlusion = clamp(exp(-Thickness * 100.0 * SubjectDepth * Density), 0.0, 1.0);
	return Occlusion;
	// Never shadow from depths that were never written to (max depth value)
	return DepthInTexture > .99f ? 1.0 : Occlusion;
}
#endif

#if MATERIAL_SHADING_MODEL_SUBSURFACE_PROFILE | MATERIAL_SHADING_MODEL_EYE
#include "TransmissionCommon.glsl"
float CalculateTransmissionThickness(float DepthInLight, float DepthInTexture, float DepthBias, float SubjectDepth)
{
	TransmissionProfileParams TransmissionParams = GetTransmissionProfileParams(int(UniParam_MaterialCommon_SSSIndex));
	float Thickness = (DepthInLight + DepthBias - DepthInTexture) * TransmissionParams.ExtinctionScale * 31.0f * SubjectDepth; // Magic number here.
	float NormalScale = TransmissionParams.NormalScale * 0.5;
	Thickness = clamp(abs(Thickness > 0.0 ? Thickness + NormalScale : max(0.0, Thickness + NormalScale)), 0.15, 5.0) + 0.25;
	return Thickness;
}
#endif

struct ShadowFilterParam
{
	vec3 WorldPosition;
	vec3 WorldNormal;
	vec2 ScreenUV;
	float Opacity; 
	mat4 Matrix;
	float DepthBias;
	float SoftTransition;
	float SubjectDepth;
	float InvSubjectDepth;
	float KernelRadius;
	float TexelSize;
};

void FilterShadow(sampler2D ShadowTexture, ShadowFilterParam FilterParam, out float SurfaceShadow, out float TransmissionShadow)
{
	vec4 ClipSpacePos = FilterParam.Matrix * vec4(FilterParam.WorldPosition, 1.0);
	float PixelDepth = ClipSpacePos.z * FilterParam.InvSubjectDepth;
	vec2 ShadowTexCoord = ClipSpacePos.xy / ClipSpacePos.w * 0.5 + 0.5;
#ifdef GLTEXTURE_FLIP_Y
#else
	ShadowTexCoord.y = 1.0 - ShadowTexCoord.y;
#endif

	float RotRad = PseudoRandom(FilterParam.ScreenUV) * 2.0 * 3.1415926535;
	vec2 RotSample = vec2(0.0, 0.0);
	RotSample.x = cos(RotRad);
	RotSample.y = sin(RotRad);
	RotSample.xy *= vec2(FilterParam.KernelRadius, FilterParam.KernelRadius) * FilterParam.TexelSize;
	mat2 Rot = mat2(RotSample.x, -RotSample.y, RotSample.y, RotSample.x);
	
#if MATERIAL_SHADING_MODEL_SUBSURFACE_PROFILE | MATERIAL_SHADING_MODEL_EYE
	vec4 ShrinkedPos = vec4(FilterParam.WorldPosition - 0.00005 * normalize(FilterParam.WorldNormal), 1.0);
	vec4 ShrinkedScreenPos = FilterParam.Matrix * ShrinkedPos;
	ShrinkedScreenPos.xy = ShrinkedScreenPos.xy / ShrinkedScreenPos.w * 0.5 + 0.5;
	ShrinkedScreenPos.z = ShrinkedScreenPos.z * FilterParam.InvSubjectDepth;
	float TransmissionThickness = 0.0f;
#endif

	SurfaceShadow = 0.0;
	TransmissionShadow = 0.0;

	for (int i = 0; i < 16; i++)
	{
		vec2 RotatedOffset = Rot * PoissonDiscSamples[i];
		vec2 ShadowDepthTexCoord = ShadowTexCoord + RotatedOffset;	
		float ShadowDepth = texture(ShadowTexture, ShadowDepthTexCoord).x;
		// 可有效缓解自阴影走样问题：
		//	PixelDepth与ShadowDepth的差值从DepthBias变为2*DepthBias的过程中，ShadowMask的值逐渐从1.0变为0.0，
		//	从而，阴影有一个过渡，缓解走样问题。
		SurfaceShadow += clamp((ShadowDepth + FilterParam.DepthBias - PixelDepth) * FilterParam.SoftTransition + 1.0, 0.0, 1.0);
		TransmissionShadow = SurfaceShadow;
#if MATERIAL_SHADING_MODEL_SUBSURFACE
		TransmissionShadow += CalculateSSSOcclusion(PixelDepth, ShadowDepth, FilterParam.Opacity, FilterParam.DepthBias, FilterParam.SubjectDepth);
#endif		
#if MATERIAL_SHADING_MODEL_SUBSURFACE_PROFILE | MATERIAL_SHADING_MODEL_EYE
		vec2 ShrinkedShadowDepthTexCoord = ShrinkedScreenPos.xy + RotatedOffset;	
		float ShrinkedShadowDepth = textureLod(ShadowTexture, ShrinkedShadowDepthTexCoord, 0.0).x;
		TransmissionThickness += CalculateTransmissionThickness(ShrinkedScreenPos.z, ShrinkedShadowDepth, FilterParam.DepthBias, FilterParam.SubjectDepth);
#endif
	}

	SurfaceShadow /= 16.0;
	TransmissionShadow /= 16.0;

#if MATERIAL_SHADING_MODEL_SUBSURFACE_PROFILE | MATERIAL_SHADING_MODEL_EYE
	TransmissionThickness /= 16.0f;
	TransmissionShadow = InternalFunc_Square(1.0 - TransmissionThickness / SSSS_MAX_TRANSMISSION_PROFILE_DISTANCE);
#endif
}

ShadowTerm DirLightShadowTest(vec3 WorldPosition, vec3 WorldNormal, float ViewDepth, vec2 ScreenUV, float Opacity)
{
	ShadowTerm Shadow;
	Shadow.SurfaceShadow = 1.0;
	Shadow.TransmissionShadow = 1.0;

	if (UniParam_ShadowTest_ShadowValid.x < 0.0)
	{
		return Shadow;
	}

	int CascadeIndex = FindCascadeIndex(ViewDepth);
	if (CascadeIndex >= UniParam_ShadowTest_DirLight_ShadowCascadeNum)
	{
		return Shadow;
	}

	InitPoissonSamples();

	float SurfaceShadow = 0.0;
	float TransmissionShadow = 0.0;

	ShadowFilterParam FilterParam;
	FilterParam.WorldPosition = WorldPosition;
	FilterParam.WorldNormal = WorldNormal;
	FilterParam.ScreenUV = ScreenUV;
	FilterParam.Opacity = Opacity;
	FilterParam.Matrix = UniParam_ShadowTest_DirLight_ShadowMatrix[CascadeIndex];
	vec4 ShadowParam = UniParam_ShadowTest_DirLight_ShadowParam[CascadeIndex]; // x:SubjectDepth, y:MaxViewZ, z:DepthBias, w:SoftTransition
	FilterParam.DepthBias = ShadowParam.z;
	FilterParam.SoftTransition = ShadowParam.w;
	FilterParam.SubjectDepth = ShadowParam.x;
	FilterParam.InvSubjectDepth = 1.0;
	FilterParam.KernelRadius = UniParam_ShadowTest_DirLight_ShadowTexelSizeAndKernelRadius[CascadeIndex].y;
	FilterParam.TexelSize = UniParam_ShadowTest_DirLight_ShadowTexelSizeAndKernelRadius[CascadeIndex].x;
	if (CascadeIndex == 0)
	{
		FilterShadow(UniParam_ShadowTest_DirLight_ShadowDepthSampler0, FilterParam, SurfaceShadow, TransmissionShadow);
	}
	else if (CascadeIndex == 1)
	{
		FilterShadow(UniParam_ShadowTest_DirLight_ShadowDepthSampler1, FilterParam, SurfaceShadow, TransmissionShadow);
	}

	Shadow.SurfaceShadow = SurfaceShadow;
	Shadow.TransmissionShadow = TransmissionShadow;
	return Shadow;
}

ShadowTerm SpotLightShadowTest(vec3 WorldPosition, vec3 WorldNormal, float ViewDepth, vec2 ScreenUV, float Opacity, int ShadowIndex)
{
	ShadowTerm Shadow;
	Shadow.SurfaceShadow = 1.0;
	Shadow.TransmissionShadow = 1.0;

	if (UniParam_ShadowTest_ShadowValid.y < 0.0 || ShadowIndex >= SPOT_LIGTH_MAX_SHADOW_NUM)
	{
		return Shadow;
	}

	InitPoissonSamples();

	float SurfaceShadow = 0.0;
	float TransmissionShadow = 0.0;

	ShadowFilterParam FilterParam;
	FilterParam.WorldPosition = WorldPosition;
	FilterParam.WorldNormal = WorldNormal;
	FilterParam.ScreenUV = ScreenUV;
	FilterParam.Opacity = Opacity;
	FilterParam.Matrix = UniParam_ShadowTest_SpotLight_ShadowMatrix[ShadowIndex];
	vec4 ShadowParam = UniParam_ShadowTest_SpotLight_ShadowParam[ShadowIndex]; // x:SubjectDepth, y:InvSubjectDepth, z:DepthBias, w:SoftTransition
	FilterParam.DepthBias = ShadowParam.z;
	FilterParam.SoftTransition = ShadowParam.w;
	FilterParam.SubjectDepth = ShadowParam.x;
	FilterParam.InvSubjectDepth = ShadowParam.y;
	FilterParam.KernelRadius = UniParam_ShadowTest_SpotLight_ShadowTexelSizeAndKernelRadius[ShadowIndex].y;
	FilterParam.TexelSize = UniParam_ShadowTest_SpotLight_ShadowTexelSizeAndKernelRadius[ShadowIndex].x;
	if (ShadowIndex == 0)
	{
		FilterShadow(UniParam_ShadowTest_SpotLight_ShadowDepthSampler0, FilterParam, SurfaceShadow, TransmissionShadow);
	}
	else if (ShadowIndex == 1)
	{
		FilterShadow(UniParam_ShadowTest_SpotLight_ShadowDepthSampler1, FilterParam, SurfaceShadow, TransmissionShadow);
	}
	// else if (ShadowIndex == 2)
	// {
	// 	FilterShadow(UniParam_ShadowTest_SpotLight_ShadowDepthSampler2, FilterParam, SurfaceShadow, TransmissionShadow);
	// }
	// else if (ShadowIndex == 3)
	// {
	// 	FilterShadow(UniParam_ShadowTest_SpotLight_ShadowDepthSampler3, FilterParam, SurfaceShadow, TransmissionShadow);
	// }

	Shadow.SurfaceShadow = SurfaceShadow;
	Shadow.TransmissionShadow = TransmissionShadow;
	return Shadow;
}
