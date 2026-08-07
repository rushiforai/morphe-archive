precision highp float;
uniform sampler2D InputTextureSampler;
varying vec2 VSOutTexCoord;
varying vec4 textureShift_1;
varying vec4 textureShift_2;
varying vec4 textureShift_3;
varying vec4 textureShift_4;

void main(){
    vec3 sum = texture2D(InputTextureSampler, VSOutTexCoord).rgb;
    sum += texture2D(InputTextureSampler, textureShift_1.xy).rgb;
    sum += texture2D(InputTextureSampler, textureShift_1.zw).rgb;
    sum += texture2D(InputTextureSampler, textureShift_2.xy).rgb;
    sum += texture2D(InputTextureSampler, textureShift_2.zw).rgb;
    sum += texture2D(InputTextureSampler, textureShift_3.xy).rgb;
    sum += texture2D(InputTextureSampler, textureShift_3.zw).rgb;
    sum += texture2D(InputTextureSampler, textureShift_4.xy).rgb;
    sum += texture2D(InputTextureSampler, textureShift_4.zw).rgb;
    gl_FragColor = vec4(sum * 0.1111, 1.0);
    
}