//******************************************************************************

// @File         ui_batch_vs.glsl

// @Version      1.0

// @Description  used for 2d ui sprite batch inc non-mask & mask.

// @HISTORY:

//******************************************************************************/

#include "common_ps.glsl"
varying highp	vec4		VSOutColor0;
varying highp	vec4		VSOutTexcoord0_mask;
varying highp 	vec4		PosAndWH;
varying highp   vec2        WorldPos;
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
	highp vec4 vTextureDiffuse = SampleTexture(DiffuseTexture, VSOutTexcoord0_mask.xy);
	highp vec4 vColor = VSOutColor0 * vTextureDiffuse;
	highp float useMask = VSOutTexcoord0_mask.z;
	if(useMask > 0.5)
	{
	    //const highp vec4	WHAxis  = vec4(1,0,0,-1);
	    highp vec2  vPos    = WorldPos.xy - PosAndWH.xy;
	    highp float xLength = abs(vPos.x);//abs(dot(vPos, WHAxis.xy));
	    highp float yLength = abs(vPos.y);//abs(dot(vPos, WHAxis.zw));
	    
	    if(xLength > PosAndWH.z || yLength > PosAndWH.w)
	    {
		  vColor.a = 0.0;
	    }
	}
	

	gl_FragColor = vColor;
}
