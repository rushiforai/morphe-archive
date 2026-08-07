#include "PostProcessCommon.glsl"

in vec2 VSOutTexcoord;
in vec4 VSOutPosition;
in vec2 VSOutFullViewUV;
//in vec3 ExposureScaleVignette;

out vec4 PSOutColor;

uniform sampler2D UniParam_ToneMapping_LUTTexture;
uniform sampler2D UniParam_ToneMapping_InputTexture;
#if USE_BLOOM
uniform sampler2D UniParam_ToneMapping_BloomTexture;
#endif
//uniform vec2 UniParam_ToneMapping_GrainRandomFull;

const float LUTSize = 32.0;
const vec2 TonemapperParams = vec2(0.4, 0.11);

// float GetGrain()
// {
// 	vec2 GrainUV = mix(UniParam_ToneMapping_GrainRandomFull, 1.0 + UniParam_ToneMapping_GrainRandomFull, VSOutTexcoord);
// 	return InternalFunc_Frac(sin(GrainUV.x + GrainUV.y * 543.31) * 493013.0);	
// }

float max4(vec4 x)
{
	return max(max(x.r, x.g), max(x.b, x.a));
}

float ComputeVignetteMask(vec2 VignetteCircleSpacePos, float Intensity)
{
	VignetteCircleSpacePos *= Intensity;
	float Tan2Angle = dot( VignetteCircleSpacePos, VignetteCircleSpacePos );
	float Cos4Angle = pow(InternalFunc_Rcp( Tan2Angle + 1.0) ,2.0);
	return Cos4Angle;
}

vec3 LogToLin(vec3 LogColor)
{
	const float LinearRange = 14.0;
	const float LinearGrey = 0.18;
	const float ExposureGrey = 444.0;
	vec3 LinearColor = exp2((LogColor - ExposureGrey / 1023.0) * LinearRange) * LinearGrey;
	return LinearColor;
}

vec3 LinToLog(vec3 LinearColor)
{
	const float LinearRange = 14.0;
	const float LinearGrey = 0.18;
	const float ExposureGrey = 444.0;
	vec3 LogColor = log2(LinearColor) / LinearRange - log2(LinearGrey) / LinearRange + ExposureGrey / 1023.0;
	LogColor = clamp(LogColor, 0.0, 1.0);
	return LogColor;
}

vec3  ColorLookupTable(vec3 LinearColor)
{
	vec3 LUTEncodedColor;
	LUTEncodedColor = LinToLog(LinearColor + LogToLin(vec3(0.0)));
	//LUTEncodedColor = LinearColor;
	vec3 UVW = LUTEncodedColor * ((LUTSize - 1.0) / LUTSize) + (0.5f / LUTSize);
	vec3  OutDeviceColor = UnwrappedTexture3DSamplePoint(UniParam_ToneMapping_LUTTexture, vec3(UVW), LUTSize).rgb;
	return OutDeviceColor * 1.05;
}

void main()
{
    vec4 SceneColor = texture(UniParam_ToneMapping_InputTexture, VSOutTexcoord);
	vec4 ccc = SceneColor;

#if !TONE_MAPPING

#if USE_BLOOM
	vec3 BloomColor = texture(UniParam_ToneMapping_BloomTexture, VSOutFullViewUV).rgb;
	SceneColor.rgb += BloomColor;
#endif

#if !NO_GAMMA
    PSOutColor.rgb = pow(SceneColor.rgb, vec3(0.45454545));
	PSOutColor.a = SceneColor.a;
#else
	PSOutColor = SceneColor;
#endif
    
#else // TONE_MAPPING

    const float OneOverPreExposure = 1.0f;
	
	//float Grain = GetGrain();
	float ExposureScale = 1.0;
	
	float SharpenMultiplierDiv6 = TonemapperParams.y;
	
	vec3 C1 = textureOffset(UniParam_ToneMapping_InputTexture, VSOutTexcoord, ivec2(-1,  0)).rgb;
	vec3 C2 = textureOffset(UniParam_ToneMapping_InputTexture, VSOutTexcoord, ivec2( 1,  0)).rgb;
	vec3 C3 = textureOffset(UniParam_ToneMapping_InputTexture, VSOutTexcoord, ivec2(-1, -1)).rgb;
	vec3 C4 = textureOffset(UniParam_ToneMapping_InputTexture, VSOutTexcoord, ivec2(-1,  1)).rgb;

	float  A0 = InternalFunc_Luminance(SceneColor.rgb);
	vec4  LuminanceNeightbors =  vec4(InternalFunc_Luminance(C1), InternalFunc_Luminance(C2), InternalFunc_Luminance(C3), InternalFunc_Luminance(C4));
	
	float  HDREdge = ExposureScale * max4(abs(A0 - LuminanceNeightbors));
	float  EdgeMask = clamp(1.0f - HDREdge, 0.0, 1.0);

	float LerpFactor = -EdgeMask * SharpenMultiplierDiv6;
	vec3  DeltaColor = (C1 + C2 + C3 + C4) - SceneColor.rgb * 4.0;
	SceneColor.rgb += DeltaColor * LerpFactor;

#if USE_BLOOM
	vec3 BloomColor = texture(UniParam_ToneMapping_BloomTexture, VSOutFullViewUV).rgb;
	SceneColor.rgb += BloomColor;
#endif

	vec3  LinearColor = SceneColor.rgb;
	LinearColor *= ExposureScale;
   
    // Vignette
	//LinearColor.rgb *= ComputeVignetteMask(ExposureScaleVignette.yz, TonemapperParams.x);
	
	vec3  OutDeviceColor = ColorLookupTable(LinearColor);
	float  LuminanceForPostProcessAA = dot(OutDeviceColor,  vec3(0.299f, 0.587f, 0.114f));
	
    // Grain
    // float  GrainQuantization = 1.0/256.0;
	// float  GrainAdd = (Grain * GrainQuantization) + (-0.5 * GrainQuantization);
	// OutDeviceColor.rgb += GrainAdd;

	PSOutColor = vec4(OutDeviceColor, SceneColor.a);
	//PSOutColor = ccc;
	
	//fragmentColor = vec4(abs(vec3(Grain)), 1.0);
	//fragmentColor = texture(TextureBefore, ScreenUV);
	//PSOutColor = texture(UniParam_ToneMapping_LUTTexture, vec3(VSOutTexcoord, 0.0 / 32.0));
	//ragmentColor = vec4(ScreenUV, 1.0, 1.0);

#endif
}
