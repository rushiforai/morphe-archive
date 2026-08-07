uniform sampler2D MaterialParam_ColorMainTexture;
uniform sampler2D MaterialParam_NormalMainTexture;
uniform sampler2D MaterialParam_MRSTexture;
uniform sampler2D MaterialParam_AOTexture;
//uniform sampler2D MaterialParam_EmissiveMaskTexture;
//uniform float MaterialParam_SCurve;
//uniform float MaterialParam_Contrast;
//uniform float MaterialParam_Saturation;
uniform vec4 MaterialParam_TintColor;
uniform float MaterialParam_NormalFlatness;
uniform float MaterialParam_MetallicOffset;
uniform float MaterialParam_SpecularOffset;
uniform float MaterialParam_RoughnessOffset;
uniform float MaterialParam_AOPower;
uniform float MaterialParam_OpacityPower;
//uniform float MaterialParam_EmissiveIntensity;
//uniform vec4 MaterialParam_EmissiveColor;


vec3 LocalFunc_UnpackNormalMap(sampler2D normalTex, in vec2 texcoord)
{
    vec3 bump = texture(normalTex, texcoord).rgb;
    bump.xy = -1.0 + 2.0 * bump.xy;
    //bump.y = -bump.y;
    bump.z = sqrt(clamp(1.0 - dot(bump.xy, bump.xy), 0.0, 1.0));  
    return bump;
}

vec3 LocalFunc_sRGBToLiner(vec3 sRGB)
{
	return (sRGB.r < 0.04045 && sRGB.g < 0.04045 && sRGB.b < 0.04045) ? sRGB.rgb / 12.92 : pow((sRGB.rgb + 0.055) / 1.055, vec3(2.4)) ;
}

vec4 LocalFunc_TextureLookUp(sampler2D tex, vec2 uv, bool sRGB)
{
	vec4 res = texture(tex, uv);
	if (sRGB)
	{
		res.rgb = LocalFunc_sRGBToLiner(res.rgb);
	}
	return res;
}

float LocalFunc_PositiveClampedPow(float X, float Y)
{
    return pow(max(X, 0.0), Y);
}

vec3 LocalFunc_PositiveClampedPow(vec3 X, float Y)
{
    return pow(max(X, vec3(0.0)), vec3(Y));
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
	vec4 Local21 = LocalFunc_TextureLookUp(MaterialParam_ColorMainTexture, PixelParameters.TexCoord0.xy, true);
//    vec3 Local23 = (2.00000000 * Local21.rgb);
//    vec3 Local24 = min(max(Local23,vec3(0.00000000,0.00000000,0.00000000)),vec3(1.00000000,1.00000000,1.00000000));
//    vec3 Local25 = LocalFunc_PositiveClampedPow(Local24,MaterialParam_SCurve);
//    vec3 Local26 = (Local25 * 0.50000000);
//    vec3 Local27 = (Local21.rgb + -0.50000000);
//    vec3 Local28 = (Local27 * 2.00000000);
//    vec3 Local29 = min(max(Local28,vec3(0.00000000,0.00000000,0.00000000)),vec3(1.00000000,1.00000000,1.00000000));
//    vec3 Local30 = (1.00000000 - Local29);
//    vec3 Local31 = LocalFunc_PositiveClampedPow(Local30,MaterialParam_SCurve);
//    vec3 Local32 = (1.00000000 - Local31);
//    vec3 Local33 = (Local32 * 0.50000000);
//    vec3 Local34 = (0.50000000 + Local33);
//    vec3 Local35 = (Local32 * 500.00000000);
//    vec3 Local36 = min(max(Local35,vec3(0.00000000,0.00000000,0.00000000)),vec3(1.00000000,1.00000000,1.00000000));
//    vec3 Local37 = mix(Local26,Local34,Local36);
//    vec3 Local38 = mix(vec3(-MaterialParam_Contrast), vec3(MaterialParam_Contrast + 1.0), Local37);
//    vec3 Local39 = min(max(Local38,vec3(0.00000000,0.00000000,0.00000000)),vec3(1.00000000,1.00000000,1.00000000));
//    float Local40 = dot(Local39, vec3(0.30000001,0.58999997,0.11000000));
//    vec3 Local41 = mix(Local39,vec3(Local40,Local40,Local40),MaterialParam_Saturation);
//    vec3 Local42 = (Local41 * MaterialParam_TintColor.rgb);
    vec3 Local42 = (Local21.rgb * MaterialParam_TintColor.rgb);
	return Local42;
}

float UserFunc_GetMetallic(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	float Local0 = LocalFunc_TextureLookUp(MaterialParam_MRSTexture, PixelParameters.TexCoord0.xy, false).r;
    float Local1 = (MaterialParam_MetallicOffset + Local0);
	return Local1;
}

float UserFunc_GetSpecular(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	float Local0 = LocalFunc_TextureLookUp(MaterialParam_MRSTexture, PixelParameters.TexCoord0.xy, false).b;
    float Local1 = (MaterialParam_SpecularOffset + Local0);
	return Local1;
}

float UserFunc_GetRoughness(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	float Local0 = LocalFunc_TextureLookUp(MaterialParam_MRSTexture, PixelParameters.TexCoord0.xy, false).g;
    float Local1 = (MaterialParam_RoughnessOffset + Local0);
	return Local1;
}

vec3 UserFunc_GetNormal(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    vec3 Local2 = LocalFunc_UnpackNormalMap(MaterialParam_NormalMainTexture, PixelParameters.TexCoord0.xy);
    vec3 Local4 = mix(Local2.rgb,vec3(0.00000000,0.00000000,1.00000000),MaterialParam_NormalFlatness);
	return Local4;
}

vec3 UserFunc_GetEmissive(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    //float Local0 = LocalFunc_TextureLookUp(MaterialParam_EmissiveMaskTexture, PixelParameters.TexCoord0.xy, false).r;
    //vec3 Local1 = (MaterialParam_EmissiveColor.rgb * Local0 * MaterialParam_EmissiveIntensity);
	//return Local1;
	return vec3(0.0);
}

float UserFunc_GetOpacity(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	float Opacity = LocalFunc_TextureLookUp(MaterialParam_ColorMainTexture, PixelParameters.TexCoord0.xy, false).a;
    return pow(Opacity, MaterialParam_OpacityPower);
}

float UserFunc_GetOpacityMask(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return LocalFunc_TextureLookUp(MaterialParam_ColorMainTexture, PixelParameters.TexCoord0.xy, false).a;
}

float UserFunc_GetOpacityClip()
{
	return 0.333;
}

float UserFunc_GetAmbientOcclusion(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return pow(texture(MaterialParam_AOTexture,PixelParameters.TexCoord0.xy).r, MaterialParam_AOPower);
}