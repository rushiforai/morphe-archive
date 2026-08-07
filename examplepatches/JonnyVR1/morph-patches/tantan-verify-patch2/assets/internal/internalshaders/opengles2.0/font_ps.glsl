//******************************************************************************

// @File         2d_ps.glsl

// @Version      1.0

// @Description  used for 2d element such as ui etc.

// @HISTORY:

//******************************************************************************/

#include "common_ps.glsl"

varying highp	vec4		VSOutColor0;
varying highp	vec2		VSOutTexcoord0;
varying highp   vec2        WorldPos;
uniform highp 	vec4		PosAndWH;
uniform highp	vec4		WHAxis;
uniform highp   sampler2D	DiffuseTexture;
uniform highp	float		g_OutlineText; // 0.0 : outline; 1.0: no outline;

#if defined(_USING_SEPERATE_ALPHA_TEXTURE_)
uniform highp sampler2D		AlphaTexture;
#endif

uniform highp	float		UseMask;
uniform highp sampler2D		MaskTexture;

highp vec4 SampleTexture(sampler2D texture, highp vec2 uv)
{
#if defined(_USING_TEXTURE_)
	highp vec4 TexColor;
	#if defined(_USING_ALPHA_CHANNEL_) && defined(_USING_ETC1_)		
		highp float v = clamp(uv.y, 0.01, 0.99);
		TexColor.rgb = texture2D(texture, vec2(uv.x, v * 0.5) -10.0).rgb;
		if(UseMask > 0.5)
		{
			TexColor.a = texture2D(MaskTexture, uv, -10.0).r;
		}
		else
		{
			TexColor.a = texture2D(texture, vec2(uv.x, v * 0.5 + 0.5), -10.0).r;
		}		
	#else 
		if(UseMask > 0.5)
		{
			TexColor.rgb = texture2D(texture, uv, -10.0).rgb;
			TexColor.a = texture2D(MaskTexture, uv, -10.0).r;
		}
		else
		{
			#if defined(_USING_SEPERATE_ALPHA_TEXTURE_)
				TexColor.rgb = texture2D(texture, uv, -10.0).rgb;
				TexColor.a = texture2D(AlphaTexture, uv, -10.0).r;			
			#else
				TexColor = texture2D(texture, uv, -10.0);
			#endif
		}		
	#endif
	TexColor = TexColor;
#else
	highp vec4 TexColor = vec4(1.0, 1.0, 1.0, 1.0);
#endif
	return TexColor;
}


void main (void)
{	
#ifdef _ENABLE_MASK_
	highp vec2 vPos = WorldPos.xy - PosAndWH.xy;
	highp float xLength = abs(dot(vPos, WHAxis.xy));
	highp float yLength = abs(dot(vPos, WHAxis.zw));
	if(xLength > PosAndWH.z || yLength > PosAndWH.w)
	{
		discard;
	}
#endif

	highp vec4 vTextureDiffuse = SampleTexture(DiffuseTexture, VSOutTexcoord0);
    highp vec4 vFontColor = vec4(0.0, 0.0, 0.0, 1.0);
#ifdef _USE_TEXTURECOLOR    
    vFontColor = VSOutColor0 * vTextureDiffuse;
#else
    vFontColor = VSOutColor0;       
    highp float fOutlineEnable = clamp(g_OutlineText, 0.0, 1.0);    
    vFontColor.a = vFontColor.a * mix(vTextureDiffuse.r, vTextureDiffuse.g, fOutlineEnable);    
#endif
    
	gl_FragColor = vFontColor;
}
