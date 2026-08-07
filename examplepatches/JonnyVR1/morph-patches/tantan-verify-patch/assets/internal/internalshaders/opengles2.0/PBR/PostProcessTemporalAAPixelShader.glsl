#include "PostProcessCommon.glsl"

in vec2 VSOutTexcoord;
in vec4 VSOutPosition;

out vec4 PSOutColor;

#define CurrentFrameWeight 0.04

ivec2 kOffset3x3[9];
int kPlusIndexes3x3[5];
uniform sampler2D UniParam_PostProcess_SourceTexture;        // Current frame
uniform sampler2D UniParam_PostProcess_PreSourceTexture;    // Previous frame
uniform sampler2D UniParam_PostProcess_DepthTexture;
uniform sampler2D UniParam_PostProcess_VelocityTexture;
//uniform vec2 UniParam_PostProcess_JitterUV;
uniform vec4 UniParam_PostProcess_PlusWeights;
//uniform mat4 UniParam_PostProcess_ClipToPreClip;

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
    
    // textureOffset can not be converted to metal shading language correctly.
    //NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2(-1, -1)); CachedNeighbors[0] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
    //NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2( 0, -1)); CachedNeighbors[1] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
    //NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2( 1, -1)); CachedNeighbors[2] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
    //NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2(-1,  0)); CachedNeighbors[3] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
    //NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2( 0,  0)); CachedNeighbors[4] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
    //NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2( 1,  0)); CachedNeighbors[5] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
    //NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2(-1,  1)); CachedNeighbors[6] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
    //NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2( 0,  1)); CachedNeighbors[7] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
    //NeighborColor = textureOffset(UniParam_PostProcess_SourceTexture, VSOutTexcoord, ivec2( 1,  1)); CachedNeighbors[8] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);

    vec2 InvTextureSize = UniParam_PostProcess_InvTargetSizeAndTextureSize.zw;
    NeighborColor = texture(UniParam_PostProcess_SourceTexture, VSOutTexcoord + vec2(-1.0, -1.0) * InvTextureSize); CachedNeighbors[0] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
    NeighborColor = texture(UniParam_PostProcess_SourceTexture, VSOutTexcoord + vec2( 0.0, -1.0) * InvTextureSize); CachedNeighbors[1] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
    NeighborColor = texture(UniParam_PostProcess_SourceTexture, VSOutTexcoord + vec2( 1.0, -1.0) * InvTextureSize); CachedNeighbors[2] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
    NeighborColor = texture(UniParam_PostProcess_SourceTexture, VSOutTexcoord + vec2(-1.0,  0.0) * InvTextureSize); CachedNeighbors[3] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
    NeighborColor = texture(UniParam_PostProcess_SourceTexture, VSOutTexcoord + vec2( 0.0,  0.0) * InvTextureSize); CachedNeighbors[4] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
    NeighborColor = texture(UniParam_PostProcess_SourceTexture, VSOutTexcoord + vec2( 1.0,  0.0) * InvTextureSize); CachedNeighbors[5] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
    NeighborColor = texture(UniParam_PostProcess_SourceTexture, VSOutTexcoord + vec2(-1.0,  1.0) * InvTextureSize); CachedNeighbors[6] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
    NeighborColor = texture(UniParam_PostProcess_SourceTexture, VSOutTexcoord + vec2( 0.0,  1.0) * InvTextureSize); CachedNeighbors[7] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
    NeighborColor = texture(UniParam_PostProcess_SourceTexture, VSOutTexcoord + vec2( 1.0,  1.0) * InvTextureSize); CachedNeighbors[8] = vec4(RGBToYCoCg(NeighborColor.rgb), NeighborColor.a);
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
    //FilteredColorCurrent = CachedNeighbors[4];

    return FilteredColorCurrent;
}

