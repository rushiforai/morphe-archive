
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
		VertexShader = box_blur_v2_height_vs
		PixelShader = box_blur_v2_height_ps
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
		Output = height_blur_texture @RGBA @Relative_0.450000_0.450000
	}
	Pass
	{
		SrcColorBlend = One
		DestColorBlend = Zero
		SrcAlphaBlend = One
		DestAlphaBlend = Zero
		VertexShader = box_blur_v2_width_diff_vs
		PixelShader = box_blur_v2_width_diff_ps
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
		Input = height_blur_texture @Bilinear @ClampU @ClampV
		Output = width_blur_texture @RGBA @Relative_0.450000_0.450000
	}
	Pass
	{
		SrcColorBlend = One
		DestColorBlend = Zero
		SrcAlphaBlend = One
		DestAlphaBlend = Zero
		VertexShader = box_blur_alpha_height_vs
		PixelShader = box_blur_alpha_height_ps
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
		Input = width_blur_texture @Bilinear @ClampU @ClampV
		Output = height_blur_texture @RGBA @Relative_0.450000_0.450000
	}
	Pass
	{
		SrcColorBlend = One
		DestColorBlend = Zero
		SrcAlphaBlend = One
		DestAlphaBlend = Zero
		VertexShader = box_blur_alpha_width_vs
		PixelShader = box_blur_alpha_width_ps
		ShaderMacro = ""
		VSEntry = main
		PSEntry = main
		WriteDepth = 0
		TestDepth = 0
		ZTestFunc = LEqual
		CullMode = Off
		WhetherClearColor = 1
		ClearColor = (0.000000,0.000000,0.000000,1.000000)
		Input = InputTextureSampler @Bilinear  @ClampU @ClampV
		Input = height_blur_texture @Bilinear @ClampU @ClampV
		Output = OutputRenderTarget @RGBA @Relative_0.450000_0.450000
	}
}
MaterialParameters
{
	float2 ViewportSize
	<
	   name = "ViewportSize"
	   widget = "input2"
	   min = 0.000000
	   max = 1.000000
	   step = 0.010000
	> = (0.000000,0.000000)
}
MaterialUserParameters
{
	
	float2 stepOffset1
	<
		name = "Texture Offset1"
		widget = "input2"
		min = 0.000000
		max = 10.000000
		step = 0.100000
	> = (0.000000,0.00000)

	float2 stepOffset2
	<
		name = "Texture Offset2"
		widget = "input2"
		min = 0.000000
		max = 10.000000
		step = 0.100000
	> = (0.000000,0.00000)
}
