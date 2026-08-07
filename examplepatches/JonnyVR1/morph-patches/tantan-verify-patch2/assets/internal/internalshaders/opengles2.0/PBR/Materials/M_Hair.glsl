uniform sampler2D MaterialParam_DepthTexture;
uniform sampler2D MaterialParam_CoverageTexture;
uniform sampler2D MaterialParam_TangentTexture;
uniform sampler2D MaterialParam_AttributeTexture;
uniform sampler2D MaterialParam_TilingNoiseTexture;
uniform sampler2D MaterialParam_Good64x64TilingNoiseHighFreqTexture;
uniform sampler2D MaterialParam_PaintMaskTexture;

uniform vec4 MaterialParam_HairDye;
uniform vec4 MaterialParam_PaintColor;

uniform vec4 MaterialParam_ParamGoup_0; // Desat, HairMelanin, HairRedness, HairRoughness
uniform vec4 MaterialParam_ParamGoup_1; // MelaninVariationFine, MelaninVariationRough, RedVariation, RoughnessVariation
uniform vec4 MaterialParam_ParamGoup_2; // OpacityFar, OpacityNear, OpacityPowFar, OpacityPowNear
uniform vec4 MaterialParam_ParamGoup_3; // Spec0, Spec1, SpecEdge, SpecFront
uniform vec4 MaterialParam_ParamGoup_4; // WhiteAmount, WhiteMelaninVariation, WhiteMelaninHigh, WhiteMelaninLow
uniform vec4 MaterialParam_ParamGoup_5; // PixelDepthOffset, Scraggle, Scatter, OpacityClipValue

//uniform float MaterialParam_Desat;
//uniform float MaterialParam_HairMelanin;
//uniform float MaterialParam_HairRedness;
//uniform float MaterialParam_HairRoughness;

//uniform float MaterialParam_MelaninVariationFine;
//uniform float MaterialParam_MelaninVariationRough;
//uniform float MaterialParam_RedVariation;
//uniform float MaterialParam_RoughnessVariation;

//uniform float MaterialParam_OpacityFar;
//uniform float MaterialParam_OpacityNear;
//uniform float MaterialParam_OpacityPowFar;
//uniform float MaterialParam_OpacityPowNear;

//uniform float MaterialParam_Spec0;
//uniform float MaterialParam_Spec1;
//uniform float MaterialParam_SpecEdge;
//uniform float MaterialParam_SpecFront;

//uniform float MaterialParam_WhiteAmount;
//uniform float MaterialParam_WhiteMelaninVariation;
//uniform float MaterialParam_WhiteMelaninHigh;
//uniform float MaterialParam_WhiteMelaninLow;

//uniform float MaterialParam_PixelDepthOffset;
//uniform float MaterialParam_Scraggle;
//uniform float MaterialParam_Scatter;
//uniform float MaterialParam_OpacityClipValue;


// Local functions.
vec3 LocalFunc_sRGBToLinear(vec3 sRGB)
{
    return (sRGB.r < 0.04045 && sRGB.g < 0.04045 && sRGB.b < 0.04045)? sRGB.rgb / 12.92 : pow((sRGB.rgb + 0.055)/1.055, vec3(2.4));
}

vec4 LocalFunc_TextureLookUp(sampler2D tex, vec2 uv, bool sRGB)
{
	vec4 res = texture(tex, uv);
	if (sRGB)
	{
		res.rgb = LocalFunc_sRGBToLinear(res.rgb);
	}
	return res;
}

vec3 LocalFunc_UnpackNormalMap(sampler2D normalTex, in vec2 texcoord)
{
    vec3 bump = texture(normalTex, texcoord.xy).rgb;
    bump.xy = -1.0 + 2.0 * bump.xy;
    bump.y = -bump.y;
    bump.z = sqrt(clamp(1.0 - dot(bump.xy, bump.xy), 0.0, 1.0));  
    return bump;
}

float LocalFunc_PositiveClampedPow(float X, float Y)
{
    return pow(max(X, 0.0), Y);
}

float LocalFunc_WorldUnitsInPixel(float WorldUnits, float Depth)
{
    vec2 Local67 = InternalFunc_GetCotanHalfFieldOfView();
    vec2 Local68 = UniParam_RTSizeAndInvSize.xy;
    vec2 Local69 = (Local67 * Local68);
    float Local70 = (Local69.r * 0.50000000);
    float Local71 = (Local70 / Depth);
    float Local72 = (WorldUnits * Local71);
    return Local72;
}

