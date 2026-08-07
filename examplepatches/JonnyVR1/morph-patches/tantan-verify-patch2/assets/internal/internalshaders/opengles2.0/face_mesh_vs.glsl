
#include "common_vs.glsl"

attribute vec3 Position0;
attribute vec4 Normal0;
attribute vec4 Tangent0; // 切线没别的用处，暂时用来存储morph形变
attribute vec2 Texcoord0;

uniform mat4 WorldViewProjMatrix;
uniform mat4 WorldMatrix;
uniform vec3 EyePos;

varying vec2 VSOutTexcoord0; // 贴图纹理UV坐标
varying vec2 VSOutFaceUV;    // 原始的图像输入中的人脸UV坐标

varying vec3 VSOutViewDir;  // In tangent space
varying vec3 VSOutLightDir; // In tangent space

void main(void) {
  vec4 Inpos = vec4(Position0, 1.0);

  VSOutTexcoord0 = Texcoord0;

  vec4 blendShape = Tangent0;
  
  vec4 tmp = WorldViewProjMatrix * Inpos;

  // 需要在顶点变换之前计算原图的UV
  VSOutFaceUV = (vec2(tmp.x, tmp.y) / tmp.w + vec2(1.0, 1.0)) * 0.5;

  gl_Position = WorldViewProjMatrix * (Inpos + blendShape);
}
