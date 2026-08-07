MaterialProperties
{
    PBR = 1
	BlendMode = Mask
	ShadingModel = Hair
	Domain = Surface
	CullMode = None
	ShaderFile = M_Hair
	UserMaterialShader = 0
}
MaterialParameters
{
	texture2D MaterialParam_DepthTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Depth Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_CoverageTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Coverage Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_TangentTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Tangent Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_AttributeTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Attribute Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_TilingNoiseTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "TilingNoise Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_Good64x64TilingNoiseHighFreqTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "Good64x64TilingNoiseHighFreq Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""
 
    texture2D MaterialParam_PaintMaskTexture @WrapU @WrapV @WrapW @Trilinear
    <
        name = "PaintMask Texture"
        widget = "texture"
        min = 0.000000
        max = 0.000000
        step = 0.000000
    > = ""

    float4 MaterialParam_HairDye
    <
        name = "HairDye"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (1.0,1.0,1.0,1.0)
    
    float4 MaterialParam_PaintColor
    <
        name = "PaintColor"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (0.0,0.0,0.0,1.0)

    float4 MaterialParam_ParamGoup_0
    <
        name = "Desat, HairMelanin, HairRedness, HairRoughness"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (0.0,0.16,0.25,0.37)
    
    float4 MaterialParam_ParamGoup_1
    <
        name = "MelaninVariationFine, MelaninVariationRough, RedVariation, RoughnessVariation"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (0.5,0.15,0.0,0.25)
    
    float4 MaterialParam_ParamGoup_2
    <
        name = "OpacityFar, OpacityNear, OpacityPowFar, OpacityPowNear"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (2.0,2.0,0.5,0.5)
    
    float4 MaterialParam_ParamGoup_3
    <
        name = "Spec0, Spec1, SpecEdge, SpecFront"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (0.45,0.75,0.5,0.5)
    
    float4 MaterialParam_ParamGoup_4
    <
        name = "WhiteAmount, WhiteMelaninVariation, WhiteMelaninHigh, WhiteMelaninLow"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (0.0,0.3,0.05,0.15)
    
    float4 MaterialParam_ParamGoup_5
    <
        name = "PixelDepthOffset, Scraggle, Scatter, OpacityClipValue"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (1.0,0.15,0.0,0.333)
}
