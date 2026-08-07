precision highp float;
uniform sampler2D InputTextureSampler;

uniform sampler2D TextureLookup_0;
uniform sampler2D TextureLookup_1;

uniform float intensity_0;
uniform float intensity_1;
uniform float isHDR;
uniform float offset;
uniform float dimension_0;
uniform float dimension_1;

varying vec2 VSOutTexCoord;

const mat3 BT709_TO_BT2020_MAT3 = mat3(0.6274040, 0.0690970, 0.0163916,
                                       0.3292820, 0.9195400, 0.0880132,
                                       0.0433136, 0.0113612, 0.8955950);

vec4 colorLookup2DSquareLUT(vec4 color, float dimension, float intensity, sampler2D lutTexture)
{
    float row = dimension;
    float blueColor = color.b * (dimension * dimension - 1.0);
    float size = dimension * dimension * dimension;
    
    vec2 quad1;
    quad1.y = floor(floor(blueColor) / row);
    quad1.x = floor(blueColor) - (quad1.y * row);
    
    vec2 quad2;
    quad2.y = floor(ceil(blueColor) / row);
    quad2.x = ceil(blueColor) - (quad2.y * row);
    
    vec2 texPos1;
    texPos1.x = (quad1.x * (1.0/row)) + 0.5 / size + ((1.0 / row - 1.0 / size) * color.r);
    texPos1.y = (quad1.y * (1.0/row)) + 0.5 / size + ((1.0 / row - 1.0 / size) * color.g);

    vec2 texPos2;
    texPos2.x = (quad2.x * (1.0 / row)) + 0.5 / size + ((1.0 / row - 1.0 / size) * color.r);
    texPos2.y = (quad2.y * (1.0 / row)) + 0.5 / size + ((1.0 / row - 1.0 / size) * color.g);
    
    vec4 newColor1 = texture2D(lutTexture, texPos1);
    vec4 newColor2 = texture2D(lutTexture, texPos2);
#ifdef _HDR_
    newColor1.rgb =  BT709_TO_BT2020_MAT3 * vec3(newColor1.r,newColor1.g,newColor1.b);
    newColor2.rgb =  BT709_TO_BT2020_MAT3 * vec3(newColor2.r,newColor2.g,newColor2.b);
#endif
    
    vec4 newColor = mix(newColor1, newColor2, float(fract(blueColor)));
    
    vec4 finalColor = mix(color, vec4(newColor.rgb, color.a), intensity);
    
    return finalColor;

}
 
 void main() {
     vec4 originColor = texture2D(InputTextureSampler, VSOutTexCoord);
     float origin_r = originColor.r;
     float origin_g = originColor.g;
     float origin_b = originColor.b;
     
     float r = origin_r > 1.0 ? 1.0 :  origin_r;
     float g = origin_r > 1.0 ? 1.0 :  origin_g;
     float b = origin_r > 1.0 ? 1.0 :  origin_b;
     vec4 changeColor = vec4(r,g,b,1.0);
     vec4 endColor;
     if (VSOutTexCoord.x > offset) {
         if (dimension_0 < 0.5) {
             endColor = originColor;
         }
         else {
             endColor = colorLookup2DSquareLUT(changeColor, dimension_0, intensity_0, TextureLookup_0);
         }
     } else {
        if (dimension_1 < 0.5) {
            endColor = originColor;
        }
        else {
            endColor = colorLookup2DSquareLUT(changeColor, dimension_1, intensity_1, TextureLookup_1);
        }
     }
     if (origin_r > 1.0) {
         endColor = vec4(endColor.r * origin_r,endColor.gba);
     }
     
     if (origin_g > 1.0) {
         endColor = vec4(endColor.r , endColor.g * origin_g,endColor.b,endColor.a);
     }
     
     if (origin_b > 1.0) {
         endColor = vec4(endColor.r , endColor.g , endColor.b * origin_b , endColor.a);
     }
     
     gl_FragColor = endColor;
     gl_FragColor.a = 1.0;
 }


