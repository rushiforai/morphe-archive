#include "PostProcessCommon.glsl"

in vec2 VSOutTexcoord;
in vec4 VSOutPosition;

out vec4 PSOutColor;

const float WhiteTemp = 6500.0;
const float WhiteTint = 0.0;
const float ExpandGamut = 1.0;
const float BlueCorrection = 0.6;
const float FilmBlackClip = 0.0;
const float FilmWhiteClip = 1.0;
const float FilmToe = 0.425;
const float FilmShoulder = 0.47;
const float FilmSlope = 0.95;

vec3 LinearTosRGB(vec3 LinearColor)
{
	return (LinearColor.r < 0.0031308 && LinearColor.g < 0.0031308 && LinearColor.b < 0.0031308) ? 12.92 * LinearColor.rgb : 1.055 * pow(LinearColor.rgb, vec3(1.0 / 2.4)) - vec3(0.055, 0.055, 0.055);
}

const mat3 AP0_2_AP1_MAT = mat3(
	1.4514393161, -0.2365107469, -0.2149285693,
	-0.0765537734, 1.1762296998, -0.0996759264,
	 0.0083161484, -0.0060324498, 0.9977163014
);

const mat3 AP1_2_AP0_MAT = mat3(
	 0.6954522414, 0.1406786965, 0.1638690622,
	 0.0447945634, 0.8596711185, 0.0955343182,
	-0.0055258826, 0.0040252103, 1.0015006723
);

const vec3 AP1_RGB2Y = vec3(0.2722287168, 0.6740817658, 0.0536895174);

const mat3 XYZ_2_sRGB_MAT = mat3(
	 3.2409699419, -1.5373831776, -0.4986107603,
	-0.9692436363, 1.8759675015, 0.0415550574,
	 0.0556300797, -0.2039769589, 1.0569715142
);

const mat3 XYZ_2_AP0_MAT = mat3(
	 1.0498110175, 0.0000000000,-0.0000974845,
	-0.4959030231, 1.3733130458, 0.0982400361,
	 0.0000000000, 0.0000000000, 0.9912520182
);

const mat3 sRGB_2_XYZ_MAT = mat3(
	0.4124564, 0.3575761, 0.1804375,
	0.2126729, 0.7151522, 0.0721750,
	0.0193339, 0.1191920, 0.9503041
);

const mat3 AP0_2_XYZ_MAT = mat3(
	0.9525523959, 0.0000000000, 0.0000936786,
	0.3439664498, 0.7281660966,-0.0721325464,
	0.0000000000, 0.0000000000, 1.0088251844
);

const mat3 AP1_2_XYZ_MAT = mat3(
	 0.6624541811, 0.1340042065, 0.1561876870,
	 0.2722287168, 0.6740817658, 0.0536895174,
	-0.0055746495, 0.0040607335, 1.0103391003
);

const mat3 M = mat3(
	vec3(0.5, -1.0, 0.5),
	vec3(-1.0, 1.0, 0.5),
	vec3(0.5, 0.0, 0.0)
);

const mat3 GamutMappingIdentityMatrix = mat3(1.0, 0.0, 0.0, 
											 0.0, 1.0, 0.0,
											 0.0, 0.0, 1.0);

const mat3 D65_2_D60_CAT = mat3(
	 1.01303, 0.00610531, -0.014971,
	 0.00769823, 0.998165, -0.00503203,
	-0.00284131, 0.00468516, 0.924507
);

const mat3 D60_2_D65_CAT = mat3(
	 0.987224, -0.00611327, 0.0159533,
	-0.00759836, 1.00186, 0.00533002,
	 0.00307257, -0.00509595, 1.08168
);

const mat3 XYZ_2_AP1_MAT = mat3(
	 1.6410233797, -0.3248032942, -0.2364246952,
	-0.6636628587, 1.6153315917, 0.0167563477,
	 0.0117218943, -0.0082844420, 0.9883948585
);

vec3 LogToLin( vec3 LogColor )
{
	const float LinearRange = 14.0;
	const float LinearGrey = 0.18;
	const float ExposureGrey = 444.0;

	vec3 LinearColor = exp2((LogColor - ExposureGrey / 1023.0) * LinearRange) * LinearGrey;
	return LinearColor;
}

