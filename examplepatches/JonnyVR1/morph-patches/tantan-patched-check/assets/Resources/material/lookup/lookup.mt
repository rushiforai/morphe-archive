
MaterialSupportMacros
{
}
MaterialProperties
{
    ShaderEncryption = 1
	AlphaType = Opaque
	ShadingType = DefaultLit
	CastShadow = 0
	LightingEnabled = 1
	Sort = XPLM_ERR
	Pass
	{
		SrcColorBlend = One
		DestColorBlend = Zero
		SrcAlphaBlend = One
		DestAlphaBlend = Zero
		VertexShader = lookup_vs
		PixelShader = lookup_ps
		ShaderMacro = ""
		VSEntry = main
		PSEntry = main
		WriteDepth = 0
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
	texture2D TextureLookup_0 @WrapU @WrapV @WrapW @Bilinear
	<
		name = "Lookup Texture 0"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D TextureLookup_1 @WrapU @WrapV @WrapW @Bilinear
	<
		name = "Lookup Texture 1"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	float intensity_0
	<
		name = "intensity_0"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.100000
	> = 0.000000

	float intensity_1
	<
		name = "intensity_1"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.100000
	> = 0.000000

	float offset
	<
		name = "offset"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.100000
	> = 0.000000

	float dimension_0
	<
		name = "dimension 0"
		widget = "slider"
		min = 0.000000
		max = 4096.000000
		step = 1.000000
	> = 0.000000

	float dimension_1
	<
		name = "dimension 1"
		widget = "slider"
		min = 0.000000
		max = 4096.000000
		step = 1.000000
	> = 0.000000
}
	
