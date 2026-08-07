#ifndef _POST_PROCESS_BLOOMSETUP_VERTEX_SHADER_GLSL_
#define _POST_PROCESS_BLOOMSETUP_VERTEX_SHADER_GLSL_

#include "PostProcessCommon.glsl"

in vec4 Position0;
in vec2 Texcoord0;

out vec2 VSOutTexcoord0;
out vec2 VSOutTexcoord1;
out vec2 VSOutTexcoord2;
out vec2 VSOutTexcoord3;

void main()
{
    vec2 TransformedUV;
    vec4 VSOutPosition;
	ComFunc_PostProcess_DrawRectangle(Position0, Texcoord0,
									  VSOutPosition, TransformedUV);
	gl_Position = VSOutPosition;
    VSOutTexcoord0 = TransformedUV + UniParam_PostProcess_InvTargetSizeAndTextureSize.zw * vec2(-1, -1);
    VSOutTexcoord1 = TransformedUV + UniParam_PostProcess_InvTargetSizeAndTextureSize.zw * vec2(1, -1);
    VSOutTexcoord2 = TransformedUV + UniParam_PostProcess_InvTargetSizeAndTextureSize.zw * vec2(-1, 1);
    VSOutTexcoord3 = TransformedUV + UniParam_PostProcess_InvTargetSizeAndTextureSize.zw * vec2(1, 1);
}

#endif