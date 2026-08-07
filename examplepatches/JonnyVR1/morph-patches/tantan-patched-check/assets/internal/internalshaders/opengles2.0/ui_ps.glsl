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
uniform highp sampler2D		DiffuseTexture;

#if defined(_USING_SEPERATE_ALPHA_TEXTURE_)
uniform highp sampler2D		AlphaTexture;
#endif

#if defined(_USING_MASK_TEXTURE_)
uniform highp sampler2D		MaskTexture;
#endif

highp vec4 SampleTexture(sampler2D texture, highp vec2 uv)
{
#if defined(_USING_TEXTURE_)
	highp vec4 TexColor;
	#if defined(_USING_ALPHA_CHANNEL_) && defined(_USING_ETC1_)		
		highp float v = clamp(uv.y, 0.005, 0.995);
		TexColor.rgb = texture2D(texture, vec2(uv.x, v * 0.5), -10.0).rgb;
        #if defined(_USING_MASK_TEXTURE_)
			TexColor.a = texture2D(MaskTexture, uv, -10.0).r;
	    #else 
			TexColor.a = texture2D(texture, vec2(uv.x, v * 0.5 + 0.5), -10.0).r;
	    #endif
	    
	#else 
        #if defined(_USING_MASK_TEXTURE_)
			TexColor.rgb = texture2D(texture, uv, -10.0).rgb;
			TexColor.a = texture2D(MaskTexture, uv, -10.0).r;
	    #else 
			#if defined(_USING_SEPERATE_ALPHA_TEXTURE_)
				TexColor.rgb = texture2D(texture, uv, -10.0).rgb;
				TexColor.a = texture2D(AlphaTexture, uv, -10.0).r;			
			#else
				TexColor = texture2D(texture, uv, -10.0);
			#endif
	   #endif
	   	  			
	#endif
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
	highp vec4 vColor = VSOutColor0 * vTextureDiffuse;
	gl_FragColor = vColor;
}
