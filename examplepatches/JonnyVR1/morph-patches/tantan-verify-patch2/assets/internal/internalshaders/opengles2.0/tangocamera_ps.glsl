//******************************************************************************

// @File         g_tangocamera.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  

// @HISTORY:

//******************************************************************************/
#extension GL_OES_EGL_image_external : require

//Textures
uniform samplerExternalOES	g_TangoSampler;

//Varyings
varying highp vec2	VSOutTexcoord0;

void main (void)
{
	gl_FragColor = texture2D(g_TangoSampler, VSOutTexcoord0);
}
