//******************************************************************************

// @File         2d_ps.glsl

// @Version      1.0

// @Description  used for 2d element such as ui etc.

// @HISTORY:

//******************************************************************************/
precision highp float;

#include "common_ps.glsl"


varying highp	vec2		VSOutTexcoord0;
varying highp   vec4		VSOutScreenPosition;
varying highp   vec2        VSOutTexcoordMask;

uniform sampler2D			g_DiffuseTexture;
#ifdef _USING_SHADE_
uniform sampler2D			g_ShadeTexture;
uniform highp vec4  		g_ShadeArea;  // xy : uv start   zw: area size : all in[0~1.0]
uniform highp vec2  		g_MirrorParam;  // x = 0: u = u;   x = 1.0 : u = 1.0 - u;  y = 0: v = v;   y = 1.0 : v = 1.0 - v;
uniform highp float  		g_ScreenOrTexUv;  // 0.0 : Screenuv; 1.0: vertexuv;  
#endif

#ifdef _USING_FADE_
uniform highp float         g_AlphaFadeFactor;
#endif

uniform sampler2D			BackgroundTexture;


vec4 unpremultiply(vec4 s)
{
    return vec4(s.rgb/max(s.a,0.00001), s.a);
}
    
vec4 premultiply(vec4 s)
{
    return vec4(s.rgb * s.a, s.a);
}

// normal blend
vec4 normalBlend(vec4 Cb, vec4 Cs)
{
    vec4 dst = premultiply(Cb);
    vec4 src = premultiply(Cs);
    return unpremultiply(src + dst * (1.0 - src.a));
}

vec4 blendBaseAlpha(vec4 Cb, vec4 Cs, vec4 B)
{
    vec4 Cr = vec4((1.0 - Cb.a) * Cs.rgb + Cb.a * XSaturate(B.rgb), Cs.a);
    return normalBlend(Cb, Cr);
}

float lum(vec4 C) 
{
    return 0.299 * C.r + 0.587 * C.g + 0.114 * C.b;
}

vec4 clipColor(vec4 C) 
{
    float l = lum(C);
    float  n = min(C.r, min(C.g, C.b));
    float x = max(C.r, max(C.g, C.b));
    if (n < 0.0) {
        return vec4((l + ((C.rgb - l) * l) / (l - n)), C.a);
    }
    if (x > 1.0) {
        return vec4(l + (((C.rgb - l) * (1.0 - l)) / (x - l)), C.a);
    }
    return C;
}

vec4 setLum(vec4 C, float l) 
{
    float d = l - lum(C);
    return clipColor(vec4(C.rgb + d, C.a));
}

// overlay
float overlayBlendSingleChannel(float b, float s )
{
    return b < 0.5 ? (2.0 * s * b) : (1.0 - 2.0 * (1.0 - b) * (1.0 - s));
}
    
vec4 overlayBlend(vec4 Cb, vec4 Cs)
{
    vec4 B =  vec4(overlayBlendSingleChannel(Cb.r, Cs.r), overlayBlendSingleChannel(Cb.g, Cs.g), overlayBlendSingleChannel(Cb.b, Cs.b), Cs.a);
    return blendBaseAlpha(Cb, Cs, B);
}

// multiply
vec4 multiplyBlend(vec4 Cb, vec4 Cs)
{
    vec4 B = XSaturate(vec4(Cb.rgb * Cs.rgb, Cs.a));
    return blendBaseAlpha(Cb, Cs, B);
}

// darken
vec4 darkenBlend(vec4 Cb, vec4 Cs)
{
    vec4 B = vec4(min(Cs.r, Cb.r), min(Cs.g, Cb.g), min(Cs.b, Cb.b), Cs.a);
    return blendBaseAlpha(Cb, Cs, B);
}

 // lighten
vec4 lightenBlend(vec4 Cb, vec4 Cs)
{
    vec4 B = vec4(max(Cs.r, Cb.r), max(Cs.g, Cb.g), max(Cs.b, Cb.b), Cs.a);
    return blendBaseAlpha(Cb, Cs, B);
}

