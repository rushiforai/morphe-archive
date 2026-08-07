//******************************************************************************

// @File         canvas_3d_ps.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is canvas_3d_ps.glsl.

// @HISTORY:

//******************************************************************************/
varying		highp vec4	VSOutColor0;
#ifdef _CANVAS_USE_TEX_
varying		highp vec2	VSOutTexcoord0;
uniform		sampler2D	DiffuseTexture;
#endif

void main(void)
{
#ifdef _CANVAS_USE_TEX_
	gl_FragColor = texture2D(DiffuseTexture, VSOutTexcoord0) * VSOutColor0;
#else
	gl_FragColor = VSOutColor0;	
#endif
}