float LocalFunc_DitherTemporalAA(vec2 ScreenPosition, float AlphaThreshold, float Random)
{
    vec2 Local0 = ScreenPosition;
    float Local1 = UniParam_TemporalAAParams.x;
    vec2 Local2 = (Local0 + vec2(Local1,Local1));
    float Local3 = mod( float(uint(Local2.x) + 2u * uint(Local2.y)) , 5.0 );
    vec2 Local4 = (Local0 / vec2(64.00000000,64.00000000));
    vec4 Local6 = texture(MaterialParam_Good64x64TilingNoiseHighFreqTexture, Local4).rrrr;
    float Local8 = (Local6.r * Random);
    float Local9 = (Local3 + Local8);
    float Local10 = (Local9 / 6.00000000);
    float Local11 = (AlphaThreshold + Local10);
    float Local12 = (Local11 + -0.50000000);
    return Local12;
}

vec3 MaterialExpressionGetHairTangent(Stru_PixelParam Parameters)
{
	return LocalFunc_UnpackNormalMap(MaterialParam_TangentTexture, Parameters.TexCoord0.xy);
}

vec2 MaterialExpressionGetHairUV(Stru_PixelParam Parameters)
{    
    return vec2(LocalFunc_TextureLookUp(MaterialParam_AttributeTexture, Parameters.TexCoord0, false).z, 0.5f);
}

vec2 MaterialExpressionGetHairRootUV(Stru_PixelParam Parameters)
{
    return LocalFunc_TextureLookUp(MaterialParam_AttributeTexture, Parameters.TexCoord0, false).xy;
}

float MaterialExpressionGetHairSeed(Stru_PixelParam Parameters)
{
    return LocalFunc_TextureLookUp(MaterialParam_AttributeTexture, Parameters.TexCoord0, false).w;
}

float MaterialExpressionGetHairCoverage(Stru_PixelParam Parameters)
{
    //return LocalFunc_TextureLookUp(MaterialParam_CoverageTexture, Parameters.TexCoord0, false).x;
    return texture(MaterialParam_CoverageTexture, Parameters.TexCoord0.xy).x;
}

