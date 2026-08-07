precision highp float;
uniform sampler2D InputTextureSampler;
uniform sampler2D EffectMaskTextureSampler;

varying vec2    VSOutTexCoord;
varying vec2	VSEffectOutTexCoord;

uniform float		effectEnable;
uniform float       intensity;

vec3 changeTextureColorSpaceTo2020(vec3 color){
    const mat3 BT709_TO_BT2020_MAT3 = mat3(0.6274040, 0.0690970, 0.0163916,
                                           0.3292820, 0.9195400, 0.0880132,
                                           0.0433136, 0.0113612, 0.8955950);
    return BT709_TO_BT2020_MAT3 * color;
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
        if (VSEffectOutTexCoord.x >= 0.0 && VSEffectOutTexCoord.x <= 1.0 && VSEffectOutTexCoord.y >= 0.0 && VSEffectOutTexCoord.y <= 1.0) {
            vec4 orgColor = texture2D(InputTextureSampler, VSOutTexCoord);
            vec4 effectColor = texture2D(EffectMaskTextureSampler, VSEffectOutTexCoord);
#ifdef _HDR_
            orgColor.rgb = changeTextureColorSpaceTo2020(orgColor.rgb);
            effectColor.rgb = changeTextureColorSpaceTo2020(effectColor.rgb);
#endif
            vec4 dst = normalBlend(orgColor, effectColor);
            dst = mix(orgColor, dst, intensity * effectColor.a);
            gl_FragColor = vec4(dst.rgb, 1.0);
        } else {
            gl_FragColor = texture2D(InputTextureSampler, VSOutTexCoord);
        }
    } else {
        gl_FragColor = texture2D(InputTextureSampler, VSOutTexCoord);
    }
}
