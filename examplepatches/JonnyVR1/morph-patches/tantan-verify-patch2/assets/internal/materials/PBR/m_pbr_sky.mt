MaterialProperties
{
    PBR = 1
	BlendMode = Opaque
	ShadingModel = Unlit
	Domain = Surface
	CullMode = None
	ShaderFile = M_Basic_Sky
	UserMaterialShader = 0
}
MaterialParameters
{
	textureCube MaterialParam_SkyCubeTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Sky Cube Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""
 
    float MaterialParam_SkyRotation
    <
        name = "Sky Rotation"
        widget = "slider"
        min = 0.000000
        max = 10.000000
        step = 0.010000
    > = 0.35
}
