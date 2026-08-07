precision highp float;
uniform sampler2D height_blur_texture;
uniform sampler2D InputTextureSampler;

varying vec2 VSOutTexCoord;
varying vec4 textureShift_1;
varying vec4 textureShift_2;
varying vec4 textureShift_3;
varying vec4 textureShift_4;

void main(){
    vec3 sum = texture2D(height_blur_texture, VSOutTexCoord).rgb;
    sum += texture2D(height_blur_texture, textureShift_1.xy).rgb;
    sum += texture2D(height_blur_texture, textureShift_1.zw).rgb;
    sum += texture2D(height_blur_texture, textureShift_2.xy).rgb;
    sum += texture2D(height_blur_texture, textureShift_2.zw).rgb;
    sum += texture2D(height_blur_texture, textureShift_3.xy).rgb;
    sum += texture2D(height_blur_texture, textureShift_3.zw).rgb;
    sum += texture2D(height_blur_texture, textureShift_4.xy).rgb;
    sum += texture2D(height_blur_texture, textureShift_4.zw).rgb;

    vec3 meanColor  = sum * 0.1111;
    vec3 inColor = texture2D(InputTextureSampler, VSOutTexCoord).rgb;
    
    vec3 diffColor = (inColor - meanColor) * 7.07;
    diffColor = min(diffColor * diffColor, 1.0);
    
    gl_FragColor = vec4(meanColor, (diffColor.r + diffColor.g + diffColor.b) * 0.3333);
}