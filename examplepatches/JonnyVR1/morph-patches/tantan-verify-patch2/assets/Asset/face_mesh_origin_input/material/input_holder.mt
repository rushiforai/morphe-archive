
MaterialSupportMacros
{
}
MaterialProperties
{
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
		VertexShader = input_holder_vs
		PixelShader = input_holder_ps
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
}
	