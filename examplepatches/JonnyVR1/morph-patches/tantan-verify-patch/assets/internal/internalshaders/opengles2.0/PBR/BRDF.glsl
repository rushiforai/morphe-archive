#ifndef _BRDF_GLSL_
#define _BRDF_GLSL_

#include "Definitions.glsl"
#include "Common.glsl"

vec3 InternalFunc_BRDF_Diffuse_Lambert( vec3 DiffuseColor )
{
	return DiffuseColor * INVERSEPI;
}

vec3 InternalFunc_BRDF_Diffuse_Burley( vec3 DiffuseColor, float Roughness, float NoV, float NoL, float VoH )
{
	float FD90 = 0.5f + 2.0f * VoH * VoH * Roughness;
	float FdV = 1.0f + (1.0f - FD90) * InternalFunc_Pow5(1.0f - NoV);
	float FdL = 1.0f + (1.0f - FD90) * InternalFunc_Pow5(1.0f - NoL);
	return DiffuseColor * ( INVERSEPI * FdV * FdL );
}

vec3 InternalFunc_BRDF_Diffuse_OrenNayar( vec3 DiffuseColor, float Roughness, float NoV, float NoL, float VoH )
{
	float VoL = 2.0f * VoH - 1.0f;
	float m = Roughness * Roughness;
	float m2 = m * m;
	float C1 = 1.0f - 0.5f * m2 / (m2 + 0.33f);
	float Cosri = VoL - NoV * NoL;
	float C2 = 0.45f * m2 / (m2 + 0.09f) * Cosri * ( Cosri >= 0.0f ? min( 1.0f, NoL / NoV ) : NoL );
	return DiffuseColor * INVERSEPI * ( NoL * C1 + C2 );
}

float InternalFunc_BRDF_D_Blinn( float Roughness, float NoH )
{
	float m = Roughness * Roughness;
	float m2 = m * m;
	float n = 2.0f / m2 - 2.0f;
	return (n + 2.0f) / (2.0f * PI) * InternalFunc_PhongShadingPow( NoH, n );
}

float InternalFunc_BRDF_D_Beckmann( float Roughness, float NoH )
{
	float m = Roughness * Roughness;
	float m2 = m * m;
	float NoH2 = NoH * NoH;
	return exp( (NoH2 - 1.0f) / (m2 * NoH2) ) / ( PI * m2 * NoH2 * NoH2 );
}

float InternalFunc_BRDF_D_GGX( float Roughness, float NoH )
{
	float m = Roughness * Roughness;
	float m2 = m * m;
	float d = ( NoH * m2 - NoH ) * NoH + 1.0001f;
	return m2 / ( PI * d * d );
}

float InternalFunc_BRDF_D_GGXaniso( float RoughnessX, float RoughnessY, float NoH, vec3 H, vec3 X, vec3 Y )
{
	float mx = RoughnessX * RoughnessX;
	float my = RoughnessY * RoughnessY;
	float XoH = dot( X, H );
	float YoH = dot( Y, H );
	float d = XoH * XoH / (mx * mx) + YoH * YoH / (my * my) + NoH * NoH;
	return 1.0f / ( PI * mx * my * d * d );
}

float InternalFunc_BRDF_D_InvGGX(float Roughness, float NoH)
{
	float m = Roughness * Roughness;
	float m2 = m * m;
	float d = (NoH - m2 * NoH) * NoH + m2;
	return 1.0 / (PI * (1.0 + 4.0 * m2)) * (1.0 + 4.0 * m2 * m2 / (d * d));
}

float InternalFunc_BRDF_Vis_Implicit()
{
	return 0.25f;
}

float InternalFunc_BRDF_Vis_Neumann( float NoV, float NoL )
{
	return 0.25f / max(NoL, NoV);
}

float InternalFunc_BRDF_Vis_Kelemen( float VoH )
{
	return 0.25f / (VoH * VoH);
}

float InternalFunc_BRDF_Vis_Schlick( float Roughness, float NoV, float NoL )
{
	float k = InternalFunc_Square( Roughness ) * 0.5f;
	float Vis_SchlickV = NoV * (1.0f - k) + k;
	float Vis_SchlickL = NoL * (1.0f - k) + k;
	return 0.25f / ( Vis_SchlickV * Vis_SchlickL );
}

float InternalFunc_BRDF_Vis_Smith( float Roughness, float NoV, float NoL )
{
	float a = InternalFunc_Square( Roughness );
	float a2 = a * a;

	float Vis_SmithV = NoV + sqrt( NoV * (NoV - NoV * a2) + a2 );
	float Vis_SmithL = NoL + sqrt( NoL * (NoL - NoL * a2) + a2 );
	return 1.0f / ( Vis_SmithV * Vis_SmithL );
}

