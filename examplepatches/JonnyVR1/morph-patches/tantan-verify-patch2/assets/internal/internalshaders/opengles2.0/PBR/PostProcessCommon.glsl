#ifndef _POST_PROCESS_COMMON_GLSL_
#define _POST_PROCESS_COMMON_GLSL_

#include "Common.glsl"

uniform vec4	UniParam_PostProcess_PosScaleBias;
uniform vec4	UniParam_PostProcess_UVScaleBias;
uniform vec4	UniParam_PostProcess_InvTargetSizeAndTextureSize;

void ComFunc_PostProcess_DrawRectangle(	in vec4 InPosition,
										in vec2 InTexCoord,
										out vec4 OutPosition,
										out vec2 OutTexCoord)
{
	OutPosition = InPosition;
	OutPosition.xy = -1.0 + 2.0 * (UniParam_PostProcess_PosScaleBias.zw + (InPosition.xy * UniParam_PostProcess_PosScaleBias.xy)) * UniParam_PostProcess_InvTargetSizeAndTextureSize.xy;
	OutTexCoord.xy = (UniParam_PostProcess_UVScaleBias.zw + (InTexCoord.xy * UniParam_PostProcess_UVScaleBias.xy)) * UniParam_PostProcess_InvTargetSizeAndTextureSize.zw;
#ifdef GLTEXTURE_FLIP_Y
    OutTexCoord.y = 1.0 - OutTexCoord.y;
#endif
}

vec4 UnwrappedTexture3DSamplePoint(sampler2D Texture, vec3 UVW, float Size)
{
    float IntW = floor( UVW.z * Size - 0.5 );
	float FracW = UVW.z * Size - 0.5 - IntW;

	float U = ( UVW.x + IntW ) / Size;
	float V = UVW.y;

	vec4 RG0 = texture( Texture, vec2(U, V) );
	vec4 RG1 = texture( Texture, vec2(U + 1.0f / Size, V) );

	return mix(RG0, RG1, FracW);
}

#endif