precision highp float;
uniform sampler2D width_blur_texture;
varying vec2 VSOutTexCoord;
varying vec4 textureShift_1;
varying vec4 textureShift_2;
varying vec4 textureShift_3;
varying vec4 textureShift_4;

void main(){
    vec4 color = texture2D(width_blur_texture, VSOutTexCoord);
    float sum = color.a;
    sum += texture2D(width_blur_texture, textureShift_1.xy).a;
    sum += texture2D(width_blur_texture, textureShift_1.zw).a;
    sum += texture2D(width_blur_texture, textureShift_2.xy).a;
    sum += texture2D(width_blur_texture, textureShift_2.zw).a;
    sum += texture2D(width_blur_texture, textureShift_3.xy).a;
    sum += texture2D(width_blur_texture, textureShift_3.zw).a;
    sum += texture2D(width_blur_texture, textureShift_4.xy).a;
    sum += texture2D(width_blur_texture, textureShift_4.zw).a;
    gl_FragColor = vec4(color.rgb, sum * 0.1111);
}