MaterialProperties
{
    PBR = 1
	BlendMode = Translucent
	ShadingModel = Unlit
	Domain = Surface
	CullMode = Back
	ShaderFile = M_EyeOcclusion
	UserMaterialShader = 0
}
MaterialParameters
{
	float4 MaterialParam_BlurColor
	<
		name = "BlurColor"
		widget = "input4"
		min = 0.000000
		max = 1.000000
		step = 0.000000
	> = (1.0,1.0,1.0,1.0)
 
    float4 MaterialParam_ShadowTint
    <
        name = "ShadowTint"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (0.0,0.0,0.0,1.0)

    float4 MaterialParam_ParamGroup_0
    <
        name = "BlurSize, ShadowMultiply"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (0.0,0.0,0.0,0.0)
    
    float4 MaterialParam_BlurParamGroup_0
    <
        name = "BottomBlurHardness, BottomBlurRadius, TopBlurHardness, TopBlurRadius"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (0.0,0.3,0.0,0.3)
    
    float4 MaterialParam_BlurParamGroup_1
    <
        name = "InnerBlurHardness, InnerBlurRadius, OuterBlurHardness, OuterBlurRadius"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (0.0,0.3,0.0,0.3)
    
    float4 MaterialParam_BlurBorderParamGroup_0
    <
        name = "BottomBlurBorderHardness, BottomBlurBorderRadius, TopBlurBorderHardness, TopBlurBorderRadius"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (0.0,0.05,0.0,0.05)
    
    float4 MaterialParam_BlurBorderParamGroup_1
    <
        name = "InnerBlurBorderHardness, InnerBlurBorderRadius, OuterBlurBorderHardness, OuterBlurBorderRadius"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (0.0,0.05,0.0,0.05)
    
    float4 MaterialParam_ShadowParamGroup_0
    <
        name = "BottomShadowHardness, BottomShadowRadius, TopShadowHardness, TopShadowRadius"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (0.0,0.0,0.0,0.0)
    
    float4 MaterialParam_ShadowParamGroup_1
    <
        name = "InnerShadowHardness, InnerShadowRadius, OuterShadowHardness, OuterShadowRadius"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (0.0,0.0,0.0,0.0)

    float4 MaterialParam_ShadowBorderParamGroup_0
    <
        name = "BottomShadowBorderHardness, BottomShadowBorderRadius, TopShadowBorderHardness, TopShadowBorderRadius"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (0.0,0.05,0.0,0.05)
    
    float4 MaterialParam_ShadowBorderParamGroup_1
    <
        name = "InnerShadowBorderHardness, InnerShadowBorderRadius, OuterShadowBorderHardness, OuterShadowBorderRadius"
        widget = "input4"
        min = 0.000000
        max = 1.000000
        step = 0.000000
    > = (0.0,0.05,0.0,0.05)
}
