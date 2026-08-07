precision highp float;
uniform sampler2D InputTextureSampler;      // 风格滤镜
uniform sampler2D InputTextureSampler_1;    // Face
uniform sampler2D InputTextureSampler_2;    // Eye
uniform sampler2D InputTextureSampler_3;    // 原图
varying vec2 VSOutTexCoord;

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

void main() {
    vec4 color = texture2D(InputTextureSampler, VSOutTexCoord);
    vec4 faceColor = texture2D(InputTextureSampler_1, VSOutTexCoord);
    vec4 eyeColor = texture2D(InputTextureSampler_2, VSOutTexCoord);
    // gl_FragColor = eyeColor; return;
    if(faceColor.a == 0.0 && eyeColor.a == 0.0) {
        gl_FragColor = color;    
    } else {
        vec4 retColor = normalBlend(color, faceColor);
        gl_FragColor = normalBlend(retColor, eyeColor);
    }
    
}