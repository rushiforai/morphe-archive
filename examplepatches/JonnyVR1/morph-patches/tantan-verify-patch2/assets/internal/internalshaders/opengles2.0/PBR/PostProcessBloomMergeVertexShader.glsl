#ifndef _POST_PROCESS_BLOOMMERGE_VERTEX_SHADER_GLSL_
#define _POST_PROCESS_BLOOMMERGE_VERTEX_SHADER_GLSL_

#include "PostProcessCommon.glsl"

in vec4 Position0;
in vec2 Texcoord0;

out vec4 VSOutTexcoord0;
out vec4 VSOutTexcoord1;
out vec4 VSOutTexcoord2;
out vec4 VSOutTexcoord3;
out vec4 VSOutTexcoord4;
out vec4 VSOutTexcoord5;
out vec4 VSOutTexcoord6;

void main()
{
    vec2 TransformedUV;
    vec4 VSOutPosition;
	ComFunc_PostProcess_DrawRectangle(Position0, Texcoord0,
									  VSOutPosition, TransformedUV);
	gl_Position = VSOutPosition;
    vec2 Scale = 0.33 * UniParam_PostProcess_InvTargetSizeAndTextureSize.zw;
    VSOutTexcoord0.xy = TransformedUV.xy + vec2(0.3420201, 0.9396926) * Scale; // Circle;
	VSOutTexcoord1.xy = TransformedUV.xy + vec2(0.9848077, 0.1736485) * Scale;
	VSOutTexcoord2.xy = TransformedUV.xy + vec2(0.6427880, -0.7660441) * Scale;
	VSOutTexcoord3.xy = TransformedUV.xy + vec2(-0.3420195, -0.9396929) * Scale;
    VSOutTexcoord4.xy = TransformedUV.xy + vec2(-0.9848076, -0.1736491) * Scale;
	VSOutTexcoord5.xy = TransformedUV.xy + vec2(-0.6427885, 0.7660437) * Scale;
    VSOutTexcoord6.xy = TransformedUV.xy;
}

#endif