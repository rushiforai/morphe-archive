
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
		VertexShader = face_lift_box_blur_vs
		PixelShader = face_lift_box_blur_ps
		ShaderMacro = ""
		VSEntry = main
		PSEntry = main
		WriteDepth = 0
		TestDepth = 0
		ZTestFunc = LEqual
		CullMode = Off
		WhetherClearColor = 1
		ClearColor = (0.000000,0.000000,0.000000,1.000000)
		Input = InputTextureSampler @Bilinear @ClampU @ClampV
		Output = OutputRenderTarget @RGBA @Relative_0.450000_0.450000
	}
}
MaterialParameters
{
	float2 ViewportSize
	<
		name = "Viewport Size"
		widget = "input2"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = (0.000000,0.000000)
}
MaterialUserParameters
{
	float2 stepOffset
	<
		name = "Texture Offset"
		widget = "input2"
		min = 0.000000
		max = 10.000000
		step = 0.100000
	> = (0.000000,0.00000)
}
	
