uniform float MaterialParam_EmissiveMultiplier;
uniform sampler2D MaterialParam_DiffuseTexture;

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
	return vec3(0.0, 0.0, 0.0);
}

float UserFunc_GetMetallic(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return 0.0;
}

float UserFunc_GetSpecular(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return 0.0;
}

float UserFunc_GetRoughness(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return 0.0;
}

vec3 UserFunc_GetNormal(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return vec3(0.0, 0.0, 1.0);
}

vec3 UserFunc_GetEmissive(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    vec3 DiffuseColor = texture(MaterialParam_DiffuseTexture, PixelParameters.TexCoord0).xyz;
	return MaterialParam_EmissiveMultiplier * DiffuseColor;
}

float UserFunc_GetOpacity(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return texture(MaterialParam_DiffuseTexture, PixelParameters.TexCoord0).a;
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