vec2 D_IlluminantChromaticity(float Temp)
{
	Temp *= 1.4388 / 1.438;

	float x = Temp <= 7000.0 ?
				0.244063 + ( 0.09911e3 + ( 2.9678e6 - 4.6070e9 / Temp ) / Temp ) / Temp :
				0.237040 + ( 0.24748e3 + ( 1.9018e6 - 2.0064e9 / Temp ) / Temp ) / Temp;

	float y = -3.0 * x*x + 2.87 * x - 0.275;

	return vec2(x,y);
}

vec2 PlanckianLocusChromaticity(float Temp)
{
	float u = ( 0.860117757f + 1.54118254e-4f * Temp + 1.28641212e-7f * Temp*Temp ) / ( 1.0f + 8.42420235e-4f * Temp + 7.08145163e-7f * Temp*Temp );
	float v = ( 0.317398726f + 4.22806245e-5f * Temp + 4.20481691e-8f * Temp*Temp ) / ( 1.0f - 2.89741816e-5f * Temp + 1.61456053e-7f * Temp*Temp );

	float x = 3.0 * u / (2.0 * u - 8.0 * v + 4.0);
	float y = 2.0 * v / (2.0 * u - 8.0 * v + 4.0 );

	return vec2(x,y);
}

vec2 PlanckianIsothermal(float Temp, float Tint)
{
	float u = ( 0.860117757f + 1.54118254e-4f * Temp + 1.28641212e-7f * Temp*Temp ) / ( 1.0f + 8.42420235e-4f * Temp + 7.08145163e-7f * Temp*Temp );
	float v = ( 0.317398726f + 4.22806245e-5f * Temp + 4.20481691e-8f * Temp*Temp ) / ( 1.0f - 2.89741816e-5f * Temp + 1.61456053e-7f * Temp*Temp );

	float ud = ( -1.13758118e9f - 1.91615621e6f * Temp - 1.53177f * Temp*Temp ) / pow(1.41213984e6f + 1189.62f * Temp + Temp*Temp, 2.0);
	float vd = ( 1.97471536e9f - 705674.0f * Temp - 308.607f * Temp*Temp ) / pow(6.19363586e6f - 179.456f * Temp + Temp*Temp, 2.0 );

	vec2 uvd = normalize(vec2(u, v));

	u += -uvd.y * Tint * 0.05;
	v += uvd.x * Tint * 0.05;

	float x = 3.0 * u / ( 2.0 * u - 8.0 * v + 4.0);
	float y = 2.0 * v / ( 2.0 * u - 8.0 * v + 4.0);

	return vec2(x,y);
}

vec3 xyY_2_XYZ(vec3 xyY)
{
	vec3 XYZ;
	XYZ[0] = xyY[0] * xyY[2] / max( xyY[1], 1e-10);
	XYZ[1] = xyY[2];
	XYZ[2] = (1.0 - xyY[0] - xyY[1]) * xyY[2] / max( xyY[1], 1e-10);

	return XYZ;
}

mat3 ChromaticAdaptation( vec2 src_xy, vec2 dst_xy )
{
	const mat3 ConeResponse = mat3(
		 0.8951, 0.2664, -0.1614,
		-0.7502, 1.7135, 0.0367,
		 0.0389, -0.0685, 1.0296
	);
	const mat3 InvConeResponse = mat3(
		 0.9869929, -0.1470543, 0.1599627,
		 0.4323053, 0.5183603, 0.0492912,
		-0.0085287, 0.0400428, 0.9684867
	);

	vec3 src_XYZ = xyY_2_XYZ(vec3(src_xy, 1.0));
	vec3 dst_XYZ = xyY_2_XYZ(vec3(dst_xy, 1.0));

	vec3 src_coneResp = src_XYZ * ConeResponse;
	vec3 dst_coneResp = dst_XYZ * ConeResponse;

	mat3 VonKriesMat = mat3(
		vec3(dst_coneResp[0] / src_coneResp[0], 0.0, 0.0),
		vec3(0.0, dst_coneResp[1] / src_coneResp[1], 0.0),
		vec3(0.0, 0.0, dst_coneResp[2] / src_coneResp[2])
	);

	return ConeResponse * VonKriesMat * InvConeResponse;
}

