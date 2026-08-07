precision highp float;
uniform sampler2D   InputTextureSampler;
uniform sampler2D   SucaiTextureSampler;
uniform sampler2D   SucaiTextureSampler2;

uniform sampler2D   LutMaskTextureSampler;
uniform sampler2D   MouthMaskTextureSampler;
uniform sampler2D   SegMaskTextureSampler;
uniform sampler2D   NoiseTextureSampler;

varying vec2        textureCoordinate;
varying vec2        sucaiTextureCoordinate;
varying vec2        maskTextureCoordinate;
varying vec2        segmaskTextureCoordinate;

uniform float       bDetachFace;
uniform float       openMouth;
uniform float       closeThreshold;

uniform float       intensity;
uniform float       blendMode;

const float         lut_width = 64.0;
const float         lut_height = 64.0;
const float         lutDimensions = 16.0;

uniform float       bSegEnable;
uniform vec2        ViewportSize;
uniform float       lipsType;

const 	mat4		uSTMatrix = mat4(4.0, 0.0, 0.0, 0.0,
									0.0, 8.0, 0.0, 0.0,
									0.0, 0.0, 1.0, 0.0,
									-1.5, -1.8, 0.0, 1.0);

vec4 unpremultiply(vec4 s) {
    return vec4(s.rgb/max(s.a,0.00001), s.a);
}

vec4 premultiply(vec4 s) {
    return vec4(s.rgb * s.a, s.a);
}

vec4 normalBlend(vec4 Cb, vec4 Cs) {
        vec4 dst = premultiply(Cb);
        vec4 src = premultiply(Cs);
        return unpremultiply(src + dst * (1.0 - src.a));
}

vec4 blendBaseAlpha(vec4 Cb, vec4 Cs, vec4 B) {
    vec4 Cr = vec4((1.0 - Cb.a) * Cs.rgb + Cb.a * clamp(B.rgb, 0.0, 1.0), Cs.a);
    return normalBlend(Cb, Cr);
}

vec4 multiplyBlend(vec4 Cb, vec4 Cs) {
    vec4 B = clamp(vec4(Cb.rgb * Cs.rgb, Cs.a), 0.0, 1.0);
    return blendBaseAlpha(Cb, Cs, B);
}

//  softLight
float softLightBlendSingleChannelD(float b) {
    return b <= 0.25? (((16.0 * b - 12.0) * b + 4.0) * b): sqrt(b);
}

float softLightBlendSingleChannel(float b, float s) {
    return s < 0.5? (b - (1.0 - 2.0 * s) * b * (1.0 - b)) : (b + (2.0 * s - 1.0) * (softLightBlendSingleChannelD(b) - b));
}
                        
vec4 softLightBlend(vec4 Cb, vec4 Cs) {
    vec4 B = vec4(softLightBlendSingleChannel(Cb.r, Cs.r), softLightBlendSingleChannel(Cb.g, Cs.g), softLightBlendSingleChannel(Cb.b, Cs.b), Cs.a);
    return blendBaseAlpha(Cb, Cs, B);
}

// screen
vec4 screenBlend(vec4 Cb, vec4 Cs) {
    vec4 White = vec4(1.0);
    vec4 B = White - ((White - Cs) * (White - Cb));
    return blendBaseAlpha(Cb, Cs, B);
}

vec4 colorLookup2DSquareLUT(vec4 color, float dimension, float intensity, sampler2D lutTexture, float width, float height) {
    float row = floor(sqrt(dimension) + 0.5);
    float blueColor = color.b * (dimension - 1.0);
    
    vec2 quad1;
    quad1.y = floor(floor(blueColor) / row);
    quad1.x = floor(blueColor) - (quad1.y * row);
    
    vec2 quad2;
    quad2.y = floor(ceil(blueColor) / row);
    quad2.x = ceil(blueColor) - (quad2.y * row);;
    
    vec2 texPos1;
    texPos1.x = (quad1.x * (1.0/row)) + 0.5/width + ((1.0/row - 1.0/width) * color.r);
    texPos1.y = (quad1.y * (1.0/row)) + 0.5/height + ((1.0/row - 1.0/height) * color.g);
    
    vec2 texPos2;
    texPos2.x = (quad2.x * (1.0/row)) + 0.5/width + ((1.0/row - 1.0/width) * color.r);
    texPos2.y = (quad2.y * (1.0/row)) + 0.5/height + ((1.0/row - 1.0/height) * color.g);
    
    vec4 newColor1 = texture2D(lutTexture, texPos1);
    vec4 newColor2 = texture2D(lutTexture, texPos2);
    
    vec4 newColor = mix(newColor1, newColor2, float(fract(blueColor)));
    vec4 finalColor = mix(color, vec4(newColor.rgb, color.a), intensity);
    
    return finalColor;
}

