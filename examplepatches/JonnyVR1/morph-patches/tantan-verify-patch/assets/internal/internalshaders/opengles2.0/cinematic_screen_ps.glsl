//******************************************************************************

// @File         cinematic_screen_ps.glsl

// @Version      1.0

// @Description  cinematic screen effect

// @HISTORY:

//******************************************************************************/

#include "common_ps.glsl"


varying highp	vec2		VSOutTexcoord0;
varying highp   vec4		VSOutScreenPosition;

#ifdef _USING_FADE_
uniform highp float         g_AlphaFadeFactor;
#endif

uniform highp float         g_BlackScreenHeight;
uniform highp float         g_ScreenHeight;

void main (void)
{	
    highp float fShade = 1.0;
#ifdef _USING_FADE_
    fShade *= g_AlphaFadeFactor;
#endif 
    //top and bottom
    highp float y1 = g_BlackScreenHeight / g_ScreenHeight;
    highp float y2 = clamp(1.0 - y1, 0.0, 1.0);
    if(!(y1 < VSOutTexcoord0.y && y2 > VSOutTexcoord0.y))
    {
        gl_FragColor = vec4(0.0, 0.0, 0.0, fShade);
    } 
    else
    {
        discard;
    }
}
