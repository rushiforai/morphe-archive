uniform float  MaterialParam_DepthOffset;
uniform float  MaterialParam_DetailAmount;
uniform float  MaterialParam_DetailUTiling;
uniform float  MaterialParam_DetailVTiling;
uniform float  MaterialParam_FadeEnd;
uniform float  MaterialParam_FadeStart;
uniform float  MaterialParam_Metallic;
uniform float  MaterialParam_MicroNormalStrength;
uniform float  MaterialParam_MicroTiling;
uniform float  MaterialParam_Opacity;
uniform float  MaterialParam_Roughness;
uniform float  MaterialParam_Specular;

uniform sampler2D MaterialParam_LacrimalNTexture;
uniform sampler2D MaterialParam_LacrimalHTexture;


// Local functions.
vec3 LocalFunc_UnpackNormalMap(sampler2D normalTex, in vec2 texcoord)
{
    vec3 bump = texture(normalTex, texcoord.xy).rgb;
    bump.xy = -1.0 + 2.0 * bump.xy;
    bump.y = -bump.y;
    bump.z = sqrt(clamp(1.0 - dot(bump.xy, bump.xy), 0.0, 1.0));  
    return bump;
}


// Material virtual user functions.
vec3 UserFunc_GetWorldPositionOffset(Stru_VertexParam VertexParameters)
{
    // Todo
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
	return vec3(1.0);
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
    vec2 Local0 = (PixelParameters.TexCoord0.xy * vec2(MaterialParam_DetailUTiling,MaterialParam_DetailVTiling));
    vec4 Local18 = texture(MaterialParam_LacrimalHTexture,Local0);
    float Local20 = (Local18.a * MaterialParam_DetailAmount);
    float Local21 = (Local20 - 0.10000000);
    float Local22 = (Local21 + MaterialParam_Roughness);

    return Local22;
}

vec3 UserFunc_GetNormal(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	vec2 Local0 = (PixelParameters.TexCoord0.xy * vec2(MaterialParam_DetailUTiling,MaterialParam_DetailVTiling));
    vec3 Local2 = LocalFunc_UnpackNormalMap(MaterialParam_LacrimalNTexture,Local0);

    float Local4 = (Local2.rgb.b + 1.00000000);

    vec2 Local5 = (PixelParameters.TexCoord0.xy * MaterialParam_MicroTiling);
    vec3 Local7 = LocalFunc_UnpackNormalMap(MaterialParam_LacrimalNTexture,Local5);

    // FlattenNormal.
    vec3 Local9 = mix(Local7.rgb,vec3(0.00000000,0.00000000,1.00000000),(1.0-MaterialParam_MicroNormalStrength));

    vec2 Local10 = (Local9.rg * -1.00000000);
    float Local11 = dot(vec3(Local2.rgb.rg,Local4), vec3(Local10,Local9.b));
    vec3 Local12 = (vec3(Local2.rgb.rg,Local4) * Local11);
    vec3 Local13 = (Local4 * vec3(Local10,Local9.b));
    vec3 Local14 = (Local12 - Local13);

    vec3 Local15 = mix(vec3(0.00000000,0.00000000,1.00000000),Local14,MaterialParam_DetailAmount);

    return Local15;
}

vec3 UserFunc_GetEmissive(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    return vec3(0.0);
}

float UserFunc_GetOpacity(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	float Local23 = (PixelParameters.TexCoord0.xy.r + 0.06000000);
    float Local24 = (1.00000000 - Local23);
    float Local25 = (Local24 * 4.48682213);
    float Local26 = fract(Local25);
    float Local27 = smoothstep(MaterialParam_FadeStart,MaterialParam_FadeEnd,Local26);
    float Local28 = (Local27 * MaterialParam_Opacity);

    return Local28;
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