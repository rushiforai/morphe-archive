//******************************************************************************

// @File         common_ps.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is common_ps.glsl.

// @HISTORY:

//******************************************************************************/

#define XSaturate( x ) clamp(x, 0.0, 1.0)

precision mediump float;

const mat3 BT709_TO_BT2020_MAT3 = mat3(0.6274040, 0.0690970, 0.0163916,
                                       0.3292820, 0.9195400, 0.0880132,
                                       0.0433136, 0.0113612, 0.8955950);

highp vec4 SampleDiffuseTexture(sampler2D texture, highp vec2 uv)
{
#if defined(_USING_ALPHA_CHANNEL_) && defined(_USING_ETC1_)
	highp vec4 TexColor;

	//#ifdef _REPEAT_ADDRESS_
	//	highp float v = uv.y - floor(uv.y);
	//#else
		highp float v = clamp(uv.y, 0.01, 0.99);
	//#endif

	TexColor.rgb = texture2D(texture, vec2(uv.x, v * 0.5)).rgb;
	TexColor.a = texture2D(texture, vec2(uv.x, v * 0.5 + 0.5)).r;

#else // #if defined(_USING_ALPHA_CHANNEL_) && defined(_USING_ETC1_)

	highp vec4 TexColor = texture2D(texture, uv);

#endif // #if defined(_USING_ALPHA_CHANNEL_) && defined(_USING_ETC1_)

#ifdef _HDR_
    TexColor.rgb = BT709_TO_BT2020_MAT3 * vec3(TexColor.r,TexColor.g,TexColor.b);
#endif
    
	return TexColor;
}


highp vec3 glb_CalcReflection(highp vec3 N, highp vec3 L)
{
    return 2.0 * dot(N, L) * N  - L;
}

//  Calculate R dot V for specular calculation
highp float glb_CalcRDotV(highp vec3 normal, highp vec3 lightDir, highp vec3 viewDir)
{
    highp float fNDotL = dot(normal, lightDir);
    highp vec3 reflection = normalize((2.0 * fNDotL) * normal - lightDir);
    return XSaturate(dot(reflection, viewDir));
}

// Calculate normal from normalmap
highp vec3 glb_SamplerNormalMap(sampler2D normalSampler, highp vec2 texCoord, highp float smoothNess)
{
    highp vec3 normal;
    normal = 2.0 * texture2D(normalSampler, texCoord).xyz - 1.0;
	normal.z = sqrt(1.0 - normal.x * normal.x - normal.y * normal.y);
	normal.z *= smoothNess;
    return normalize(normal);
}

// Calculate normal from normalmap
highp vec3 glb_SamplerNormalMap_ApplyStrength(sampler2D normalSampler, highp vec2 texCoord, highp float strength)
{
    highp vec3 normal;
    normal = 2.0 * texture2D(normalSampler, texCoord).xyz - 1.0;
    normal.xy *= strength;
    return normalize(normal);
}

highp vec3 glb_HSB(highp vec3 c, highp float HValue, highp float SValue, highp float BValue)
{
	// RGB 转 HSB
    highp vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    highp vec4 p = mix(vec4(c.bg, K.wz),
                 vec4(c.gb, K.xy),
                 step(c.b, c.g));
    highp vec4 q = mix(vec4(p.xyw, c.r),
                 vec4(c.r, p.yzx),
                 step(p.x, c.r));
    highp float d = q.x - min(q.w, q.y);
    highp float e = 1.0e-10;
    highp vec3 hsbcol = vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);

	hsbcol.r += HValue / 360.0;
	hsbcol.g = hsbcol.g * (1.0 + SValue);
	hsbcol.b = hsbcol.b * (1.0 + BValue);

	highp vec3 rgb = clamp(abs(mod(hsbcol.x * 6.0 + vec3(0.0, 4.0, 2.0), 6.0) - 3.0) - 1.0, 0.0, 1.0);
    rgb = rgb * rgb * (3.0 - 2.0 * rgb);
    return hsbcol.z * mix(vec3(1.0), rgb, hsbcol.y);
}
