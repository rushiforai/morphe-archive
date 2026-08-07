#include "PostProcessCommon.glsl"

in vec2 VSOutTexcoord;
in vec4 VSOutPosition;

out vec4 PSOutColor;

//-----------------------------------------------------------------------------------------------
//Copy
#ifdef SHADERDEF_COPY
uniform sampler2D	UniParam_PostProcess_CopyTexture;
void main()
{
	PSOutColor = textureLod(UniParam_PostProcess_CopyTexture, VSOutTexcoord, 0.0).xyzw;
}
#endif

// TAA
#ifdef SHADERDEF_TAA
#define CurrentFrameWeight 0.04
ivec2 kOffset3x3[9];
int kPlusIndexes3x3[5];
uniform sampler2D UniParam_PostProcess_SourceTexture;
uniform sampler2D UniParam_PostProcess_PreSourceTexture;
uniform sampler2D UniParam_PostProcess_DepthTexture;
uniform sampler2D UniParam_PostProcess_VelocityTexture;
uniform vec2 UniParam_PostProcess_JitterUV;
uniform vec4 UniParam_PostProcess_PlusWeights;

vec3 RGBToYCoCg(vec3 RGB)
{
	float Y = dot(RGB, vec3(1, 2, 1));
	float Co = dot(RGB, vec3(2, 0, -2));
	float Cg = dot(RGB, vec3(-1, 2, -1));

	vec3 YCoCg = vec3( Y, Co, Cg );
	return YCoCg;
}

vec3 YCoCgToRGB(vec3 YCoCg)
{
	float Y = YCoCg.x * 0.25;
	float Co = YCoCg.y * 0.25;
	float Cg = YCoCg.z * 0.25;

	float R = Y + Co - Cg;
	float G = Y + Cg;
	float B = Y - Co - Cg;

	vec3 RGB = vec3(R, G, B);
	return RGB;
}

void CacheNeighborPixelColor(out vec4 CachedNeighbors[9])
{
	vec4 NeighborColor;
	NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2(-1, -1)); CachedNeighbors[0] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
	NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2( 0, -1)); CachedNeighbors[1] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
	NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2( 1, -1)); CachedNeighbors[2] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
	NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2(-1,  0)); CachedNeighbors[3] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
	NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2( 0,  0)); CachedNeighbors[4] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
	NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2( 1,  0)); CachedNeighbors[5] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
	NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2(-1,  1)); CachedNeighbors[6] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
	NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2( 0,  1)); CachedNeighbors[7] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
	NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2( 1,  1)); CachedNeighbors[8] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
}

vec4 FiltCurrentFrame(vec4 CachedNeighbors[9])
{
	float PlusWeights[5];
	PlusWeights[0] = UniParam_PostProcess_PlusWeights.x;
	PlusWeights[1] = UniParam_PostProcess_PlusWeights.y;
	PlusWeights[2] = UniParam_PostProcess_PlusWeights.z;
	PlusWeights[3] = UniParam_PostProcess_PlusWeights.w;
	PlusWeights[4] = 1.0 - PlusWeights[0] - PlusWeights[1] - PlusWeights[2] - PlusWeights[3];
	
	float NeighborsFinalWeight = 0.0;
	vec4 ColorWithNeighbor = vec4(0.0);
	for (int i = 0; i < 5; i++)
	{	
		int SampleIndex = kPlusIndexes3x3[i];
		ivec2 SampleOffset = kOffset3x3[SampleIndex];
	
		float SampleSpatialWeight = PlusWeights[i];

		vec4 SampleColor = CachedNeighbors[4 + SampleOffset.x + SampleOffset.y * 3];
		float SampleHdrWeight = 1.0 / (SampleColor.x + 4.0);
			
		float SampleFinalWeight = SampleSpatialWeight * SampleHdrWeight;

		ColorWithNeighbor += SampleFinalWeight * SampleColor;
		NeighborsFinalWeight += SampleFinalWeight;
	}
	
	vec4 FilteredColorCurrent = ColorWithNeighbor / NeighborsFinalWeight;	
	return FilteredColorCurrent;
}

