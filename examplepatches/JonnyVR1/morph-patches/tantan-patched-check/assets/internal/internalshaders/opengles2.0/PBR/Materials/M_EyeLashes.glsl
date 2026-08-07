uniform sampler2D MaterialParam_CoverageTexture;

uniform vec4 MaterialParam_HairDye;
uniform float MaterialParam_HairMelanin;
uniform float MaterialParam_HairRedness;
uniform float MaterialParam_Metallic;
uniform float MaterialParam_Roughness;
uniform float MaterialParam_Specular;
uniform float MaterialParam_Opacity;


// Local functions.
float LocalFunc_PositiveClampedPow(float X, float Y)
{
    return pow(max(X, 0.0), Y);
}

// Reference: A Practical and Controllable Hair and Fur Model for Production Path Tracing.
vec3 HairAbsorptionToColor(vec3 A, float B)
{
	float b2 = B * B;
	float b3 = B * b2;
	float b4 = b2 * b2;
	float b5 = B * b4;
	float D = (5.969f - 0.215f * B + 2.532f * b2 - 10.73f * b3 + 5.574f * b4 + 0.245f * b5);
	return exp(-sqrt(A) * D);
}

// Reference: A Practical and Controllable Hair and Fur Model for Production Path Tracing.
vec3 HairColorToAbsorption(vec3 C, float B)
{
	float b2 = B * B;
	float b3 = B * b2;
	float b4 = b2 * b2;
	float b5 = B * b4;
	float D = (5.969f - 0.215f * B + 2.532f * b2 - 10.73f * b3 + 5.574f * b4 + 0.245f * b5);
	return pow(log(C) / D, vec3(2.0));
}

vec3 MaterialExpressionGetHairColorFromMelanin(float InMelanin, float InRedness, vec3 InDyeColor)
{
    InMelanin = clamp(InMelanin, 0.0, 1.0);
	InRedness = clamp(InRedness, 0.0, 1.0);
	float Melanin = -log(max(1.0 - InMelanin, 0.0001f));
	float Eumelanin = Melanin * (1.0 - InRedness);
	float Pheomelanin = Melanin * InRedness;

	vec3 DyeAbsorption = HairColorToAbsorption(clamp(InDyeColor, 0.0, 1.0), 0.3);
	vec3 Absorption = Eumelanin * vec3(0.506f, 0.841f, 1.653f) + Pheomelanin * vec3(0.343f, 0.733f, 1.924f);

	return HairAbsorptionToColor(Absorption + DyeAbsorption, 0.3);
}

vec3 LocalFunc_RGB2YCbCr(vec3 RGB)
{
    vec3 YCbCr = vec3(0.0);

    YCbCr.x = 0.299*RGB.r + 0.587*RGB.g + 0.114*RGB.b;
    YCbCr.y = (RGB.b-YCbCr.x)*0.564+0.5;
    YCbCr.z = (RGB.r-YCbCr.x)*0.713+0.5;

    return YCbCr;
}

vec3 LocalFunc_YCbCrAdjustments(vec3 YCbCr)
{
    vec3 colorout = vec3(0.0);

    colorout.x = YCbCr.x;
    colorout.y = YCbCr.y * 0.935;
    colorout.z = YCbCr.z * 1.065;

    return clamp(colorout, 0.0, 1.0);
}

vec3 LocalFunc_YCbCr2RGB(vec3 YCbCr)
{
    vec3 RGB = vec3(0.0);

    RGB.r = YCbCr.x + 1.402*(YCbCr.z-0.5);
    RGB.g = YCbCr.x - 0.34414*(YCbCr.y-0.5) - 0.71414*(YCbCr.z-0.5);
    RGB.b = YCbCr.x + 1.772*(YCbCr.y-0.5);

    return clamp(RGB, 0.0, 1.0);
}


// Material virtual user functions.
vec3 UserFunc_GetWorldPositionOffset(Stru_VertexParam VertexParameters)
{
	return vec3(0.0, 0.0, 0.0);
}

struct Stru_SharedVariables
{
    float Unused; // NOTE!! Struct should not be empty.
};
// NOTE!! TangentNormal, WorldNormal and ReflectionVector in PixelParameters are invalid.
void UserFunc_GetSharedVariables(Stru_PixelParam PixelParameters, inout Stru_SharedVariables SharedVariables)
{

}

vec3 UserFunc_GetBaseColor(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    vec3 HairColor = MaterialExpressionGetHairColorFromMelanin(MaterialParam_HairMelanin, MaterialParam_HairRedness, MaterialParam_HairDye.rgb);

    // Begin of MF_RedHairBoost.
    vec3 Local38 = LocalFunc_RGB2YCbCr(HairColor.rgb);
    vec3 Local39 = LocalFunc_YCbCrAdjustments(Local38);
    vec3 Local40 = LocalFunc_YCbCr2RGB(Local39);
    float Local41 = LocalFunc_PositiveClampedPow(MaterialParam_HairRedness,2.20000005);
    float Local42 = clamp(Local41, 0.0, 1.0);
    vec3 Local43 = mix(HairColor.rgb,Local40,float(Local42));
    // End of MF_RedHairBoost.

    return Local43;
}

float UserFunc_GetMetallic(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return MaterialParam_Metallic;
}

float UserFunc_GetSpecular(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    return MaterialParam_Specular;
}

float UserFunc_GetRoughness(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    return MaterialParam_Roughness;
}

vec3 UserFunc_GetNormal(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    return vec3(0.0, 0.0, 1.0);
}

vec3 UserFunc_GetEmissive(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return vec3(0.0, 0.0, 0.0);
}

float UserFunc_GetOpacity(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    float Opacity = texture(MaterialParam_CoverageTexture, PixelParameters.TexCoord0.xy).a;
    Opacity *= MaterialParam_Opacity;
    return Opacity;
}

float UserFunc_GetOpacityMask(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return 1.0;
}

float UserFunc_GetOpacityClip()
{
	return 0.333;
}

float UserFunc_GetAmbientOcclusion(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return 1.0;
}