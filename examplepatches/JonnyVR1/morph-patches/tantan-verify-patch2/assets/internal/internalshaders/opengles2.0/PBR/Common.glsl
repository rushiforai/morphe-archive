#ifndef _COMMON_GLSL_
#define _COMMON_GLSL_

#include "Definitions.glsl"

#if FLOAT_HIGH_PRECISION
precision highp float;
#else
precision mediump float;
#endif

uniform mat4 UniParam_WorldToView;
uniform mat4 UniParam_WorldToClip;
uniform mat4 UniParam_ScreenToTranslatedWorld;
uniform mat4 UniParam_ViewToClip;
uniform mat4 UniParam_PreWorldToClip;
uniform vec4 UniParam_DeviceZToWorldZ;

uniform vec3 UniParam_CameraPos;
uniform vec3 UniParam_CameraForward;
uniform vec3 UniParam_CameraUp;
uniform vec3 UniParam_CameraRight;

uniform float UniParam_GameTime;

uniform vec4 UniParam_RTSizeAndInvSize;

uniform vec4 UniParam_TemporalAAParams;		// x: temporal sample index, y: temporal sample sequence length, z: sample location x, w: sample location y.
uniform vec4 UniParam_TemporalAAJitters;	// xy: current frame jitter, zw: pre-frame jitter.

// Only valid in Translucent materials.
uniform sampler2D UniParam_SceneColorDepthTextureSampler;

vec2 InternalFunc_RenderTargetUV(vec2 SvPosition)
{
	return SvPosition.xy * UniParam_RTSizeAndInvSize.zw;
}

// Depth in eye space
float InternalFunc_ConvertFromDeviceZ(float DeviceZ)
{
	return 1.0f / (DeviceZ * UniParam_DeviceZToWorldZ[2] - UniParam_DeviceZToWorldZ[3]);
}

float InternalFunc_ConvertToDeviceZ(float SceneDepth)
{
	return 1.0f / ((SceneDepth + UniParam_DeviceZToWorldZ[3]) * UniParam_DeviceZToWorldZ[2]);
}

// Depth in eye space
highp float InternalFunc_LinearEyeDepth(float DeviceZ)
{
	return 1.0f / (DeviceZ * UniParam_DeviceZToWorldZ[2] - UniParam_DeviceZToWorldZ[3]);
}

// Linear depth in range 0~1
highp float InternalFunc_LinearDepth(float DeviceZ)
{
	return InternalFunc_LinearEyeDepth(DeviceZ) / UniParam_DeviceZToWorldZ[1];
}

#define InternalFunc_TangentBias(X) (X * 2.0f - 1.0f)

vec3 InternalFunc_TransformTangentVectorToWorld(mat3 TangentToWorld, vec3 InTangentVector)
{
	return TangentToWorld * InTangentVector;
}

float InternalFunc_Mod(float X, float Y)
{
	return X - Y * floor(X / Y);
}

float InternalFunc_rsqrt(float x)
{
   if (x == 0.0f) return 0.0f;
   return 1.0 / sqrt(x);
}

const float PI = 3.1415926535897932f;
const float INVERSEPI = 0.3183098861837907f;

float InternalFunc_Square( float X )
{
	return X * X;
}

vec2 InternalFunc_Square( vec2 X )
{
	return X * X;
}

vec3 InternalFunc_Square( vec3 X )
{
	return X * X;
}

vec4 InternalFunc_Square( vec4 X )
{
	return X * X;
}

float InternalFunc_ClampedPow(float X, float Y)
{
	return pow(max(abs(X), 0.000001f), Y);
}
vec2 InternalFunc_ClampedPow(vec2 X, vec2 Y)
{
	return pow(max(abs(X), vec2(0.000001f, 0.000001f)), Y);
}
vec3 InternalFunc_ClampedPow(vec3 X, vec3 Y)
{
	return pow(max(abs(X), vec3(0.000001f, 0.000001f, 0.000001f)), Y);
}  
vec4 InternalFunc_ClampedPow(vec4 X, vec4 Y)
{
	return pow(max(abs(X), vec4(0.000001f, 0.000001f, 0.000001f, 0.000001f)), Y);
} 

float InternalFunc_PhongShadingPow(float X, float Y)
{
	return InternalFunc_ClampedPow(X, Y);
}

float InternalFunc_Pow4( float x )
{
	float xx = x*x;
	return xx * xx;
}
float InternalFunc_Pow5( float x )
{
	float xx = x*x;
	return xx * xx * x;
}

float InternalFunc_Luminance(vec3 LinearColor)
{
	return dot(LinearColor, vec3(0.3f, 0.59f, 0.11f));
}

