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
uniform vec4		Offsets;

varying vec2		VSOutScreenPos;
varying vec2		VSOutTexCoord;
varying vec4		VSOutTexCoord01;
varying vec4		VSOutTexCoord23;
varying vec4		VSOutTexCoord45;

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
	VSOutTexCoord = OutTexCoord;
	highp vec4 vOffsets = Offsets *  InvTargetSizeAndTextureSize.zwzw;
	VSOutTexCoord01 = OutTexCoord.xyxy + vOffsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0);
	VSOutTexCoord23 = OutTexCoord.xyxy + vOffsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) * 2.0;
	VSOutTexCoord45 = OutTexCoord.xyxy + vOffsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) * 3.0;
}