void ComputeNeighborhoodBoundingbox(vec4 CachedNeighbors[9], out vec4 NeighborMin, out vec4 NeighborMax)
{
	NeighborMin = vec4(min(CachedNeighbors[1].x, min(CachedNeighbors[3].x, min(CachedNeighbors[4].x, min(CachedNeighbors[5].x, CachedNeighbors[7].x)))),
					   min(CachedNeighbors[1].y, min(CachedNeighbors[3].y, min(CachedNeighbors[4].y, min(CachedNeighbors[5].y, CachedNeighbors[7].y)))),
					   min(CachedNeighbors[1].z, min(CachedNeighbors[3].z, min(CachedNeighbors[4].z, min(CachedNeighbors[5].z, CachedNeighbors[7].z)))),
					   min(CachedNeighbors[1].w, min(CachedNeighbors[3].w, min(CachedNeighbors[4].w, min(CachedNeighbors[5].w, CachedNeighbors[7].w))))	);
	NeighborMax = vec4(max(CachedNeighbors[1].x, max(CachedNeighbors[3].x, max(CachedNeighbors[4].x, max(CachedNeighbors[5].x, CachedNeighbors[7].x)))),
					   max(CachedNeighbors[1].y, max(CachedNeighbors[3].y, max(CachedNeighbors[4].y, max(CachedNeighbors[5].y, CachedNeighbors[7].y)))),
					   max(CachedNeighbors[1].z, max(CachedNeighbors[3].z, max(CachedNeighbors[4].z, max(CachedNeighbors[5].z, CachedNeighbors[7].z)))),
					   max(CachedNeighbors[1].w, max(CachedNeighbors[3].w, max(CachedNeighbors[4].w, max(CachedNeighbors[5].w, CachedNeighbors[7].w))))	);
}

struct FCatmullRomSamples
{
	int Count;
	ivec2 UVDir[5];
	vec2 UV[5];
	float Weight[5];
	float FinalMultiplier;
};

void Bicubic2DCatmullRom(vec2 UV, vec2 Size, vec2 InvSize, out vec2 Sample[3], out vec2 Weight[3])
{
	UV *= Size;

	vec2 tc = floor( UV - 0.5 ) + 0.5;
	vec2 f = UV - tc;
	vec2 f2 = f * f;
	vec2 f3 = f2 * f;

	vec2 w0 = f2 - 0.5 * (f3 + f);
	vec2 w1 = 1.5 * f3 - 2.5 * f2 + 1.0;
	vec2 w3 = 0.5 * (f3 - f2);
	vec2 w2 = 1.0 - w0 - w1 - w3;

	Weight[0] = w0;
	Weight[1] = w1 + w2;
	Weight[2] = w3;

	Sample[0] = tc - 1.0;
	Sample[1] = tc + w2 / Weight[1];
	Sample[2] = tc + 2.0;

	Sample[0] *= InvSize;
	Sample[1] *= InvSize;
	Sample[2] *= InvSize;
}

FCatmullRomSamples GetBicubic2DCatmullRomSamples(vec2 UV, vec2 Size, vec2 InvSize)
{
	FCatmullRomSamples Samples;
	Samples.Count = 5;

	vec2 Weight[3];
	vec2 Sample[3];
	Bicubic2DCatmullRom( UV, Size, InvSize, Sample, Weight );


	Samples.UV[0] = vec2(Sample[1].x, Sample[0].y);
	Samples.UV[1] = vec2(Sample[0].x, Sample[1].y);
	Samples.UV[2] = vec2(Sample[1].x, Sample[1].y);
	Samples.UV[3] = vec2(Sample[2].x, Sample[1].y);
	Samples.UV[4] = vec2(Sample[1].x, Sample[2].y);

	Samples.Weight[0] = Weight[1].x * Weight[0].y;
	Samples.Weight[1] = Weight[0].x * Weight[1].y;
	Samples.Weight[2] = Weight[1].x * Weight[1].y;
	Samples.Weight[3] = Weight[2].x * Weight[1].y;
	Samples.Weight[4] = Weight[1].x * Weight[2].y;

	Samples.UVDir[0] = ivec2(0, -1);
	Samples.UVDir[1] = ivec2(-1, 0);
	Samples.UVDir[2] = ivec2(0, 0);
	Samples.UVDir[3] = ivec2(1, 0);
	Samples.UVDir[4] = ivec2(0, 1);


	float CornerWeights;
	CornerWeights = Samples.Weight[0];
	CornerWeights += Samples.Weight[1];
	CornerWeights += Samples.Weight[2];
	CornerWeights += Samples.Weight[3];
	CornerWeights += Samples.Weight[4];
	Samples.FinalMultiplier = 1.0 / CornerWeights;

	return Samples;
}

