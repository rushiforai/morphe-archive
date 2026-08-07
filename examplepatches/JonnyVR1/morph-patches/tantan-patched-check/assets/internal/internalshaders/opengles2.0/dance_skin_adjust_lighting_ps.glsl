//******************************************************************************

// @File         dance_skin_ps.glsl

// @Version      1.0

// @Created      2020, 2, 28

// @Description

// @HISTORY

//******************************************************************************/

/* Macros in this shader:
_ALPHATEST_						
_ALPHABLEND_
MASK
*/

#include "common_ps.glsl"

//------------------------------------------
// parameters
//------------------------------------------
uniform highp vec3		EyePos;
uniform sampler2D		g_MainTex;
uniform sampler2D		g_MaskTex2;
uniform sampler2D		g_NormalTex;
uniform lowp vec4		g_GlobalLightness;
uniform lowp vec4		g_SkinColor;

uniform lowp vec4		g_Color;
uniform lowp vec4		g_SpecColorSkin;
uniform mediump float	g_ShininessSkin;
uniform mediump vec4 	g_LightIntensityAmbientSkin;
uniform mediump vec4 	g_LightDirectionSkin;

#ifdef MASK
uniform sampler2D		g_SkinTex;
uniform sampler2D		g_MaskTex3;
uniform lowp vec4		g_FaceLuminance;
#endif

#ifdef ANIM
uniform highp float		TimeSinceFirstTick;
uniform lowp float		g_AnimTime1;
uniform lowp float		g_AnimTime2;
#endif

//------------------------------------------
// Varyings
//------------------------------------------
varying mediump vec2	_uv;
varying highp vec3		_worldN;
varying highp vec3		_worldV;
varying highp vec3		_tangentWorld;
varying highp vec3		_binormalWorld;

void main (void)
{
	//const lowp vec4 _Color = vec4(0.588,0.588,0.588,1);
	//const lowp vec4 _SpecColorSkin = vec4(0.808,0.46,0.38,0.25);
	//const mediump float _ShininessSkin = 1.0;
	//const mediump vec4 _LightIntensityAmbientSkin = vec3(0.6,1.25,0.1,1.0);
	//const mediump vec4 _LightDirectionSkin = vec3(0.0,-0.25,0.0,1.0);

	mediump vec2 UV = _uv;

#ifdef ANIM
	lowp float fIndex = mod(TimeSinceFirstTick, g_AnimTime1 + g_AnimTime2);
	if(fIndex < g_AnimTime1)
	{
		UV.y = _uv.y * 0.5 + 0.5;
	}
	else
	{
		UV.y = _uv.y * 0.5;
	}
#endif

#ifdef MASK	
	lowp vec4 srcCol = texture2D(g_MainTex, UV.xy);
	lowp vec4 mask3 = texture2D(g_MaskTex3, UV.xy);
	lowp vec4 skinCol = texture2D(g_SkinTex, UV.xy);

	mediump float face_Gray = srcCol.r * 0.299 + srcCol.g * 0.587 + srcCol.b * 0.114;
	srcCol.rgb = mix(srcCol.rgb, g_FaceLuminance.rgb * face_Gray, g_FaceLuminance.a);
	srcCol.a = 1.0;

	mediump vec4 c = mix(skinCol, srcCol, mask3.r) * g_Color;
#else
	mediump vec4 c = texture2D(g_MainTex, UV.xy) * g_Color;
#endif
	
	mediump float c_Gray = c.r * 0.299 + c.g * 0.587 + c.b * 0.114; 
	lowp vec4 mask2 = texture2D(g_MaskTex2, UV.xy);	
	
	// Skin Color
	c.rgb = mix(mix(c.rgb, g_SkinColor.rgb * c_Gray, g_SkinColor.a), c.rgb, mask2.b);
	c.a = 1.0;	// For Render Icon
	
	highp vec3 normal = glb_SamplerNormalMap_ApplyStrength(g_NormalTex, UV.xy, 1.0);
	
	highp vec3 worldN = normalize(_worldN);
	highp mat3 tangent2World = mat3(normalize(_tangentWorld), normalize(_binormalWorld), worldN);
    highp vec3 normalDirection = normalize(tangent2World * normal);
			
	highp vec3 viewDirection = normalize((EyePos.xyz - _worldV));
	highp float worldVNDot = dot(viewDirection, worldN);

	mediump vec3 CamSpaceLightDir = normalize(viewDirection - g_LightDirectionSkin.xyz).xyz;
	highp vec3 refl = reflect(-CamSpaceLightDir, normalDirection);

	highp float RefDot = max(0.0, dot(refl, viewDirection));
	lowp float normalAmount = abs(dot(normalDirection, CamSpaceLightDir));
	
	highp vec3 specSkin = normalAmount * g_SpecColorSkin.rgb * g_SpecColorSkin.a * pow(RefDot, g_ShininessSkin ) * mask2.r;
			
	c.rgb *= (g_LightIntensityAmbientSkin.x * normalAmount + g_LightIntensityAmbientSkin.y + g_LightIntensityAmbientSkin.z * mask2.g);
			
	// Specular
	c.rgb += specSkin;
			
	c *= g_GlobalLightness;	

#ifdef MASK
	c.a = 1.0;
#endif
	
	gl_FragColor = c;
}