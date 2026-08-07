//******************************************************************************

// @File         fur_surface_ps.glsl

// @Version      1.0

// @Created      2022, 7, 28

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
*/

#include "common_ps.glsl"
#include "lightcommon_ps.glsl"

//------------------------------------------
// parameters
//------------------------------------------
uniform highp vec3		EyePos;
uniform highp vec4 		g_Color;
uniform highp vec4		g_SpecularColor;
uniform highp float		g_Shininess;
#ifdef FUR_COLOR_TEX
uniform sampler2D		g_FurColorTex;
#endif

//------------------------------------------
// Varyings
//------------------------------------------
varying mediump vec4	_uv;
varying highp vec3		_worldNormal;
varying highp vec3		_worldPos;

void main (void)
{
    lowp vec3 color = g_Color.rgb;
#ifdef FUR_COLOR_TEX
	color *= texture2D(g_FurColorTex, _uv.xy).rgb;
#endif

#ifdef _DYNAMIC_LIGHTING_

	highp vec3 worldNormal = normalize(_worldNormal);
	highp vec3 worldView = normalize(EyePos - _worldPos);

#if defined(_DIRECTION_LIGHT_)  
	highp vec3 worldLight = LightDir;
#elif defined(_SPOT_LIGHT_) || defined(_POINT_LIGHT_)
	highp vec3 worldToLight = (g_PointLight_PosAndInvRadius.xyz - _worldPos);
    highp vec3 worldLight = normalize(worldToLight);
#endif

	highp vec3 worldHalf = normalize(worldView + worldLight);
	highp float fNDL = dot(worldNormal, worldLight);
    highp float fDiffuseFactor = XSaturate(fNDL);
    
	highp float lightRadial = 1.0;
#if defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)     
    // Distance attenuation             
    highp vec3 ToLightRadius = worldToLight * g_PointLight_PosAndInvRadius.w;
    highp float lightRadial = LightCommon_RadialAttenuation(ToLightRadius, g_PointLight_FalloffExponent);                         
            
    #ifdef _SPOT_LIGHT_
        // Angle attenuation
        highp vec3 ToLightNormal = normalize(worldToLight);
        highp vec3 worldlightDir = normalize(LightDir);
        lightRadial *= LightCommon_SpotAttenuation(ToLightNormal, worldlightDir, g_SpotLight_SpotAngele);          
    #endif  
	
	lightRadial = XSaturate(lightRadial);
#endif

	// Ambient
	lowp vec3 colAmbient = vec3(0.0, 0.0, 0.0);
#ifdef _DIRECTION_LIGHT_        
    highp float fAmbientLightFactor1 = XSaturate(-fNDL);
	highp float fAmbientLightFactor2 = 1.0 - XSaturate(abs(fNDL));
	colAmbient = Ambient1 * fAmbientLightFactor1 + Ambient2 * fAmbientLightFactor2;	
#endif       

	// Diffuse
	lowp vec3 colDiffuse = SunLight.rgb * fDiffuseFactor * lightRadial;

	// Specular
	lowp vec3 colSpecular = SunLight.rgb * lightRadial * g_SpecularColor.rgb * pow(XSaturate(dot(worldNormal, worldHalf)), g_Shininess);

	color = (colAmbient + colDiffuse) * color + colSpecular;
#endif
	
	gl_FragColor = vec4(color, 1.0);
}