void ComputeNeighborhoodBoundingbox(vec4 CachedNeighbors[9], out vec4 NeighborMin, out vec4 NeighborMax)
{
    NeighborMin = min(CachedNeighbors[1], min(CachedNeighbors[3], min(CachedNeighbors[4], min(CachedNeighbors[5], CachedNeighbors[7]))));
    NeighborMax = max(CachedNeighbors[1], max(CachedNeighbors[3], max(CachedNeighbors[4], max(CachedNeighbors[5], CachedNeighbors[7]))));
    NeighborMin = min(NeighborMin, min(CachedNeighbors[0], min(CachedNeighbors[2], min(CachedNeighbors[6], CachedNeighbors[8]))));
    NeighborMax = max(NeighborMax, max(CachedNeighbors[0], max(CachedNeighbors[2], max(CachedNeighbors[6], CachedNeighbors[8]))));
}

//struct FCatmullRomSamples
//{
//    int Count;
//    ivec2 UVDir[5];
//    vec2 UV[5];
//    float Weight[5];
//    float FinalMultiplier;
//};

//void Bicubic2DCatmullRom(vec2 UV, vec2 Size, vec2 InvSize, out vec2 Sample[3], out vec2 Weight[3])
//{
//    UV *= Size;
//
//    vec2 tc = floor( UV - 0.5 ) + 0.5;
//    vec2 f = UV - tc;
//    vec2 f2 = f * f;
//    vec2 f3 = f2 * f;
//
//    vec2 w0 = f2 - 0.5 * (f3 + f);
//    vec2 w1 = 1.5 * f3 - 2.5 * f2 + 1.0;
//    vec2 w3 = 0.5 * (f3 - f2);
//    vec2 w2 = 1.0 - w0 - w1 - w3;
//
//    Weight[0] = w0;
//    Weight[1] = w1 + w2;
//    Weight[2] = w3;
//
//    Sample[0] = tc - 1.0;
//    Sample[1] = tc + w2 / Weight[1];
//    Sample[2] = tc + 2.0;
//
//    Sample[0] *= InvSize;
//    Sample[1] *= InvSize;
//    Sample[2] *= InvSize;
//}

//FCatmullRomSamples GetBicubic2DCatmullRomSamples(vec2 UV, vec2 Size, vec2 InvSize)
//{
//    FCatmullRomSamples Samples;
//    Samples.Count = 5;
//
//    vec2 Weight[3];
//    vec2 Sample[3];
//    Bicubic2DCatmullRom( UV, Size, InvSize, Sample, Weight );
//
//
//    Samples.UV[0] = vec2(Sample[1].x, Sample[0].y);
//    Samples.UV[1] = vec2(Sample[0].x, Sample[1].y);
//    Samples.UV[2] = vec2(Sample[1].x, Sample[1].y);
//    Samples.UV[3] = vec2(Sample[2].x, Sample[1].y);
//    Samples.UV[4] = vec2(Sample[1].x, Sample[2].y);
//
//    Samples.Weight[0] = Weight[1].x * Weight[0].y;
//    Samples.Weight[1] = Weight[0].x * Weight[1].y;
//    Samples.Weight[2] = Weight[1].x * Weight[1].y;
//    Samples.Weight[3] = Weight[2].x * Weight[1].y;
//    Samples.Weight[4] = Weight[1].x * Weight[2].y;
//
//    Samples.UVDir[0] = ivec2(0, -1);
//    Samples.UVDir[1] = ivec2(-1, 0);
//    Samples.UVDir[2] = ivec2(0, 0);
//    Samples.UVDir[3] = ivec2(1, 0);
//    Samples.UVDir[4] = ivec2(0, 1);
//
//
//    float CornerWeights;
//    CornerWeights = Samples.Weight[0];
//    CornerWeights += Samples.Weight[1];
//    CornerWeights += Samples.Weight[2];
//    CornerWeights += Samples.Weight[3];
//    CornerWeights += Samples.Weight[4];
//    Samples.FinalMultiplier = 1.0 / CornerWeights;
//
//    return Samples;
//}

