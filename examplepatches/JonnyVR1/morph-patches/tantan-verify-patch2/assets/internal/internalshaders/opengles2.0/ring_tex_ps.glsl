//******************************************************************************

// @File         cinematic_screen_ps.glsl

// @Version      1.0

// @Description  cinematic screen effect

// @HISTORY:

//******************************************************************************/

#include "common_ps.glsl"


varying highp	vec2		VSOutTexcoord0;

#ifdef _USING_FADE_
uniform highp float         g_AlphaFadeFactor;
#endif

uniform highp float         g_Inner_hollow_out_radis;
uniform sampler2D			g_DiffuseTexture;

void main (void)
{	
    highp float fShade = 1.0;
#ifdef _USING_FADE_
    fShade *= g_AlphaFadeFactor;
#endif 
    highp vec2 centerUV = 2.0 * VSOutTexcoord0 - 1.0;
    highp float len = length(centerUV);
    if(len >= g_Inner_hollow_out_radis && len <= 1.0)
    {
        highp vec4 vTextureDiffuse = SampleDiffuseTexture(g_DiffuseTexture, VSOutTexcoord0);
        vTextureDiffuse.a *= fShade;
        gl_FragColor = vTextureDiffuse;
    }
    else
    {
        discard;
    }
}
