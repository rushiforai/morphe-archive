uniform float MaterialParam_GumsColorU;
uniform float MaterialParam_GumsColorV;
uniform float MaterialParam_PlaqueColorU;
uniform float MaterialParam_PlaqueColorV;
uniform float MaterialParam_TeethColorU;
uniform float MaterialParam_TeethColorV;

uniform float MaterialParam_CameraForwardCheat;
uniform float MaterialParam_DetailAmount;
uniform float MaterialParam_DetailScale;
uniform float MaterialParam_DimReflectionsRange;
uniform float MaterialParam_NormalStrength;
uniform float MaterialParam_PlaqueAmount;
uniform float MaterialParam_Roughness;
uniform vec4 MaterialParam_TeethTint;

uniform sampler2D MaterialParam_TeethColorTexture;
uniform sampler2D MaterialParam_GumsColorPickerTexture;
uniform sampler2D MaterialParam_TeethColorPickerTexture;
uniform sampler2D MaterialParam_PlaqueColorPickerTexture;
uniform sampler2D MaterialParam_GumsDivTexture;
uniform sampler2D MaterialParam_TeethMasksTexture;
uniform sampler2D MaterialParam_TeethMouseOcclusionTexture;
uniform sampler2D MaterialParam_TeethNormalTexture;
uniform sampler2D MaterialParam_SkinNTexture;
uniform sampler2D MaterialParam_TeethGumsNormalTexture;


// Local functions.
vec3 LocalFunc_sRGBToLinear(vec3 sRGB)
{
    return (sRGB.r < 0.04045 && sRGB.g < 0.04045 && sRGB.b < 0.04045)? sRGB.rgb / 12.92 : pow((sRGB.rgb + 0.055)/1.055, vec3(2.4));
}

vec3 LocalFunc_UnpackNormalMap(sampler2D normalTex, in vec2 texcoord)
{
    vec3 bump = texture(normalTex, texcoord.xy).rgb;
    bump.xy = -1.0 + 2.0 * bump.xy;
    bump.y = -bump.y;
    bump.z = sqrt(clamp(1.0 - dot(bump.xy, bump.xy), 0.0, 1.0));  
    return bump;
}

vec3 LocalFunc_PositiveClampedPow(vec3 X, float Y)
{
    return pow(max(X, vec3(0.0)), vec3(Y));
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
    vec3 Local27 = LocalFunc_sRGBToLinear(texture(MaterialParam_TeethColorTexture,PixelParameters.TexCoord0.xy).rgb);
    vec3 Local30 = LocalFunc_sRGBToLinear(texture(MaterialParam_GumsColorPickerTexture,vec2(MaterialParam_GumsColorU,MaterialParam_GumsColorV)).rgb);
    vec3 Local33 = LocalFunc_sRGBToLinear(texture(MaterialParam_GumsDivTexture,PixelParameters.TexCoord0.xy).rgb);
    vec3 Local35 = (Local27.rgb / Local33.rgb);
    vec3 Local36 = (Local30.rgb * Local35);
    vec3 Local37 = mix(Local27.rgb,Local36,float(0.67000002));
    vec3 Local39 = LocalFunc_sRGBToLinear(texture(MaterialParam_TeethColorPickerTexture,vec2(MaterialParam_TeethColorU,MaterialParam_TeethColorV)).rgb);
    vec3 Local41 = (Local27.rgb / vec3(0.90104198,0.73331898,0.51521498));
    vec3 Local42 = (Local39.rgb * Local41);
    vec4 Local44 = texture(MaterialParam_TeethMasksTexture,PixelParameters.TexCoord0.xy);
    vec3 Local46 = mix(Local37,Local42,float(Local44.r));

    vec3 Local48 = LocalFunc_sRGBToLinear(texture(MaterialParam_PlaqueColorPickerTexture,vec2(MaterialParam_PlaqueColorU,MaterialParam_PlaqueColorV)).rgb);
    vec3 Local50 = LocalFunc_PositiveClampedPow(Local48.rgb,0.30000001);

    vec3 Local51 = (Local46 * Local50);

    // ThresholdWithRange.
    float Local52 = (Local44.g - 1.00000000);
    float Local53 = (Local52 + 1.00000000);
    float Local54 = (1.00000000 - Local53);
    float Local55 = (Local54 * MaterialParam_PlaqueAmount);
    float Local56 = (1.00000000 - Local55);
    float Local57 = min(max(Local56,0.00000000),1.00000000);

    float Local58 = (Local44.r * Local57);

    vec3 Local59 = mix(Local46,Local51,float(Local58));
    vec3 Local60 = (Local59 * MaterialParam_TeethTint.rgb);

    vec3 Local62 = LocalFunc_sRGBToLinear(texture(MaterialParam_TeethMouseOcclusionTexture,PixelParameters.TexCoord0.xy).rgb);
    vec3 Local64 = (Local60 * Local62.rgb);

    //return Local64;
    return vec3(1.0, 0.0, 0.0);
}

