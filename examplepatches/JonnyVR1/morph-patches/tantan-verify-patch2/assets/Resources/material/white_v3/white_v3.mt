MaterialSupportMacros
{
}
MaterialProperties
{
    ShaderEncryption = 1
	AlphaType = Opaque
	ShadingType = DefaultLit
	CastShadow = 1
	LightingEnabled = 1
	Sort = XPLM_ERR
	Pass
	{
		SrcColorBlend = One
		DestColorBlend = Zero
		SrcAlphaBlend = One
		DestAlphaBlend = Zero
		VertexShader = white_v3_vs
		PixelShader = white_v3_ps
		ShaderMacro = ""
		VSEntry = main
		PSEntry = main
		WriteDepth = 1
		TestDepth = 0
		ZTestFunc = LEqual
		CullMode = Off
		WhetherClearColor = 1
		ClearColor = (0.000000,0.000000,0.000000,1.000000)
		Input = InputTextureSampler @Point @ClampU @ClampV
		Output = OutputRenderTarget  
	}
}
MaterialParameters
{
}
MaterialUserParameters
{
	texture2D TextureWhittenV1 @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Whitten Texture V1"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D TextureReddenV1 @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Redden Texture V1"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D TextureWhittenV2 @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Whitten Texture V2"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D TextureReddenV2 @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Redden Texture V2"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D TextureWhittenV3 @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Whitten Texture V3"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	float whitenDegree
	<
		name = "Whiten Degree"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000

	float redDegree
	<
		name = "Red Degree"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000

	float whitenDegreeVersion
	<
		name = "Whiten Degree Version"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000

	float redDegreeVersion
	<
		name = "Red Degree Version"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000

}