float InternalFunc_BRDF_Vis_SmithJointApprox( float Roughness, float NoV, float NoL )
{
	float a = InternalFunc_Square( Roughness );
	float Vis_SmithV = NoL * ( NoV * ( 1.0f - a ) + a );
	float Vis_SmithL = NoV * ( NoL * ( 1.0f - a ) + a );
	return 0.5f / ( Vis_SmithV + Vis_SmithL );
}

float InternalFunc_BRDF_Vis_Cloth(float NoV, float NoL)
{
	return 1.0 / (4.0 * (NoL + NoV - NoL * NoV));
}

vec3 InternalFunc_BRDF_F_None( vec3 SpecularColor )
{
	return SpecularColor;
}

vec3 InternalFunc_BRDF_F_Schlick( vec3 SpecularColor, float VoH )
{
	float Fc = InternalFunc_Pow5(1.0f - VoH);
	return clamp( 50.0f * SpecularColor.g, 0.0, 1.0) * Fc + (1.0f - Fc) * SpecularColor;
}

vec3 InternalFunc_BRDF_F_Fresnel( vec3 SpecularColor, float VoH )
{
	vec3 SpecularColorSqrt = sqrt( clamp( vec3(0.0f, 0.0f, 0.0f), vec3(0.99f, 0.99f, 0.99f), SpecularColor ) );
	vec3 n = ( 1.0f + SpecularColorSqrt ) / ( 1.0f - SpecularColorSqrt );
	vec3 g = sqrt( n * n + VoH * VoH - 1.0f );
	return 0.5f * InternalFunc_Square( (g - VoH) / (g + VoH) ) * ( 1.0f + InternalFunc_Square( ((g + VoH) * VoH - 1.0f) / ((g - VoH) * VoH + 1.0f) ) );
}

// Diffuse model
// 0: Lambert
// 1: Oren-Nayar
#ifndef PHYSICAL_DIFFUSE
#define PHYSICAL_DIFFUSE 0
#endif

vec3 ComFunc_BRDF_Diffuse( vec3 DiffuseColor, float Roughness, float NoV, float NoL, float VoH )
{
//#if   PHYSICAL_DIFFUSE == 0
	return InternalFunc_BRDF_Diffuse_Lambert( DiffuseColor );
// #elif PHYSICAL_DIFFUSE == 1
// 	return InternalFunc_BRDF_Diffuse_OrenNayar( DiffuseColor, Roughness, NoV, NoL, VoH );
// #endif
}

// Microfacet distribution function
// 0: GGX
// 1: GGXaniso
#ifndef PHYSICAL_SPEC_D
#define PHYSICAL_SPEC_D	0
#endif
float ComFunc_BRDF_Distribution( float Roughness, float NoH )
{
#if PHYSICAL_SPEC_D == 0
	return InternalFunc_BRDF_D_GGX( Roughness, NoH );
#elif PHYSICAL_SPEC_D == 1
	return InternalFunc_BRDF_D_GGXaniso(Roughness, NoH);
#endif
}


// Geometric attenuation or shadowing
// 0: Implicit
// 1: Neumann
// 2: Kelemen
// 3: Schlick
// 4: Smith (matched to GGX)
// 5: SmithJointApprox
#ifndef PHYSICAL_SPEC_G
#define PHYSICAL_SPEC_G 0
#endif

float ComFunc_BRDF_GeometricVisibility( float Roughness, float NoV, float NoL, float VoH )
{
#if   PHYSICAL_SPEC_G == 0
	return InternalFunc_BRDF_Vis_Implicit();
#elif PHYSICAL_SPEC_G == 1
	return InternalFunc_BRDF_Vis_Neumann( NoV, NoL );
#elif PHYSICAL_SPEC_G == 2
	return InternalFunc_BRDF_Vis_Kelemen( VoH );
#elif PHYSICAL_SPEC_G == 3
	return InternalFunc_BRDF_Vis_Schlick( Roughness, NoV, NoL );
#elif PHYSICAL_SPEC_G == 4
	return InternalFunc_BRDF_Vis_Smith( Roughness, NoV, NoL );
#elif PHYSICAL_SPEC_G == 5
	return InternalFunc_BRDF_Vis_SmithJointApprox(Roughness, NoV, NoL);
#endif
}

// Fresnel
// 0: None
// 1: Schlick
// 2: Fresnel
#ifndef PHYSICAL_SPEC_F
#define PHYSICAL_SPEC_F	0
#endif
vec3 ComFunc_BRDF_Fresnel( vec3 SpecularColor, float VoH )
{
#if   PHYSICAL_SPEC_F == 0
	return InternalFunc_BRDF_F_None( SpecularColor );
#elif PHYSICAL_SPEC_F == 1
	return InternalFunc_BRDF_F_Schlick( SpecularColor, VoH );
#elif PHYSICAL_SPEC_F == 2
	return InternalFunc_BRDF_F_Fresnel( SpecularColor, VoH );
#endif
}

#endif
