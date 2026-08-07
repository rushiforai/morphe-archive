#include "Common.glsl"
#include "MaterialCommon.glsl"
#include "VertexDef.glsl"

out vec4 VSOutWorldPosition;
out vec4 VSOutWorldPosition_CamRelative;
out vec4 VSOutScreenPosition;
out vec4 VSOutPreScreenPosition;
out vec4 VSOutPosition;

void main()
{
	VirStru_VertexDef_Intermediates VDIntermediates = VirFunc_VertexDef_GetIntermediates();
	
	vec4 WorldPosition = VirFunc_VertexDef_GetWorldPosition(VDIntermediates);
	Stru_VertexParam VertexParameters = VirFunc_VertexDef_GetMaterialVertexParameters(VDIntermediates, WorldPosition.xyz);
	WorldPosition.xyz += InternalFunc_MaterialGetWorldPositionOffset(VertexParameters);

	vec4 PreWorldPosition = VirFunc_VertexDef_GetPreWorldPosition(VDIntermediates);
	Stru_VertexParam PreVertexParameters = VirFunc_VertexDef_GetMaterialVertexParameters(VDIntermediates, PreWorldPosition.xyz);
	PreWorldPosition.xyz += InternalFunc_MaterialGetWorldPositionOffset(PreVertexParameters);

	VSOutWorldPosition = WorldPosition;
	VSOutWorldPosition_CamRelative = vec4(WorldPosition.xyz - UniParam_CameraPos, 1.0f);
	VirFunc_VertexDef_GetInterpolantsVSToPS(VDIntermediates);
	gl_Position = UniParam_WorldToClip * VSOutWorldPosition;
	VSOutPosition = gl_Position;
	VSOutScreenPosition = gl_Position;

	VSOutPreScreenPosition = UniParam_PreWorldToClip * PreWorldPosition;
}