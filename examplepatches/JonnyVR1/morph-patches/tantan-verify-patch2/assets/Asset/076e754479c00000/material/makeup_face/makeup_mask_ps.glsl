precision highp float;
uniform sampler2D   InputTextureSampler;
uniform sampler2D   SucaiTextureSampler;
uniform sampler2D   SegMaskTextureSampler;
varying vec2		textureCoordinate;
varying vec2 		sucaiTextureCoordinate;
varying vec2        segmaskTextureCoordinate;

uniform float       intensity;
uniform float       blendMode;
uniform float       bDetachFace;
uniform float       bSegEnable;


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

void main() {
    vec4 color = texture2D(InputTextureSampler, textureCoordinate);
    if (bDetachFace > 0.0) {
        vec4 sucai = texture2D(SucaiTextureSampler, sucaiTextureCoordinate);
        vec4 dst = vec4(1.0,1.0,1.0, 0.0);
        if(blendMode == 1.0) {
            dst = softLightBlend(color, sucai);    
        } else if(blendMode == 2.0) {
            dst = screenBlend(color, sucai);
        } else if(blendMode == 3.0) {
            dst = normalBlend(color, sucai);
        } else {
            dst = multiplyBlend(color, sucai);    
        }
        float segmask = 1.0;
        if (bSegEnable > 0.0) {
            segmask = texture2D(SegMaskTextureSampler, segmaskTextureCoordinate).r;
        }
        dst = mix(color, dst, intensity * segmask);
        gl_FragColor = vec4(dst.rgb, 1.0);
    } else {
        gl_FragColor = color;
    }
}