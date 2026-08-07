#ifndef _FORWARD_SHADING_LIGHT_COMMON_GLSL_
#define _FORWARD_SHADING_LIGHT_COMMON_GLSL_

#include "BRDF.glsl"
#include "Common.glsl"

struct ShadowTerm
{
	float SurfaceShadow;
	float TransmissionShadow;
};

#if SHADOW_ENABLE
#include "ShadowTestCommon.glsl"
#endif

struct DirectLighting
{
	vec3 Diffuse;
	vec3 Specular;
	vec3 Transmission;
};

void InitDirectLighting(out DirectLighting DL)
{
	DL.Diffuse = vec3(0.0);
	DL.Specular = vec3(0.0);
	DL.Transmission = vec3(0.0);
}

struct ShadingData
{
	vec3 WorldNormal;
	vec3 DiffuseColor;
	vec3 SpecularColor;
	vec3 BaseColor;
	float Metallic;
	float Roughness;
	float Specular;
	float Opacity;
	float AO;
	uint ShadingModelID;
	vec4 CustomData0;
	vec4 CustomData1;
};

struct LightData
{
	vec3 LightColor;		// Pre-multiplied intensity.
	vec3 LightPosition;
	vec3 LightDirection;	// Point to light.
	bool IsRadialLight;
	bool IsStaticLight;
	int ShadowIndex;
};

// float ComFunc_LightCommon_RadialAttenuation(vec3 WorldLightVector, float FalloffExponent)
// {
// 	float NormalizeDistanceSquared = dot(WorldLightVector, WorldLightVector);

// 	return pow(1.0 - clamp(NormalizeDistanceSquared, 0.0, 1.0), FalloffExponent);
// }

// float ComFunc_LightCommon_SpotAttenuation(vec3 L, vec3 SpotDirection, vec2 SpotAngles)
// {
// 	float ConeAngleFalloff = InternalFunc_Square(clamp((dot(L, SpotDirection) - SpotAngles.x) * SpotAngles.y, 0.0, 1.0));
// 	return ConeAngleFalloff;
// }

//-----------------------Default lit-----------------------
#if MATERIAL_SHADING_MODEL_DEFAULT_LIT

DirectLighting DefaultLitBxDF(ShadingData Data, vec3 N, vec3 V, vec3 L, float NoL, ShadowTerm Shadow)
{
	vec3 H = normalize(V + L);
	float NoV = abs(dot(N, V)) + 1e-5;
	float NoH = clamp(dot(N, H), 0.0, 1.0);
	float VoH = clamp(dot(V, H), 0.0, 1.0);

	float D = ComFunc_BRDF_Distribution(Data.Roughness, NoH);
	float Vis = ComFunc_BRDF_GeometricVisibility(Data.Roughness, NoV, NoL, VoH);
	vec3 F = ComFunc_BRDF_Fresnel(Data.SpecularColor, VoH);

	DirectLighting Lighting;
	Lighting.Diffuse = ComFunc_BRDF_Diffuse(Data.DiffuseColor, Data.Roughness, NoV, NoL, VoH) * NoL * Shadow.SurfaceShadow;
	Lighting.Specular = (D * Vis) * F * NoL * Shadow.SurfaceShadow;
	Lighting.Transmission = vec3(0.0);

    return Lighting;
}

#endif
//---------------------------------------------------------

//-----------------------Hair-----------------------
#if MATERIAL_SHADING_MODEL_HAIR

float Hair_g(float B, float Theta)
{
	return exp( -0.5 * (Theta * Theta ) / (B * B) ) / (sqrt(2.0 * PI) * B);
}

float Hair_F(float CosTheta)
{
	float n = 1.55;
	float F0 = ((1.0 - n) / (1.0 + n)) * ((1.0 - n) / (1.0 + n));
	return F0 + (1.0 - F0) * ((1.0 - CosTheta) * (1.0 - CosTheta) * (1.0 - CosTheta) * (1.0 - CosTheta) * (1.0 - CosTheta));
}

