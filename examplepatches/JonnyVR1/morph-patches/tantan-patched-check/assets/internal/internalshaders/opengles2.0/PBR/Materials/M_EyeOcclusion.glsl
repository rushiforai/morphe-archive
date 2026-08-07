uniform vec4  MaterialParam_BlurColor;
uniform vec4  MaterialParam_ShadowTint;

uniform vec4 MaterialParam_ParamGroup_0; // BlurSize, ShadowMultiply

uniform vec4  MaterialParam_BlurParamGroup_0; // BottomBlurHardness, BottomBlurRadius, TopBlurHardness, TopBlurRadius
uniform vec4  MaterialParam_BlurParamGroup_1; // InnerBlurHardness, InnerBlurRadius, OuterBlurHardness, OuterBlurRadius

uniform vec4  MaterialParam_BlurBorderParamGroup_0; // BottomBlurBorderHardness, BottomBlurBorderRadius, TopBlurBorderHardness, TopBlurBorderRadius
uniform vec4  MaterialParam_BlurBorderParamGroup_1; // InnerBlurBorderHardness, InnerBlurBorderRadius, OuterBlurBorderHardness, OuterBlurBorderRadius

uniform vec4  MaterialParam_ShadowParamGroup_0; // BottomShadowHardness, BottomShadowRadius, TopShadowHardness, TopShadowRadius
uniform vec4  MaterialParam_ShadowParamGroup_1; // InnerShadowHardness, InnerShadowRadius, OuterShadowHardness, OuterShadowRadius

uniform vec4  MaterialParam_ShadowBorderParamGroup_0; // BottomShadowBorderHardness, BottomShadowBorderRadius, TopShadowBorderHardness, TopShadowBorderRadius
uniform vec4  MaterialParam_ShadowBorderParamGroup_1; // InnerShadowBorderHardness, InnerShadowBorderRadius, OuterShadowBorderHardness, OuterShadowBorderRadius

//uniform float  MaterialParam_BlurSize;
//uniform float  MaterialParam_ShadowMultiply;

//uniform float  MaterialParam_BottomBlurHardness;
//uniform float  MaterialParam_BottomBlurRadius;
//uniform float  MaterialParam_TopBlurHardness;
//uniform float  MaterialParam_TopBlurRadius;
//uniform float  MaterialParam_InnerBlurHardness;
//uniform float  MaterialParam_InnerBlurRadius;
//uniform float  MaterialParam_OuterBlurHardness;
//uniform float  MaterialParam_OuterBlurRadius;

//uniform float  MaterialParam_BottomBlurBorderHardness;
//uniform float  MaterialParam_BottomBlurBorderRadius;
//uniform float  MaterialParam_TopBlurBorderHardness;
//uniform float  MaterialParam_TopBlurBorderRadius;
//uniform float  MaterialParam_InnerBlurBorderHardness;
//uniform float  MaterialParam_InnerBlurBorderRadius;
//uniform float  MaterialParam_OuterBlurBorderHardness;
//uniform float  MaterialParam_OuterBlurBorderRadius;

//uniform float  MaterialParam_BottomShadowHardness;
//uniform float  MaterialParam_BottomShadowRadius;
//uniform float  MaterialParam_TopShadowHardness;
//uniform float  MaterialParam_TopShadowRadius;
//uniform float  MaterialParam_InnerShadowHardness;
//uniform float  MaterialParam_InnerShadowRadius;
//uniform float  MaterialParam_OuterShadowHardness;
//uniform float  MaterialParam_OuterShadowRadius;

//uniform float  MaterialParam_BottomShadowBorderHardness;
//uniform float  MaterialParam_BottomShadowBorderRadius;
//uniform float  MaterialParam_TopShadowBorderHardness;
//uniform float  MaterialParam_TopShadowBorderRadius;
//uniform float  MaterialParam_InnerShadowBorderHardness;
//uniform float  MaterialParam_InnerShadowBorderRadius;
//uniform float  MaterialParam_OuterShadowBorderHardness;
//uniform float  MaterialParam_OuterShadowBorderRadius;


// Local functions.
vec2 CalcScreenUVFromOffsetFraction(vec4 ScreenPosition, vec2 OffsetFraction)
{
	vec2 NDC = ScreenPosition.xy / ScreenPosition.w;
	// Apply the offset in NDC space so that it is consistent regardless of scene color buffer size
	// Clamp to valid area of the screen to avoid reading garbage
	vec2 OffsetNDC = clamp(NDC + OffsetFraction * vec2(2.0, -2.0), -0.999f, 0.999f);
	return OffsetNDC * 0.5 + 0.5;
}

vec3 DecodeSceneColorForMaterialNode(vec2 ScreenUV)
{
    return texture(UniParam_SceneColorTextureSampler, ScreenUV).rgb;
}