float UserFunc_GetMetallic(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return 0.0;
}

float UserFunc_GetSpecular(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    vec3 Local62 = LocalFunc_sRGBToLinear(texture(MaterialParam_TeethMouseOcclusionTexture,PixelParameters.TexCoord0.xy).rgb);

    float Local65 = dot(PixelParameters.WorldNormal, PixelParameters.WorldNormal);
    float Local66 = sqrt(Local65);
    vec3 Local67 = (PixelParameters.WorldNormal / Local66);
    float Local68 = dot(PixelParameters.CameraVector, Local67);
    vec3 Local69 = (Local68 * Local67);
    vec3 Local70 = (Local69 * 2.00000000);
    vec3 Local71 = (Local70 - PixelParameters.CameraVector);
    float Local72 = dot(Local71, PixelParameters.CameraVector);
    float Local73 = smoothstep(0.00000000,MaterialParam_DimReflectionsRange,Local72);
    float Local74 = (Local73 * 0.44999999);

    float Local75 = (Local62.r * Local74);

    return Local75;
}

float UserFunc_GetRoughness(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    return MaterialParam_Roughness;
}

vec3 UserFunc_GetNormal(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    // Base normal.
    vec3 Local1 = LocalFunc_UnpackNormalMap(MaterialParam_TeethNormalTexture,PixelParameters.TexCoord0.xy);
    vec3 Local3 = (Local1.rgb * vec3(MaterialParam_NormalStrength, MaterialParam_NormalStrength, 1.0));

    float Local4 = (Local3.b + 1.00000000);

    // Detail normal.
    vec2 Local5 = (PixelParameters.TexCoord0.xy * MaterialParam_DetailScale);
    vec3 Local7 = LocalFunc_UnpackNormalMap(MaterialParam_SkinNTexture,Local5);
    vec3 Local9 = mix(vec3(0.00000000,0.00000000,1.00000000),Local7.rgb,MaterialParam_DetailAmount);

    vec2 Local10 = (Local9.rg * -1.00000000);
    float Local11 = dot(vec3(Local3.rg,Local4), vec3(Local10,Local9.b));
    vec3 Local12 = (vec3(Local3.rg,Local4) * Local11);
    vec3 Local13 = (Local4 * vec3(Local10,Local9.b));
    vec3 Local14 = (Local12 - Local13);

    float Local15 = (Local14.b + 1.00000000);

    // TeethGumsNormal.
    vec3 Local17 = LocalFunc_UnpackNormalMap(MaterialParam_TeethGumsNormalTexture,PixelParameters.TexCoord0.xy);
    
    vec2 Local19 = (Local17.rgb.rg * -1.00000000);
    float Local20 = dot(vec3(Local14.rg,Local15), vec3(Local19,Local17.rgb.b));
    vec3 Local21 = (vec3(Local14.rg,Local15) * Local20);
    vec3 Local22 = (Local15 * vec3(Local19,Local17.rgb.b));
    vec3 Local23 = (Local21 - Local22);

    // Lerp with camera vector.
    vec3 Local24 = mix(Local23,PixelParameters.CameraVector,MaterialParam_CameraForwardCheat);

    return Local24;
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