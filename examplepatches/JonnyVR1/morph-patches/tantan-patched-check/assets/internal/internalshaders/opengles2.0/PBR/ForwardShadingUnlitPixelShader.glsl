#include "Common.glsl"
#include "MaterialCommon.glsl"
#include "ForwardShadingPixelShaderCommon.glsl"

void main()
{
	Stru_PixelParam PixelParameters = VirFunc_VertexDef_GetMaterialPixelParameters();
	InternalFunc_MaterialCalcPixelParameters(PixelParameters,
										gl_FrontFacing, 
										VSOutPosition, 
										VSOutWorldPosition, 
										VSOutWorldPosition_CamRelative,
										vec3(0.0, 0.0, 0.0));

	//Alpha test
	InternalFunc_MaterialClipping(PixelParameters);

	vec3  Emissive = InternalFunc_MaterialGetEmissive(PixelParameters);
    PSOutColor.rgb = Emissive;
#if MATERIAL_BLEND_MODE_TRANSLUCENT
    float Opacity = InternalFunc_MaterialGetOpacity(PixelParameters);
    PSOutColor.a = Opacity;
#else
    PSOutColor.a = 1.0;
#endif
}