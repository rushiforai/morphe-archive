#include "Common.glsl"
#include "MaterialCommon.glsl"
#include "ForwardShadingPixelShaderCommon.glsl"

layout (location = 1) out vec4 PSOutBaseColor;
#if SHADERDEF_BASSPASS_VELOCITY
in vec4 VSOutPreScreenPosition;
layout (location = 2) out vec4 PSOutVelocity;
#endif

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

	InternalFunc_MaterialCalculateSharedVariables(PixelParameters);
	vec3 BaseColor = InternalFunc_MaterialGetBaseColor(PixelParameters);
	float Specular	= InternalFunc_MaterialGetSpecular(PixelParameters);
	float Opacity = InternalFunc_MaterialGetOpacity(PixelParameters);

	float EncodedSSSIndex = 0.0;
#if SHADERDEF_BASSPASS_VELOCITY	
	vec2 Velocity = VSOutScreenPosition.xy / VSOutScreenPosition.w - VSOutPreScreenPosition.xy / VSOutPreScreenPosition.w;
	PSOutVelocity = vec4(Velocity, 0.0, 1.0);
#endif	
#if MATERIAL_SHADING_MODEL_SUBSURFACE_PROFILE
	EncodedSSSIndex = UniParam_MaterialCommon_SSSIndex / 255.0;
#endif
	PSOutColor = vec4(Specular, UniParam_MaterialCommon_ShadingType / 255.0, Opacity, EncodedSSSIndex);
	PSOutBaseColor = vec4(BaseColor, 1.0);
}