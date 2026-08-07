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
		VertexShader = white_v2_vs
		PixelShader = white_v2_ps
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
	texture2D TextureLookup @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Lookup Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D TextureLookupGray @WrapU @WrapV @WrapW @Trilinear
	<
		name = "LookupGray Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	float levelBlack
	<
		name = "Level black"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000

	float levelRangeInv
	<
		name = "Level RangeInv"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000

	float alpha
	<
		name = "alpha"
		widget = "slider"
		min = 0.000000
		max = 100.000000
		step = 0.010000
	> = 0.000000

}
