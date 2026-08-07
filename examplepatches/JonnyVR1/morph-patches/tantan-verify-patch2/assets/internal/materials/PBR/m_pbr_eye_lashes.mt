MaterialProperties
{
    PBR = 1
	BlendMode = Translucent
	ShadingModel = DefaultLit
	Domain = Surface
	CullMode = None
	ShaderFile = M_EyeLashes
	UserMaterialShader = 0
}
MaterialParameters
{	
	texture2D MaterialParam_CoverageTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Coverage Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	float4 MaterialParam_HairDye
	<
		name = "HairDye"
		widget = "input4"
		min = 0.000000
		max = 1.000000
		step = 0.000000
	> = (1.0,1.0,1.0,1.0)

	float MaterialParam_HairMelanin
	<
		name = "HairMelanin"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.01000
	> = 0.3

	float MaterialParam_HairRedness
	<
		name = "HairRedness"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.01000
	> = 0.15

	float MaterialParam_Metallic
	<
		name = "Metallic"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.01000
	> = 0.0

	float MaterialParam_Roughness
	<
		name = "Roughness"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.01000
	> = 1.0

	float MaterialParam_Specular
	<
		name = "Specular"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.01000
	> = 0.0

	float MaterialParam_Opacity
	<
		name = "Opacity"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.01000
	> = 1.0
}
