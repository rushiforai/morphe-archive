MaterialProperties
{
    PBR = 1
	BlendMode = Translucent
	ShadingModel = DefaultLit
	Domain = Surface
	CullMode = Back
	ShaderFile = M_LacrimalFluid
	UserMaterialShader = 0
}
MaterialParameters
{
	float MaterialParam_DepthOffset
	<
		name = "DepthOffset"
		widget = "slider"
		min = 0.000000
		max = 10.000000
		step = 0.010000
	> = 0.05

	float MaterialParam_DetailAmount
	<
		name = "DetailAmount"
		widget = "slider"
		min = 0.000000
		max = 10.000000
		step = 0.10000
	> = 0.5

	float MaterialParam_DetailUTiling
	<
		name = "DetailUTiling"
		widget = "slider"
		min = 0.000000
		max = 10.000000
		step = 0.10000
	> = 1.0

	float MaterialParam_DetailVTiling
	<
		name = "DetailVTiling"
		widget = "slider"
		min = 0.000000
		max = 10.000000
		step = 0.10000
	> = 1.0

	float MaterialParam_FadeStart
	<
		name = "FadeStart"
		widget = "slider"
		min = 0.000000
		max = 10.000000
		step = 0.10000
	> = 0.0

	float MaterialParam_FadeEnd
	<
		name = "FadeEnd"
		widget = "slider"
		min = 0.000000
		max = 10.000000
		step = 0.10000
	> = 0.5

	float MaterialParam_Metallic
	<
		name = "Metallic"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 1.0

	float MaterialParam_Specular
	<
		name = "Specular"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.008

	float MaterialParam_Roughness
	<
		name = "Roughness"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.2

	float MaterialParam_Opacity
	<
		name = "Opacity"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.04

	float MaterialParam_MicroNormalStrength
	<
		name = "MicroNormalStrength"
		widget = "slider"
		min = 0.000000
		max = 10.000000
		step = 0.10000
	> = 0.0

	float MaterialParam_MicroTiling
	<
		name = "MicroTiling"
		widget = "slider"
		min = 0.000000
		max = 10.000000
		step = 0.10000
	> = 1.0

	texture2D MaterialParam_LacrimalNTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "LacrimalN Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_LacrimalHTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "LacrimalH Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""
}
