
#include "common_ps.glsl"

#ifdef _FOG_ENABLE_
#include "fogcommon.glsl"
#endif

uniform sampler2D		g_NormalMap;
uniform sampler2D		g_NormalMap1;
uniform samplerCube		g_CubeReflectMap;
uniform highp vec3		EyePos;
uniform highp vec4		g_vWaterColor;
uniform highp vec3		SunLight;
uniform highp vec3  	LightDir;
uniform highp vec4      g_vWaveNormalMapOffset;

uniform highp vec4      g_WaterParam0;
#define SpecularPower	g_WaterParam0.x
#define FresnelBase     g_WaterParam0.y
#define FresnelPower    g_WaterParam0.z

varying highp vec3		VSOutTexcoord0; //uvWave
varying highp vec2		VSOutTexcoord1; 
varying highp vec3		VSOutWorldPosition;

highp vec3 SamplerNormalMap(sampler2D normalMap, highp vec2 uv)
{
	highp vec3 Normal;
	Normal.xz = texture2D(normalMap, uv).xy * 2.0 - 1.0;
	Normal.y = sqrt(1.0 - dot(Normal.xz, Normal.xz));

    //highp vec3 Normal;
	//Normal.xyz = texture2D(normalMap, uv).xzy;
	return Normal;
}

//	Build wave normal from 2 wave normal textures
highp vec3 BuildWaveNormal(sampler2D sam0, highp vec2 uv0, sampler2D sam1, highp vec2 uv1)
{
	highp vec3 vNorm1 = SamplerNormalMap(sam0, uv0);
	highp vec3 vNorm2 = SamplerNormalMap(sam1, uv1);
	highp vec3 vNormal = normalize(vNorm1 + vNorm2);
	return vNormal;
}

highp float CalcFresnel(highp vec3 ToEyeY, highp vec3 vNormal)
{
	//return FresnelBase + (1.0 - FresnelBase) * pow(1.0 - XSaturate(dot(ToEyeY, vNormal)), FresnelPower);
    highp float fAngle = XSaturate(ToEyeY.y);
    highp float fFresnel = 0.02037 + (1.0 - 0.02037) * pow(1.0 - fAngle, 5.0);
    return fFresnel;
}

highp vec3 CalcReflection(highp vec3 N, highp vec3 L)
{
	return 2.0 * dot(N, L) * N  - L;
}

highp float MaxComp(highp vec3 v)
{
    return max(max(v.x, v.y), v.z);
}

void main (void)
{
	highp vec3 vToEyeVec = normalize(EyePos - VSOutWorldPosition);
	highp vec3 vToLightVec = normalize(LightDir);

	//	Normal
	//highp vec2 vTexcoord = VSOutTexcoord0.xy;	
	highp vec3 vNormal = BuildWaveNormal(g_NormalMap, VSOutTexcoord0.xy, g_NormalMap1, VSOutTexcoord1.xy);

    // Specular Color
    highp vec3 vHalf = normalize(vToEyeVec + vToLightVec); // N dot H
	highp float fSpecPowerBase = XSaturate(dot(vHalf, vNormal));
    //highp float fSpec = pow(fSpecPowerBase, SpecularPower);

	highp float fSpec = pow(max(dot(reflect(-vToEyeVec,vNormal),vToLightVec),0.0),SpecularPower);
	highp vec3 SpecColor = fSpec * SunLight.rgb;

    // Sky Color
	highp vec4 cubeTex = textureCube(g_CubeReflectMap, CalcReflection(vNormal, vToEyeVec)); 
	highp vec3 SkyColor = cubeTex.rgb;

	// Base Color
	highp float fNdotL = dot(vToLightVec, vNormal);
	highp vec3 WaterColor = fNdotL * SunLight * g_vWaterColor.xyz;

	// Final Color
	highp float fFresnel = CalcFresnel(vToEyeVec, vNormal);
    //highp vec3 vFinalColor = mix(WaterColor, SkyColor, fFresnel) + SpecColor;
	highp vec3 vFinalColor = (SkyColor + SpecColor) * 0.7 + WaterColor;
	
#ifdef _FOG_ENABLE_
	// Fog
	if (EnableFog > 0.5)
	{
		highp vec4 FogColor = ComputeCompositeFog(VSOutWorldPosition, EyePos);
		vFinalColor = vec3(mix(vFinalColor.xyz, FogColor.xyz, FogColor.a));
	}
#endif

    // Alpha
    highp float fCubePower = MaxComp(cubeTex.rgb);
    highp float fCubeSpecAlpha = VSOutTexcoord0.z * pow(fCubePower * 1.1, 10.0);
    highp float fSpecAlpha = fSpec + fCubeSpecAlpha;
	
	highp float alpha = max(g_vWaterColor.w + 1.5 * fFresnel, fSpecAlpha);

    gl_FragColor = vec4(vFinalColor, alpha);
    //gl_FragColor = vec4(fFresnel, fFresnel, fFresnel, 1.0);
}
