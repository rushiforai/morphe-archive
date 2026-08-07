
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
		VertexShader = fl_opt_rt_vs
		PixelShader = fl_opt_rt_ps
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
		Output = OutputRenderTarget
	}
}
MaterialParameters
{
	float2      ViewportSize
	float       liquefyCount  
	float       FaceDetected
	float3      CameraPos
	floatArray  Coefficients
    matrix4Array PointsMatrixInverse
    matrix4 ViewProjectionMatrixInverse
}
MaterialUserParameters
{
}
	