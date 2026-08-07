
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
		VertexShader = white_v1_vs
		PixelShader = white_v1_ps
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
	float skinLightingScale
	<
		name = "Skin Lighting Scale"
		widget = "slider"
		min = 0.000000
		max = 5.000000
		step = 0.010000
	> = 1.000000

	float3 skinDefaultRGB
	<
	   name = "Skin Default RGB"
	   widget = "input3"
	   min = 0.000000
	   max = 1.000000
	   step = 0.010000
	> = (0.000000, 0.000000, 0.000000)
}
	
