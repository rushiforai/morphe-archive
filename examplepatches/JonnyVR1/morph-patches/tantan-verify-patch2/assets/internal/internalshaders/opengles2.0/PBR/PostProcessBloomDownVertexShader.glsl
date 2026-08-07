#ifndef _POST_PROCESS_BLOOMDOWN_VERTEX_SHADER_GLSL_
#define _POST_PROCESS_BLOOMDOWN_VERTEX_SHADER_GLSL_

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
// vec2 Circle(float Start, float Points, float Point) 
// {
// 	float Rad = (3.141592 * 2.0 * (1.0 / Points)) * (Point + Start);
// 	return vec2(sin(Rad), cos(Rad));
// }

void main()
{
    vec2 TransformedUV;
    vec4 VSOutPosition;
	ComFunc_PostProcess_DrawRectangle(Position0, Texcoord0,
									  VSOutPosition, TransformedUV);
	gl_Position = VSOutPosition;
    
    vec2 Scale = 2.64 * UniParam_PostProcess_InvTargetSizeAndTextureSize.zw;
    VSOutTexcoord0.xy = TransformedUV.xy;
	VSOutTexcoord0.zw = TransformedUV.xy + vec2(0.0640702, 0.9979454) * Scale; // Circle
	VSOutTexcoord1.xy = TransformedUV.xy + vec2(0.4907175, 0.8713187) * Scale;
	VSOutTexcoord1.zw = TransformedUV.xy + vec2(0.8201722, 0.5721167) * Scale;
	VSOutTexcoord2.xy = TransformedUV.xy + vec2(0.9871818, 0.1595999) * Scale;
	VSOutTexcoord2.zw = TransformedUV.xy + vec2(0.9586679, -0.2845276) * Scale;
	VSOutTexcoord3.xy = TransformedUV.xy + vec2(0.7402780, -0.6723009) * Scale;
	VSOutTexcoord3.zw = TransformedUV.xy + vec2(0.3752670, -0.9269167) * Scale;
	VSOutTexcoord4.xy = TransformedUV.xy + vec2(-0.0640702, -0.9979454) * Scale;
	VSOutTexcoord4.zw = TransformedUV.xy + vec2(-0.4907175, -0.8713187) * Scale;
	VSOutTexcoord5.xy = TransformedUV.xy + vec2(-0.8201722, -0.5721167) * Scale;
	VSOutTexcoord5.zw = TransformedUV.xy + vec2(-0.9871818, -0.1596000) * Scale;
	VSOutTexcoord6.xy = TransformedUV.xy + vec2(-0.9586679, 0.2845275) * Scale;
	VSOutTexcoord6.zw = TransformedUV.xy + vec2(-0.7402781, 0.6723008) * Scale;
	VSOutTexcoord7.xy = TransformedUV.xy + vec2(-0.3752671, 0.9269167) * Scale;
	VSOutTexcoord7.zw = vec2(0.0, 0.0);
}

#endif