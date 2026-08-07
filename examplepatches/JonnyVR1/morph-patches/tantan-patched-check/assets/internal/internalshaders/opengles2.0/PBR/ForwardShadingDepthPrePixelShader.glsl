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
	PSOutColor = vec4(0.0, 0.0, 0.0, 0.0);
}