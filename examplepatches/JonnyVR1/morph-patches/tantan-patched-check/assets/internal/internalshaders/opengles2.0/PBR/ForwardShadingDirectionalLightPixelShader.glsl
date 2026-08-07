#include "Common.glsl"
#include "MaterialCommon.glsl"
#include "ForwardShadingPixelShaderCommon.glsl"
#include "ForwardShadingLightCommon.glsl"
#include "IndirectLightingCommon.glsl"

#if !MATERIAL_SHADING_MODEL_UNLIT
uniform UniParamBlock_Light
{ 
	uniform mat4 UniParam_MovableLight_Param[4];	// mat[0] : Pos(.xyz)InvRadius(.w)  mat[1] : Color(.xyz)Falloff(.w)  mat[2] : Dir(.xyz)Type(.w)  mat[3] : Angle(.xy)Movability(.z)ShadowIndex(.w)
    uniform int UniParam_MovableLight_Num;
    uniform vec3 UniParam_DirectionalLight_Dir;		// Point to light.
    uniform vec3 UniParam_DirectionalLight_Color;	// Pre-multiplied intensity.
	uniform int UniParam_DirectionalLight_Movability;
};

bool IsStaticLight(int LightMovability)
{
	return (LightMovability == 0);
}

void GetMovableLight(mat4 LightParam, out LightData Light, out vec3 L, out float Attenuation)
{
	Light.LightPosition = LightParam[0].xyz;
	Light.LightDirection = LightParam[2].xyz;
	Light.LightColor = LightParam[1].xyz;
	Light.IsRadialLight = true;
	Light.IsStaticLight = IsStaticLight(int(LightParam[3].z));

    vec3 ToLight = LightParam[0].xyz - VSOutWorldPosition.xyz;
    float DistanceSqr = dot(ToLight, ToLight);
    L = ToLight * InternalFunc_rsqrt(DistanceSqr);

    if (LightParam[1].w == 0.0) //Bug
    {
        Attenuation = 1.0 / (DistanceSqr + 1.0);
		float LightRadiusMask = InternalFunc_Square(clamp(1.0 - InternalFunc_Square(DistanceSqr * (LightParam[0].w * LightParam[0].w)), 0.0, 1.0));
		Attenuation *= LightRadiusMask;
    }
    else
    {
        vec3 ToLightInvRadius = ToLight * LightParam[0].w;
        Attenuation = max(pow(clamp(1.0 - dot(ToLightInvRadius, ToLightInvRadius), 0.0, 1.0), LightParam[1].w), 0.0);
	}

    if (LightParam[2].w > 0.5) // Spot light
    {
        float mask = clamp((dot(L, LightParam[2].xyz) - LightParam[3].x) * LightParam[3].y, 0.0, 1.0);
        Attenuation *= InternalFunc_Square(mask);
		Light.ShadowIndex = int(LightParam[3].w);	// Shadow enabled spot light.
    }
	else
	{
		Light.ShadowIndex = -1;
	}
}
#endif

