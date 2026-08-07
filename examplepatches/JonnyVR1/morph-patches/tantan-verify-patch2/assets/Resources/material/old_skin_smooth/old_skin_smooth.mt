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
		VertexShader = old_skin_smooth_vs
		PixelShader = old_skin_smooth_ps
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
	
	float parameter
	<
		name = "Parameter"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000

	float3 lowSkinThreshold
	<
		name = "LowSkinThreshold"
		widget = "input3"
		min = 0.000000
		max = 0.000000
		step = 0.010000
	> = (0.000000,0.000000,0.000000)

	float3 highSkinThreshold
	<
		name = "HighSkinThreshold"
		widget = "input3"
		min = 0.000000
		max = 0.000000
		step = 0.010000
	> = (0.000000,0.000000,0.000000)
}
