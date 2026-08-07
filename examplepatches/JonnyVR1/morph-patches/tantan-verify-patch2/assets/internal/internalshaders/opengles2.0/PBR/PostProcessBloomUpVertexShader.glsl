#ifndef _POST_PROCESS_BLOOMUP_VERTEX_SHADER_GLSL_
#define _POST_PROCESS_BLOOMUP_VERTEX_SHADER_GLSL_

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
out vec4 VSOutTexcoord7;

void main()
{
    vec2 TransformedUV;
    vec4 VSOutPosition;
	ComFunc_PostProcess_DrawRectangle(Position0, Texcoord0, VSOutPosition, TransformedUV);
	gl_Position = VSOutPosition;
    vec2 Scale = 1.32 * UniParam_PostProcess_InvTargetSizeAndTextureSize.zw;
    VSOutTexcoord0.xy = TransformedUV.xy + vec2(0.2536546, 0.9672949) * Scale; // Circle;
	VSOutTexcoord0.zw = TransformedUV.xy + vec2(0.9144126, 0.4047833) * Scale;
	VSOutTexcoord1.xy = TransformedUV.xy + vec2(0.8865993, -0.4625383) * Scale;
	VSOutTexcoord1.zw = TransformedUV.xy + vec2(0.1911586, -0.9815592) * Scale;
	VSOutTexcoord2.xy = TransformedUV.xy + vec2(-0.6482284, -0.7614460) * Scale;
	VSOutTexcoord2.zw = TransformedUV.xy + vec2(-0.9994862, 0.0320516) * Scale;
	VSOutTexcoord3.xy = TransformedUV.xy + vec2(-0.5981105, 0.8014136) * Scale;
	VSOutTexcoord3.zw = TransformedUV.xy;
    
	VSOutTexcoord4.xy = TransformedUV.xy + vec2(0.2536546, 0.9672949) * Scale;
	VSOutTexcoord4.zw = TransformedUV.xy + vec2(0.9144126, 0.4047833) * Scale;
	VSOutTexcoord5.xy = TransformedUV.xy + vec2(0.8865993, -0.4625383) * Scale;
	VSOutTexcoord5.zw = TransformedUV.xy + vec2(0.1911586, -0.9815592) * Scale;
	VSOutTexcoord6.xy = TransformedUV.xy + vec2(-0.6482284, -0.7614460) * Scale;
	VSOutTexcoord6.zw = TransformedUV.xy + vec2(-0.9994862, 0.0320516) * Scale;
	VSOutTexcoord7.xy = TransformedUV.xy + vec2(-0.5981105, 0.8014136) * Scale;
	VSOutTexcoord7.zw = vec2(0.0, 0.0);
}

#endif