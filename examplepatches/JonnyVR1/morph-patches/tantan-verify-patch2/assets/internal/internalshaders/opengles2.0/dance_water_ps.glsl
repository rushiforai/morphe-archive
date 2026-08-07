//******************************************************************************

// @File         dance_water_ps.glsl

// @Version      1.0

// @Created      2020, 3, 9

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
*/

#include "common_ps.glsl"
#include "fogcommon.glsl"

//------------------------------------------
// parameters
//------------------------------------------
uniform highp float		TimeSinceFirstTick;
uniform highp vec3		EyePos;
uniform sampler2D		g_WaterTex;
uniform sampler2D		g_LowBaseTex;
uniform highp vec4		g_LowBaseTex_ST;
uniform highp vec4		g_Specular;
uniform highp float		g_Shininess;
uniform highp vec4		g_InvRanges;
uniform highp vec4		g_LightDir;
uniform highp vec4		g_LightColor;
uniform highp vec4		g_NormalTiling;
uniform highp vec4 		g_NormalDirection;
uniform highp float		g_FresnelScale;

//------------------------------------------
// Varyings
//------------------------------------------
varying mediump vec2	_uv;
varying highp vec3		_worldPos;
varying highp vec3		_vertexPos;

void main (void)
{
	// Calculate the object-space normal (Z-up)
	highp float _Time = TimeSinceFirstTick / 20.0;
	mediump vec4 NormalUV = (_vertexPos.xyxy + vec4(_Time) * g_NormalDirection.xyzw) * g_NormalTiling.xyzw;
	mediump vec3 nNormal = (glb_SamplerNormalMap_ApplyStrength(g_WaterTex, NormalUV.xy, 1.0) + glb_SamplerNormalMap_ApplyStrength(g_WaterTex, NormalUV.zw, 1.0)) * 0.5;

	// Calculate the depth ranges (X = Alpha, Y = Color Depth)
	mediump vec2 ranges = XSaturate(g_InvRanges.xy);
	ranges.y = 1.0 - ranges.y;
	ranges.y = mix(ranges.y, ranges.y * ranges.y * ranges.y, 0.5);

	// Calculate the color tint
	mediump vec4 col;

	// Initial material properties
	mediump float Specular = ranges.x;

	// Low-quality reflection uses the cube map
	mediump vec3 reflection = texture2D(g_LowBaseTex, _uv + nNormal.xy * g_FresnelScale).rgb;

	// No refraction -- just use the color tint
	col.a = 1.0 - ranges.y * ranges.y;

	// Calculate the initial material color
	col.rgb = reflection;

	mediump float shininess = g_Shininess * 250.0 + 4.0;
	mediump vec3 lightDir = normalize(g_LightDir.xyz);

	// Phong shading model
	highp vec3 viewDir = normalize((EyePos.xyz - _worldPos));
	mediump float diffuseFactor = max(0.0, dot(nNormal, lightDir));
	mediump vec3 CamSpaceLightDir = normalize(viewDir - lightDir).xyz;
	highp vec3 refl = reflect(-CamSpaceLightDir, nNormal);
	highp float RefDot = max(0.0, dot(refl, viewDir));
	
	col.rgb = (col.rgb * diffuseFactor + g_Specular.rgb * RefDot) * g_LightColor.rgb;
	col.rgb *= 2.0;
	
	// Fog
#ifdef _FOG_ENABLE_
	lowp vec4 FogColor = ComputeCompositeFog(_worldPos, EyePos);
	resultColor = vec3(mix(col.rgb, FogColor.xyz, FogColor.a));
#endif

	gl_FragColor = col;
}