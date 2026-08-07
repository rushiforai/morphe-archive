#include "Common.glsl"
#include "MaterialCommon.glsl"

in vec4 VSOutWorldPosition;
in vec4 VSOutWorldPosition_CamRelative;
in vec4 VSOutPosition;

layout (location = 0) out vec4 PSOutBaseColorOpacity;
layout (location = 1) out vec4 PSOutNormal;
layout (location = 2) out vec4 PSOutMRS;
layout (location = 3) out vec4 PSOutEmissiveColor;

uniform vec3 UniParam_DirectionalLight_Dir;		// Point to light.

void main()
{
	Stru_PixelParam PixelParameters = VirFunc_VertexDef_GetMaterialPixelParameters();

	Stru_SharedVariables SharedVariables;
	InternalFunc_MaterialCalcPixelParameters(PixelParameters,
										SharedVariables,
										gl_FrontFacing, 
										VSOutPosition, 
										VSOutWorldPosition, 
										VSOutWorldPosition_CamRelative,
										UniParam_DirectionalLight_Dir);

	// Alpha test.
	InternalFunc_MaterialClipping(PixelParameters, SharedVariables);
	
	vec3 BaseColor = InternalFunc_MaterialGetBaseColor(PixelParameters, SharedVariables);
	vec3 Normal = InternalFunc_MaterialGetNormal(PixelParameters, SharedVariables);
	vec3 Emissive = InternalFunc_MaterialGetEmissive(PixelParameters, SharedVariables);
	float Metallic = InternalFunc_MaterialGetMetallic(PixelParameters, SharedVariables);
	float Specular = InternalFunc_MaterialGetSpecular(PixelParameters, SharedVariables);
	float Roughness = InternalFunc_MaterialGetRoughness(PixelParameters, SharedVariables);
	float Opacity = InternalFunc_MaterialGetOpacity(PixelParameters, SharedVariables);

#if MATERIAL_BLEND_MODE_OPAQUE || MATERIAL_BLEND_MODE_MASKED
	PSOutBaseColorOpacity = vec4(pow(BaseColor, vec3(0.45f)), 1.0f);
#elif MATERIAL_BLEND_MODE_TRANSLUCENT
	PSOutBaseColorOpacity = vec4(pow(BaseColor, vec3(0.45f)), Opacity);
#endif

	PSOutNormal = vec4(Normal * 0.5 + 0.5, 1.0f);
	PSOutMRS = vec4(Metallic, Roughness, Specular, 1.0f);
	PSOutEmissiveColor = vec4(Emissive, 1.0f);

	// PSOutBaseColorOpacity = vec4(1.0f, 0.0f, 0.0f, 1.0f);
	// PSOutNormal = vec4(0.0f, 1.0f, 0.0f, 1.0f);
	// PSOutMRS = vec4(0.0f, 0.0f, 1.0f, 1.0f);
	// PSOutEmissiveColor = vec4(1.0f, 1.0f, 1.0f, 1.0f);
}