vec3 WhiteBalance(vec3 LinearColor)
{
	vec2 SrcWhiteDaylight = D_IlluminantChromaticity(WhiteTemp);
	vec2 SrcWhitePlankian = PlanckianLocusChromaticity(WhiteTemp);

	vec2 SrcWhite = WhiteTemp < 4000.0 ? SrcWhitePlankian : SrcWhiteDaylight;
	vec2 D65White = vec2(0.31270, 0.32900);

	vec2 Isothermal = PlanckianIsothermal( WhiteTemp, WhiteTint ) - SrcWhitePlankian;
	SrcWhite += Isothermal;
	
	mat3 WhiteBalanceMat = ChromaticAdaptation( SrcWhite, D65White );
	WhiteBalanceMat = sRGB_2_XYZ_MAT * WhiteBalanceMat * XYZ_2_sRGB_MAT;

	return LinearColor * WhiteBalanceMat;
}

float rgb_2_saturation(vec3 rgb)
{
	float minrgb = min( min(rgb.r, rgb.g ), rgb.b );
	float maxrgb = max( max(rgb.r, rgb.g ), rgb.b );
	return ( max( maxrgb, 1e-10 ) - max( minrgb, 1e-10 ) ) / max( maxrgb, 1e-2 );
}

float rgb_2_yc(vec3 rgb, float ycRadiusWeight)
{
	float r = rgb[0];
	float g = rgb[1];
	float b = rgb[2];

	float chroma = sqrt(b*(b-g)+g*(g-r)+r*(r-b));

	return (b + g + r + ycRadiusWeight * chroma) / 3.0;
}

float sigmoid_shaper( float x)
{
	float t = max(1.0 - abs(0.5 * x ), 0.0);
	float y = 1.0 + sign(x) * (1.0 - t*t);
	return 0.5 * y;
}

float glow_fwd( float ycIn, float glowGainIn, float glowMid)
{
   float glowGainOut;

   if (ycIn <= 2.0/3.0 * glowMid) {
	 glowGainOut = glowGainIn;
   } else if ( ycIn >= 2.0 * glowMid) {
	 glowGainOut = 0.0;
   } else {
	 glowGainOut = glowGainIn * (glowMid / ycIn - 0.5);
   }

   return glowGainOut;
}

float rgb_2_hue(vec3 rgb)
{
	float hue;
	if (rgb[0] == rgb[1] && rgb[1] == rgb[2])
	{
		hue = 0.0;
	}
	else
	{
		hue = (180.0 / PI) * atan(sqrt(3.0)*(rgb[1] - rgb[2]), 2.0 * rgb[0] - rgb[1] - rgb[2]);
	}

	if (hue < 0.0)
		hue = hue + 360.0;

	return clamp(hue, 0.0, 360.0);
}

float center_hue( float hue, float centerH)
{
	float hueCentered = hue - centerH;
	if (hueCentered < -180.0)
		hueCentered += 360.0;
	else if (hueCentered > 180.0)
		hueCentered -= 360.0;
	return hueCentered;
}

float log10(float x)
{
	return log(x) / log(10.0);
}

vec3 log10(vec3 v)
{
	return vec3(log10(v.x), log10(v.y), log10(v.z));
}