vec4 SampleHistory(vec2 HistoryPositionNDC)
{
	vec2 HistoryUV = HistoryPositionNDC * 0.5 + 0.5;
	HistoryUV = clamp(HistoryUV, vec2(0.0), vec2(1.0));
	
	FCatmullRomSamples Samples = GetBicubic2DCatmullRomSamples(HistoryUV, UniParam_PostProcess_PosScaleBias.xy, UniParam_PostProcess_InvTargetSizeAndTextureSize.xy);
	
	vec4 HistoryColor = vec4(0.0);
	for (int i = 0; i < Samples.Count; i++)
	{
		vec2 SampleUV = Samples.UV[i];
		
		if (Samples.UVDir[i].x < 0)
		{
			SampleUV.x = max(SampleUV.x, 0.0);
		}
		else if (Samples.UVDir[i].x > 0)
		{
			SampleUV.x = min(SampleUV.x, 1.0);
		}

		if (Samples.UVDir[i].y < 0)
		{
			SampleUV.y = max(SampleUV.y, 0.0);
		}
		else if (Samples.UVDir[i].y > 0)
		{
			SampleUV.y = min(SampleUV.y, 1.0);
		}
	
		HistoryColor += texture(UniParam_PostProcess_PreSourceTexture, SampleUV) * Samples.Weight[i];
	}
	HistoryColor *= Samples.FinalMultiplier;
	
	return vec4(RGBToYCoCg(HistoryColor.rgb), 0.0);
}

vec2 WeightedLerpFactors(float WeightA, float WeightB, float Blend)
{
	float BlendA = (1.0 - Blend) * WeightA;
	float BlendB = Blend * WeightB;
	float RcpBlend = 1.0 / (BlendA + BlendB);
	BlendA *= RcpBlend;
	BlendB *= RcpBlend;
	return vec2(BlendA, BlendB);
}

