
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
		VertexShader = skin_smooth_v3_face_vs
		PixelShader = skin_smooth_v3_face_ps
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
		Input = InputTextureSampler_1 @Bilinear @ClampU @ClampV
		Input = InputTextureSampler_2 @Bilinear @ClampU @ClampV
		Output = OutputRenderTarget
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
	texture2D MaskTextureSampler @WrapU @WrapV @WrapW @Trilinear
	<
		name = "MaskTextureSampler"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = "default_texture_path"
	float intensity2
	<
		name = "Blur Intensity"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000
	float sharpen
	<
		name = "Sharpen Intensity"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000
}
	
