
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
		VertexShader = face_stretch_vs
		PixelShader = face_stretch_ps
		ShaderMacro = ""
		VSEntry = main
		PSEntry = main
		WriteDepth = 0
		TestDepth = 0
		ZTestFunc = LEqual
		CullMode = Off
		WhetherClearColor = 0
		ClearColor = (0.000000,0.000000,0.000000,1.000000)
		Input = InputTextureSampler @Bilinear @ClampU @ClampV
		Output = OutputRenderTarget
	}
}
MaterialParameters
{

}
MaterialUserParameters
{

}
	