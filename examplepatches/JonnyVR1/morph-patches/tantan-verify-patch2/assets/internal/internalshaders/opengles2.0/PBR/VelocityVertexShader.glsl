#include "Common.glsl"
#include "MaterialCommon.glsl"
#include "VertexDef.glsl"

out vec4 VSOutScreenPosition;
out vec4 VSOutPreScreenPosition;
out vec4 VSOutPosition;


void main()
{
	// VirStru_VertexDef_Intermediates VDIntermediates = VirFunc_VertexDef_GetIntermediates();
	// vec4 WorldPosition = VirFunc_VertexDef_GetWorldPosition(VDIntermediates);
	// Stru_VertexParam VertexParameters = VirFunc_VertexDef_GetMaterialVertexParameters(VDIntermediates, WorldPosition.xyz);
	
	// WorldPosition.xyz += InternalFunc_MaterialGetWorldPositionOffset(VertexParameters);


	// vec4 PreWorldPosition = VirFunc_VertexDef_GetPreWorldPosition(VDIntermediates);
	// Stru_VertexParam PreVertexParameters = VirFunc_VertexDef_GetMaterialVertexParameters(VDIntermediates, PreWorldPosition.xyz);
	// PreWorldPosition.xyz += InternalFunc_MaterialGetWorldPositionOffset(PreVertexParameters);
	
	// // #if MATERIAL_BLEND_MODE_MASKED
	// // 	Output.VertexDefInterpolants = VirFunc_VertexDef_GetInterpolantsVSToPS(Input, VDIntermediates);
	// // 	Output.WorldPosition = WorldPosition;
	// // 	Output.WorldPosition_CamRelative = float4(WorldPosition.xyz - UniParam_CameraPos, 1.0);
	// // #endif //MATERIAL_BLEND_MODE_MASKED

	// gl_Position = UniParam_WorldToClip * WorldPosition;
	// VSOutPosition = gl_Position;
	// VSOutScreenPosition = gl_Position;
	// VSOutPreScreenPosition = UniParam_PreWorldToClip * PreWorldPosition;
}