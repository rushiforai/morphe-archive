#include "common_vs.glsl"

attribute vec3	Position0;
attribute vec2	Texcoord0;

varying vec3	VSOutTexcoord0;
varying vec2	VSOutTexcoord1;
varying vec3	VSOutWorldPosition;	

uniform  mat4   WorldViewProjMatrix;
uniform  float  g_fNMapUVScale;
uniform  vec4   g_vWaveNormalMapOffset;

void main(void)
{
	vec3 vInPos = Position0;
	vec4 outputPos = WorldViewProjMatrix * vec4(vInPos, 1.0);
	gl_Position = outputPos;

	vec2 coord = Texcoord0 * g_fNMapUVScale * 2.0;
    VSOutTexcoord0.xy = coord * 1.3 + g_vWaveNormalMapOffset.xy;
    VSOutTexcoord1.xy = coord * 0.7 + g_vWaveNormalMapOffset.zw;
	float fDistFactor = outputPos.z / 100.0;
    VSOutTexcoord0.z = XSaturate(1.5 - fDistFactor * 0.8);   // cube
	VSOutWorldPosition = Position0;
}