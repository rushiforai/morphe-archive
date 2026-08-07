//******************************************************************************

// @File         postprocess_vs.glsl

// @Version       1.0

// @Created      2018, 6, 7

// @Description 

// @HISTORY:

//******************************************************************************/

attribute vec4		Position0;
attribute vec2		Texcoord0;

uniform vec4		PosScaleBias;
uniform vec4		UVScaleBias;
uniform vec4		InvTargetSizeAndTextureSize;

varying vec2		VSOutScreenPos;
varying vec2		VSOutTexCoord;


void DrawRectangle(	in vec4 InPosition,
					in vec2 InTexCoord,
					out vec4 OutPosition,
					out vec2 OutTexCoord)
{
	OutPosition = InPosition;
	OutPosition.xy = -1.0 + 2.0 * (PosScaleBias.zw + (InPosition.xy * PosScaleBias.xy)) * InvTargetSizeAndTextureSize.xy;
	OutTexCoord.xy = (UVScaleBias.zw + (InTexCoord.xy * UVScaleBias.xy)) * InvTargetSizeAndTextureSize.zw;
}

void main(void)
{
	vec4 OutPosition;
	vec2 OutTexCoord;
	DrawRectangle(Position0, Texcoord0, OutPosition, OutTexCoord);
	gl_Position = OutPosition;
	VSOutScreenPos = OutPosition.xy;
#ifdef GLTEXTURE_FLIP_Y
	VSOutTexCoord.x = OutTexCoord.x;
	VSOutTexCoord.y = 1.0 - OutTexCoord.y;
#else
	VSOutTexCoord = OutTexCoord;
#endif
}