vec3  FilmToneMap(vec3  LinearColor)
{
	const mat3 AP0_2_AP1 = AP0_2_XYZ_MAT * XYZ_2_AP1_MAT;
	const mat3 AP1_2_AP0 = AP1_2_XYZ_MAT * XYZ_2_AP0_MAT;

	vec3 ColorAP1 = LinearColor;
	vec3 ColorAP0 = ColorAP1 * AP1_2_AP0;

	const float RRT_GLOW_GAIN = 0.05;
	const float RRT_GLOW_MID = 0.08;

	float saturation = rgb_2_saturation(ColorAP0);
	float ycIn = rgb_2_yc(ColorAP0,  1.75);
	float s = sigmoid_shaper( (saturation - 0.4) / 0.2);
	float addedGlow = 1.0 + glow_fwd( ycIn, RRT_GLOW_GAIN * s, RRT_GLOW_MID);
	ColorAP0 *= addedGlow;
	
	const float RRT_RED_SCALE = 0.82;
	const float RRT_RED_PIVOT = 0.03;
	const float RRT_RED_HUE = 0.0;
	const float RRT_RED_WIDTH = 135.0;
	float hue = rgb_2_hue( ColorAP0 );
	float centeredHue = center_hue( hue, RRT_RED_HUE );
	float hueWeight = pow(smoothstep(0.0, 1.0, 1.0 - abs( 2.0 * centeredHue / RRT_RED_WIDTH)) ,2.0);

	ColorAP0.r += hueWeight * saturation * (RRT_RED_PIVOT - ColorAP0.r) * (1.0 - RRT_RED_SCALE);

	vec3 WorkingColor = ColorAP0 * AP0_2_AP1_MAT;

	WorkingColor = max(vec3(0.0), WorkingColor);

	WorkingColor = mix(vec3(dot(WorkingColor, AP1_RGB2Y)), WorkingColor, 0.96 );

	const  float  ToeScale = 1.0 + FilmBlackClip - FilmToe;
	const  float  ShoulderScale = 1.0 + FilmWhiteClip - FilmShoulder;

	const float InMatch = 0.18;
	const float OutMatch = 0.18;

	float ToeMatch;
	if( FilmToe > 0.8 )
	{
		ToeMatch = ( 1.0 - FilmToe - OutMatch ) / FilmSlope + log10( InMatch );
	}
	else
	{
		const float bt = ( OutMatch + FilmBlackClip ) / ToeScale - 1.0;
		ToeMatch = log10( InMatch ) - 0.5 * log( (1.0+bt)/(1.0-bt) ) * (ToeScale / FilmSlope);
	}	

	float StraightMatch = ( 1.0 - FilmToe ) / FilmSlope - ToeMatch;
	float ShoulderMatch = FilmShoulder / FilmSlope - StraightMatch;

	vec3  LogColor = log10(WorkingColor);
	vec3  StraightColor = FilmSlope * ( LogColor + StraightMatch );

	vec3  ToeColor = ( -FilmBlackClip ) + (2.0 * ToeScale) / ( 1.0 + exp( (-2.0 * FilmSlope / ToeScale) * ( LogColor - ToeMatch ) ) );
	vec3  ShoulderColor = ( 1.0 + FilmWhiteClip ) - (2.0 * ShoulderScale) / ( 1.0 + exp( ( 2.0 * FilmSlope / ShoulderScale) * ( LogColor - ShoulderMatch ) ) );

	ToeColor = vec3(LogColor.x < ToeMatch ? ToeColor.x : StraightColor.x, LogColor.y < ToeMatch ? ToeColor.y : StraightColor.y, LogColor.z < ToeMatch ? ToeColor.z : StraightColor.z);
	ShoulderColor = vec3(LogColor.x > ShoulderMatch ? ShoulderColor.x : StraightColor.x, LogColor.y > ShoulderMatch ? ShoulderColor.y : StraightColor.y, LogColor.z > ShoulderMatch ? ShoulderColor.z : StraightColor.z);
	
	vec3  t = clamp( ( LogColor - ToeMatch ) / ( ShoulderMatch - ToeMatch ), 0.0, 1.0);
	t = ShoulderMatch < ToeMatch ? 1.0 - t : t;
	t = (3.0-2.0*t)*t*t;
	vec3  ToneColor = mix( ToeColor, ShoulderColor, t );

	ToneColor = mix( vec3(dot( vec3(ToneColor), AP1_RGB2Y )), ToneColor, 0.93 );
	
	return max( vec3(0.0), ToneColor );
}

float  LinearToSrgbBranchingChannel( float  lin)
{
	if(lin < 0.00313067) return lin * 12.92;
	return pow(lin, (1.0/2.4)) * 1.055 - 0.055;
}

vec3  LinearToSrgbBranching( vec3  lin)
{
	return  vec3 (
		LinearToSrgbBranchingChannel(lin.r),
		LinearToSrgbBranchingChannel(lin.g),
		LinearToSrgbBranchingChannel(lin.b));
}

vec3  LinearToSrgb( vec3  lin)
{
	return LinearToSrgbBranching(lin);
}

