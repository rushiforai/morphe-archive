//******************************************************************************

// @File         fur_ps.glsl

// @Version      1.0

// @Created      2022, 7, 28

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
FUR_COLOR_TEX
FUR_LENGTH_MASK
*/

#include "common_ps.glsl"
#include "lightcommon_ps.glsl"

//------------------------------------------
// parameters
//------------------------------------------
uniform highp vec3		EyePos;

#ifdef FUR_COLOR_TEX
uniform sampler2D		g_FurColorTex;
#endif

#ifdef FUR_LENGTH_MASK
uniform sampler2D 		g_FurLengthMaskTex;
#endif 

uniform sampler2D 		g_FurStyleTex;
uniform highp vec2      g_FurTexPowerScale;
uniform highp vec4 		g_FurColor;
uniform highp vec4		g_FurSpecularColor;
uniform highp float		g_Shininess;
uniform highp float 	g_FurDensity;
uniform highp float 	g_FurThickness;
uniform highp float 	g_FurThickness_B;
uniform highp float 	g_FurThickness_T;
uniform highp float 	g_FurThickness_B2T;
uniform highp float		g_FurFeather;
uniform highp float		g_FurShadow;
uniform highp vec4		g_RimColor;
uniform highp float		g_RimPower;
uniform highp float		FurStep;

//------------------------------------------
// Varyings
//------------------------------------------
varying mediump vec4	_uv;
varying highp vec3		_worldNormal;
varying highp vec3		_worldPos;

void main (void)
{
    lowp vec3 color = g_FurColor.rgb;
#ifdef FUR_COLOR_TEX
	color *= texture2D(g_FurColorTex, _uv.xy).rgb;
#endif

#ifdef _DYNAMIC_LIGHTING_

	highp vec3 worldNormal = normalize(_worldNormal);
	highp vec3 worldView = normalize(EyePos - _worldPos);

	color -= (pow(1.0 - FurStep, 3.0)) * g_FurShadow;
    highp float rim = 1.0 - XSaturate(dot(worldView, worldNormal));
    color += g_RimColor.rgb * pow(rim, g_RimPower);

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
	lowp vec3 colDiffuse = SunLight * fDiffuseFactor * lightRadial;

	// Specular
	lowp vec3 colSpecular = SunLight.rgb * lightRadial * g_FurSpecularColor.rgb * pow(XSaturate(dot(worldNormal, worldHalf)), g_Shininess);

	color = (colAmbient + colDiffuse) * color + colSpecular;
#endif
	
#ifdef FUR_LENGTH_MASK
    highp vec4 lengthMask = texture2D(g_FurLengthMaskTex, _uv.zw);
    if (lengthMask.r < FurStep) discard;
#endif 

    highp vec4 mask = texture2D(g_FurStyleTex, _uv.zw * g_FurDensity);
	mask.r = pow(mask.r, g_FurTexPowerScale.x) * g_FurTexPowerScale.y;

    highp float rBot = pow(mask.r + g_FurThickness, (10.0 - g_FurThickness_B));
    highp float rTop = pow(mask.r + g_FurThickness, (10.0 - g_FurThickness_T));
    //highp float b2t = clamp(g_FurThickness_B2T, 0.0, 1.0);
    //b2t = mix(-1.0 - b2t, b2t + 0.1, step(0.0, b2t));
    //mask.r = mix(rBot, rTop, mix(pow(FurStep * 1.3333, -b2t), pow(FurStep * 1.3333, b2t * 10.0), step(0.0, b2t)));
    //highp float translucency = ( (clamp(pow(1.1 - FurStep, 2.0), 0.0, 1.0) - 1.0) * clamp(2.0 - g_FurThickness_B2T, 0.0, 1.0) + mask.r ) * pow((1.0 - FurStep * 1.333), g_FurFeather);
    highp float b2t = clamp(g_FurThickness_B2T, 0.0, 1.0) + 0.1;
    mask.r = mix(rBot, rTop, pow(FurStep * 1.3333, b2t * 10.0));
    highp float translucency = ( (clamp(pow(1.1 - FurStep, 2.0), 0.0, 1.0) - 1.0) * clamp(2.0 - g_FurThickness_B2T, 0.0, 1.0) + mask.r ) * pow((1.001 - FurStep), g_FurFeather);

    if (translucency < 0.000001) discard;

	gl_FragColor = vec4(color, translucency);
}