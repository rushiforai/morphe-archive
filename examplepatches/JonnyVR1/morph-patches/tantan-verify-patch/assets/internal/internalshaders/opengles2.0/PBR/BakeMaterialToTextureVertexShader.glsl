#include "Common.glsl"
#include "MaterialCommon.glsl"
#include "VertexDef.glsl"

out vec4 VSOutWorldPosition;
out vec4 VSOutWorldPosition_CamRelative;
out vec4 VSOutPosition;

void main()
{
	VirStru_VertexDef_Intermediates VDIntermediates = VirFunc_VertexDef_GetIntermediates();
	
	vec4 WorldPosition = VirFunc_VertexDef_GetWorldPosition(VDIntermediates);
	Stru_VertexParam VertexParameters = VirFunc_VertexDef_GetMaterialVertexParameters(VDIntermediates, WorldPosition.xyz);
	WorldPosition.xyz += InternalFunc_MaterialGetWorldPositionOffset(VertexParameters);

	VSOutWorldPosition = WorldPosition;
	VSOutWorldPosition_CamRelative = vec4(WorldPosition.xyz - UniParam_CameraPos, 1.0f);
	VirFunc_VertexDef_GetInterpolantsVSToPS(VDIntermediates);

	VSOutPosition = UniParam_WorldToClip * VSOutWorldPosition;
	gl_Position = vec4(Texcoord1.xy * 2.0f - 1.0f, 0.0f, 1.0f);
}