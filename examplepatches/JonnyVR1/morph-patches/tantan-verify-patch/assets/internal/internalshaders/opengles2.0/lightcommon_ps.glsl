//******************************************************************************

// @File         lightcommon.glsl

// @Version       1.0

// @Created      2018, 9, 29

// @Description  This file is lightcommon.glsl.

// @HISTORY:

//******************************************************************************/
#if defined(_DIRECTION_LIGHT_) || defined(_SPOT_LIGHT_) || defined(_POINT_LIGHT_)

#define _DYNAMIC_LIGHTING_

#if defined(_DIRECTION_LIGHT_) || defined(_SPOT_LIGHT_)
uniform highp vec3		LightDir;
#endif

#if defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)
uniform highp float 	g_PointLight_FalloffExponent;
uniform highp vec4		g_PointLight_PosAndInvRadius;
#endif

#ifdef _SPOT_LIGHT_
uniform highp vec2		g_SpotLight_SpotAngele;
#endif

uniform highp vec3		SunLight;
uniform highp vec3		Ambient1;
uniform highp vec3		Ambient2;

highp float LightCommon_RadialAttenuation(highp vec3 WorldLightVector, highp float FalloffExponent)
{
	highp float NormalizeDistanceSquared = dot(WorldLightVector, WorldLightVector);
	return pow(1.0 - XSaturate(NormalizeDistanceSquared), FalloffExponent);
}

highp float LightCommon_SpotAttenuation(highp vec3 L, highp vec3 SpotDirection, highp vec2 SpotAngles)
{
	highp float ConeAngleFalloff = XSaturate((dot(L, SpotDirection) - SpotAngles.x) * SpotAngles.y);
	return ConeAngleFalloff * ConeAngleFalloff;
}

#endif