const float LUTSize = 32.0;
void main()
{
	vec4 Neutral;	
	vec2 UV = VSOutTexcoord - vec2(0.499999f / (LUTSize * LUTSize), 0.499999f / LUTSize);

	vec3 RGB;	
	RGB.r = fract(UV.x * LUTSize);
	RGB.b = UV.x - RGB.r / LUTSize;
	RGB.g = UV.y;
	Neutral = vec4(RGB * 1.032258064516129, 0); // 1.032258064516129 = LUTSize / (LUTSize - 1);
	
	const mat3 sRGB_2_AP1 = sRGB_2_XYZ_MAT * D65_2_D60_CAT * XYZ_2_AP1_MAT;
	const mat3 AP1_2_sRGB = AP1_2_XYZ_MAT * D60_2_D65_CAT * XYZ_2_sRGB_MAT;
	const mat3 AP0_2_AP1 = AP0_2_XYZ_MAT * XYZ_2_AP1_MAT;
	const mat3 AP1_2_AP0 = AP1_2_XYZ_MAT * XYZ_2_AP0_MAT;
	const mat3 AP1_2_Output = AP1_2_XYZ_MAT * D60_2_D65_CAT * XYZ_2_sRGB_MAT;
	
	vec3 LUTEncodedColor = Neutral.rgb;
	vec3 LinearColor = LogToLin(LUTEncodedColor) - LogToLin(vec3(0.0));
	vec3 BalancedColor = LinearColor;//WhiteBalance(LinearColor);	
	vec3 ColorAP1 = BalancedColor * sRGB_2_AP1;
	float LumaAP1 = dot(ColorAP1, AP1_RGB2Y);
	vec3 ChromaAP1 = ColorAP1 / LumaAP1;
	float ChromaDistSqr = dot(ChromaAP1 - 1.0, ChromaAP1 - 1.0);
	float ExpandAmount = (1.0 - exp2(-4.0 * ChromaDistSqr)) * (1.0 - exp2(-4.0 * ExpandGamut * LumaAP1*LumaAP1));

	const mat3 Wide_2_XYZ_MAT = mat3(
			0.5441691, 0.2395926, 0.1666943,
			0.2394656, 0.7021530, 0.0583814,
			-0.0023439, 0.0361834, 1.0552183
	);

	const mat3 Wide_2_AP1 = Wide_2_XYZ_MAT * XYZ_2_AP1_MAT;
	const mat3 ExpandMat = AP1_2_sRGB * Wide_2_AP1;

	vec3 ColorExpand = ColorAP1 * ExpandMat;
	ColorAP1 = mix(ColorAP1, ColorExpand, ExpandAmount);
	
	//ColorAP1 = ColorCorrectAll( ColorAP1 );
	
	vec3 GradedColor = ColorAP1 * AP1_2_sRGB;

	const mat3 BlueCorrect = mat3(
		0.9404372683, -0.0183068787, 0.0778696104,
		0.0083786969, 0.8286599939, 0.1629613092,
		0.0005471261, -0.0008833746, 1.0003362486
	);
	
	const mat3 BlueCorrectInv = mat3(
		1.06318, 0.0233956, -0.0865726,
		-0.0106337, 1.20632, -0.19569,
		-0.000590887, 0.00105248, 0.999538
	);
	const mat3 BlueCorrectAP1 = AP1_2_AP0 * BlueCorrect * AP0_2_AP1;
	const mat3 BlueCorrectInvAP1 = AP1_2_AP0 * BlueCorrectInv * AP0_2_AP1;

	ColorAP1 = mix( ColorAP1, ColorAP1 * BlueCorrectAP1, BlueCorrection );

	ColorAP1 = FilmToneMap( ColorAP1 );

	ColorAP1 = mix( ColorAP1, ColorAP1 * BlueCorrectInvAP1, BlueCorrection );

	vec3 FilmColor = max(vec3(0.0), ColorAP1 * AP1_2_sRGB);
	FilmColor = max(vec3(0.0), FilmColor);
	
	vec4 OutColor = vec4(LinearToSrgb(FilmColor), 0.0);
	
	PSOutColor = OutColor / 1.05;	
}
