uniform highp vec4              FogParameter0;
uniform highp vec4              FogParameter1;
uniform highp vec4				FogParameter2;
#define FogStart                FogParameter0.x
#define FogRcpDist              FogParameter0.y
#define FogTop                  FogParameter0.z
#define FogHeightRcpIntensity   FogParameter0.w 
#define FogDensityUpper         FogParameter1.x
#define FogDensityLower         FogParameter1.y
#define FogHorzDensity          FogParameter1.z
#define FogHorzPower            FogParameter1.w 
#define FogWorldPosHeightOffset FogParameter2.x
#define FogDensity				FogParameter2.y
#define FogFixedAngleUpper		FogParameter2.z
#define FogFixedAngleLower		FogParameter2.w

uniform highp vec4              FogColorUpper;
uniform highp vec4              FogColorLower;
uniform highp float				EnableFog;

highp vec4 ComputeCompositeFog(highp vec3 WorldPosition, highp vec3 CameraPos)
{
    highp vec3 FogDir = vec3(0.0, -1.0, 0.0);
    highp vec3 WorldPosToCamera = WorldPosition + vec3(0.0, FogWorldPosHeightOffset, 0.0) - CameraPos;
	highp float Dist = length(WorldPosToCamera);
	highp vec3 ViewVector = WorldPosToCamera / Dist;
    highp float FdotV = dot(FogDir, ViewVector);
	highp float FdotV01 = FdotV * 0.5 + 0.5;
	highp float FdotUpperDir01 = -cos(FogFixedAngleUpper)* 0.5 + 0.5;
	highp float FdotLowerDir01 = cos(FogFixedAngleLower) * 0.5 + 0.5;
	FdotV01 = clamp((FdotV01 - FdotUpperDir01) / (FdotLowerDir01 - FdotUpperDir01), 0.0, 1.0);

	highp float MidIntensity = pow(abs(1.5 - abs(FdotV)), FogHorzDensity);// MidIntensity 		  越靠近中间越大
	highp float Lerp = pow(FdotV01, FogHorzPower);//获得上下半球雾的插值系数 		越靠近下方越大
	highp float Density = mix(FogDensityUpper, FogDensityLower, Lerp) * MidIntensity * FogDensity;//对雾浓度进行插值
	highp vec4 FogColor = mix(FogColorUpper, FogColorLower, Lerp);	//对雾颜色进行插值

	highp float UniformDist = clamp((Dist - FogStart) * FogRcpDist, 0.0, 1.0); // 距离转换到strat-end的0..1空间
	highp float ExpFog = (1.0 - 1.0 / exp(UniformDist * Density));  //进行指数雾计算
	highp float FogFactor = clamp(ExpFog * FogColor.a, 0.0, 1.0);

    // Part2: 额外垂直方向雾的计算
	// highp float UniformHeight = clamp((FogTop - WorldPosition.y) * FogHeightRcpIntensity, 0.0, 1.0); // 高度转换到0..1空间
	// highp float DistFactor = Dist * 0.001 * FogDensity;
	// highp float ExpFogHeight = max(0.0, (1.0 - 1.0 / exp(UniformHeight * DistFactor))); //进行指数雾计算
	// FogFactor += ExpFogHeight * abs(FdotV) * 2.0;
	// FogFactor = clamp(FogFactor, 0.0, 1.0);
    return vec4(FogColor.xyz, FogFactor);
}
