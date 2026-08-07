MaterialProperties
{
    PBR = 1
	BlendMode = Additive
	ShadingModel = Unlit
	Domain = Surface
	CullMode = Back
	ShaderFile = M_Basic_Particle
    UserMaterialShader = 0
}
MaterialParameters
{
	texture2D MaterialParam_DiffuseTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Diffuse Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""
}