vec3 InternalFunc_LightCommon_HairShading(vec3 BaseColor, float Metallic, float Specular, float Roughness,
									vec3 L, vec3 V, vec3 N, float Shadow, float BackLit, vec2 Random)
{
	float ClampedRoughness = clamp(Roughness, 1.0/255.0, 1.0);
	float VdotL = dot(V,L);
	float SinThetaL = clamp(dot(N,L), -1.0, 1.0);
	float SinThetaV = clamp(dot(N,V), -1.0, 1.0);
	
	float CosThetaD = cos( 0.5 * abs( InternalFunc_ASinFast(SinThetaV) - InternalFunc_ASinFast(SinThetaL) ) );
	
	vec3 Lp = L - SinThetaL * N;
	vec3 Vp = V - SinThetaV * N;
	float CosPhi = dot(Lp, Vp) * (1.0 / sqrt(dot(Lp, Lp) * dot(Vp, Vp) + 1e-4));
	float CosHalfPhi = sqrt(max(0.0, 0.5 + 0.5 * CosPhi));
	
	float n = 1.55;
	float n_prime = 1.19 / CosThetaD + 0.36 * CosThetaD;
	
	float Shift = 0.035;
	float Alpha0 = -Shift * 2.0;
	float Alpha1 = Shift;
	float Alpha2 = Shift * 4.0;
	
	float B0 = ClampedRoughness * ClampedRoughness;
	float B1 = ClampedRoughness * ClampedRoughness / 2.0;
	float B2 = ClampedRoughness * ClampedRoughness * 2.0;
	
	vec3 S = vec3(0.0);
	vec3 R;
	vec3 TT;
	vec3 TRT;
	vec3 Kajiya;
	
	// R
	{
		float sa = sin(Alpha0);
		float ca = cos(Alpha0);
		float Shift = 2.0 * sa * (ca * CosHalfPhi * sqrt(1.0 - SinThetaV * SinThetaV) + sa * SinThetaV);
		float Mp = Hair_g(B0 * sqrt(2.0) * CosHalfPhi, SinThetaL + SinThetaV - Shift);
		float Np = 0.25 * CosHalfPhi;
		float Fp = Hair_F(sqrt(max(0.0, 0.5 + 0.5 * VdotL)));
		S += Mp * Np * Fp * (Specular * 2.0) * mix(1.0, BackLit, max(0.0, -VdotL));
		//R = S;
	}
		
	// TT
	{
		// FIXME!! by zhouyifan, force B in denominator to 0.5, setting to B1 cause error in some pixels.
		// I dont't know why, maybe caused by float precision.
		//float Mp = Hair_g(B1, SinThetaL + SinThetaV - Alpha1);
		float Theta = SinThetaL + SinThetaV - Alpha1;
		float Mp = exp( -0.5 * (Theta * Theta ) / (B1 * B1) ) / ( sqrt(2.0 * PI) * 0.5 );

		float a = 1.0 / n_prime;
		float h = CosHalfPhi * (1.0 + a * ( 0.6 - 0.8 * CosPhi));
		float f = Hair_F(CosThetaD * sqrt(max(0.0, 1.0 - h * h)));
		float Fp = (1.0 - f) * (1.0 - f);
		vec3 Tp = pow(BaseColor, vec3(0.5 * sqrt(1.0 - (h * a) * (h * a)) / CosThetaD));
		float Np = exp( -3.65 * CosPhi - 3.98 );
		S += Mp * Np * Fp * Tp * BackLit;	
		//TT = S -R;
	}

	// TRT
	{
		float Mp = Hair_g(B2, SinThetaL + SinThetaV - Alpha2 );
		float f = Hair_F(CosThetaD * 0.5);
		float Fp = (1.0 - f) * (1.0 - f) * f;
		vec3 Tp = pow(BaseColor, vec3(0.8 / CosThetaD));
		float Np = exp( 17.0 * CosPhi - 16.78 );
		S += Mp * Np * Fp * Tp;
		//TRT = S - TT - R;
	}
	
	//Kajiya Kay diffuse attenuation
	{
		float KajiyaDiffuse = 1.0 - abs( dot(N,L) );
		vec3 FakeNormal = normalize(V - N * dot(V,N));
		N = FakeNormal;
		float Wrap = 1.0;
		float NdotL = max(0.0, (dot(N, L) + Wrap) / ((1.0 + Wrap) * (1.0 + Wrap)));
		float DiffuseScatter = (1.0 / PI) * mix( NdotL, KajiyaDiffuse, 0.33 ) * Metallic;
		float Luma = InternalFunc_Luminance(BaseColor);
		vec3 ScatterTint = pow(BaseColor / Luma, vec3(1.0 - Shadow));
		S += sqrt(BaseColor) * DiffuseScatter * ScatterTint;
		//Kajiya = S - R-TT-TRT;
	}
	
	S = -min(-S, 0.0);
	return S;
}
DirectLighting HairBxDF(ShadingData Data, vec3 N, vec3 V, vec3 L, float NoL, ShadowTerm Shadow)
{
	vec3 BsdfValue = InternalFunc_LightCommon_HairShading(Data.BaseColor, Data.Metallic, Data.Specular, Data.Roughness, 
						L, V, N, Shadow.TransmissionShadow, 1.0, vec2(0.0));

	DirectLighting Lighting;
	//Lighting.Diffuse = vec3(0.0);
	//Lighting.Specular = vec3(0.0);
	//Lighting.Transmission = BsdfValue * Shadow.SurfaceShadow;
	Lighting.Diffuse = BsdfValue * Shadow.SurfaceShadow;
	Lighting.Specular = vec3(0.0);
	Lighting.Transmission = vec3(0.0);
	return Lighting;
}

