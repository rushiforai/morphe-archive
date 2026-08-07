uniform float MaterialParam_Metallic;
uniform float MaterialParam_Specular;
uniform float MaterialParam_Roughness;
uniform sampler2D MaterialParam_DiffuseTexture;
uniform sampler2D MaterialParam_NormalTexture;

vec3 LocalFunc_sRGBToLinear(vec3 sRGB)
{
    return (sRGB.r < 0.04045 && sRGB.g < 0.04045 && sRGB.b < 0.04045)? sRGB.rgb / 12.92 : pow((sRGB.rgb + 0.055)/1.055, vec3(2.4));
}

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
	vec3 DiffuseColor = texture(MaterialParam_DiffuseTexture, PixelParameters.TexCoord0).xyz;
	DiffuseColor = LocalFunc_sRGBToLinear(DiffuseColor);
	return DiffuseColor;
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
	vec3 Normal = 2.0 * texture(MaterialParam_NormalTexture, PixelParameters.TexCoord0).xyz - 1.0;
	Normal = normalize(Normal);
	return Normal;
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