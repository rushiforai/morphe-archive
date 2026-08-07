//******************************************************************************

// @File         skeleton2d_ps.glsl

// @Version      1.0

// @Description  used for skeleton 2d. 2020/12/25.

// @HISTORY:

//******************************************************************************/

#include "common_ps.glsl"
varying highp	vec4		VSLightColor;
varying highp	vec4		VSDarkColor;
varying highp 	vec4		uv_tint_mask;
varying highp 	vec4		PosAndWH;
varying highp   vec2        WorldPos;
uniform highp sampler2D		DiffuseTexture;
#if defined(_ENABLE_MASK_)
uniform highp	vec4		WHAxis;
#endif
#if defined(_USING_SEPERATE_ALPHA_TEXTURE_)
uniform highp sampler2D		AlphaTexture;
#endif

highp vec4 SampleUITexture(sampler2D texture, highp vec2 uv)
{
#if defined(_USING_TEXTURE_)
	highp vec4 TexColor;
	#if defined(_USING_ALPHA_CHANNEL_) && defined(_USING_ETC1_)		
		highp float v = clamp(uv.y, 0.005, 0.995);
		TexColor.rgb = texture2D(texture, vec2(uv.x, v * 0.5), -10.0).rgb;
		TexColor.a = texture2D(texture, vec2(uv.x, v * 0.5 + 0.5), -10.0).r;
	#else 
       #if defined(_USING_SEPERATE_ALPHA_TEXTURE_)
			TexColor.rgb = texture2D(texture, uv, -10.0).rgb;
			TexColor.a = texture2D(AlphaTexture, uv, -10.0).r;			
		#else
			TexColor = texture2D(texture, uv, -10.0);
		#endif
	   	  			
	#endif
#else
	highp vec4 TexColor = vec4(1.0, 1.0, 1.0, 1.0);
#endif
	return TexColor;
}
void main (void)
{	
	 bool checkAABBmask = true;
#ifdef _ENABLE_MASK_
	highp vec2 vPos = WorldPos.xy - PosAndWH.xy;
	highp float xLength = abs(dot(vPos, WHAxis.xy));
	highp float yLength = abs(dot(vPos, WHAxis.zw));
	if(xLength > PosAndWH.z || yLength > PosAndWH.w)
	{
		discard;
	}
	checkAABBmask = false;
#endif
	highp vec4 texColor = SampleUITexture(DiffuseTexture, uv_tint_mask.xy);
    highp vec4 finalColor;
	
    if(uv_tint_mask.z > 0.5){
         finalColor.a   = VSLightColor.a * texColor.a;
         finalColor.rgb = ((texColor.a - 1.0) * VSDarkColor.a + 1.0 - texColor.rgb) * VSDarkColor.rgb + texColor.rgb * VSLightColor.rgb;
    }else{
        finalColor = texColor * VSLightColor;
    }
	highp float useMask        = uv_tint_mask.w;
	if(useMask > 0.5 && checkAABBmask)
	{
	    highp vec2  vPos    = WorldPos.xy - PosAndWH.xy;
	    highp float xLength = abs(vPos.x);
	    highp float yLength = abs(vPos.y);
	    if(xLength > PosAndWH.z || yLength > PosAndWH.w)
	    {
		  finalColor.a = 0.0;
	    }
	}
	gl_FragColor = finalColor;
}