// color burn
float colorBurnBlendSingleChannel(float b, float f)
{
    if (b == 1.0) {
        return 1.0;
    } else if (f == 0.0) {
        return 0.0;
    } else {
        return 1.0 - min(1.0, (1.0 - b) / f);
    }
}

vec4 colorBurnBlend(vec4 Cb, vec4 Cs)
{
    vec4 B = vec4(colorBurnBlendSingleChannel(Cb.r, Cs.r), colorBurnBlendSingleChannel(Cb.g, Cs.g), colorBurnBlendSingleChannel(Cb.b, Cs.b), Cs.a);
    return blendBaseAlpha(Cb, Cs, B);
}

// color dodge
float colorDodgeBlendSingleChannel(float b, float f)
{
    if (b == 0.0) {
        return 0.0;
    } else if (f == 1.0) {
        return 1.0;
    } else {
        return min(1.0, b / (1.0 - f));
    }
}

vec4 colorDodgeBlend(vec4 Cb, vec4 Cs)
{
    vec4 B = vec4(colorDodgeBlendSingleChannel(Cb.r, Cs.r), colorDodgeBlendSingleChannel(Cb.g, Cs.g), colorDodgeBlendSingleChannel(Cb.b, Cs.b), Cs.a);
    return blendBaseAlpha(Cb, Cs, B);
}

// linear burn
vec4 linearBurnBlend(vec4 Cb, vec4 Cs)
{
    vec4 B = max(Cb + Cs - 1.0, 0.0);
    return blendBaseAlpha(Cb, Cs, B);
}

// screen
vec4 screenBlend(vec4 Cb, vec4 Cs)
{
    vec4 White = vec4(1.0);
    vec4 B = White - ((White - Cs) * (White - Cb));
    return blendBaseAlpha(Cb, Cs, B);
}

// hard light
vec4 hardLightBlend(vec4 Cb, vec4 Cs)
{
    return overlayBlend(Cs, Cb);
}

 // soft light
float softLightBlendSingleChannelD(float b)
{
    return b <= 0.25? (((16.0 * b - 12.0) * b + 4.0) * b): sqrt(b);
}

float softLightBlendSingleChannel(float b, float s)
{
    return s < 0.5? (b - (1.0 - 2.0 * s) * b * (1.0 - b)) : (b + (2.0 * s - 1.0) * (softLightBlendSingleChannelD(b) - b));
}
                         
vec4 softLightBlend(vec4 Cb, vec4 Cs)
{
    vec4 B = vec4(softLightBlendSingleChannel(Cb.r, Cs.r), softLightBlendSingleChannel(Cb.g, Cs.g), softLightBlendSingleChannel(Cb.b, Cs.b), Cs.a);
    return blendBaseAlpha(Cb, Cs, B);
}

// vivid light
float vividLightBlendSingleChannel(float b, float s)
{
    if (s <= 0.5) {
        if (s == 0.0) {
            return s;
        }
        return 1.0 - (1.0 - b) / (2.0 * s);
    } else {
        if (s == 1.0) {
            return s;
        }
        return b / (2.0 * (1.0 - s));
    }
}
    
vec4 vividLightBlend(vec4 Cb, vec4 Cs)
{
    vec4 B = vec4(vividLightBlendSingleChannel(Cb.r, Cs.r), vividLightBlendSingleChannel(Cb.g, Cs.g), vividLightBlendSingleChannel(Cb.b, Cs.b), Cs.a);
    return blendBaseAlpha(Cb, Cs, B);
}

float mid(float cmin, float cmid, float cmax, float s) 
{
    return ((cmid - cmin) * s) / (cmax - cmin);
}

vec4 setSat(vec4 C, float s) 
{
    if (C.r > C.g) {
        if (C.r > C.b) {
            if (C.g > C.b) {
                C.g = mid(C.b, C.g, C.r, s);
                C.b = 0.0;
            } else {
                C.b = mid(C.g, C.b, C.r, s);
                C.g = 0.0;
            }
            C.r = s;
        } else {
            C.r = mid(C.g, C.r, C.b, s);
            C.b = s;
            C.r = 0.0;
        }
    } else if (C.r > C.b) {
        C.r = mid(C.b, C.r, C.g, s);
        C.g = s;
        C.b = 0.0;
    } else if (C.g > C.b) {
        C.b = mid(C.r, C.b, C.g, s);
        C.g = s;
        C.r = 0.0;
    } else if (C.b > C.g) {
        C.g = mid(C.r, C.g, C.b, s);
        C.b = s;
        C.r = 0.0;
    } else {
        C = vec4(0.0);
    }
    return C;
}