vec4 SampleHistory(vec2 HistoryPositionNDC)
{
    vec2 HistoryUV = HistoryPositionNDC * 0.5 + 0.5;
    HistoryUV = clamp(HistoryUV, vec2(0.0), vec2(1.0));
    
//    FCatmullRomSamples Samples = GetBicubic2DCatmullRomSamples(HistoryUV, UniParam_PostProcess_PosScaleBias.xy, UniParam_PostProcess_InvTargetSizeAndTextureSize.xy);
//
//    vec4 HistoryColor = vec4(0.0);
//    for (int i = 0; i < Samples.Count; i++)
//    {
//        vec2 SampleUV = Samples.UV[i];
//
//        if (Samples.UVDir[i].x < 0)
//        {
//            SampleUV.x = max(SampleUV.x, 0.0);
//        }
//        else if (Samples.UVDir[i].x > 0)
//        {
//            SampleUV.x = min(SampleUV.x, 1.0);
//        }
//
//        if (Samples.UVDir[i].y < 0)
//        {
//            SampleUV.y = max(SampleUV.y, 0.0);
//        }
//        else if (Samples.UVDir[i].y > 0)
//        {
//            SampleUV.y = min(SampleUV.y, 1.0);
//        }
//
//        HistoryColor += texture(UniParam_PostProcess_PreSourceTexture, SampleUV) * Samples.Weight[i];
//    }
//    HistoryColor *= Samples.FinalMultiplier;

    vec4 HistoryColor = texture(UniParam_PostProcess_PreSourceTexture, HistoryUV);
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
    vec3 PositionNDC = vec3(VSOutTexcoord.xy * 2.0 - 1.0, DeviceZ);

    vec4 Depths;
    // textureOffset can not be converted to metal shading language correctly.
    //Depths.x = textureOffset(UniParam_PostProcess_DepthTexture, VSOutTexcoord, ivec2(-2, -2)).r;
    //Depths.y = textureOffset(UniParam_PostProcess_DepthTexture, VSOutTexcoord, ivec2( 2, -2)).r;
    //Depths.z = textureOffset(UniParam_PostProcess_DepthTexture, VSOutTexcoord, ivec2(-2,  2)).r;
    //Depths.w = textureOffset(UniParam_PostProcess_DepthTexture, VSOutTexcoord, ivec2( 2,  2)).r;
    vec2 InvTextureSize = UniParam_PostProcess_InvTargetSizeAndTextureSize.zw;
    Depths.x = texture(UniParam_PostProcess_DepthTexture, VSOutTexcoord + vec2(-2.0, -2.0) * InvTextureSize).r;
    Depths.y = texture(UniParam_PostProcess_DepthTexture, VSOutTexcoord + vec2( 2.0, -2.0) * InvTextureSize).r;
    Depths.z = texture(UniParam_PostProcess_DepthTexture, VSOutTexcoord + vec2(-2.0,  2.0) * InvTextureSize).r;
    Depths.w = texture(UniParam_PostProcess_DepthTexture, VSOutTexcoord + vec2( 2.0,  2.0) * InvTextureSize).r;
    
    float DepthsXY = min(Depths.x, Depths.y);
    float DepthsZW = min(Depths.z, Depths.w);
    float DepthsXYZW = min(DepthsXY, DepthsZW);

    vec2 VelocityOffset = vec2(0.0);
    if (DepthsXYZW < PositionNDC.z)
    {
        vec2 DepthOffset = vec2(2.0, 2.0);
        float DepthOffsetX = 2.0;
        
        if (Depths.x < Depths.y)
        {
            DepthOffsetX = -2.0;
        }
        if (Depths.z < Depths.w)
        {
            DepthOffset.x = -2.0;
        }
        if (DepthsXY < DepthsZW)
        {
            DepthOffset.y = -2.0 ;
            DepthOffset.x = DepthOffsetX;
        }
        VelocityOffset = DepthOffset * UniParam_PostProcess_InvTargetSizeAndTextureSize.xy;
        //PositionNDC.z = DepthsXYZW;
    }

    // vec4 ThisClip = vec4( PositionNDC, 1.0 );
    // vec4 PrevClip = UniParam_PostProcess_ClipToPreClip * ThisClip;
    // vec2 PrevScreen = PrevClip.xy / PrevClip.w;
    // vec2 VelocityNDC = PositionNDC.xy - PrevScreen;
    // vec2 VelocityInTexture = texture(UniParam_PostProcess_VelocityTexture, VSOutTexcoord + VelocityOffset).xy;
    // bool DynamicN = abs(VelocityInTexture.x) > 0.0 || abs(VelocityInTexture.y) > 0.0;
    // if (DynamicN)
    // {
    //     VelocityNDC = VelocityInTexture;
    // }

    vec2 VelocityNDC = texture(UniParam_PostProcess_VelocityTexture, VSOutTexcoord + VelocityOffset).xy;
    //VelocityNDC = vec2(0.0);
    vec2 HistoryPositionNDC = PositionNDC.xy - VelocityNDC;

    // Detect if HistoryPositionNDC would be outside of the viewport.
    bool OffScreen = max(abs(HistoryPositionNDC.x), abs(HistoryPositionNDC.y)) >= 1.0;

    // CacheNeighbor Pixel Color.
    vec4 CachedNeighbors[9];
    CacheNeighborPixelColor(CachedNeighbors);

    // Filter Current Pixel.
    vec4 FilteredColorCurrent;
    FilteredColorCurrent = FiltCurrentFrame(CachedNeighbors);

    // SampleHistory.
    vec4 HistoryColor = SampleHistory(HistoryPositionNDC);
    HistoryColor.a = 0.0;
        
    //bool Dynamic1 = abs(textureOffset(UniParam_PostProcess_VelocityTexture, VSOutTexcoord, ivec2( 0, -1)).x) > 0.0;
    //bool Dynamic3 = abs(textureOffset(UniParam_PostProcess_VelocityTexture, VSOutTexcoord, ivec2(-1,  0)).x) > 0.0;
    //bool Dynamic4 = abs(textureOffset(UniParam_PostProcess_VelocityTexture, VSOutTexcoord, ivec2( 0,  0)).x) > 0.0;
    //bool Dynamic5 = abs(textureOffset(UniParam_PostProcess_VelocityTexture, VSOutTexcoord, ivec2( 1,  0)).x) > 0.0;
    //bool Dynamic7 = abs(textureOffset(UniParam_PostProcess_VelocityTexture, VSOutTexcoord, ivec2( 0,  1)).x) > 0.0;
    //bool Dynamic = Dynamic1 || Dynamic3 || Dynamic4 || Dynamic5 || Dynamic7;
    bool IgnoreHistory = OffScreen;// || !Dynamic && HistoryColor.a > 0.0;
    
    vec4 NeighborMin;
    vec4 NeighborMax;
    ComputeNeighborhoodBoundingbox(CachedNeighbors, NeighborMin, NeighborMax);
    HistoryColor = clamp(HistoryColor, NeighborMin, NeighborMax);

    if (IgnoreHistory)
    {
        HistoryColor = FilteredColorCurrent;
    }

    // Compute mix weight.
    float LumaFiltered = FilteredColorCurrent.x;
    float LumaHistory = HistoryColor.x;
    
    vec2 BackTemp = VelocityNDC * UniParam_PostProcess_PosScaleBias.xy;
    float Velocity = sqrt(dot(BackTemp, BackTemp));
    float BlendFinal = mix(CurrentFrameWeight, 0.2, clamp(Velocity / 40.0, 0.0, 1.0));
    BlendFinal = max(BlendFinal, clamp(0.01 * LumaHistory / abs(LumaFiltered - LumaHistory), 0.0, 1.0));

    float FilteredColorWeight = 1.0 / (FilteredColorCurrent.x + 4.0);
    float HistoryColorWeight = 1.0 / (HistoryColor.x + 4.0);
    
    vec2 Weights = WeightedLerpFactors(HistoryColorWeight, FilteredColorWeight, BlendFinal);
    //Weights = vec2(1.0 - CurrentFrameWeight, CurrentFrameWeight);
    vec4 ColorOut = HistoryColor * Weights.x + FilteredColorCurrent * Weights.y;

    ColorOut.rgb = YCoCgToRGB(ColorOut.rgb);
    ColorOut.a = 1.0;
    PSOutColor = ColorOut;
}
