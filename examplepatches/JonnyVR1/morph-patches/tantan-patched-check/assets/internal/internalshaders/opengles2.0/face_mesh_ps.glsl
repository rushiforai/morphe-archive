
#include "common_ps.glsl"
#include "lightcommon_ps.glsl"

uniform sampler2D g_OriginSampler;
uniform sampler2D g_DiffuseSampler;
uniform sampler2D g_SSAOMaskSampler;

varying highp vec2 VSOutTexcoord0;
varying highp vec3 VSOutViewDir;  // In tangent space
varying highp vec3 VSOutLightDir; // In tangent space

varying highp vec2 VSOutFaceUV; // 原始的图像输入中的人脸UV坐标

void main(void) {
  // UV
  highp vec2 Texcoord0 = VSOutTexcoord0;

#ifdef FLIP_UV_VERTICAL
  Texcoord0.y = 1.0 - Texcoord0.y;
#endif
#ifdef FLIP_UV_HORIZONTAL
  Texcoord0.x = 1.0 - Texcoord0.x;
#endif

  // Sample the diffuse texture.
  highp vec4 faceColor = texture2D(g_OriginSampler, VSOutFaceUV);
  highp vec4 maskColor = SampleDiffuseTexture(g_DiffuseSampler, Texcoord0);

  gl_FragColor =
      vec4(mix(faceColor.rgb, maskColor.rgb, maskColor.a), 1.0);
}