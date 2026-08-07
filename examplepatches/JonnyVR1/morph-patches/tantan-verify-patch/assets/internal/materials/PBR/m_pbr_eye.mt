MaterialProperties
{
    PBR = 1
	BlendMode = Opaque
	ShadingModel = Eye
	Domain = Surface
	CullMode = Back
	ShaderFile = M_Eye
	UserMaterialShader = 0
}
MaterialParameters
{
	texture2D MaterialParam_ScleraBaseColorTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "ScleraBaseColor Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_ScleraNormalTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "ScleraNormal Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_EyeMidPlaneDisplacementTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "EyeMidPlaneDisplacement Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_EyeNTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "EyeN Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_VeinsColorTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "VeinsColor Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_EyeMaskTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "EyeMask Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

    texture2D MaterialParam_ScleraTintPicker @WrapU @WrapV @WrapW @Trilinear
	<
		name = "ScleraTintPicker Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

    texture2D MaterialParam_IrisColorPicker @WrapU @WrapV @WrapW @Trilinear
	<
		name = "IrisColorPicker Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""
    
    float4 MaterialParam_IrisParamGroup_0
    <
        name = "PupilScale, IrisUVRadius, RefractionDepthScale"
        widget = "input4"
        min = 0.000000
        max = 10.000000
        step = 0.10000
    > = (0.25,0.0,0.13,1.0)

    float4 MaterialParam_IrisParamGroup_3
    <
        name = "IrisBrightness, IrisSaturation, IrisRoughness, IrisSpecularity"
        widget = "input4"
        min = 0.000000
        max = 10.000000
        step = 0.10000
    > = (1.0,1.0,0.1,0.4)

    float4 MaterialParam_IrisGeneratorParamGroup_0
    <
        name = "IrisColor1U, IrisColor1V, IrisColor2U, IrisColor2V"
        widget = "input4"
        min = 0.000000
        max = 10.000000
        step = 0.10000
    > = (0.8,0.3,0.5,0.3)
    
    float4 MaterialParam_IrisGeneratorParamGroup_1
    <
        name = "IrisColorBalance, IrisColorBalanceSmoothness, limbusDarkAmount, RadialStructuralBlendSwitch"
        widget = "input4"
        min = 0.000000
        max = 10.000000
        step = 0.10000
    > = (0.5,0.5,0.5,0.0)

    float4 MaterialParam_IrisGeneratorParamGroup_2
    <
        name = "IrisColorHueVariation, IrisColorValueVariation, IrisSaturationVariation, AOinIris"
        widget = "input4"
        min = 0.000000
        max = 10.000000
        step = 0.10000
    > = (0.1,0.25,0.25,0.7)
    
    float4 MaterialParam_ScleraParamGroup_0
    <
        name = "FlattenNormal, ScleraBrightness, ScleraRoughness, ScleraSpecularity"
        widget = "input4"
        min = 0.000000
        max = 10.000000
        step = 0.10000
    > = (0.7,1.0,0.4,0.6)
    
    float4 MaterialParam_ScleraParamGroup_1
    <
        name = "ScleraTintU, ScleraTintV, ScleraPower, VeinsPower"
        widget = "input4"
        min = 0.000000
        max = 10.000000
        step = 0.10000
    > = (1.0,0.0,0.1,0.4)
}