float RGB2Y(vec3 rgb)
{
    return 0.299 * rgb.r + 0.587 * rgb.g + 0.114 * rgb.b;
}

const vec2 maskSize = vec2(320.0, 160.0);
vec4 LipsBlurColor(sampler2D srcImageTexture, sampler2D maskImageTexture, vec2 textureCoordinate, vec2 maskTextureCoordinate, vec2 srcImageSize, float smoothRadius) {

    int coreSize = 3;
    float kernelValues[9];
    kernelValues[0] = 1.0; kernelValues[1] = 2.0; kernelValues[2] = 1.0;
    kernelValues[3] = 2.0; kernelValues[4] = 4.0; kernelValues[5] = 2.0;
    kernelValues[6] = 1.0; kernelValues[7] = 2.0; kernelValues[8] = 1.0;

    vec4 blurColor = vec4(0.0);
    float sumAlpha = 0.0;
    float maxSourceLum = 0.0;
    float texelOffset = smoothRadius;

    for (int j = 0; j < coreSize; ++j)
    {
        float offsetY = float(j - (coreSize - 1) / 2);
        for (int i = 0; i < coreSize; ++i)
        {
            float offsetX = float(i - (coreSize - 1) / 2);
            vec2 position = textureCoordinate + vec2(offsetX * texelOffset/srcImageSize.x, offsetY * texelOffset/srcImageSize.y);
            vec4 currColor = texture2D(srcImageTexture, position);
            
            vec2 maskCoord = (uSTMatrix * vec4(maskTextureCoordinate + vec2(offsetX * texelOffset/maskSize.x, offsetY * texelOffset/maskSize.y), 0, 1)).xy;
            vec2 maskPosition = vec2(maskCoord.x, 1.0 - maskCoord.y);
            float currMaskAlpha = texture2D(maskImageTexture, maskPosition).b;

            maxSourceLum = max(maxSourceLum, RGB2Y(currColor.rgb));

            int index = i + j * coreSize;
            blurColor += currColor * currMaskAlpha * kernelValues[index];
            sumAlpha += currMaskAlpha * kernelValues[index];
        }
    }

    blurColor /= sumAlpha;
    
    return vec4(blurColor.rgb, maxSourceLum);
}

const vec2 uNoiseOffset = vec2(270.0, 700.0);
const vec2 noiseImageSize = vec2(236.0, 129.0);
vec3 LipsSpecularModify(sampler2D noiseImageTexture, vec2 textureCoordinate, vec2 sucaiTextureCoordinate, vec2 srcImageSize, vec4 source, vec4 blurColor, vec4 params, float alpha) {
    float sourceLum = RGB2Y(source.rgb);
    float blurLum = RGB2Y(blurColor.rgb);

    float maxSourceLum = blurColor.a;
    float lipsType = params.x;
    float smoothRadius = params.y;
    float shininess = params.z;
    float specStrength = params.w;

    float spec = 0.0;
    vec3 lightColor = vec3(1.0);

    if (2.0 == lipsType)
    {
        float lum_thres = 0.4;
        if (sourceLum > lum_thres)
        {
            spec = -1.0 * ((sourceLum - lum_thres)/(1.0 - lum_thres));
        }
        spec += sourceLum - blurLum;
        lightColor = vec3(0.0, 1.0, 1.0);
    }
    else if (lipsType > 1.0)
    {
        if (sourceLum - blurLum > 0.02)
        {
            spec = pow(clamp((sourceLum - blurLum)/(maxSourceLum - blurLum), 0.0, 1.0), shininess);
        }
    } else {
        if (sourceLum - blurLum > 0.06)
        {
            spec = pow(clamp((sourceLum - blurLum)/(maxSourceLum - blurLum), 0.0, 1.0), shininess);
        }
    }

    if (4.0 == lipsType)
    {
        vec2 noiseTexCoord = textureCoordinate * srcImageSize;
        noiseTexCoord = (noiseTexCoord - uNoiseOffset) / noiseImageSize;
        float noiseValue = texture2D(noiseImageTexture, sucaiTextureCoordinate).r;

        bool flag = (noiseValue > 0.98 && noiseValue < 1.0) ||
                    //(noiseValue > 0.88 && noiseValue < 0.9) ||
                    (noiseValue > 0.78 && noiseValue < 0.8) ||
                    //(noiseValue > 0.68 && noiseValue < 0.7) ||
                    (noiseValue > 0.58 && noiseValue < 0.6) ||
                    //(noiseValue > 0.48 && noiseValue < 0.5) ||
                    (noiseValue > 0.38 && noiseValue < 0.4);
                        
        if (flag) {
            spec = noiseValue;
        }
        alpha = pow(alpha, 2.0);
    }

    vec3 specular = alpha * specStrength * spec * lightColor;
    return specular;
}

