
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
		VertexShader = cartoon_vs
		PixelShader = cartoon_ps
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
    float   effectFlipX

	float2 	ViewportSize
	<
		name = "Viewport Size"
		widget = "input2"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = (0.000000, 0.000000)

	float2 	effectMaskSize
	<
		name = "Mask Size"
		widget = "input2"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = (0.000000, 0.000000)

	matrix4		warpMat

	texture2D EffectMaskTextureSampler @ClampU @ClampV @ClampZ @Trilinear
	<
		name = "EffectMaskTextureSampler"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = "default_texture_path"
}
MaterialUserParameters
{
	float intensity
	<
		name = "Mask Size"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000
}
	