float sat(vec4 C) 
{
    float n = min(C.r, min(C.g, C.b));
    float x = max(C.r, max(C.g, C.b));
    return x - n;
}

// hue
vec4 hueBlend(vec4 Cb, vec4 Cs) 
{
    vec4 B = setLum(setSat(Cs, sat(Cb)), lum(Cb));
    return blendBaseAlpha(Cb, Cs, B);
}
    
// saturation
vec4 saturationBlend(vec4 Cb, vec4 Cs) 
{
    vec4 B = setLum(setSat(Cb, sat(Cs)), lum(Cb));
    return blendBaseAlpha(Cb, Cs, B);
}
    
// luminosity
vec4 luminosityBlend(vec4 Cb, vec4 Cs) 
{
    vec4 B = setLum(Cb, lum(Cs));
    return blendBaseAlpha(Cb, Cs, B);
}

// color
vec4 colorBlend(vec4 Cb, vec4 Cs) 
{
    vec4 B = setLum(Cs, lum(Cb));
    return blendBaseAlpha(Cb, Cs, B);
}

// exclusion
vec4 exclusionBlend(vec4 Cb, vec4 Cs) 
{
    vec4 B = vec4(Cb.rgb + Cs.rgb - 2.0 * Cb.rgb * Cs.rgb, Cs.a);
    return blendBaseAlpha(Cb, Cs, B);
}

// difference
vec4 differenceBlend(vec4 Cb, vec4 Cs) 
{
    vec4 B = vec4(abs(Cb.rgb - Cs.rgb), Cs.a);
    return blendBaseAlpha(Cb, Cs, B);
}
    
// add
vec4 addBlend(vec4 Cb, vec4 Cs) 
{
    vec4 B = min(Cb + Cs, 1.0);
    return blendBaseAlpha(Cb, Cs, B);
}

// subtract
vec4 subtractBlend(vec4 Cb, vec4 Cs) 
{
    vec4 B = Cb - Cs;
    return blendBaseAlpha(Cb, Cs, B);
}

// divide
float divideBlendSingleChannel(float b, float f) 
{
    if (f == 0.0) {
        return 1.0;
    } else {
        return min(b / f, 1.0);
    }
}

vec4 divideBlend(vec4 Cb, vec4 Cs) 
{
    vec4 B = vec4(divideBlendSingleChannel(Cb.r, Cs.r), divideBlendSingleChannel(Cb.g, Cs.g), divideBlendSingleChannel(Cb.b, Cs.b), Cs.a);
    return blendBaseAlpha(Cb, Cs, B);
}
    
// linear light
vec4 linearLightBlend(vec4 Cb, vec4 Cs) 
{
    vec4 B  = Cb + 2.0 * Cs - 1.0;
    return blendBaseAlpha(Cb, Cs, B);
}

// pin light
float pinLightBlendSingleChannel(float b, float s) 
{
    if (s > 0.5) {
        return max(b , 2.0 * (s - 0.5));
    } else {
        return min(b, 2.0 * s);
    }
}
    
vec4 pinLightBlend(vec4 Cb, vec4 Cs) 
{
    vec4 B = vec4(pinLightBlendSingleChannel(Cb.r, Cs.r), pinLightBlendSingleChannel(Cb.g, Cs.g), pinLightBlendSingleChannel(Cb.b, Cs.b), Cs.a);
    return blendBaseAlpha(Cb, Cs, B);
}