void main() {
    vec4 color = texture2D(InputTextureSampler, textureCoordinate);
    if (bDetachFace > 0.0) {
        vec4 mask = texture2D(MouthMaskTextureSampler, sucaiTextureCoordinate);
        float segmask = 1.0;
        if (bSegEnable > 0.0) {
            segmask = texture2D(SegMaskTextureSampler, segmaskTextureCoordinate).r;
        }
        
        vec4 effectParams = vec4(lipsType, 8.0, 8.0, 1.0);
        
        if (lipsType == 2.0) {
            effectParams.w = 0.3;
            effectParams.y = 10.0;
        } else if (lipsType == 3.0) {
            effectParams.w = 0.8;
            effectParams.y = 16.0;
        } else if (lipsType == 4.0) {
            effectParams.y = 16.0;
        }

        vec4 lutMask = texture2D(LutMaskTextureSampler, sucaiTextureCoordinate);

        if (blendMode == 20.0) {
            vec3 colorRes = color.rgb;
            float alpha = lutMask.r;
            if (openMouth > 0.5) {
                alpha = lutMask.g * mask.a;
            }
            if (alpha > 0.0) {
                colorRes = colorLookup2DSquareLUT(color, lutDimensions, alpha, SucaiTextureSampler, lut_width, lut_height).rgb;
            }
            float mixV = intensity;
            if (openMouth < 0.5 && mask.a < 0.8) {
                mixV = mixV * (1.0 - clamp(closeThreshold, 0.0, 1.0));
            }
            // colorRes = mix(color.rgb, colorRes, mixV * segmask);
            // gl_FragColor = vec4(colorRes, 1.0);

            // 为了提高性能，只处理嘴唇部分
            if (lipsType == 0.0  || lutMask.b < 0.004 || segmask == 0.0) {
                gl_FragColor = vec4(mix(color.rgb, colorRes, mixV * segmask), 1.0);
            } else {
                vec4 blurColor = LipsBlurColor(InputTextureSampler, LutMaskTextureSampler, textureCoordinate, maskTextureCoordinate, ViewportSize, effectParams.y);
                vec3 specular = LipsSpecularModify(NoiseTextureSampler, textureCoordinate, sucaiTextureCoordinate, ViewportSize, color, blurColor, effectParams, lutMask.b);
                
                float maxSourceLum = blurColor.a;
                colorRes = clamp(colorRes + specular * maxSourceLum * mixV, 0.0, 1.0);
                colorRes = mix(color.rgb, colorRes, mixV);

                gl_FragColor = vec4(mix(color.rgb, colorRes.rgb, mixV * segmask), 1.0);
            }
        } else {
            vec4 sucai = vec4(0.0);
            if (openMouth > 0.5) {
                sucai = texture2D(SucaiTextureSampler, sucaiTextureCoordinate);
            } else {
                sucai = texture2D(SucaiTextureSampler2, sucaiTextureCoordinate);
            }
            vec4 dst = color;
            if(blendMode == 1.0) {
                dst = softLightBlend(color, sucai);
            } else if(blendMode == 2.0) {
                dst = screenBlend(color, sucai);
            } else if(blendMode == 3.0) {
                dst = normalBlend(color, sucai);
            } else {
                dst = multiplyBlend(color, sucai);
            }
            
            float mixV = intensity;
            if (openMouth > 0.5) {
                mixV = intensity * mask.a;
            }
            if (openMouth < 0.5 && mask.a < 0.8) {
                mixV = mixV * (1.0 - clamp(closeThreshold, 0.0, 1.0));
            }

            // gl_FragColor = vec4(mix(color.rgb, colorRes.rgb, mixV * segmask), 1.0);

            // 为了提高性能，只处理嘴唇部分
            vec3 colorRes = dst.rgb;
            if (lipsType == 0.0 || lutMask.b < 0.004 || segmask == 0.0) {
                gl_FragColor = vec4(mix(color.rgb, colorRes, mixV * segmask), 1.0);
            } else {
                vec4 blurColor = LipsBlurColor(InputTextureSampler, LutMaskTextureSampler, textureCoordinate, maskTextureCoordinate, ViewportSize, effectParams.y);
                vec3 specular = LipsSpecularModify(NoiseTextureSampler, textureCoordinate, sucaiTextureCoordinate, ViewportSize, color, blurColor, effectParams, lutMask.b);
                
                float maxSourceLum = blurColor.a;
                colorRes = clamp(colorRes + specular * maxSourceLum * mixV, 0.0, 1.0);
                colorRes = mix(color.rgb, colorRes, mixV);

                gl_FragColor = vec4(mix(color.rgb, colorRes, mixV * segmask), 1.0);
            }
        }
    } else {
        gl_FragColor = color;
    }
}
