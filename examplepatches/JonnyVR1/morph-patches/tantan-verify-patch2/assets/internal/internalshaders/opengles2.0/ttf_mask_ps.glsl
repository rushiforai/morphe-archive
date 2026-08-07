//******************************************************************************

// @File         2d_ps.glsl

// @Version      1.0

// @Description  used for 2d element such as ui etc.

// @HISTORY:

//******************************************************************************/

#include "common_ps.glsl"
varying highp	vec4		VSFontColor    ;
varying highp   vec4		VSOutLineColor;
varying highp	vec4		compressed;
varying highp 	vec4		PosAndWH;
varying highp   vec2        WorldPos;
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


	highp vec4 vTextureDiffuse = SampleTexture(DiffuseTexture, compressed.xy);
    highp vec4 vFontColor = vec4(0.0, 0.0, 0.0, 1.0);
#ifdef _USE_TEXTURECOLOR    
    vFontColor = VSFontColor * vTextureDiffuse;
#else
       
    highp float fOutlineEnable = clamp(compressed.z, 0.0, 1.0); 
    if(fOutlineEnable < 0.1)
    {
     vFontColor    = VSFontColor;   
     vFontColor.a *=  vTextureDiffuse.r;
    }
    else
    {
      vFontColor =   mix(VSOutLineColor, VSFontColor, vTextureDiffuse.r);
      vFontColor.a *= vTextureDiffuse.g;
    }   
   
#endif
   if(compressed.w > 0.)
   {
   // const highp	vec4		WHAxis = vec4(1,0,0,-1);
    highp vec2 vPos = WorldPos.xy - PosAndWH.xy;
	highp float xLength = abs(vPos.x);//abs(dot(vPos, WHAxis.xy));
	highp float yLength = abs(vPos.y);
	if(xLength > PosAndWH.z || yLength > PosAndWH.w)
	{
		vFontColor.a = 0.;
	}
	
   }
	gl_FragColor = vFontColor;
}