void main (void)
{	
    //gl_FragColor = vec4(1.0,0.0,0.0,1.0);
    //return;

	highp vec2 ScreenUV = VSOutScreenPosition.xy / VSOutScreenPosition.w * 0.5 + 0.5; 
#ifndef GLTEXTURE_FLIP_Y
    ScreenUV.y = 1.0 - ScreenUV.y; 
#endif	
	
    highp float fShade = 1.0;
#ifdef _USING_SHADE_   
    highp vec2 ShadeUV = mix (ScreenUV, VSOutTexcoordMask, g_ScreenOrTexUv);
    
    highp vec2 AreaUV = vec2(0.0);
    AreaUV.x = clamp(ShadeUV.x * g_ShadeArea.z + g_ShadeArea.x, 0.0, 1.0);
    AreaUV.y = clamp(ShadeUV.y * g_ShadeArea.w + g_ShadeArea.y, 0.0, 1.0);
    
    AreaUV.x = abs(g_MirrorParam.x - AreaUV.x);
    AreaUV.y = abs(g_MirrorParam.y - AreaUV.y);
    
    fShade = SampleDiffuseTexture(g_ShadeTexture, AreaUV).r; 
#ifdef _OPPOSITE_SHADE_
    fShade = clamp(1.0 - fShade, 0.0, 1.0);    
#endif    
#endif

#ifdef _USING_FADE_
    fShade *= g_AlphaFadeFactor;
#endif 

	highp vec4 vTextureDiffuse = SampleDiffuseTexture(g_DiffuseTexture, VSOutTexcoord0);
    vTextureDiffuse.a *= fShade;

    highp vec4 vBackground = texture2D(BackgroundTexture, ScreenUV);

#if defined(_NORMAL_BLEND_)
	gl_FragColor = normalBlend(vBackground, vTextureDiffuse);
#elif defined(_OVERLAY_)
    gl_FragColor = overlayBlend(vBackground, vTextureDiffuse);
#elif defined(_MULTIPLY_)
    gl_FragColor = multiplyBlend(vBackground, vTextureDiffuse);
#elif defined(_DARKEN_)
    gl_FragColor = darkenBlend(vBackground, vTextureDiffuse);
#elif defined(_LIGHTEN_)
    gl_FragColor = lightenBlend(vBackground, vTextureDiffuse);
#elif defined(_COLOR_BRUN_)
    gl_FragColor = colorBurnBlend(vBackground, vTextureDiffuse);
#elif defined(_COLOR_DODGE_)
    gl_FragColor = colorDodgeBlend(vBackground, vTextureDiffuse);
#elif defined(_LINEAR_BURN_)
    gl_FragColor = linearBurnBlend(vBackground, vTextureDiffuse);
#elif defined(_SCREEN_)
    gl_FragColor = screenBlend(vBackground, vTextureDiffuse);
#elif defined(_HARD_LIGHT_)
    gl_FragColor = hardLightBlend(vBackground, vTextureDiffuse);
#elif defined(_SOFT_LIGHT_)
	gl_FragColor = softLightBlend(vBackground, vTextureDiffuse);
#elif defined(_VIVID_LIGHT_)
	gl_FragColor = vividLightBlend(vBackground, vTextureDiffuse);
#elif defined(_HUE_)
	gl_FragColor = hueBlend(vBackground, vTextureDiffuse);
#elif defined(_SATURATION_)
	gl_FragColor = saturationBlend(vBackground, vTextureDiffuse);
#elif defined(_LUMINOSITY_)
	gl_FragColor = luminosityBlend(vBackground, vTextureDiffuse);
#elif defined(_COLOR_)
	gl_FragColor = colorBlend(vBackground, vTextureDiffuse);
#elif defined(_EXCLUSION_)
	gl_FragColor = exclusionBlend(vBackground, vTextureDiffuse);
#elif defined(_DIFFERENCE_)
	gl_FragColor = differenceBlend(vBackground, vTextureDiffuse);
//#elif defined(_DISSOLVE_)
	//todo
#elif defined(_ADD_)
	gl_FragColor = addBlend(vBackground, vTextureDiffuse);
#elif defined(_SUBTRACT_)
	gl_FragColor = subtractBlend(vBackground, vTextureDiffuse);
#elif defined(_DIVIDE_)
	gl_FragColor = divideBlend(vBackground, vTextureDiffuse);
#elif defined(_LINEAR_LIGHT_)
	gl_FragColor = linearLightBlend(vBackground, vTextureDiffuse);
#elif defined(_PIN_LIGHT_)
	gl_FragColor = pinLightBlend(vBackground, vTextureDiffuse);
#else
	gl_FragColor = vBackground;
#endif
}
