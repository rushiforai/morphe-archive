
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
		VertexShader = makeup_lips_vs
		PixelShader = makeup_lips_ps
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
	float 		bDetachFace
	float		openMouth
	float       closeThreshold
	float		bSegEnable
    float       segFlipX
    matrix4     uSegMatrix
    float2 ViewportSize
    <
        name = "Viewport Size"
        widget = "input2"
        min = 0.000000
        max = 0.000000
        step = 0.000000
    > = (0.000000,0.000000)
    float2 segImageSize
    <
        name = "Seg Image Size"
        widget = "input2"
        min = 0.000000
        max = 0.000000
        step = 0.000000
    > = (0.000000,0.000000)
    texture2D SegMaskTextureSampler @ClampU @ClampV @ClampW @Trilinear
    <
       name = "SegMaskTextureSampler"
       widget = "texture"
       min = 0.000000
       max = 0.000000
       step = 0.000000
    > = "default_texture_path"
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

	texture2D SucaiTextureSampler2 @ClampU @ClampV @ClampW @Trilinear
	<
	   name = "SucaiTextureSampler2"
	   widget = "texture"
	   min = 0.000000
	   max = 0.000000
	   step = 0.000000
	> = "default_texture_path"

	texture2D LutMaskTextureSampler @ClampU @ClampV @ClampW @Trilinear
	<
	   name = "LutMaskTextureSampler"
	   widget = "texture"
	   min = 0.000000
	   max = 0.000000
	   step = 0.000000
	> = "default_texture_path"
	texture2D MouthMaskTextureSampler @ClampU @ClampV @ClampW @Trilinear
	<
	   name = "MouthMaskTextureSampler"
	   widget = "texture"
	   min = 0.000000
	   max = 0.000000
	   step = 0.000000
	> = "default_texture_path"

	texture2D NoiseTextureSampler @ClampU @ClampV @ClampW @Trilinear
	<
	   name = "NoiseTextureSampler"
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
		name = "Makeup Intensity"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000

	float lipsType
	<
		name = "Lips Type"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.000000
}
