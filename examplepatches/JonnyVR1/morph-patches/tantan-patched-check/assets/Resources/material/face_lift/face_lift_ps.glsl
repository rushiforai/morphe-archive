precision highp float;
uniform sampler2D InputTextureSampler; // 原图
uniform sampler2D InputTextureSampler_1; // blur

uniform sampler2D MaskTextureSampler;
uniform sampler2D ToothLutTextureSampler;

varying vec2        VSOutTexCoord;
varying vec2		textureCoordinate;
varying vec2 		sucaiTextureCoordinate;

uniform float       eyebrightenIntensity;
uniform float   	teethWhitenIntensity;
uniform float   	removePouchIntensity;
uniform float   	removeNasolabialFoldsIntensity;

uniform float       bDetachFace;
uniform float       openMouth;


const float         lut_width = 64.0;
const float         lut_height = 64.0;
const float         lutDimensions = 16.0;

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

void main() {

    highp vec4 color = texture2D(InputTextureSampler, textureCoordinate);
    if (bDetachFace < 1.0) {
        gl_FragColor = color; return;
    }
    // gl_FragColor = color;return;
    highp vec4 maskColor = texture2D(MaskTextureSampler, sucaiTextureCoordinate);
    highp vec3 resultColor = color.rgb;

    //brighten eyes
    if(maskColor.b > 0.005 && maskColor.r < 0.005 && eyebrightenIntensity >= 0.01)
    {
        highp vec2 step1 = vec2(0.00208, 0.0);
        highp vec2 step2 = vec2(0.0, 0.00134);
        highp vec3 sumColor = vec3(0.0, 0.0, 0.0);
        for(float t = -2.0; t < 2.5; t += 1.0)
        {
            for(float p = -2.0;p < 2.5; p += 1.0)
            {
                sumColor += texture2D(InputTextureSampler,textureCoordinate + t * step1 + p * step2).rgb;
            }
        }
        sumColor = sumColor * 0.04;
        sumColor = clamp(sumColor + (color.rgb - sumColor) * 3.0, 0.0, 1.0);
        sumColor = max(color.rgb, sumColor);
        resultColor = mix(color.rgb, sumColor, eyebrightenIntensity * maskColor.b * 0.5);
    }
    
    //remove eye pouch
    if(maskColor.r > 0.005 && maskColor.b < 0.005 && removePouchIntensity >= 0.01)
    {
        lowp vec3 scaledColor = texture2D(InputTextureSampler, textureCoordinate).rgb;
        lowp vec3 scaledBlurColor = texture2D(InputTextureSampler_1, textureCoordinate).rgb;
        lowp vec3 imDiff = clamp((scaledBlurColor - scaledColor) * 1.3 + 0.03 * scaledBlurColor, 0.0, 0.2);
        imDiff = min(resultColor+ imDiff, 1.0);
        resultColor = mix(resultColor, imDiff, removePouchIntensity * maskColor.r);
    }
    
    //remove nasolabial folds
    if(maskColor.g > 0.005 && removeNasolabialFoldsIntensity >= 0.01)
    {
        lowp vec3 scaledColor = texture2D(InputTextureSampler, textureCoordinate).rgb;
        lowp vec3 scaledBlurColor = texture2D(InputTextureSampler_1, textureCoordinate).rgb;
        lowp vec3 imDiff = clamp((scaledBlurColor - scaledColor) * 1.4 + 0.05 * scaledBlurColor, 0.0, 0.3);//0.3
        imDiff = min(resultColor+ imDiff, 1.0);
        resultColor = mix(resultColor, imDiff, removeNasolabialFoldsIntensity * maskColor.g);
    }

    // teeth whiten
    if(maskColor.r > 0.005 && maskColor.b > 0.005 && teethWhitenIntensity >= 0.01 && openMouth > 0.0)
    {
        vec4 inputColor = colorLookup2DSquareLUT(vec4(resultColor, 1.0), lutDimensions, teethWhitenIntensity, ToothLutTextureSampler, lut_width, lut_height);
        resultColor = mix(resultColor, inputColor.rgb, maskColor.r);
    }

    gl_FragColor = vec4(resultColor, 1.0);
}