#endif
//--------------------------------------------------

//-----------------------Subsurface profile-----------------------
#if MATERIAL_SHADING_MODEL_SUBSURFACE_PROFILE

#include "TransmissionCommon.glsl"

void GetProfileDualSpecular(int SubsurfaceProfileInt, out float AverageToRoughness0, out float AverageToRoughness1, out float LobeMix, out float RoughnessToAverage)
{
	//vec4 Data = texelFetch(UniParam_SubsurfaceProfileTexture, ivec2(SSSS_DUAL_SPECULAR_OFFSET, SubsurfaceProfileInt), 0);
    vec4 Data = texture(UniParam_SubsurfaceProfileTexture, vec2(float(SSSS_DUAL_SPECULAR_OFFSET) / float(SSSS_PROFILE_TEXTURE_WIDTH), float(SubsurfaceProfileInt) / float(SUBSURFACE_PROFILE_MAX_NUM)));
	AverageToRoughness0 = Data.x * SSSS_MAX_DUAL_SPECULAR_ROUGHNESS;
	AverageToRoughness1 = Data.y * SSSS_MAX_DUAL_SPECULAR_ROUGHNESS;
	RoughnessToAverage = Data.w * SSSS_MAX_DUAL_SPECULAR_ROUGHNESS;
	LobeMix = Data.z;
}

float ApproximateHG(float cosJ, float g)
{
	float g2 = g * g;
	float gcos2 = 1.0 - (g * cosJ);
	gcos2 *= gcos2;
	const float ISO_PHASE_FUNC_Normalized = 0.5;
	return (ISO_PHASE_FUNC_Normalized * (1.0 - g2) / max( 1e-5, gcos2));
}

