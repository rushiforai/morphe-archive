////uniform float MaterialParam_ChestNormalIntensity;
////uniform float MaterialParam_ChestMicroNormalIntensity;
//uniform float MaterialParam_MicroNormalIntensity;
//uniform float MaterialParam_MicroNormalTiling;
//uniform float MaterialParam_NormalIntensity;
//uniform float MaterialParam_FresnelRoughness;
//uniform float MaterialParam_FresnelRoughnessExponent;
//uniform float MaterialParam_MinRoughness;
//uniform float MaterialParam_MaxRoughness;
//uniform float MaterialParam_GlobalRoughness;
//uniform float MaterialParam_CavityMapPower;
//uniform float MaterialParam_AOPower;
//uniform float MaterialParam_Specular;

uniform vec4 MaterialParam_TintColor;
uniform vec4 MaterialParam_ParamGroup_0; // NormalIntensity, MicroNormalIntensity, MicroNormalTiling, CavityMapPower
uniform vec4 MaterialParam_ParamGroup_1; // GlobalRoughness, MinRoughness, MaxRoughness, Specular
uniform vec4 MaterialParam_ParamGroup_2; // FresnelRoughness, FresnelRoughnessExponent, AOPower

uniform sampler2D MaterialParam_ColorMainTexture;
uniform sampler2D MaterialParam_NormalMainTexture;
uniform sampler2D MaterialParam_NormalMicroTexture;
uniform sampler2D MaterialParam_RoughnessCavityAOTexture;


// Local functions.
vec3 LocalFunc_sRGBToLinear(vec3 sRGB)
{
    return (sRGB.r < 0.04045 && sRGB.g < 0.04045 && sRGB.b < 0.04045)? sRGB.rgb / 12.92 : pow((sRGB.rgb + 0.055)/1.055, vec3(2.4));
}

vec3 LocalFunc_UnpackNormalMap(sampler2D normalTex, in vec2 texcoord)
{
    vec3 bump = texture(normalTex, texcoord.xy).rgb;
    bump.xy = -1.0 + 2.0 * bump.xy;
    //bump.y = -bump.y;
    bump.z = sqrt(clamp(1.0 - dot(bump.xy, bump.xy), 0.0, 1.0));  
    return bump;
    //return vec3(bump.xy, 1.0);
}

float LocalFunc_PositiveClampedPow(float X, float Y)
{
    return pow(max(X, 0.0), Y);
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
    vec3 Local25 = LocalFunc_sRGBToLinear(texture(MaterialParam_ColorMainTexture,PixelParameters.TexCoord0.xy).rgb);
    vec3 Local27 = Local25.rgb * MaterialParam_TintColor.rgb;

    return Local27;
}

float UserFunc_GetMetallic(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return 0.0;
}

float UserFunc_GetSpecular(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    float Local29 = texture(MaterialParam_RoughnessCavityAOTexture,PixelParameters.TexCoord0.xy).g;
    float Local31 = LocalFunc_PositiveClampedPow(Local29,MaterialParam_ParamGroup_0.w);
    float Local32 = (Local31 * MaterialParam_ParamGroup_1.w);
    float Local33 = clamp(Local32, 0.0, 1.0);

    return Local33;
}

float UserFunc_GetRoughness(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    float Local38 = texture(MaterialParam_RoughnessCavityAOTexture,PixelParameters.TexCoord0.xy).r;
    float Local40 = mix(MaterialParam_ParamGroup_1.y,MaterialParam_ParamGroup_1.z,Local38);
    float Local41 = Local40;
    float Local42 = ((MaterialParam_ParamGroup_1.x * 0.4 + 0.8) * Local41);
    float Local43 = (MaterialParam_ParamGroup_2.x * Local42);
    float Local44 = dot(PixelParameters.WorldNormal, PixelParameters.CameraVector);
    float Local45 = max(0.00000000,Local44);
    float Local46 = (1.00000000 - Local45);
    float Local47 = abs(Local46);
    float Local48 = max(Local47,0.00010000);
    float Local49 = LocalFunc_PositiveClampedPow(Local48,MaterialParam_ParamGroup_2.y);
    float Local50 = (Local49 * (1.00000000 - 0.00000000));
    float Local51 = (Local50 + 0.00000000);
    float Local52 = mix(Local42,Local43,Local51);

    return Local52;
}

vec3 UserFunc_GetNormal(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    vec3 Local1 = LocalFunc_UnpackNormalMap(MaterialParam_NormalMainTexture,PixelParameters.TexCoord0.xy);
    //float Local3 = (PixelParameters.TexCoord0.xy.g - 0.00000000);
    //float Local4 = abs(Local3);
    //float Local5 = (Local4 * (1.00000000 / max(0.00001000,0.98500001)));
    //float Local6 = (1.00000000 - Local5);
    //float Local7 = (Local6 * (1.00000000 / max((1.00000000 - 0.89999998),0.00001000)));
    //float Local8 = min(max(Local7,0.00000000),1.00000000);
    //vec3 Local9 = mix(vec3(MaterialParam_ChestNormalIntensity, MaterialParam_ChestNormalIntensity, 1.0),vec3(MaterialParam_NormalIntensity, MaterialParam_NormalIntensity, 1.0),float(Local8));
    //vec3 Local10 = (Local1.rgb * Local9);
    vec3 Local10 = Local1 * vec3(MaterialParam_ParamGroup_0.x, MaterialParam_ParamGroup_0.x, 1.0);
    float Local11 = (Local10.b + 1.00000000);
    vec2 Local12 = (PixelParameters.TexCoord0.xy * MaterialParam_ParamGroup_0.z);
    vec3 Local14 = LocalFunc_UnpackNormalMap(MaterialParam_NormalMicroTexture,Local12);
    //vec3 Local16 = mix(vec3(MaterialParam_ChestMicroNormalIntensity, MaterialParam_ChestMicroNormalIntensity, 1.0),vec3(MaterialParam_MicroNormalIntensity, MaterialParam_MicroNormalIntensity, 1.0),float(Local8));
    //vec3 Local17 = (Local14.rgb * Local16);
    vec3 Local17 = Local14 * vec3(MaterialParam_ParamGroup_0.y, MaterialParam_ParamGroup_0.y, 1.0);
    vec2 Local18 = (Local17.rg * -1.00000000);
    float Local19 = dot(vec3(Local10.rg,Local11), vec3(Local18,Local17.b));
    vec3 Local20 = (vec3(Local10.rg,Local11) * Local19);
    vec3 Local21 = (Local11 * vec3(Local18,Local17.b));
    vec3 Local22 = (Local20 - Local21);

    return Local22;
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
    return pow(texture(MaterialParam_RoughnessCavityAOTexture,PixelParameters.TexCoord0.xy).b, MaterialParam_ParamGroup_2.z);
}
