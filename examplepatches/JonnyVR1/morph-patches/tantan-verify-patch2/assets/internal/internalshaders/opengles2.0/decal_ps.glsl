//******************************************************************************

// @File         particle_ps.glsl

//******************************************************************************/

#include "common_ps.glsl"
uniform highp mat4 SvPositionToDecal;
uniform highp vec2 InvViewportSize;
uniform sampler2D g_DiffuseSampler;
uniform sampler2D DepthTexture;
void main(void)
{
    highp vec2 ScreenUV = gl_FragCoord.xy * InvViewportSize;
    highp float SceneTextureDepth = texture2D(DepthTexture, ScreenUV).r;
    highp float FragCoordY = gl_FragCoord.y;
#ifndef GLTEXTURE_FLIP_Y 
    FragCoordY = 1.0 / InvViewportSize.y - gl_FragCoord.y;
#endif
    highp vec4 clipPos = SvPositionToDecal * vec4(gl_FragCoord.x, FragCoordY, SceneTextureDepth, 1.0);
    highp vec3 OSPosition = (clipPos / clipPos.w).xyz;
    highp vec3 absOSPosition = abs((clipPos / clipPos.w).xyz);
    if( absOSPosition.x > 1.0 || absOSPosition.y > 1.0 || absOSPosition.z > 1.0)
    {
        discard;
    }
	gl_FragColor = SampleDiffuseTexture(g_DiffuseSampler, vec2(OSPosition.x * 0.5 + 0.5, 0.5 - OSPosition.z * 0.5)).xyzw;
}
