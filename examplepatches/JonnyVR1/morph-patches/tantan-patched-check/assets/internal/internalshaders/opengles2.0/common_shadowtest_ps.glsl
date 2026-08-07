//******************************************************************************

// @File         common_shadowtest_ps.glsl

// @Version      1.0

// @Created      2018, 9, 27

// @Description  This file is common_shadowtest_ps.glsl.

// @HISTORY:

//******************************************************************************/

precision highp float;

#define DIR_LIGHT_MAX_CASCADE_NUM 2

uniform float		ShadowValid;
uniform int			ShadowCascadeNum;
uniform mat4		ShadowMatrix[DIR_LIGHT_MAX_CASCADE_NUM];
uniform vec4		ShadowParam[DIR_LIGHT_MAX_CASCADE_NUM]; // x:SubjectDepth, y:MaxViewZ, z:DepthBias, w:SoftTransition
uniform vec2		ShadowTexelSizeAndKernelRadius[DIR_LIGHT_MAX_CASCADE_NUM];
uniform vec4		ShadowColorAndStrength;

uniform sampler2D	ShadowDepthSampler0;
uniform sampler2D	ShadowDepthSampler1;

vec2 PoissonDiscSamples[16];

//Input: It uses texture coords as the random number seed.
//Output: Random number: [0, 1).
float PseudoRandom(vec2 XY)
{
	return fract(sin(dot(XY, vec2(12.9898, 78.233))) * 43758.5453);
}

int FindCascadeIndex(float ViewDepth)
{
	if (ViewDepth < ShadowParam[0].y)
	{
		return 0;
	}
	else if (ViewDepth < ShadowParam[1].y)
	{
		return 1;
	}

	return ShadowCascadeNum;
}

struct ShadowFilterParam
{
	vec3 WorldPosition;
	vec2 ScreenUV;
	mat4 Matrix;
	float DepthBias;
	float SoftTransition;
	float KernelRadius;
	float TexelSize;
};

void FilterShadow(sampler2D ShadowTexture, ShadowFilterParam FilterParam, out float SurfaceShadow)
{
	vec4 ClipSpacePos = FilterParam.Matrix * vec4(FilterParam.WorldPosition, 1.0);
	float PixelDepth = ClipSpacePos.z;
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

	SurfaceShadow = 0.0;
	for (int i = 0; i < 16; i++)
	{
		vec2 RotatedOffset = Rot * PoissonDiscSamples[i];
		vec2 ShadowDepthTexCoord = ShadowTexCoord + RotatedOffset;
		float ShadowDepth = texture2D(ShadowTexture, ShadowDepthTexCoord).x;
		// 可有效缓解自阴影走样问题：
		//	PixelDepth与ShadowDepth的差值从DepthBias变为2*DepthBias的过程中，ShadowMask的值逐渐从1.0变为0.0，
		//	从而，阴影有一个过渡，缓解走样问题。
		SurfaceShadow += clamp((ShadowDepth + FilterParam.DepthBias - PixelDepth) * FilterParam.SoftTransition + 1.0, 0.0, 1.0);
	}
	SurfaceShadow /= 16.0;
}

float ShadowTest(vec3 WorldPosition, float ViewDepth, vec2 ScreenUV)
{
	if (ShadowValid < 0.0)
	{
		return 1.0;
	}
	
	int CascadeIndex = FindCascadeIndex(ViewDepth);
	if (CascadeIndex >= ShadowCascadeNum)
	{
		return 1.0;
	}

	// Init poisson samples.
	PoissonDiscSamples[0] = vec2(-0.613392, 0.617481); PoissonDiscSamples[1] = vec2(0.553514, -0.832698);
	PoissonDiscSamples[2] = vec2(0.806146, 0.578845); PoissonDiscSamples[3] = vec2(-0.724784, -0.673879);
	PoissonDiscSamples[4] = vec2(0.0372021, -0.0494094); PoissonDiscSamples[5] = vec2(0.0991546, 0.986755);
	PoissonDiscSamples[6] = vec2(0.975463, -0.18009); PoissonDiscSamples[7] = vec2(-0.989929, -0.00601214);
	PoissonDiscSamples[8] = vec2(-0.118931, -0.977599); PoissonDiscSamples[9] = vec2(0.271645, 0.451338);
	PoissonDiscSamples[10] = vec2(-0.479782, -0.197119); PoissonDiscSamples[11] = vec2(0.464705, -0.328227);
	PoissonDiscSamples[12] = vec2(-0.205359, 0.366375); PoissonDiscSamples[13] = vec2(0.0159612, -0.52324);
	PoissonDiscSamples[14] = vec2(0.621326, 0.132359); PoissonDiscSamples[15] = vec2(-0.32841, 0.941099);

	float SurfaceShadow = 0.0;

	ShadowFilterParam FilterParam;
	FilterParam.WorldPosition = WorldPosition;
	FilterParam.ScreenUV = ScreenUV;
	FilterParam.Matrix = ShadowMatrix[CascadeIndex];
	vec4 ShadowParam = ShadowParam[CascadeIndex]; // x:SubjectDepth, y:MaxViewZ, z:DepthBias, w:SoftTransition
	FilterParam.DepthBias = ShadowParam.z;
	FilterParam.SoftTransition = ShadowParam.w;
    vec2 TexelSizeAndKernelRadius = ShadowTexelSizeAndKernelRadius[CascadeIndex];
	FilterParam.KernelRadius = TexelSizeAndKernelRadius.y;
	FilterParam.TexelSize = TexelSizeAndKernelRadius.x;
	if (CascadeIndex == 0)
	{
		FilterShadow(ShadowDepthSampler0, FilterParam, SurfaceShadow);
	}
	else if (CascadeIndex == 1)
	{
		FilterShadow(ShadowDepthSampler1, FilterParam, SurfaceShadow);
	}

	SurfaceShadow = mix(SurfaceShadow, 1.0, (1.0 - ShadowColorAndStrength.w));
	return SurfaceShadow;
}
