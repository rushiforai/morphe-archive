#define SHADOW_DEPTH_SHADER 1

#include "Common.glsl"
#include "MaterialCommon.glsl"
#include "ForwardShadingPixelShaderCommon.glsl"

uniform float UniParam_ShadowDepth_InvSubjectDepth;

in vec4 VSOutShadowPosition;

void main()
{
#if MATERIAL_BLEND_MODE_MASKED
	Stru_PixelParam PixelParameters = VirFunc_VertexDef_GetMaterialPixelParameters();
	Stru_SharedVariables SharedVariables;
	InternalFunc_MaterialCalcPixelParameters(PixelParameters,
										SharedVariables,
										gl_FrontFacing, 
										VSOutPosition, 
										VSOutWorldPosition, 
										VSOutWorldPosition_CamRelative,
										vec3(0.0, 0.0, 0.0));

	//Alpha test
	InternalFunc_MaterialClipping(PixelParameters, SharedVariables);
#endif

	PSOutColor = vec4(1.0, 0.0, 0.0, 1.0);
	gl_FragDepth = VSOutShadowPosition.z * UniParam_ShadowDepth_InvSubjectDepth; // Linear depth in range from 0.0 to 1.0
}