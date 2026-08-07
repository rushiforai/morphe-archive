
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
		VertexShader = makeup_pupil_vs
		PixelShader = makeup_pupil_ps
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
	float bDetachFace
}
MaterialUserParameters
{
	texture2D SucaiTextureSampler @ClampU @ClampV @ClampW @Trilinear
	<
	   name = "SucaiTextureSampler"
	   widget = "texture"
	   min = 0.000000
	   max = 0.000000
	   step = 0.000000
	> = "default_texture_path"

	float blendMode
	<
		name = "Blend Mode"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 1.000000

	float intensity
	<
		name = "Pupil Intensity"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000
}
	
