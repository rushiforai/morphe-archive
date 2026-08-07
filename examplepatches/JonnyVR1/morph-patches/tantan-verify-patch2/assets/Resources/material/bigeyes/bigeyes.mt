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
        VertexShader = bigeyes_vs
        PixelShader = bigeyes_ps
        ShaderMacro = ""
        VSEntry = main
        PSEntry = main
        WriteDepth = 1
        TestDepth = 0
        ZTestFunc = LEqual
        CullMode = Off
        WhetherClearColor = 1
        ClearColor = (0.000000,0.000000,0.000000,1.000000)
        Input = InputTextureSampler @Bilinear @ClampU @ClampV
        Output = InputBeautySampler @RGBA @Relative_1.000000_1.000000
    }
    Pass
    {
        SrcColorBlend = One
        DestColorBlend = Zero
        SrcAlphaBlend = One
        DestAlphaBlend = Zero
        VertexShader = make_face_vs
        PixelShader = make_face_ps
        ShaderMacro = ""
        VSEntry = main
        PSEntry = main
        WriteDepth = 1
        TestDepth = 0
        ZTestFunc = LEqual
        CullMode = Off
        WhetherClearColor = 1
        ClearColor = (0.000000,0.000000,0.000000,1.000000)
        Input = InputTextureSampler @Bilinear @ClampU @ClampV
        Input = InputBeautySampler @Bilinear @ClampU @ClampV
        Output = OutputRenderTarget
    }
}
MaterialParameters
{
    float stepCount
	floatArray m
    floatArray intensityX
    floatArray intensityY
    floatArray circleCenterX
    floatArray circleCenterY
    floatArray circleSizeX
    floatArray circleSizeY
    floatArray circleType
}
MaterialUserParameters
{
	float radiusLeft
	<
		name = "radius of the left"
		widget = "slider"
		min = 0.000000
		max = 100.000000
		step = 0.100000
	> = 0.000000

	float2 centerLeft
	<
		name = "center of the left"
		widget = "input2"
		min = 0.000000
		max = 100.000000
		step = 0.100000
	> = (0.000000,0.000000)

	float radiusRight
	<
		name = "radius of the right"
		widget = "slider"
		min = 0.000000
		max = 100.000000
		step = 0.100000
	> = 0.000000

	float2 centerRight
	<
		name = "center of the right"
		widget = "input2"
		min = 0.000000
		max = 100.000000
		step = 0.100000
	> = (0.000000,0.000000)

	float scale
	<
		name = "scaling for the eyes"
		widget = "slider"
		min = 0.000000
		max = 100.000000
		step = 0.100000
	> = 0.000000

	float intensity
	<
		name = "input intensity for big eyes"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.100000
	> = 0.300000

	float2 ViewportSize
	<
		name = "size of the viewport"
		widget = "input2"
		min = 0.000000
		max = 4000.000000
		step = 1.000000
	> = (0.000000,0.000000)

}
