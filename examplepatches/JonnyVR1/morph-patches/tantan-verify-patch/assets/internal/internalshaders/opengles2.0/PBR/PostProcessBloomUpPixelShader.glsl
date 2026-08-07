#include "PostProcessCommon.glsl"

in vec4 VSOutTexcoord0;
in vec4 VSOutTexcoord1;
in vec4 VSOutTexcoord2;
in vec4 VSOutTexcoord3;
in vec4 VSOutTexcoord4;
in vec4 VSOutTexcoord5;
in vec4 VSOutTexcoord6;
in vec4 VSOutTexcoord7;

out vec4 PSOutColor;

uniform vec3 UniParam_BloomUp_BloomTintA;
uniform vec3 UniParam_BloomUp_BloomTintB;
uniform sampler2D UniParam_BloomUp_TextureA;
uniform sampler2D UniParam_BloomUp_TextureB;

void main()
{
    vec3 A0 = texture(UniParam_BloomUp_TextureA, VSOutTexcoord0.xy).rgb;
	vec3 A1 = texture(UniParam_BloomUp_TextureA, VSOutTexcoord0.zw).rgb;
	vec3 A2 = texture(UniParam_BloomUp_TextureA, VSOutTexcoord1.xy).rgb;
	vec3 A3 = texture(UniParam_BloomUp_TextureA, VSOutTexcoord1.zw).rgb;
	vec3 A4 = texture(UniParam_BloomUp_TextureA, VSOutTexcoord2.xy).rgb;
	vec3 A5 = texture(UniParam_BloomUp_TextureA, VSOutTexcoord2.zw).rgb;
	vec3 A6 = texture(UniParam_BloomUp_TextureA, VSOutTexcoord3.xy).rgb;
	vec3 A7 = texture(UniParam_BloomUp_TextureA, VSOutTexcoord3.zw).rgb;

	vec3 B0 = texture(UniParam_BloomUp_TextureB, VSOutTexcoord3.zw).rgb;
	vec3 B1 = texture(UniParam_BloomUp_TextureB, VSOutTexcoord4.xy).rgb;
	vec3 B2 = texture(UniParam_BloomUp_TextureB, VSOutTexcoord4.zw).rgb;
	vec3 B3 = texture(UniParam_BloomUp_TextureB, VSOutTexcoord5.xy).rgb;
	vec3 B4 = texture(UniParam_BloomUp_TextureB, VSOutTexcoord5.zw).rgb;
	vec3 B5 = texture(UniParam_BloomUp_TextureB, VSOutTexcoord6.xy).rgb;
	vec3 B6 = texture(UniParam_BloomUp_TextureB, VSOutTexcoord6.zw).rgb;
	vec3 B7 = texture(UniParam_BloomUp_TextureB, VSOutTexcoord7.xy).rgb;

	PSOutColor.rgb = 
		A0 * UniParam_BloomUp_BloomTintA + 
		A1 * UniParam_BloomUp_BloomTintA + 
		A2 * UniParam_BloomUp_BloomTintA + 
		A3 * UniParam_BloomUp_BloomTintA + 
		A4 * UniParam_BloomUp_BloomTintA + 
		A5 * UniParam_BloomUp_BloomTintA + 
		A6 * UniParam_BloomUp_BloomTintA + 
		A7 * UniParam_BloomUp_BloomTintA +
		B0 * UniParam_BloomUp_BloomTintB + 
		B1 * UniParam_BloomUp_BloomTintB + 
		B2 * UniParam_BloomUp_BloomTintB + 
		B3 * UniParam_BloomUp_BloomTintB + 
		B4 * UniParam_BloomUp_BloomTintB + 
		B5 * UniParam_BloomUp_BloomTintB + 
		B6 * UniParam_BloomUp_BloomTintB + 
		B7 * UniParam_BloomUp_BloomTintB;
	PSOutColor.a = 0.0;
}
