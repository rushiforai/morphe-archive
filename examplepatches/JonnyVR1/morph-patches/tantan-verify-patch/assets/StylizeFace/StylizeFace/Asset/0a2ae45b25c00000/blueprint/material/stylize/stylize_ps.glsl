precision highp float;
uniform sampler2D InputTextureSampler;
uniform sampler2D EffectMaskTextureSampler;

varying vec2    VSOutTexCoord;
varying vec2	VSEffectOutTexCoord;

uniform float		effectEnable;
uniform float       intensity;

float blendAdd(float base, float blend) {
    return min(base+blend,1.0);
}

vec3 blendAdd(vec3 base, vec3 blend) {
    return min(base+blend,vec3(1.0));
}

vec3 blendAdd(vec3 base, vec3 blend, float opacity) {
    return (blendAdd(base, blend) * opacity + base * (1.0 - opacity));
}

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
    if (effectEnable > 0.5) {
        vec4 orgColor = texture2D(InputTextureSampler, VSOutTexCoord);
        if(VSEffectOutTexCoord.x >= 0.0 && VSEffectOutTexCoord.x <= 1.0 && VSEffectOutTexCoord.y >= 0.0 && VSEffectOutTexCoord.y <= 1.0) {
            vec4 effectColor = texture2D(EffectMaskTextureSampler, VSEffectOutTexCoord);
            vec4 dst = normalBlend(orgColor, effectColor);
            dst = mix(orgColor, dst, intensity);
            gl_FragColor = vec4(dst.rgb, 1.0);
        } else {
            gl_FragColor = orgColor;
        }
    } else {
        gl_FragColor = texture2D(InputTextureSampler, VSOutTexCoord);
    }
}