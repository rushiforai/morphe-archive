precision highp float;
uniform sampler2D   InputTextureSampler;
uniform sampler2D   SucaiTextureSampler;
varying vec2		textureCoordinate;
varying vec2 		sucaiTextureCoordinate;
varying float		weight;

uniform float       intensity;
uniform float       bDetachFace;

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
    vec4 color = texture2D(InputTextureSampler, textureCoordinate);
    if (bDetachFace > 0.0) {
        vec4 sucai = texture2D(SucaiTextureSampler, sucaiTextureCoordinate);
        vec4 dstColor = normalBlend(color, sucai);
        dstColor = mix(color, dstColor, intensity);
        gl_FragColor = vec4(mix(color.rgb, dstColor.rgb, weight), 1.0);
    } else {
        gl_FragColor = color;
    }
}