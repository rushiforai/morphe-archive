MaterialProperties
{
    PBR = 1
	BlendMode = Opaque
	ShadingModel = Unlit
	Domain = Surface
	CullMode = Back
	ShaderFile = M_Basic_Unlit
	UserMaterialShader = 0
}
MaterialParameters
{
	float MaterialParam_EmissiveMultiplier
	<
		name = "EmissiveMultiplier"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 1.000000

	texture2D MaterialParam_DiffuseTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Diffuse Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""
}
