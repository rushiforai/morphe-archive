//******************************************************************************

// @File         2d_ps.glsl

// @Version      1.0

// @Description  used for 2d element such as ui etc.

// @HISTORY:

//******************************************************************************/

#include "common_ps.glsl"


varying highp	vec4		VSFontColor;
varying highp   vec4		VSOutLineColor;
varying highp	vec3		VSOutTexcoordAndOutLine0;
varying highp   vec2        WorldPos;
uniform highp 	vec4		PosAndWH;
uniform highp	vec4		WHAxis;
uniform highp   sampler2D	DiffuseTexture;


highp vec4 SampleTexture(sampler2D texture, highp vec2 uv)
{
#if defined(_USING_TEXTURE_)
	highp vec4 TexColor;
	#if defined(_USING_ALPHA_CHANNEL_) && defined(_USING_ETC1_)		
		highp float v = clamp(uv.y, 0.01, 0.99);
		TexColor.rgb = texture2D(texture, vec2(uv.x, v * 0.5) -10.0).rgb;
		TexColor.a = texture2D(texture, vec2(uv.x, v * 0.5 + 0.5), -10.0).r;
	#else 
	    TexColor = texture2D(texture, uv, -10.0);		
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

	highp vec4 vTextureDiffuse = SampleTexture(DiffuseTexture, VSOutTexcoordAndOutLine0.xy);
    highp vec4 vFontColor = vec4(0.0, 0.0, 0.0, 1.0);
#ifdef _USE_TEXTURECOLOR    
    vFontColor = VSFontColor * vTextureDiffuse;
#else
       
    highp float fOutlineEnable = clamp(VSOutTexcoordAndOutLine0.z, 0.0, 1.0); 
    if(fOutlineEnable < 0.1){
     vFontColor    = VSFontColor;   
     vFontColor.a *=  vTextureDiffuse.r;
    }else{
      vFontColor =   mix(VSOutLineColor, VSFontColor, vTextureDiffuse.r);
      vFontColor.a *= vTextureDiffuse.g;
    }   
       
#endif
    
	gl_FragColor = vFontColor;
}
