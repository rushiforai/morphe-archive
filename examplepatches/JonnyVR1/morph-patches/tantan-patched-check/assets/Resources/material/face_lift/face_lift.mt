
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
		VertexShader = face_lift_vs
		PixelShader = face_lift_ps
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
		Output = OutputRenderTarget
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

	float	openMouth;
    float   bDetachFace;
}
MaterialUserParameters
{
	texture2D MaskTextureSampler @ClampU @ClampV @ClampW @Trilinear
	<
		name = "MaskTextureSampler"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = "default_texture_path"

	texture2D ToothLutTextureSampler @ClampU @ClampV @ClampW @Trilinear
	<
	   name = "ToothLutTextureSampler"
	   widget = "texture"
	   min = 0.000000
	   max = 0.000000
	   step = 0.000000
	> = "default_texture_path"

	float eyebrightenIntensity
	<
		name = "Bright Eye Intensity"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000

	float teethWhitenIntensity
	<
		name = "Teeth Whiten Intensity"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000

	float removePouchIntensity
	<
		name = "Remove Pouch Intensity"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000

	float removeNasolabialFoldsIntensity
	<
		name = "Remove NasolabialFolds Intensity"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000
}
	
