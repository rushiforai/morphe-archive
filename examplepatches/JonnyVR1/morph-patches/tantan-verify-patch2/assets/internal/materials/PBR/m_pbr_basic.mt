MaterialProperties
{
    PBR = 1
	BlendMode = Opaque
	ShadingModel = DefaultLit
	Domain = Surface
	CullMode = Back
	ShaderFile = M_Basic
	UserMaterialShader = 0
}
MaterialParameters
{
	float MaterialParam_Metallic
	<
		name = "Metallic"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000

	float MaterialParam_Specular
	<
		name = "Specular"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.500000

	float MaterialParam_Roughness
	<
		name = "Roughness"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.500000

	texture2D MaterialParam_DiffuseTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Diffuse Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_NormalTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Normal Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""
}
