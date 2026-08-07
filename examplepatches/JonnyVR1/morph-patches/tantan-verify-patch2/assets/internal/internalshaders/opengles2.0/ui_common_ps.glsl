
//******************************************************************************

// @File         ui_common_ps.glsl

// @Version       1.0

// @Created      2020, 8, 22

// @Description  This file is ui_common_ps.glsl by ysf

// @HISTORY:

//******************************************************************************/


highp vec4 SampleUITexture(sampler2D texture, highp vec2 uv)
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