float MaterialExpressionGetHairDepth(Stru_PixelParam Parameters)
{
	float SceneDepthOffset = LocalFunc_TextureLookUp(MaterialParam_DepthTexture, Parameters.TexCoord0, false).x;
	float SceneDepth = Parameters.SVPosition.w;

	return InternalFunc_ConvertToDeviceZ(SceneDepth + SceneDepthOffset);
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

float CustomExpression0(float varA,float varMin,float varMax)
{
    return smoothstep(varMin,varMax,varA);
}

// RGB2YCbCr.
vec3 CustomExpression1(vec3 RGB)
{
    vec3 YCbCr = vec3(0.0);

    YCbCr.x = 0.299*RGB.r + 0.587*RGB.g + 0.114*RGB.b;
    YCbCr.y = (RGB.b-YCbCr.x)*0.564+0.5;
    YCbCr.z = (RGB.r-YCbCr.x)*0.713+0.5;

    return YCbCr;
}

// YCbCrAdjustments V02.
vec3 CustomExpression2(vec3 YCbCr)
{
    vec3 colorout = vec3(0.0);

    colorout.x = YCbCr.x;
    colorout.y = YCbCr.y * 0.935;
    colorout.z = YCbCr.z * 1.065;

    return clamp(colorout, 0.0, 1.0);
}

// YCbCr2RGB.
vec3 CustomExpression3(vec3 YCbCr)
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
    vec3 Normal;
    float Roughness;
    vec3 BaseColor;
    float Specular;
    float OpacityMask;
    float PixelDepthOffset;
};
// NOTE!! TangentNormal, WorldNormal and ReflectionVector in PixelParameters are invalid.
void UserFunc_GetSharedVariables(Stru_PixelParam PixelParameters, inout Stru_SharedVariables SharedVariables)
{
    vec3 Local0 = MaterialExpressionGetHairTangent(PixelParameters);
    vec2 Local1 = MaterialExpressionGetHairUV(PixelParameters);
    float Local2 = MaterialExpressionGetHairSeed(PixelParameters);
    //Local2 = 0.0;
    float Local3 = (Local1.r + Local2);
    vec4 Local5 = LocalFunc_TextureLookUp(MaterialParam_TilingNoiseTexture, vec2(Local3,0.00000000), false).rrrr;
    vec3 Local7 = (vec3(vec2(Local5.r,0.00000000),Local5.b) - vec3(0.50000000,0.50000000,0.00000000));
    vec3 Local8 = (Local7 * MaterialParam_ParamGoup_5.y);
    vec3 Local9 = (Local0.rgb + Local8);

    //-----------------------------------------
	// Make normal and reflection vector valid.
	SharedVariables.Normal = Local9;
	PixelParameters.TangentNormal = Local9;
	PixelParameters.WorldNormal = normalize(InternalFunc_TransformTangentVectorToWorld(PixelParameters.TangentToWorld, PixelParameters.TangentNormal));
	PixelParameters.WorldNormal *= PixelParameters.TwoSidedSign;
	PixelParameters.ReflectionVector = InternalFunc_Material_ReflectionAboutCustomWorldNormal(PixelParameters, PixelParameters.WorldNormal, false);
	//-----------------------------------------

    vec4 Local11 = vec4(0.0, 1.0, 0.0, 1.0);
    // Remap melanin.
    float Local12 = mix(Local11.r,Local11.g,MaterialParam_ParamGoup_0.y);
    // Begin of melanin variation.
    float Local13 = mix(MaterialParam_ParamGoup_1.x, MaterialParam_ParamGoup_1.y, clamp(2.0 * MaterialParam_ParamGoup_0.w, 0.0, 1.0));
    float Local14 = (Local13 + 1.00000000);
    float Local15 = LocalFunc_PositiveClampedPow(Local12,Local14);
    float Local16 = (Local2 * 2.00000000);
    float Local17 = min(max(Local16,0.00000000),1.00000000);
    float Local18 = mix(Local15,Local12,Local17);
    float Local19 = (1.00000000 / Local14);
    float Local20 = LocalFunc_PositiveClampedPow(Local12,Local19);
    float Local21 = (Local16 - 1.00000000);
    float Local22 = min(max(Local21,0.00000000),1.00000000);
    float Local23 = mix(Local18,Local20,Local22);
    // End of melanin variation.

    float Local24 = LocalFunc_PositiveClampedPow(Local23,2.20000005);

    // Begin of white hair.
    float Local25 = mix(MaterialParam_ParamGoup_4.z,MaterialParam_ParamGoup_4.w,MaterialParam_ParamGoup_0.y);
    float Local26 = LocalFunc_PositiveClampedPow(Local25, (MaterialParam_ParamGoup_4.y + 1.0));
    float Local27 = mix(Local26,Local25,Local17);
    float Local28 = LocalFunc_PositiveClampedPow(Local25, 1.0 / (MaterialParam_ParamGoup_4.y + 1.0));
    float Local29 = mix(Local27,Local28,Local22); // White melanin.
    float Local30 = CustomExpression0(Local2, MaterialParam_ParamGoup_4.x, (MaterialParam_ParamGoup_4.x - 0.01));
    float Local31 = mix(Local24,Local29,Local30); // Mixed melanin.
    // End of white hair.

    // Remap redness.
    float Local32 = mix(Local11.b,Local11.a,MaterialParam_ParamGoup_0.z);

    // Begin of red variation.
    float Local33 = LocalFunc_PositiveClampedPow(Local32, (MaterialParam_ParamGoup_1.z + 1.0));
    float Local34 = mix(Local33,Local32,Local17);
    float Local35 = LocalFunc_PositiveClampedPow(Local32, 1.0 / (MaterialParam_ParamGoup_1.z + 1.0));
    float Local36 = mix(Local34,Local35,Local22); // Redness.
    // End of red variation.

    vec3 Local37 = MaterialExpressionGetHairColorFromMelanin(Local31, Local36, MaterialParam_HairDye.rgb);

    // Begin of MF_RedHairBoost.
    vec3 Local38 = CustomExpression1(Local37.rgb);
    vec3 Local39 = CustomExpression2(Local38);
    vec3 Local40 = CustomExpression3(Local39);
    float Local41 = LocalFunc_PositiveClampedPow(Local36,2.20000005);
    float Local42 = clamp(Local41, 0.0, 1.0);
    vec3 Local43 = mix(Local37.rgb,Local40,float(Local42));
    // End of MF_RedHairBoost.

    // Begin of paint.
    vec2 Local44 = MaterialExpressionGetHairRootUV(PixelParameters);
    float Local45 = (1.00000000 - Local44.rg.g);
    vec4 Local47 = LocalFunc_TextureLookUp(MaterialParam_PaintMaskTexture, vec2(Local44.rg.r,Local45), false);
    vec3 Local49 = mix(Local43,MaterialParam_PaintColor.rgb,float(Local47.r));
    // End of paint.

    float Local50 = dot(Local49, vec3(0.30000001,0.58999997,0.11000000));
    float Local51 = mix(MaterialParam_ParamGoup_0.x,0.89999998,Local30);
    vec3 Local52 = mix(Local49,vec3(Local50,Local50,Local50),float(Local51)); // BaseColor.

    float Local53 = mix(MaterialParam_ParamGoup_3.y,MaterialParam_ParamGoup_3.x,Local2);
    float Local54 = (Local1.g - 0.50000000);
    float Local55 = abs(Local54);
    float Local56 = (Local55 * (1.00000000 / max(0.00001000,1.50000000)));
    float Local57 = (1.00000000 - Local56);
    float Local58 = (Local57 * (1.00000000 / max((1.00000000 - 0.00000000),0.00001000)));
    float Local59 = min(max(Local58,0.00000000),1.00000000);
    float Local60 = mix(MaterialParam_ParamGoup_3.z,MaterialParam_ParamGoup_3.w,Local59);
    float Local61 = (Local53 * Local60); // Specular.

    float Local62 = LocalFunc_PositiveClampedPow(MaterialParam_ParamGoup_0.w, (MaterialParam_ParamGoup_1.w + 1.0));
    float Local63 = mix(Local62,MaterialParam_ParamGoup_0.w,Local17);
    float Local64 = LocalFunc_PositiveClampedPow(MaterialParam_ParamGoup_0.w, 1.0 / (MaterialParam_ParamGoup_1.w + 1.0));
    float Local65 = mix(Local63,Local64,Local22); // Roughness.

    float Local66 = MaterialExpressionGetHairCoverage(PixelParameters);
    float Local72 = LocalFunc_WorldUnitsInPixel(1.0, PixelParameters.SVPosition.w);
    float Local73 = min(max(Local72,0.00000000),1.00000000);
    float Local74 = mix(MaterialParam_ParamGoup_2.x,MaterialParam_ParamGoup_2.y,Local73);
    float Local75 = (Local66 * Local74);
    float Local76 = mix(MaterialParam_ParamGoup_2.z,MaterialParam_ParamGoup_2.w,Local73);
    float Local77 = LocalFunc_PositiveClampedPow(Local75,Local76);
    vec2 ScreenPosition = ((PixelParameters.SVPosition.xy / PixelParameters.SVPosition.w) * 0.5 + vec2(0.5)) * UniParam_RTSizeAndInvSize.xy;
    float Local78 = LocalFunc_DitherTemporalAA(ScreenPosition, Local77, 1.0);
    float Local79 = InternalFunc_GetShadowReplaceState() ? Local66 : Local78; // OpacityMask.

    // float Local91 = MaterialExpressionGetHairDepth(Parameters);
    // float Local92 = (0.00000000 + Local10);
    // float Local93 = (Local92 + -0.50000000);
    // float Local94 = (Local91.r * Local93);
    // float Local95 = (Local94 * MaterialParam_ParamGoup_5.x); // PixelDepthOffset.

    SharedVariables.OpacityMask = Local79;
    SharedVariables.BaseColor = Local52;
    SharedVariables.Specular = Local61;
    SharedVariables.Roughness = Local65;
    SharedVariables.PixelDepthOffset = 0.0;//Local95;
}

vec3 UserFunc_GetBaseColor(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    return SharedVariables.BaseColor;
}

float UserFunc_GetMetallic(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return MaterialParam_ParamGoup_5.z;
}

float UserFunc_GetSpecular(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    return SharedVariables.Specular;
}

float UserFunc_GetRoughness(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    return SharedVariables.Roughness;
}

vec3 UserFunc_GetNormal(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    return SharedVariables.Normal;
}

vec3 UserFunc_GetEmissive(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return vec3(0.0, 0.0, 0.0);
}

float UserFunc_GetOpacity(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    return 1.0;
}

float UserFunc_GetOpacityMask(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return SharedVariables.OpacityMask;
}

float UserFunc_GetOpacityClip()
{
	return MaterialParam_ParamGoup_5.w;
}

float UserFunc_GetAmbientOcclusion(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return 1.0;
}
