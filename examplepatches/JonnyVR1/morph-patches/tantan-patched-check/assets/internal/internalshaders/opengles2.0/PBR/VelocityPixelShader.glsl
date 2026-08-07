#include "Common.glsl"
#include "MaterialCommon.glsl"
#include "ForwardShadingPixelShaderCommon.glsl"

#if SHADERDEF_BASSPASS_VELOCITY
in vec4 VSOutPreScreenPosition;
#endif

void main()
{
// #if MATERIAL_BLEND_MODE_MASKED
// 	Stru_PixelParam PixelParameters = VirFunc_VertexDef_GetMaterialPixelParameters(Input.VertexDefInterpolants);
// 	InternalFunc_MaterialCalcPixelParameters(PixelParameters,
// 										Input.Position,
// 										IsFrontFace,
// 										Input.WorldPosition,
// 										Input.WorldPosition_CamRelative,
// 										0);
// 	InternalFunc_MaterialClipping(PixelParameters);

// #endif //MATERIAL_BLEND_MODE_MASKED
	vec2 Velocity = VSOutScreenPosition.xy / VSOutScreenPosition.w - VSOutPreScreenPosition.xy / VSOutPreScreenPosition.w;
	PSOutColor = vec4(Velocity, 0.0, 1.0);
}