void main()
{
	PSOutColor = vec4(0.0, 0.0, 0.0, 1.0);
	
	Stru_PixelParam PixelParameters = VirFunc_VertexDef_GetMaterialPixelParameters();

    vec3 LightDir = vec3(0.0, 0.0, 0.0);
#if !MATERIAL_SHADING_MODEL_UNLIT
    LightDir = UniParam_DirectionalLight_Dir;
#endif
	Stru_SharedVariables SharedVariables;
	InternalFunc_MaterialCalcPixelParameters(PixelParameters,
										SharedVariables,
										gl_FrontFacing, 
										VSOutPosition, 
										VSOutWorldPosition, 
										VSOutWorldPosition_CamRelative,
										LightDir);

	// Alpha test.
	InternalFunc_MaterialClipping(PixelParameters, SharedVariables);

	float Opacity = InternalFunc_MaterialGetOpacity(PixelParameters, SharedVariables);

	// Lighting color, we do lighting in geometry pass.
	vec3 Color = vec3(0.0);

	// Emissive.
	vec3 Emissive = InternalFunc_MaterialGetEmissive(PixelParameters, SharedVariables);	
    Color += Emissive;

#if !MATERIAL_SHADING_MODEL_UNLIT

	// Shading point data.
	ShadingData Data;
	Data.Opacity = Opacity;
	Data.WorldNormal = PixelParameters.WorldNormal;
    Data.BaseColor = InternalFunc_MaterialGetBaseColor(PixelParameters, SharedVariables);
	Data.Metallic = InternalFunc_MaterialGetMetallic(PixelParameters, SharedVariables);
	Data.Specular = InternalFunc_MaterialGetSpecular(PixelParameters, SharedVariables);
	Data.Roughness = InternalFunc_MaterialGetRoughness(PixelParameters, SharedVariables);
    vec3 DiffuseColor = Data.BaseColor - Data.BaseColor * Data.Metallic;
	vec3 SpecularColor = mix(0.08 * vec3(Data.Specular), Data.BaseColor, vec3(Data.Metallic));
	Data.DiffuseColor = DiffuseColor;
	Data.SpecularColor = SpecularColor;

	// Camera vector.
	vec3 V = normalize(UniParam_CameraPos - PixelParameters.WorldPosition); // Point to camera.

	// Shading model related custom data.
#if MATERIAL_SHADING_MODEL_SUBSURFACE_PROFILE
	Data.DiffuseColor = vec3(1.0, 1.0, 1.0);
	if (Data.Opacity > 0.0)
	{
		float AverageToRoughness0 = 0.0;
		float AverageToRoughness1 = 0.0;
		float LobeMix = 0.0;
		float MaterialRoughnessToAverage = 0.0;
		GetProfileDualSpecular(UniParam_MaterialCommon_SSSIndex, AverageToRoughness0, AverageToRoughness1, LobeMix, MaterialRoughnessToAverage);
		MaterialRoughnessToAverage = mix(1.0, MaterialRoughnessToAverage, clamp(Data.Opacity * 10.0, 0.0, 1.0));
		Data.Roughness = clamp(Data.Roughness * MaterialRoughnessToAverage, 0.0, 1.0);
	}
#elif MATERIAL_SHADING_MODEL_EYE
	Data.DiffuseColor = vec3(1.0, 1.0, 1.0);	
	float IrisMask = InternalFunc_MaterialGetIrisMask(PixelParameters, SharedVariables);
	float IrisDistance = InternalFunc_MaterialGetIrisDistance(PixelParameters, SharedVariables);
	vec3 PlaneNormal = normalize(InternalFunc_MaterialGetTangentOutput(PixelParameters, SharedVariables));
	vec3 CausticNormal = normalize(mix(PlaneNormal, -Data.WorldNormal, IrisMask * IrisDistance));
	vec3 IrisNormal = PlaneNormal;
	Data.CustomData0.xyz = IrisNormal;
	Data.CustomData1.xyz = CausticNormal;
	Data.CustomData1.w = IrisMask;
#elif MATERIAL_SHADING_MODEL_CLOTH
	vec4 SubsurfaceColor = InternalFunc_MaterialGetSubsurfaceData(PixelParameters, SharedVariables);
	float Cloth = InternalFunc_MaterialGetCloth(PixelParameters, SharedVariables);
	Data.CustomData0.xyz = SubsurfaceColor.rgb;
	Data.CustomData0.w = Cloth;
#endif

	// Direction light data.
	LightData Light;
	Light.LightPosition = vec3(0.0);
	Light.LightDirection = normalize(UniParam_DirectionalLight_Dir);
	Light.LightColor = UniParam_DirectionalLight_Color;
	Light.IsRadialLight = false;	// Direction light.
	Light.IsStaticLight = IsStaticLight(UniParam_DirectionalLight_Movability);
	Light.ShadowIndex = 0;			// Nonsense for direction light.

	vec3 L = Light.LightDirection;
	float LightAttenuation = 1.0;

	DirectLighting Lighting;
	InitDirectLighting(Lighting);

	// Direction lighting.
	if (!Light.IsStaticLight)
	{
		Lighting = GetDynamicLighting(Data, Light, L, V, LightAttenuation);
	}

	// Radial lights.
    for (int i = 0; i < UniParam_MovableLight_Num; ++i)
    {
        GetMovableLight(UniParam_MovableLight_Param[i], Light, L, LightAttenuation);
		if (!Light.IsStaticLight)
		{
        	DirectLighting MovableLighting = GetDynamicLighting(Data, Light, L, V, LightAttenuation);
        	Lighting.Diffuse += MovableLighting.Diffuse;
        	Lighting.Specular += MovableLighting.Specular;
        	Lighting.Transmission += MovableLighting.Transmission;
		}
    }

#if LIGHT_MAP_ENABLE
	Lighting.Diffuse += Data.DiffuseColor * GetLightmapLighting(PixelParameters.LightmapTexCoord);
#endif // LIGHT_MAP_ENABLE

#if SKY_DIFFUSE_ENABLE
	Lighting.Diffuse += GetSkyDiffuseLighting(Data.DiffuseColor, Data.WorldNormal);
#endif

#if IBL_ENABLE
#if MATERIAL_SHADING_MODEL_HAIR
	SpecularColor = vec3(0.0);
#endif
	Lighting.Specular += GetReflectionEnvironment(SpecularColor, Data.WorldNormal, V, PixelParameters.ReflectionVector, Data.Roughness);
#endif // IBL_ENABLE

#if MATERIAL_BLEND_MODE_OPAQUE || MATERIAL_BLEND_MODE_MASKED
	// Ambient occlusion.
	float AO = InternalFunc_MaterialGetAmbientOcclusion(PixelParameters, SharedVariables);
	Lighting.Diffuse *= AO;
	Lighting.Specular *= AO;
	Lighting.Transmission *= AO;
#endif

	Color += Lighting.Diffuse + Lighting.Specular + Lighting.Transmission;

#endif // !MATERIAL_SHADING_MODEL_UNLIT


	// Encode into RTs.

#if MATERIAL_BLEND_MODE_ADDITIVE
    PSOutColor = vec4(Color * Opacity, Opacity);
#else
	//PSOutColor = ComFunc_ForwardShadingCommon_BlendAdd(PixelParameters, VSOutScreenPosition, Color);
	PSOutColor = vec4(Color, Opacity);
#endif // MATERIAL_BLEND_MODE_ADDITIVE

#if RENDER_SUBSURFACE_PROFILE

#if !MATERIAL_SHADING_MODEL_UNLIT	
	PSOutBaseColor = vec4(Data.BaseColor, 0.0);
#else
	PSOutBaseColor = vec4(0.0);
#endif

#if MATERIAL_SHADING_MODEL_DEFAULT_LIT
	PSOutCustomData = vec4(0.0, float(SHADING_MODEL_ID_DEFAULT_LIT), 0.0, 0.0);
#elif MATERIAL_SHADING_MODEL_SUBSURFACE
	PSOutCustomData = vec4(0.0, float(SHADING_MODEL_ID_SUBSURFACE), 0.0, 0.0);
#elif MATERIAL_SHADING_MODEL_HAIR
	PSOutCustomData = vec4(0.0, float(SHADING_MODEL_ID_HAIR), 0.0, 0.0);
#elif MATERIAL_SHADING_MODEL_CLOTH
	PSOutCustomData = vec4(0.0, float(SHADING_MODEL_ID_CLOTH), 0.0, 0.0);
#elif MATERIAL_SHADING_MODEL_SUBSURFACE_PROFILE
	float NonSpecularLuminance = InternalFunc_Luminance(Lighting.Diffuse + Lighting.Transmission);
	PSOutCustomData = vec4(NonSpecularLuminance, float(SHADING_MODEL_ID_SUBSURFACE_PROFILE), float(UniParam_MaterialCommon_SSSIndex), Opacity); // Scattering intensity indicated by opacity stored into alpha channel.
#elif MATERIAL_SHADING_MODEL_EYE
	float NonSpecularLuminance = InternalFunc_Luminance(Lighting.Diffuse + Lighting.Transmission);
	PSOutCustomData = vec4(NonSpecularLuminance, float(SHADING_MODEL_ID_EYE), float(UniParam_MaterialCommon_SSSIndex), 1.0 - IrisMask); // Scattering intensity indicated by opacity stored into alpha channel.
#else
	PSOutCustomData = vec4(0.0, float(SHADING_MODEL_ID_UNLIT), 0.0, 0.0);
#endif

#endif // RENDER_SUBSURFACE_PROFILE

#if RENDER_VELOCITY
	PSOutVelocity = VSOutScreenPosition.xy / VSOutScreenPosition.w - VSOutPreScreenPosition.xy / VSOutPreScreenPosition.w
					- (UniParam_TemporalAAJitters.xy - UniParam_TemporalAAJitters.zw) * 2.0;
#endif

}
