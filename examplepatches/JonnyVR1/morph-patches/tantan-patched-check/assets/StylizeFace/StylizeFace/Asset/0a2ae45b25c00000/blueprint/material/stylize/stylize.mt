
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
		VertexShader = stylize_vs
		PixelShader = stylize_ps
		ShaderMacro = ""
		VSEntry = main
		PSEntry = main
		WriteDepth = 0
		TestDepth = 0
		ZTestFunc = LEqual
		CullMode = Off
		WhetherClearColor = 1
		ClearColor = (0.000000,0.000000,0.000000,0.000000)
		Input = InputTextureSampler @Point @ClampU @ClampV
		Output = OutputRenderTarget
	}
}
MaterialParameters
{
	float	effectEnable
	float2 	ViewportSize
	float2 	effectMaskSize
	matrix4	warpMat
	texture2D EffectMaskTextureSampler @ClampU @ClampV @ClampW @Trilinear
    float flipx
}
MaterialUserParameters
{
	float intensity
	<
		name = "Mask Size"
		widget = "input2"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000
}
	