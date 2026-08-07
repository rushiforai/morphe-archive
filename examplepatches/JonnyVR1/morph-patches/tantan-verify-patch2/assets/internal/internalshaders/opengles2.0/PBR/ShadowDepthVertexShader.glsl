#define SHADOW_DEPTH_SHADER 1

#include "Common.glsl"
#include "MaterialCommon.glsl"
#include "VertexDef.glsl"

uniform mat4 UniParam_ShadowDepth_TransformMatrix;

out vec4 VSOutWorldPosition;
out vec4 VSOutWorldPosition_CamRelative;
out vec4 VSOutScreenPosition;
out vec4 VSOutPosition;
out vec4 VSOutShadowPosition; // DX-ruled clip space position, convenient for linear depth calculation.

void main()
{
	VirStru_VertexDef_Intermediates VDIntermediates = VirFunc_VertexDef_GetIntermediates();
	vec4 WorldPosition = VirFunc_VertexDef_GetWorldPosition(VDIntermediates);
	Stru_VertexParam VertexParameters = VirFunc_VertexDef_GetMaterialVertexParameters(VDIntermediates, WorldPosition.xyz);
	
	WorldPosition.xyz += InternalFunc_MaterialGetWorldPositionOffset(VertexParameters);
	VirFunc_VertexDef_GetInterpolantsVSToPS(VDIntermediates);
	gl_Position = UniParam_WorldToClip * WorldPosition;
	VSOutWorldPosition = WorldPosition;
	VSOutWorldPosition_CamRelative = vec4(WorldPosition.xyz - UniParam_CameraPos, 1.0f);
	VSOutPosition = gl_Position;
	VSOutScreenPosition = gl_Position;
	VSOutShadowPosition = UniParam_ShadowDepth_TransformMatrix * WorldPosition;
}