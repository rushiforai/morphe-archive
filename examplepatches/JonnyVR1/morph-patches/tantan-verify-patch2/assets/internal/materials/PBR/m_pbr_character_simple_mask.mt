MaterialProperties
{
    PBR = 1
	BlendMode = Mask
	ShadingModel = DefaultLit
	Domain = Surface
	CullMode = Back
	ShaderFile = M_Character_Simple
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

	texture2D MaterialParam_MRSTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Metallic(R) Roughness(G) Specular(B) Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_AOTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "AO Texture"
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
		step = 0.010000
	> = (1.0,1.0,1.0,1.0)
	
	float MaterialParam_NormalFlatness
	<
		name = "Normal Flatness"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.0
	
	float MaterialParam_MetallicOffset
	<
		name = "Metallic Offset"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.0
	
	float MaterialParam_SpecularOffset
	<
		name = "Specular Offset"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.0

	float MaterialParam_RoughnessOffset
	<
		name = "Roughness Offset"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.0

	float MaterialParam_AOPower
	<
		name = "AO Power"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 1.0
}
