//******************************************************************************

// @File         wireframe_ps.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is wireframe_ps.glsl.

// @HISTORY:

//******************************************************************************/

varying		highp vec4	VSOutColor0;
void main(void)
{
	gl_FragColor = VSOutColor0;

}
