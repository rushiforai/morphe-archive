//******************************************************************************

// @File         2d_ps.glsl

// @Version      1.0

// @Description  used for 2d element such as ui etc.

// @HISTORY:

//******************************************************************************/

#include "common_ps.glsl"


varying highp	vec2		VSOutTexcoord0;
varying highp   vec4		VSOutScreenPosition;
varying highp   vec2        VSOutTexcoordMask;

uniform sampler2D			g_DiffuseTexture;
#ifdef _USING_SHADE_
uniform sampler2D			g_ShadeTexture;
uniform highp vec4  		g_ShadeArea;  // xy : uv start   zw: area size : all in[0~1.0]
uniform highp vec2  		g_MirrorParam;  // x = 0: u = u;   x = 1.0 : u = 1.0 - u;  y = 0: v = v;   y = 1.0 : v = 1.0 - v;
uniform highp float  		g_ScreenOrTexUv;  // 0.0 : Screenuv; 1.0: vertexuv;  
#endif
#ifdef _USING_FADE_
uniform highp float         g_AlphaFadeFactor;
#endif

void main (void)
{	
    highp float fShade = 1.0;
#ifdef _USING_SHADE_
    highp vec2 ScreenUV = VSOutScreenPosition.xy / VSOutScreenPosition.w * 0.5 + 0.5; 
    ScreenUV.y = 1.0 - ScreenUV.y;    
    highp vec2 ShadeUV = mix (ScreenUV, VSOutTexcoordMask, g_ScreenOrTexUv);
    
    highp vec2 AreaUV = vec2(0.0);
    AreaUV.x = clamp(ShadeUV.x * g_ShadeArea.z + g_ShadeArea.x, 0.0, 1.0);
    AreaUV.y = clamp(ShadeUV.y * g_ShadeArea.w + g_ShadeArea.y, 0.0, 1.0);
    
    AreaUV.x = abs(g_MirrorParam.x - AreaUV.x);
    AreaUV.y = abs(g_MirrorParam.y - AreaUV.y);
    
    fShade = SampleDiffuseTexture(g_ShadeTexture, AreaUV).r; 
#ifdef _OPPOSITE_SHADE_
    fShade = clamp(1.0 - fShade, 0.0, 1.0);    
#endif    
#endif

#ifdef _USING_FADE_
    fShade *= g_AlphaFadeFactor;
#endif 

	highp vec4 vTextureDiffuse = SampleDiffuseTexture(g_DiffuseTexture, VSOutTexcoord0);
    vTextureDiffuse.a *= fShade;
	gl_FragColor = vTextureDiffuse;
}