vec3 InternalFunc_CheapContrast(in float val, in float contrast)
{
    vec3 Lerp = mix(vec3(0.0 - contrast), vec3(contrast + 1.0), val);
	vec3 Result = min(max(Lerp, vec3(0.0)), vec3(1.0));
    return Result;
}

float InternalFunc_Fresnel(in vec3 WorldNormal, in vec3 CameraDir, in float ExponentIn, in float BaseReflectFrctionIn)
{
	float Local229 = dot(WorldNormal, CameraDir);
	float Local230 = max(0.0, Local229);
	float Local231 = (1.0 - Local230);
	float Local232 = abs(Local231);
	float Local233 = InternalFunc_ClampedPow(Local232,ExponentIn);
	float Local234 = (Local233 * (1.0 - BaseReflectFrctionIn));
	float Local235 = (Local234 + BaseReflectFrctionIn);
    return Local235;
}

vec3 InternalFunc_SRGBToLinear1(vec3 sRGB)
{
	return (sRGB.r < 0.04045 && sRGB.g < 0.04045 && sRGB.b < 0.04045)? sRGB.rgb / 12.92 : pow((sRGB.rgb + 0.055)/1.055, vec3(2.4)) ;
}

float InternalFunc_Frac(float x)
{
	return x - floor(x);
}

#define FLT_MAX 3.402823466e+38

float InternalFunc_Rcp(float s)
{
	if(s != 0.0)
	{
		return 1.0 / s;
	}
	else
	{
		return FLT_MAX;	
	}
}

float InternalFunc_SphereMask(in vec2 A, in float B, in float Radius, in float Hardness)
{
	vec2 local0 = A - vec2(B);
	float local1 = dot(local0,local0);
	float local2 = sqrt(local1);
	float local3 = (local2 * (1.0 / max(0.00001, Radius)));
	float local4 = (1.0 - local3);
	float local5 = (local4 * (1.0 / max((1.0 - Hardness), 0.00001)));
	float local6 = min(max(local5,0.0),1.0);
	return local6;
}

int InternalFunc_DecodeShadingModelId(float InPackedChannel)
{
	return int(InPackedChannel);
}

vec2 InternalFunc_GetTanHalfFieldOfView()
{
	return vec2(1.0 / UniParam_ViewToClip[0][0], 1.0 / UniParam_ViewToClip[1][1]);
}

vec2 InternalFunc_GetCotanHalfFieldOfView()
{
	return vec2(UniParam_ViewToClip[0][0], UniParam_ViewToClip[1][1]);
}

// max absolute error 9.0x10^-3
// Eberly's polynomial degree 1 - respect bounds
// 4 VGPR, 12 FR (8 FR, 1 QR), 1 scalar
// input [-1, 1] and output [0, PI]
float InternalFunc_ACosFast(float inX) 
{
    float x = abs(inX);
    float res = -0.156583f * x + (0.5 * PI);
    res *= sqrt(1.0f - x);
    return (inX >= 0.0) ? res : PI - res;
}

// Same cost as acosFast + 1 FR
// Same error
// input [-1, 1] and output [-PI/2, PI/2]
float InternalFunc_ASinFast( float x )
{
    return (0.5 * PI) - InternalFunc_ACosFast(x);
}

bool InternalFunc_GetShadowReplaceState()
{
#ifdef SHADOW_DEPTH_SHADER
	return true;
#else
	return false;
#endif
}

float InternalFunc_DepthFade(vec4 SvPosition, float PixelDepth, float Opacity, float FadeDistance)
{
#if SCENE_COLOR_DEPTH_VALID
	vec2 ScreenUV = SvPosition.xy / SvPosition.w * 0.5 + 0.5;
	float SceneDepth = InternalFunc_ConvertFromDeviceZ(texture(UniParam_SceneColorDepthTextureSampler, ScreenUV).w);
	float Fade = clamp((SceneDepth - PixelDepth) / FadeDistance, 0.0, 1.0);
	return Opacity * Fade;
#else
	return Opacity;
#endif
}

vec4 InternalFunc_SampleRGBATexture(sampler2D Tex, vec2 TexCoord)
{
#if USING_ETC1
	//#ifdef _REPEAT_ADDRESS_
	//	float V = TexCoord.y - floor(TexCoord.y);
	//#else
		float V = clamp(TexCoord.y, 0.01, 0.99);
	//#endif

	vec4 TexColor;
	TexColor.rgb = texture(Tex, vec2(TexCoord.x, V * 0.5)).rgb;
	TexColor.a = texture(Tex, vec2(TexCoord.x, V * 0.5 + 0.5)).r;
#else
	vec4 TexColor = texture(Tex, TexCoord);
#endif
	return TexColor;
}

#endif