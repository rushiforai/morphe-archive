//******************************************************************************

// @File         cube_tex_box_ps.glsl

// @Version      1.0

// @Description  cinematic screen effect

// @HISTORY:

//******************************************************************************/

#include "common_ps.glsl"


varying highp vec3		    VSOutCubeTexDir;
varying highp vec2          VSOutTexcoord0;

#ifdef _USING_FADE_
uniform highp float         g_AlphaFadeFactor;
#endif

#ifdef _USING_FOCUS_
uniform highp vec4          g_focusColor;
uniform highp float         g_focusHalfUV;//0-0.5
uniform highp vec3          g_focusSurfNormal;
#endif

uniform samplerCube			g_DiffuseTexture;


void main (void)
{	
    highp float fShade = 1.0;
#ifdef _USING_FADE_
    fShade *= g_AlphaFadeFactor;
#endif 
    highp vec4 cubeColor = textureCube(g_DiffuseTexture, VSOutCubeTexDir);
    //adding a light blue color for the surface.
#ifdef _USING_FOCUS_
    highp vec3 curTexDir = normalize(VSOutCubeTexDir);
    highp float cosDir = dot(curTexDir, g_focusSurfNormal);//should be at pi/4
    if(cosDir > 0.707107)
    {
        if((0.5-g_focusHalfUV <= VSOutTexcoord0.x &&  VSOutTexcoord0.x <= 0.5 + g_focusHalfUV)//u
            &&(0.5-g_focusHalfUV <= VSOutTexcoord0.y && VSOutTexcoord0.y <= 0.5 + g_focusHalfUV))//v
        {
            cubeColor.rgb += g_focusColor.rgb * g_focusColor.a;
        }
    }
    // else{
    //     cubeColor.r = cosDir;    
    //     cubeColor.g = 0.0;
    //     cubeColor.b = 0.0;
    // }
#endif
    cubeColor.a *= fShade;
    gl_FragColor = cubeColor;
}