void main()
{
	kOffset3x3[0] = ivec2(-1, -1);
	kOffset3x3[1] = ivec2( 0, -1);
	kOffset3x3[2] = ivec2( 1, -1);
	kOffset3x3[3] = ivec2(-1,  0);
	kOffset3x3[4] = ivec2( 0,  0);
	kOffset3x3[5] = ivec2( 1,  0);
	kOffset3x3[6] = ivec2(-1,  1);
	kOffset3x3[7] = ivec2( 0,  1);
	kOffset3x3[8] = ivec2( 1,  1);
	kPlusIndexes3x3[0] = 1;
	kPlusIndexes3x3[1] = 3;
	kPlusIndexes3x3[2] = 4;
	kPlusIndexes3x3[3] = 5;
	kPlusIndexes3x3[4] = 7;
	
	float DeviceZ = texture(UniParam_PostProcess_DepthTexture, VSOutTexcoord).r;
	vec3 PositionNDC = vec3(VSOutTexcoord.xy * 2.0 - 1.0, InternalFunc_LinearDepth(DeviceZ));

	vec4 Depths;
	Depths.x = InternalFunc_LinearDepth(textureOffset(UniParam_PostProcess_DepthTexture, VSOutTexcoord, ivec2(-2, -2)).r);
	Depths.y = InternalFunc_LinearDepth(textureOffset(UniParam_PostProcess_DepthTexture, VSOutTexcoord, ivec2( 2, -2)).r);
	Depths.z = InternalFunc_LinearDepth(textureOffset(UniParam_PostProcess_DepthTexture, VSOutTexcoord, ivec2(-2,  2)).r);
	Depths.w = InternalFunc_LinearDepth(textureOffset(UniParam_PostProcess_DepthTexture, VSOutTexcoord, ivec2( 2,  2)).r);
	
	float DepthsXY = min(Depths.x, Depths.y);
	float DepthsZW = min(Depths.z, Depths.w);
	float DepthsXYZW = min(DepthsXY, DepthsZW);

	vec2 VelocityOffset = vec2(0.0);
	if(DepthsXYZW < PositionNDC.z)
	{
		vec2 DepthOffset = vec2(2.0, 2.0);
		float DepthOffsetX = 2.0;
		
		if(Depths.x < Depths.y)
		{
			DepthOffsetX = -2.0;
		}
		if(Depths.z > Depths.w)
		{
			DepthOffset.x = -2.0;
		}
		if(DepthsXY < DepthsZW)
		{
			DepthOffset.y = -2.0 ;
			DepthOffset.x = DepthOffsetX;
		}
		VelocityOffset = DepthOffset * UniParam_PostProcess_InvTargetSizeAndTextureSize.xy;
	}

	vec2 VelocityNDC = texture(UniParam_PostProcess_VelocityTexture, VSOutTexcoord + VelocityOffset).xy * 2.0;
	vec2 HistoryPositionNDC = PositionNDC.xy - VelocityNDC ;

	//CacheNeighbor Pixel Color
	vec4 CachedNeighbors[9];
	CacheNeighborPixelColor(CachedNeighbors);

	//Filt Current Pixel	
	vec4 FilteredColorCurrent;
	FilteredColorCurrent = FiltCurrentFrame(CachedNeighbors);

	//SampleHistory
	vec4 HistoryColor = SampleHistory(HistoryPositionNDC);
	HistoryColor.a = 0.0;

	bool OffScreen = max(abs(HistoryPositionNDC.x), abs(HistoryPositionNDC.y)) >= 1.0;		
	bool Dynamic1 = abs(textureOffset(UniParam_PostProcess_VelocityTexture, VSOutTexcoord, ivec2( 0, -1)).x) > 0.0;
	bool Dynamic3 = abs(textureOffset(UniParam_PostProcess_VelocityTexture, VSOutTexcoord, ivec2(-1,  0)).x) > 0.0;
	bool Dynamic4 = abs(textureOffset(UniParam_PostProcess_VelocityTexture, VSOutTexcoord, ivec2( 0,  0)).x) > 0.0;
	bool Dynamic5 = abs(textureOffset(UniParam_PostProcess_VelocityTexture, VSOutTexcoord, ivec2( 1,  0)).x) > 0.0;
	bool Dynamic7 = abs(textureOffset(UniParam_PostProcess_VelocityTexture, VSOutTexcoord, ivec2( 0,  1)).x) > 0.0;
	bool Dynamic = Dynamic1 || Dynamic3 || Dynamic4 || Dynamic5 || Dynamic7;
	bool IgnoreHistory = OffScreen || !Dynamic && HistoryColor.a > 0.0;
	
	if(IgnoreHistory)
	{
		HistoryColor = FilteredColorCurrent;
	}
	else
	{
		vec4 NeighborMin;
		vec4 NeighborMax;
		ComputeNeighborhoodBoundingbox(CachedNeighbors, NeighborMin, NeighborMax);
		HistoryColor = clamp(HistoryColor, NeighborMin, NeighborMax);
	}

	float LumaFiltered = FilteredColorCurrent.x;
	float LumaHistory = HistoryColor.x;
	
	vec2 BackTemp = VelocityNDC * UniParam_PostProcess_PosScaleBias.xy;	
	float Velocity = sqrt(dot(BackTemp, BackTemp));
	float BlendFinal = mix(CurrentFrameWeight, 0.2, clamp(Velocity / 40.0, 0.0, 1.0));
	BlendFinal = max(BlendFinal, clamp(0.01 * LumaHistory / abs(LumaFiltered - LumaHistory), 0.0, 1.0));

	float FilteredColorWeight = 1.0 / (FilteredColorCurrent.x + 4.0);
	float HistoryColorWeight = 1.0 / (HistoryColor.x + 4.0);
	
	vec2 Weights = WeightedLerpFactors(HistoryColorWeight, FilteredColorWeight, BlendFinal);
	
	vec4 ColorOut = HistoryColor * Weights.x + FilteredColorCurrent * Weights.y;

	ColorOut.rgb = YCoCgToRGB(ColorOut.rgb);
	ColorOut.a = 1.0;
	PSOutColor = ColorOut;
	//PSOutColor = vec4(texture(UniParam_PostProcess_SourceTexture, VSOutTexcoord).xyz, 1.0);
}
#endif
// //-----------------------------------------------------------------------------------------------
// //Fill
// uniform vec4 UniParam_PostProcess_FillColor;
// uniform vec4 UniParam_PostProcess_FillMask;
// float4 Fill(LocStru_PostProcess_PSInput Input) : SV_Target0
// {
// 	return UniParam_PostProcess_FillColor;
// }

// //-----------------------------------------------------------------------------------------------
// //CopyFill
// float4 CopyFill(LocStru_PostProcess_PSInput Input) : SV_Target0
// {
// 	float4 CopyTextureColor = UniParam_PostProcess_CopyTexture.SampleLevel(UniParam_PostProcess_CopyTextureSampler, Input.TexCoord, 0);
// 	return UniParam_PostProcess_FillMask > 0.5 ? UniParam_PostProcess_FillColor : CopyTextureColor;
	
// }



// //------------------------------------------------------------------
// //bicubic filter
// float InternalFunc_PostProcess_BellFunc(float X)
// {
// 	// This interpolation is created through 3 sections.
// 	// We need to convert ( -2 to +2 ) to ( -1.5 to +1.5 ).
// 	float F = (X / 2.0) * 1.5; // Converting -2 to +2 to -1.5 to +1.5
// 	if (F > -1.5 && F < -0.5)
// 	{
// 		return(0.5 * pow(F + 1.5, 2.0));
// 	}
// 	else if (F > -0.5 && F < 0.5)
// 	{
// 		return 3.0 / 4.0 - (F * F);
// 	}
// 	else if ((F > 0.5 && F < 1.5))
// 	{
// 		return(0.5 * pow(F - 1.5, 2.0));
// 	}
// 	return 0.0;
// }