DirectLighting SubsurfaceProfileBxDF(ShadingData Data, vec3 N, vec3 V, vec3 L, float NoL, ShadowTerm Shadow)
{
	vec3 H = normalize(V + L);
	float NoV = max(abs(dot(N, V)) + 1e-5, 0.0);
	float NoH = clamp(dot(N, H), 0.0, 1.0);
	float VoH = clamp(dot(V, H), 0.0, 1.0);

	float InvLenH = InternalFunc_rsqrt( 2.0 + 2.0 * dot(V, L) );
	//float NoH = clamp( ( NoL + NoV ) * InvLenH , 0.0, 1.0);
	//float VoH = clamp( InvLenH + InvLenH * dot(V, L), 0.0, 1.0);

	float AverageToRoughness0 = 0.0;
	float AverageToRoughness1 = 0.0;
	float RoughnessToAverage = 0.0;
	float LobeMix = 0.0;
	GetProfileDualSpecular(UniParam_MaterialCommon_SSSIndex, AverageToRoughness0, AverageToRoughness1, LobeMix, RoughnessToAverage);
	
	float AverageRoughness = Data.Roughness;
	float Lobe0Roughness = max(clamp(AverageRoughness * AverageToRoughness0, 0.0, 1.0), 0.02);
	float Lobe1Roughness = clamp(AverageRoughness * AverageToRoughness1, 0.0, 1.0);
	float ClampOpacity = clamp(Data.Opacity * 10.0, 0.0, 1.0);
	Lobe0Roughness = mix(1.0, Lobe0Roughness, ClampOpacity);
	Lobe1Roughness = mix(1.0, Lobe1Roughness, ClampOpacity);

	float AverageAlpha2 = AverageRoughness;
	float Lobe0Alpha2 = Lobe0Roughness;//InternalFunc_Pow4(Lobe0Roughness);
	float Lobe1Alpha2 = Lobe1Roughness;//InternalFunc_Pow4(Lobe1Roughness);
	float D = mix(InternalFunc_BRDF_D_GGX(Lobe0Alpha2, NoH), InternalFunc_BRDF_D_GGX(Lobe1Alpha2, NoH), LobeMix);
	float Vis = InternalFunc_BRDF_Vis_SmithJointApprox(AverageAlpha2, NoV, NoL);
	vec3 F = InternalFunc_BRDF_F_Schlick(Data.SpecularColor, VoH);

	TransmissionProfileParams TransmissionParams = GetTransmissionProfileParams(UniParam_MaterialCommon_SSSIndex);
	float Thickness = (1.0 - Shadow.TransmissionShadow) * SSSS_MAX_TRANSMISSION_PROFILE_DISTANCE;
	vec3 Profile = GetTransmissionProfile(UniParam_MaterialCommon_SSSIndex, Thickness).xyz;
	vec3 RefracV = refract(V, -N, TransmissionParams.OneOverIOR);
	float PhaseFunction = ApproximateHG(dot(-L, RefracV), TransmissionParams.ScatteringDistribution);

	DirectLighting Lighting;
	Lighting.Diffuse = InternalFunc_BRDF_Diffuse_Burley(Data.DiffuseColor, Data.Roughness, NoV, NoL, VoH) * NoL * Shadow.SurfaceShadow;
	Lighting.Specular = D * Vis * F * NoL * Shadow.SurfaceShadow;
	Lighting.Transmission = Profile * PhaseFunction * Shadow.TransmissionShadow; // TODO: This probably should also include cosine term (NoL)

	return Lighting;
}

#endif
//----------------------------------------------------------------

//-----------------------Eye-----------------------
#if MATERIAL_SHADING_MODEL_EYE

#include "TransmissionCommon.glsl"

DirectLighting EyeBxDF(ShadingData Data, vec3 N, vec3 V, vec3 L, float NoL, ShadowTerm Shadow)
{
	vec3 H = normalize(V + L);
	float NoV = max(abs(dot(N, V)) + 1e-5, 0.0);
	float NoH = clamp(dot(N, H), 0.0, 1.0);
	float VoH = clamp(dot(V, H), 0.0, 1.0);
	float InvLenH = InternalFunc_rsqrt( 2.0 + 2.0 * dot(V, L) );

	// Fresnel
	float F0 = Data.Specular * 0.08;
	float Fc = pow(1.0 - VoH, 5.0);
	float F = Fc + (1.0 - Fc) * F0;
	// GGX
	float D =  InternalFunc_BRDF_D_GGX(Data.Roughness, NoH);
	// Visibility
	float Vis = InternalFunc_BRDF_Vis_SmithJointApprox(Data.Roughness, VoH, NoL);
	
	vec3 IrisNormal = Data.CustomData0.xyz; 	// CustomData0.xyz stores IrisNormal.
	vec3 CausticNormal = Data.CustomData1.xyz; 	// CustomData1.xyz stores CausticNormal.
	float IrisMask = Data.CustomData1.w;		// CustomData1.w stores IrisMask.
	float IrisNoL = clamp(dot(IrisNormal, L), 0.0, 1.0);
	float Power = mix(12.0, 1.0, IrisNoL);
	float Caustic = 0.8 + 0.2 * (Power + 1.0) * pow(clamp(dot(CausticNormal, L), 0.0, 1.0), Power);
	float Iris = IrisNoL * Caustic;
	float Sclera = NoL;

	DirectLighting Lighting;
	Lighting.Diffuse = vec3(0.0);
	Lighting.Specular = vec3(D * F * Vis * NoL) * Shadow.SurfaceShadow;
	Lighting.Transmission = mix( Sclera, Iris, IrisMask ) * (1.0 - F) * InternalFunc_BRDF_Diffuse_Lambert(Data.DiffuseColor) * Shadow.TransmissionShadow;

	return Lighting;
}

