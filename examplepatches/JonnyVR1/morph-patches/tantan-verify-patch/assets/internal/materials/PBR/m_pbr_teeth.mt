MaterialProperties
{
    PBR = 1
	BlendMode = Opaque
	ShadingModel = Subsurface
	Domain = Surface
	CullMode = Back
	ShaderFile = M_Teeth
	UserMaterialShader = 0
}
MaterialParameters
{
	float MaterialParam_GumsColorU
	<
		name = "GumsColorU"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.35

	float MaterialParam_GumsColorV
	<
		name = "GumsColorV"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.35

	float MaterialParam_PlaqueColorU
	<
		name = "PlaqueColorU"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.35

	float MaterialParam_PlaqueColorV
	<
		name = "PlaqueColorV"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.35

	float MaterialParam_TeethColorU
	<
		name = "TeethColorU"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.35

	float MaterialParam_TeethColorV
	<
		name = "TeethColorV"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.35

	float MaterialParam_CameraForwardCheat
	<
		name = "CameraForwardCheat"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.4

	float MaterialParam_DetailAmount
	<
		name = "DetailAmount"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.3

	float MaterialParam_DetailScale
	<
		name = "DetailScale"
		widget = "slider"
		min = 0.000000
		max = 10.000000
		step = 0.10000
	> = 3.0

	float MaterialParam_DimReflectionsRange
	<
		name = "DimReflectionsRange"
		widget = "slider"
		min = 0.000000
		max = 10.000000
		step = 0.010000
	> = 0.35

	float MaterialParam_NormalStrength
	<
		name = "NormalStrength"
		widget = "slider"
		min = 0.000000
		max = 10.000000
		step = 0.010000
	> = 1.0

	float MaterialParam_PlaqueAmount
	<
		name = "PlaqueAmount"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.12

	float MaterialParam_Roughness
	<
		name = "Roughness"
		widget = "slider"
		min = 0.000000
		max = 1.000000
		step = 0.010000
	> = 0.3

	float4 MaterialParam_TeethTint
	<
		name = "NoseColor"
		widget = "input4"
		min = 0.000000
		max = 1.000000
		step = 0.000000
	> = (1.0,1.0,1.0,1.0)

	texture2D MaterialParam_TeethColorTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "TeethColor Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_GumsColorPickerTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "GumsColorPicker Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_TeethColorPickerTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "TeethColorPicker Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_PlaqueColorPickerTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "PlaqueColorPicker Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_GumsDivTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "GumsDiv Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_TeethMasksTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "TeethMasks Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_TeethMouseOcclusionTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "TeethMouseOcclusion Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_TeethNormalTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "TeethNormal Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_SkinNTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "SkinN Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""

	texture2D MaterialParam_TeethGumsNormalTexture @WrapU @WrapV @WrapW @Trilinear
	<
		name = "TeethGumsNormal Texture"
		widget = "texture"
		min = 0.000000
		max = 0.000000
		step = 0.000000
	> = ""
}
