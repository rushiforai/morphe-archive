MaterialProperties
{
    PBR = 1
	BlendMode = Opaque
	ShadingModel = Subsurface
	Domain = Surface
	CullMode = Back
	ShaderFile = M_Skin
	UserMaterialShader = 0
}
MaterialParameters
{
	texture2D MaterialParam_ColorMainTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "ColorMain Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_NormalMainTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "NormalMain Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_NormalMicroTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "NormalMicro Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_RoughnessCavityAOTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Roughness(R) Cavity(G) AO(B) Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""
 
    float4 MaterialParam_TintColor
    <
        name = "Tint Color"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.10000
    > = (1.0,1.0,1.0,1.0)

    float4 MaterialParam_ParamGroup_0
    <
        name = "NormalIntensity, MicroNormalIntensity, MicroNormalTiling, CavityMapPower"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.10000
    > = (1.0,1.0,1.0,1.0)
    
    float4 MaterialParam_ParamGroup_1
    <
        name = "GlobalRoughness, MinRoughness, MaxRoughness, Specular"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.10000
    > = (1.0,1.0,1.0,1.0)
    
    float4 MaterialParam_ParamGroup_2
    <
        name = "FresnelRoughness, FresnelRoughnessExponent, AOPower"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.10000
    > = (1.0,1.0,1.0,1.0)
}