// float InternalFunc_PostProcess_BSpline(float F)
// {
// 	if (F < 0.0)
// 	{
// 		F = -F;
// 	}

// 	if (F >= 0.0 && F <= 1.0)
// 	{
// 		return (2.0 / 3.0) + (0.5) * (F* F * F) - (F*F);
// 	}
// 	else if (F > 1.0 && F <= 2.0)
// 	{
// 		return 1.0 / 6.0 * pow((2.0 - F), 3.0);
// 	}
// 	return 1.0;
// }

// float InternalFunc_PostProcess_Triangular(float F)
// {
// 	F = F / 2.0;
// 	if (F < 0.0)
// 	{
// 		return (F + 1.0);
// 	}
// 	else
// 	{
// 		return (1.0 - F);
// 	}
// 	return 0.0;
// }


// float4 InternalFunc_PostProcess_BicubicFilter(Texture2D Tex, SamplerState Sam, float2 TexCoord, float2 TexSize, float2 TexelSize)
// {
	
// 	float4 Sum = 0.0;
// 	float4 Denom = 0.0;
// 	float A = frac(TexCoord.x * TexSize.x); // get the decimal part
// 	float B = frac(TexCoord.y * TexSize.y); // get the decimal part

// 	int X = int(TexCoord.x * TexSize.x);
// 	int Y = int(TexCoord.y * TexSize.y);
// 	float2 TexCoord1 = float2(float(X) / TexSize.x + 0.5 / TexSize.x,
// 		float(Y) / TexSize.y + 0.5 / TexSize.y);

// 	for (int M = -1; M <= 2; M++)
// 	{
// 		for (int N = -1; N <= 2; N++)
// 		{
// 			float2 TexCoord2 = TexCoord1 + float2(TexelSize.x * float(M), TexelSize.y * float(N));
// 			TexCoord2 = clamp(TexCoord2, UniParam_PostProcess_UVScaleBias.zw * UniParam_PostProcess_InvTargetSizeAndTextureSize.zw,
// 				(UniParam_PostProcess_UVScaleBias.xy + UniParam_PostProcess_UVScaleBias.zw) * UniParam_PostProcess_InvTargetSizeAndTextureSize.zw);
// 			float4 vecData = Tex.SampleLevel(Sam, TexCoord2, 0);
// 			float F = InternalFunc_PostProcess_Triangular(float(M) - A);
			
// 			float4 vecCooef1 = float4(F, F, F, F);
// 			float F1 = InternalFunc_PostProcess_Triangular(-(float(N) - B));
// 			float4 vecCoeef2 = float4(F1, F1, F1, F1);

// 			Sum = Sum + (vecData * vecCoeef2 * vecCooef1);
// 			Denom = Denom + ((vecCoeef2 * vecCooef1));
// 		}
// 	}
// 	return Sum / Denom;
// }

// float4 BicubicFilter(LocStru_PostProcess_PSInput Input) : SV_Target0
// {

// 	float2 TexSize = 1.0f / UniParam_PostProcess_InvTargetSizeAndTextureSize.zw;
// 	return InternalFunc_PostProcess_BicubicFilter(UniParam_PostProcess_CopyTexture,
// 		UniParam_PostProcess_CopyTextureSampler,
// 		Input.TexCoord,
// 		TexSize,
// 		UniParam_PostProcess_InvTargetSizeAndTextureSize.zw);
// }

// //-----------------------------------------------------------------------------------------------
// //PackDepth
// float4 PackDepth(LocStru_PostProcess_PSInput Input) : SV_Target0
// {
// 	float Depth = 1.0f - UniParam_PostProcess_DepthTexture.SampleLevel(UniParam_PostProcess_DepthTextureSampler, Input.TexCoord, 0).r;

// 	return float4(Depth, Depth, Depth, 1.0f);
// }

// //-----------------------------------------------------------------------------------------------
// //CopyDepth
// void CopyDepth(LocStru_PostProcess_PSInput Input, out float OutDepth : SV_DEPTH)
// {
// 	OutDepth = UniParam_PostProcess_DepthTexture.SampleLevel(UniParam_PostProcess_DepthTextureSampler, Input.TexCoord, 0).r;
// }