#endif
//-------------------------------------------------

//-----------------------Cloth-----------------------
#if MATERIAL_SHADING_MODEL_CLOTH

DirectLighting ClothBxDF(ShadingData Data, vec3 N, vec3 V, vec3 L, float NoL, ShadowTerm Shadow)
{
	vec3 H = normalize(V + L);
	float NoV = max(abs(dot(N, V)) + 1e-5, 0.0);
	float NoH = clamp(dot(N, H), 0.0, 1.0);
	float VoH = clamp(dot(V, H), 0.0, 1.0);
	float InvLenH = InternalFunc_rsqrt(2.0 + 2.0 * dot(V, L));

	vec3 FuzzColor = clamp(Data.CustomData0.rgb, 0.0, 1.0);	// CustomData0.xyz stores FuzzColor.
	float Cloth = clamp(Data.CustomData0.a, 0.0, 1.0);		// CustomData0.w stores Cloth.

	float D = InternalFunc_BRDF_D_GGX(Data.Roughness, NoH);
	float Vis = InternalFunc_BRDF_Vis_SmithJointApprox(Data.Roughness, NoV, NoL);
	vec3 F = InternalFunc_BRDF_F_Schlick(Data.SpecularColor, VoH);
	vec3 Spec1 = D * Vis * F;

	float D2 = InternalFunc_BRDF_D_InvGGX(Data.Roughness, NoH);
	float Vis2 = InternalFunc_BRDF_Vis_Cloth(NoV, NoL);
	vec3 F2 = InternalFunc_BRDF_F_Schlick(FuzzColor, VoH);
	vec3 Spec2 = D2 * Vis2 * F2;

	DirectLighting Lighting;
	Lighting.Diffuse = InternalFunc_BRDF_Diffuse_Lambert(Data.DiffuseColor) * Shadow.SurfaceShadow;
	Lighting.Specular = mix(Spec1, Spec2, Cloth) * Shadow.SurfaceShadow;
	Lighting.Transmission = vec3(0.0);

	return Lighting;
}

#endif
//---------------------------------------------------

//-----------------------Subsurface-----------------------
#if MATERIAL_SHADING_MODEL_SUBSURFACE
// vec3 ComFunc_LightCommon_SubsurfaceShading(vec3 SubsurfaceColor, float Opacity, float AO, vec3 L, vec3 V, vec3 N)
// {
// 	vec3 H = normalize(V + L);
// 	// to get an effect when you see through the material
// 	// hard coded pow constant
// 	float InScatter = pow(clamp(dot(L, -V), 0.0, 1.0), 12.0f) * mix(3.0f, 0.1f, Opacity);
// 	// wrap around lighting, /(PI*2) to be energy consistent (hack do get some view dependnt and light dependent effect)
// 	// Opacity of 0 gives no normal dependent lighting, Opacity of 1 gives strong normal contribution
// 	float NormalContribution = clamp(dot(N, H) * Opacity + 1.0f - Opacity, 0.0, 1.0);
// 	//float BackScatter = GBuffer.GBufferAO * NormalContribution / (PI * 2);
// 	float BackScatter = AO * NormalContribution / (PI * 2.0f);

