uniform sampler2D		InputTextureSampler;
uniform highp vec4		g_HSVC;
uniform highp vec3		g_WhiteBalance;
uniform highp float		g_Vignette;
varying highp vec2		VSOutTexCoord;
varying highp vec2		VSOutVignetteSpace;
highp vec3 whitebalance(highp vec3 In)
{
    highp mat3 LIN_2_LMS_MAT = mat3(
        3.90405e-1, 5.49941e-1, 8.92632e-3,
        7.08416e-2, 9.63172e-1, 1.35775e-3,
        2.31082e-2, 1.28021e-1, 9.36245e-1
    );

    highp mat3 LMS_2_LIN_MAT = mat3(
        2.85847e+0, -1.62879e+0, -2.48910e-2,
        -2.10182e-1,  1.15820e+0,  3.24281e-4,
        -4.18120e-2, -1.18169e-1,  1.06867e+0
    );

    highp vec3 lms = LIN_2_LMS_MAT * In;
    lms *= g_WhiteBalance.rgb;
    return LMS_2_LIN_MAT * lms;
}

highp vec3 rgb2hsv(highp vec3 c)
{
    highp vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    highp vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    highp vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    highp float d = q.x - min(q.w, q.y);
    highp float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

highp vec3 hsv2rgb(highp vec3 c)
{
    highp vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    highp vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

highp vec3 contrastAdjust( highp vec3 color, highp float c) 
{
    highp float t = 0.5 - c * 0.5; 
    return color * c + t;
}

highp float ComputeVignetteMask(highp vec2 VignetteCircleSpacePos, highp float Intensity)
{
	// Natural vignetting
	// cosine-fourth law
	VignetteCircleSpacePos *= Intensity;
	highp float Tan2Angle = dot( VignetteCircleSpacePos, VignetteCircleSpacePos );
	highp float Cos2Angle = 1.0 / ( Tan2Angle + 1.0 );
	highp float Cos4Angle = Cos2Angle * Cos2Angle;
	return Cos4Angle;
}

void main(void)
{
	highp vec4 FinalColor = texture2D(InputTextureSampler, VSOutTexCoord);
#ifdef WHITE_BALANCE
	FinalColor.rgb = whitebalance(FinalColor.rgb);
#endif
#ifdef COLOR_GRADLING
	highp vec3 hsv = rgb2hsv(FinalColor.rgb);
	hsv.r += g_HSVC.r;
	hsv.gb *= g_HSVC.gb;
	FinalColor.rgb = hsv2rgb(hsv.rgb);
	FinalColor.rgb = contrastAdjust(FinalColor.rgb, g_HSVC.a);
#endif
#ifdef VIGNETTE
	FinalColor.rgb = FinalColor.rgb * ComputeVignetteMask(VSOutVignetteSpace, g_Vignette);
#endif
	gl_FragColor = FinalColor;
}