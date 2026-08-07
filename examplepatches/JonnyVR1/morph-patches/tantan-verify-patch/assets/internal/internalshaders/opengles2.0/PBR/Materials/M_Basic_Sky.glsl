uniform samplerCube MaterialParam_SkyCubeTexture;
uniform float MaterialParam_SkyRotation;

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
    mat3 RotateMatrix;
    float CosineValue = cos(MaterialParam_SkyRotation);
    float SineValue = sin(MaterialParam_SkyRotation);
    RotateMatrix[0] = vec3(CosineValue, 0.0, -SineValue);
    RotateMatrix[1] = vec3(0.0, 1.0, 0.0);
    RotateMatrix[2] = vec3(SineValue, 0.0, CosineValue);
	return texture(MaterialParam_SkyCubeTexture, RotateMatrix * (-PixelParameters.CameraVector)).rgb;
    //return LocalFunc_sRGBToLinear(texture(MaterialParam_SkyCubeTexture, RotateMatrix * (-PixelParameters.CameraVector)).rgb);
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
