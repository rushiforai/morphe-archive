//******************************************************************************

// @File         postprocess_copy_ps.glsl

// @Version       1.0

// @Created      2018, 6, 7

// @Description

// @HISTORY:

//******************************************************************************/

uniform sampler2D		CopyTexture;

varying highp vec2		VSOutTexCoord;

void main(void)
{
	highp vec2 texcoord = VSOutTexCoord;
#ifdef _FLIP_V_
	texcoord.y = 1.0 - texcoord.y;
#endif
	gl_FragColor = texture2D(CopyTexture, texcoord);
}