// 	// lerp to never exceed 1 (energy conserving)
// 	return SubsurfaceColor * mix(BackScatter, 1.0f, InScatter);
// }
#endif
//--------------------------------------------------------

DirectLighting IntegrateBxDF(ShadingData Data, vec3 N, vec3 V, vec3 L, float NoL, ShadowTerm Shadow)
{
#if MATERIAL_SHADING_MODEL_DEFAULT_LIT
	return DefaultLitBxDF(Data, N, V, L, NoL, Shadow);
#elif MATERIAL_SHADING_MODEL_SUBSURFACE
	return SubsurfaceBxDF(Data, N, V, L, NoL, Shadow);
#elif MATERIAL_SHADING_MODEL_SUBSURFACE_PROFILE
	return SubsurfaceProfileBxDF(Data, N, V, L, NoL, Shadow);
#elif MATERIAL_SHADING_MODEL_HAIR
	return HairBxDF(Data, N, V, L, NoL, Shadow);
#elif MATERIAL_SHADING_MODEL_EYE
	return EyeBxDF(Data, N, V, L, NoL, Shadow);
#elif MATERIAL_SHADING_MODEL_CLOTH
	return ClothBxDF(Data, N, V, L, NoL, Shadow);
#else
	DirectLighting Lighting;
	Lighting.Diffuse = vec3(0.0);
	Lighting.Specular = vec3(0.0);
	Lighting.Transmission = vec3(0.0);
	return Lighting;
#endif
}

DirectLighting GetDynamicLighting(ShadingData ShadePoint, LightData Light, vec3 L, vec3 V, float LightAttenuation)
{
	DirectLighting Lighting;

	if (LightAttenuation <= 0.0)
	{	
		Lighting.Diffuse = vec3(0.0);
		Lighting.Specular = vec3(0.0);
		Lighting.Transmission = vec3(0.0);
		return Lighting;
	}

	vec3 N = ShadePoint.WorldNormal;
	float NoL = clamp(dot(N, L), 0.0, 1.0);

	// Shadow data.
	ShadowTerm Shadow;
	Shadow.SurfaceShadow = 1.0;
	Shadow.TransmissionShadow = 1.0;
#if SHADOW_ENABLE
	if (Light.ShadowIndex >= 0)
	{
		highp vec2 ScreenUV = VSOutScreenPosition.xy / VSOutScreenPosition.w * 0.5 + 0.5;
		if (!Light.IsRadialLight)
		{
			Shadow = DirLightShadowTest(VSOutWorldPosition.xyz, N, VSOutScreenPosition.w, ScreenUV, ShadePoint.Opacity);
		}
		else
		{
			Shadow = SpotLightShadowTest(VSOutWorldPosition.xyz, N, VSOutScreenPosition.w, ScreenUV, ShadePoint.Opacity, Light.ShadowIndex);
		}	
// #if !MATERIAL_SHADING_MODEL_HAIR && !MATERIAL_SHADING_MODEL_SUBSURFACE_PROFILE && !MATERIAL_SHADING_MODEL_EYE
// 		Shadow.SurfaceShadow *= clamp(dot(N, L) * 6.0 - 0.2, 0.0, 1.0);
// #endif
	}
#endif // SHADOW_ENABLE
	
	Lighting = IntegrateBxDF(ShadePoint, N, V, L, NoL, Shadow);

	 // Transmission can only be calculated correctly when light cast shadow.
	 // So we don't consider transmission by non-shadowed lights.
	 if (Light.ShadowIndex < 0)
	 {
	 	Lighting.Transmission = vec3(0.0);
	 }

	Lighting.Diffuse *= Light.LightColor * LightAttenuation;
	Lighting.Specular *= Light.LightColor * LightAttenuation;
	Lighting.Transmission *= Light.LightColor * LightAttenuation;
	
	return Lighting; 
}

#endif //_FORWARD_SHADING_LIGHT_COMMON_GLSL_
