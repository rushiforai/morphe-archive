
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
		VertexShader = face_liquefy_vs
		PixelShader = face_liquefy_ps
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
    float Number;
    float4Array Coeffs
    float3 CameraPos
    matrix4Array PointsMatrixInverse
    matrix4 ViewProjectionMatrixInverse
}
MaterialUserParameters
{
}
	