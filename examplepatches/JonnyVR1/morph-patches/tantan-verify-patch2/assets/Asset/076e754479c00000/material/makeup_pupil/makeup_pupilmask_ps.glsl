precision highp float;
uniform sampler2D   InputTextureSampler;
uniform sampler2D   InputTextureSampler_1;
uniform sampler2D   EyeMaskTextureSampler;
uniform sampler2D   SegMaskTextureSampler;
varying vec2		textureCoordinate;
varying vec2 		sucaiTextureCoordinate;
varying vec2        segmaskTextureCoordinate;

uniform float       bDetachFace;
uniform float       bSegEnable;

void main() {
    
    vec4 color = texture2D(InputTextureSampler, textureCoordinate);
    if (bDetachFace > 0.0) {
        vec4 pupil = texture2D(InputTextureSampler_1, textureCoordinate);
        float maskAlpha = texture2D(EyeMaskTextureSampler, sucaiTextureCoordinate).r;
        float segmask = 1.0;
        if (bSegEnable > 0.0 && color.a > 0.0) {
            segmask = texture2D(SegMaskTextureSampler, segmaskTextureCoordinate).r;
        }
        pupil = pupil * maskAlpha * segmask;
        vec3 dstColor = clamp(pupil.rgb + color.rgb * (1.0 - pupil.a), 0.0, 1.0);
        if(color.a == 0.0) {
            gl_FragColor = vec4(0.0);
        } else {
            gl_FragColor = vec4(dstColor.rgb, color.a);
        }
    } else {
        gl_FragColor = color;
    }
}