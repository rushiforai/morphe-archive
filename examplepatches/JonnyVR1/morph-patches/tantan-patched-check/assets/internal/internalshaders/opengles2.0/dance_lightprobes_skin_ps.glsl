//******************************************************************************

// @File         dance_lightprobes_skin_ps.glsl

// @Version      1.0

// @Created      2020, 3, 10

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
_ALPHATEST_						
_ALPHABLEND_
*/

#include "common_ps.glsl"

//------------------------------------------
// parameters
//------------------------------------------
uniform highp vec3		EyePos;
uniform sampler2D		g_MainTex;
uniform sampler2D		g_MaskTex2;
uniform sampler2D		g_MaskTex3;
uniform lowp vec4		g_SkinColor;
uniform sampler2D		g_SkinTex;
uniform lowp vec4		g_GlobalLightness;
uniform lowp vec4		g_FaceLuminance;
uniform mediump vec4	g_LightIntensityAmbientSkin;

//------------------------------------------
// Varyings
//------------------------------------------
varying mediump vec2	_uv;
varying highp float		_vLight;

void main (void)
{
	const lowp vec4 _Color = vec4(0.588,0.588,0.588,1);
	const lowp vec4 _SpecColorSkin = vec4(0.808,0.46,0.38,0.25);
	const mediump float _ShininessSkin = 1.0;
	const mediump vec3 _LightIntensityAmbientSkin = vec3(0.6,1.25,0.1);
	const mediump vec3 _LightDirectionSkin = vec3(0.0,-0.25,0.0);
	
	lowp vec4 srcCol = texture2D(g_MainTex, _uv.xy);
	lowp vec4 mask2 = texture2D(g_MaskTex2, _uv.xy);	
	lowp vec4 skinCol = texture2D(g_SkinTex, _uv.xy);
	lowp vec4 mask3 = texture2D(g_MaskTex3, _uv.xy);
	
	mediump float face_Gray = srcCol.r * 0.299 + srcCol.g * 0.587 + srcCol.b * 0.114;
	srcCol.rgb = mix(srcCol.rgb, g_FaceLuminance.rgb * face_Gray, g_FaceLuminance.a);
	srcCol.a = 1.0;

	mediump vec4 c = mix(skinCol, srcCol, mask3.r) * _Color;	
	mediump float c_Gray = c.r * 0.299 + c.g * 0.587 + c.b * 0.114; 
	c.rgb = mix(mix(c.rgb, g_SkinColor.rgb * c_Gray, g_SkinColor.a), c.rgb, mask2.b);
	c.a = 1.0;	// For Render Icon
	
	c.rgb *= (_vLight + g_LightIntensityAmbientSkin.z * mask2.g);
	c *= g_GlobalLightness;	
	
	gl_FragColor = c;
}