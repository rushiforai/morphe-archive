#ifndef _POST_PROCESS_VERTEX_SHADER_GLSL_
#define _POST_PROCESS_VERTEX_SHADER_GLSL_

#include "PostProcessCommon.glsl"

in vec4 Position0;
in vec2 Texcoord0;

out vec2 VSOutTexcoord;
out vec4 VSOutPosition;
out vec2 VSOutFullViewUV;
// #if SHADER_TONEMAPPING
// out vec3 ExposureScaleVignette;
// vec2 VignetteSpace(vec2 Pos)
// {
// 	vec2 ScreenSize = 1.0 / UniParam_PostProcess_InvTargetSizeAndTextureSize.xy;
// 	float Scale = sqrt(2.0) / sqrt(1.0 + (ScreenSize.y * (1.0 / ScreenSize.x)) * (ScreenSize.y * (1.0 / ScreenSize.x)));
// 	return Pos * vec2(1.0, ScreenSize.y * (1.0 / ScreenSize.x)) * Scale;
// }
// #endif 
//----------------------------------------------------------------------------------------------
//VS
void main()
{
	ComFunc_PostProcess_DrawRectangle(Position0, Texcoord0,
									  VSOutPosition, VSOutTexcoord);
	gl_Position = VSOutPosition;
    VSOutFullViewUV = VSOutPosition.xy * vec2(0.5, -0.5) + 0.5;
#ifdef GLTEXTURE_FLIP_Y
    VSOutFullViewUV.y = 1.0 - VSOutFullViewUV.y;
#endif
// #if SHADER_TONEMAPPING
// 	ExposureScaleVignette = vec3(1.0, VignetteSpace(VSOutPosition.xy));
// #endif
}

#endif