float CustomExpression0(Stru_PixelParam Parameters)
{
	return InternalFunc_GetTanHalfFieldOfView().y;
}

float ConvertRadius(float Radius)
{
    return ( 1.0 / max(0.00001, Radius) );
}

float ConvertHardness(float Hardness)
{
    return ( 1.0 / max(0.00001, (1.0 - Hardness)) );
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
	return vec3(0.0);
}

float UserFunc_GetMetallic(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return 0.0;
}

float UserFunc_GetSpecular(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    return 0.5;
}

float UserFunc_GetRoughness(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    return 0.5;
}

vec3 UserFunc_GetNormal(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return vec3(0.0, 0.0, 1.0);
}

vec3 UserFunc_GetEmissive(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    // Original scene color.
	vec2 Local0 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, vec2(0.00000000,0.00000000));
    vec3 Local1 = DecodeSceneColorForMaterialNode(Local0);

    // Blur scene color with Poisson disk.
    float Local2 = CustomExpression0(PixelParameters);
	float Local3 = InternalFunc_ConvertFromDeviceZ(texture(UniParam_SceneDepthTextureSampler, PixelParameters.SVPosition.xy / PixelParameters.SVPosition.w * 0.5 + 0.5).r);
    Local3 *= 100.0; // Convert from m to cm.
    float Local4 = (Local2 * Local3);
    float Local5 = (0.1 / Local4);
    float Local6 = (Local5 * MaterialParam_ParamGroup_0.x);
    vec2 Local7 = (vec2(0.40360001,-0.79350001) * Local6);
    vec2 Local8 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, Local7);
    vec3 Local9 = DecodeSceneColorForMaterialNode(Local8);
    vec2 Local10 = (vec2(0.37300000,-0.27300000) * Local6);
    vec2 Local11 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, Local10);
    vec3 Local12 = DecodeSceneColorForMaterialNode(Local11);
    vec3 Local13 = (Local9 + Local12);
    vec2 Local14 = (vec2(-0.04100000,-0.59700000) * Local6);
    vec2 Local15 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, Local14);
    vec3 Local16 = DecodeSceneColorForMaterialNode(Local15);
    vec3 Local17 = (Local13 + Local16);
    vec2 Local18 = (vec2(-0.37092999,-0.91799998) * Local6);
    vec2 Local19 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, Local18);
    vec3 Local20 = DecodeSceneColorForMaterialNode(Local19);
    vec3 Local21 = (Local17 + Local20);
    vec2 Local22 = (vec2(-0.37900001,-0.33500001) * Local6);
    vec2 Local23 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, Local22);
    vec3 Local24 = DecodeSceneColorForMaterialNode(Local23);
    vec3 Local25 = (Local21 + Local24);
    vec2 Local26 = (vec2(-0.31540000,0.10700000) * Local6);
    vec2 Local27 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, Local26);
    vec3 Local28 = DecodeSceneColorForMaterialNode(Local27);
    vec3 Local29 = (Local25 + Local28);
    vec2 Local30 = (vec2(-0.76700002,-0.61400002) * Local6);
    vec2 Local31 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, Local30);
    vec3 Local32 = DecodeSceneColorForMaterialNode(Local31);
    vec3 Local33 = (Local29 + Local32);
    vec2 Local34 = (vec2(-0.48699999,0.63900000) * Local6);
    vec2 Local35 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, Local34);
    vec3 Local36 = DecodeSceneColorForMaterialNode(Local35);
    vec3 Local37 = (Local33 + Local36);
    vec2 Local38 = (vec2(0.23600000,0.15099999) * Local6);
    vec2 Local39 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, Local38);
    vec3 Local40 = DecodeSceneColorForMaterialNode(Local39);
    vec3 Local41 = (Local37 + Local40);
    vec2 Local42 = (vec2(0.03100000,0.73100001) * Local6);
    vec2 Local43 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, Local42);
    vec3 Local44 = DecodeSceneColorForMaterialNode(Local43);
    vec3 Local45 = (Local41 + Local44);
    vec2 Local46 = (vec2(-0.82300001,-0.10600000) * Local6);
    vec2 Local47 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, Local46);
    vec3 Local48 = DecodeSceneColorForMaterialNode(Local47);
    vec3 Local49 = (Local45 + Local48);
    vec2 Local50 = (vec2(-0.87320000,0.30300000) * Local6);
    vec2 Local51 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, Local50);
    vec3 Local52 = DecodeSceneColorForMaterialNode(Local51);
    vec3 Local53 = (Local49 + Local52);
    vec2 Local54 = (vec2(0.92699999,-0.11600000) * Local6);
    vec2 Local55 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, Local54);
    vec3 Local56 = DecodeSceneColorForMaterialNode(Local55);
    vec3 Local57 = (Local53 + Local56);
    vec2 Local58 = (vec2(0.69800001,0.37700000) * Local6);
    vec2 Local59 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, Local58);
    vec3 Local60 = DecodeSceneColorForMaterialNode(Local59);
    vec3 Local61 = (Local57 + Local60);
    vec2 Local62 = (vec2(0.82400000,-0.51499999) * Local6);
    vec2 Local63 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, Local62);
    vec3 Local64 = DecodeSceneColorForMaterialNode(Local63);
    vec3 Local65 = (Local61 + Local64);
    vec2 Local66 = (vec2(0.50800002,0.75300002) * Local6);
    vec2 Local67 = CalcScreenUVFromOffsetFraction(PixelParameters.SVPosition, Local66);
    vec3 Local68 = DecodeSceneColorForMaterialNode(Local67);
    vec3 Local69 = (Local65 + Local68);
    vec3 Local70 = (Local69 / 16.00000000);
    vec3 Local71 = (MaterialParam_BlurColor.rgb * Local70);

    // Blur lerp alpha.
    float Local72 = (PixelParameters.TexCoord0.xy.r - 0.00000000);
    float Local73 = abs(Local72);
    float Local74 = (Local73 * ConvertRadius(MaterialParam_BlurBorderParamGroup_1.w));
    float Local75 = (1.00000000 - Local74);
    float Local76 = (Local75 * ConvertHardness(MaterialParam_BlurBorderParamGroup_1.z));
    float Local77 = min(max(Local76,0.00000000),1.00000000);
    float Local78 = (1.00000000 - Local77);

    float Local79 = (PixelParameters.TexCoord0.xy.r - 1.00000000);
    float Local80 = abs(Local79);
    float Local81 = (Local80 * ConvertRadius(MaterialParam_BlurBorderParamGroup_1.y));
    float Local82 = (1.00000000 - Local81);
    float Local83 = (Local82 * ConvertHardness(MaterialParam_BlurBorderParamGroup_1.x));
    float Local84 = min(max(Local83,0.00000000),1.00000000);
    float Local85 = (1.00000000 - Local84);
    float Local86 = (Local78 * Local85);

    float Local87 = (PixelParameters.TexCoord0.xy.g - 1.00000000);
    float Local88 = abs(Local87);
    float Local89 = (Local88 * ConvertRadius(MaterialParam_BlurBorderParamGroup_0.y));
    float Local90 = (1.00000000 - Local89);
    float Local91 = (Local90 * ConvertHardness(MaterialParam_BlurBorderParamGroup_0.x));
    float Local92 = min(max(Local91,0.00000000),1.00000000);
    float Local93 = (1.00000000 - Local92);

    float Local94 = (PixelParameters.TexCoord0.xy.g - 0.00000000);
    float Local95 = abs(Local94);
    float Local96 = (Local95 * ConvertRadius(MaterialParam_BlurBorderParamGroup_0.w));
    float Local97 = (1.00000000 - Local96);
    float Local98 = (Local97 * ConvertHardness(MaterialParam_BlurBorderParamGroup_0.z));
    float Local99 = min(max(Local98,0.00000000),1.00000000);
    float Local100 = (1.00000000 - Local99);

    float Local101 = (Local93 * Local100);
    float Local102 = (Local86 * Local101);
    float Local103 = (1.00000000 - Local102);

    float Local104 = (Local73 * ConvertRadius(MaterialParam_BlurParamGroup_1.w));
    float Local105 = (1.00000000 - Local104);
    float Local106 = (Local105 * ConvertHardness(MaterialParam_BlurParamGroup_1.z));
    float Local107 = min(max(Local106,0.00000000),1.00000000);
    float Local108 = (1.00000000 - Local107);

    float Local109 = (Local80 * ConvertRadius(MaterialParam_BlurParamGroup_1.y));
    float Local110 = (1.00000000 - Local109);
    float Local111 = (Local110 * ConvertHardness(MaterialParam_BlurParamGroup_1.x));
    float Local112 = min(max(Local111,0.00000000),1.00000000);
    float Local113 = (1.00000000 - Local112);

    float Local114 = (Local108 * Local113);

    float Local115 = (Local88 * ConvertRadius(MaterialParam_BlurParamGroup_0.y));
    float Local116 = (1.00000000 - Local115);
    float Local117 = (Local116 * ConvertHardness(MaterialParam_BlurParamGroup_0.x));
    float Local118 = min(max(Local117,0.00000000),1.00000000);
    float Local119 = (1.00000000 - Local118);

    float Local120 = (Local95 * ConvertRadius(MaterialParam_BlurParamGroup_0.w));
    float Local121 = (1.00000000 - Local120);
    float Local122 = (Local121 * ConvertHardness(MaterialParam_BlurParamGroup_0.z));
    float Local123 = min(max(Local122,0.00000000),1.00000000);
    float Local124 = (1.00000000 - Local123);

    float Local125 = (Local119 * Local124);
    float Local126 = (Local114 * Local125);
    float Local127 = (Local103 + Local126);
    float Local128 = clamp(Local127, 0.0, 1.0);
    float Local129 = (1.00000000 - Local128);

    // Lerp original with blurred scene color.
    vec3 Local130 = mix(Local1,Local71,float(Local129));

    // Shadow.
    float Local131 = (Local73 * ConvertRadius(MaterialParam_ShadowParamGroup_1.w));
    float Local132 = (1.00000000 - Local131);
    float Local133 = (Local132 * ConvertHardness(MaterialParam_ShadowParamGroup_1.z));
    float Local134 = min(max(Local133,0.00000000),1.00000000);
    float Local135 = (1.00000000 - Local134);

    float Local136 = (Local80 * ConvertRadius(MaterialParam_ShadowParamGroup_1.y));
    float Local137 = (1.00000000 - Local136);
    float Local138 = (Local137 * ConvertHardness(MaterialParam_ShadowParamGroup_1.x));
    float Local139 = min(max(Local138,0.00000000),1.00000000);
    float Local140 = (1.00000000 - Local139);

    float Local141 = (Local135 * Local140);

    float Local142 = (Local88 * ConvertRadius(MaterialParam_ShadowParamGroup_0.y));
    float Local143 = 1.00000000 - Local142;
    float Local144 = (Local143 * ConvertHardness(MaterialParam_ShadowParamGroup_0.x));
    float Local145 = min(max(Local144,0.00000000),1.00000000);
    float Local146 = (1.00000000 - Local145);

    float Local147 = (Local95 * ConvertRadius(MaterialParam_ShadowParamGroup_0.w));
    float Local148 = (1.00000000 - Local147);
    float Local149 = (Local148 * ConvertHardness(MaterialParam_ShadowParamGroup_0.z));
    float Local150 = min(max(Local149,0.00000000),1.00000000);
    float Local151 = (1.00000000 - Local150);

    float Local152 = (Local146 * Local151);

    float Local153 = (Local141 * Local152);
    float Local154 = (1.00000000 - Local153);

    float Local155 = (Local73 * ConvertRadius(MaterialParam_ShadowBorderParamGroup_1.w));
    float Local156 = (1.00000000 - Local155);
    float Local157 = (Local156 * ConvertHardness(MaterialParam_ShadowBorderParamGroup_1.z));
    float Local158 = min(max(Local157,0.00000000),1.00000000);
    float Local159 = (1.00000000 - Local158);

    float Local160 = (Local80 * ConvertRadius(MaterialParam_ShadowBorderParamGroup_1.y));
    float Local161 = (1.00000000 - Local160);
    float Local162 = (Local161 * ConvertHardness(MaterialParam_ShadowBorderParamGroup_1.x));
    float Local163 = min(max(Local162,0.00000000),1.00000000);
    float Local164 = (1.00000000 - Local163);

    float Local165 = (Local159 * Local164);

    float Local166 = (Local88 * ConvertRadius(MaterialParam_ShadowBorderParamGroup_0.y));
    float Local167 = (1.00000000 - Local166);
    float Local168 = (Local167 * ConvertHardness(MaterialParam_ShadowBorderParamGroup_0.x));
    float Local169 = min(max(Local168,0.00000000),1.00000000);
    float Local170 = (1.00000000 - Local169);

    float Local171 = (Local95 * ConvertRadius(MaterialParam_ShadowBorderParamGroup_0.w));
    float Local172 = (1.00000000 - Local171);
    float Local173 = (Local172 * ConvertHardness(MaterialParam_ShadowBorderParamGroup_0.z));
    float Local174 = min(max(Local173,0.00000000),1.00000000);
    float Local175 = (1.00000000 - Local174);

    float Local176 = (Local170 * Local175);
    float Local177 = (Local165 * Local176);

    float Local178 = (Local154 * Local177);
    float Local179 = clamp(Local178, 0.0, 1.0);
    float Local180 = (Local179 * Local179);
    vec3 Local181 = mix(vec3(1.00000000,1.00000000,1.00000000),MaterialParam_ShadowTint.rgb,float(Local180));
    float Local182 = mix(1.00000000,(1.0-MaterialParam_ParamGroup_0.y),Local180); // One minus ShadowMultiply
    vec3 Local183 = (Local181 * Local182);

    // Shadowed result.
    vec3 Local184 = (Local130 * Local183);

    return Local184;
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
