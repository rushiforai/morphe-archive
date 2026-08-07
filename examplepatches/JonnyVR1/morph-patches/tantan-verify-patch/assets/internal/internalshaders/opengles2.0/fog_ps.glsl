//******************************************************************************

// @File         postprocess_copy_ps.glsl

// @Version       1.0

// @Created      2018, 6, 7

// @Description

// @HISTORY:

//******************************************************************************/

#include "fogcommon.glsl"
uniform highp vec3		CameraPos;
uniform highp vec4		DeviceZToWorldZ;
uniform highp sampler2D		SourceTexture;
uniform highp sampler2D		DepthTexture;
varying highp vec2		VSOutScreenPos;
varying highp vec2		VSOutTexCoord;
varying highp vec3		VSOutScreenVector;

highp float CalcSceneDepth(highp vec2 ScreenUV)
{
    highp float Depth = texture2D(DepthTexture, ScreenUV).x;
    //Depth = 2.0 * Depth - 1.0;
    //return (2.0 * 100.0 * 0.05) / (0.05 + 100.0 - Depth * (100.0 - 0.05));
	return 1.0 / (Depth * DeviceZToWorldZ[2] - DeviceZToWorldZ[3]);
}

void main(void)
{
	highp vec4 SceneColor = texture2D(SourceTexture, VSOutTexCoord);
	highp float SceneDepth = CalcSceneDepth(VSOutTexCoord);
    highp vec3 WorldPosition = VSOutScreenVector * SceneDepth + CameraPos;
    highp vec4 FogColor = ComputeCompositeFog(WorldPosition, CameraPos);
    gl_FragColor = vec4(mix(SceneColor.xyz, FogColor.xyz, FogColor.a), SceneColor.a);
}
