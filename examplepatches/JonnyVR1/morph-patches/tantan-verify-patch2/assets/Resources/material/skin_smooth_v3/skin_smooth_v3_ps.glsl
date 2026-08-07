precision highp float;
uniform sampler2D InputTextureSampler;    // normal
uniform sampler2D InputTextureSampler_1;  // blur
varying vec2 VSOutTexCoord;

uniform float intensity;
uniform float sharpen;
uniform float mutil_face_enable;
uniform vec2 ViewportSize;

const float theta = 0.1;
const float skinMaskValue = 1.0;

void main() {

    vec4 iColor = texture2D(InputTextureSampler, VSOutTexCoord);
    if (intensity > 0.0001 || sharpen > 0.0001) {
        vec4 meanColor = texture2D(InputTextureSampler_1, VSOutTexCoord);

        float mixV = intensity;
        if (mutil_face_enable < 0.5 && intensity > 0.3) {
            mixV = 0.3;
        } 

        float p = clamp((min(iColor.r, meanColor.r - 0.1) - 0.2) * 4.0, 0.0, 1.0);
        float kMin = (1.0 - meanColor.a / (meanColor.a + theta)) * p * mixV;
        vec3 resultColor = mix(iColor.rgb, meanColor.rgb, kMin * skinMaskValue);
        
        float widthOffset = 1.0/ViewportSize.x;
        float heightOffset = 1.0/ViewportSize.y;
        
        float sum = texture2D(InputTextureSampler, VSOutTexCoord + 0.5 * vec2(widthOffset, heightOffset)).g;
        sum += texture2D(InputTextureSampler, VSOutTexCoord + 0.5 * vec2(-widthOffset, -heightOffset)).g;
        sum += texture2D(InputTextureSampler, VSOutTexCoord + 0.5 * vec2(-widthOffset, heightOffset)).g;
        sum += texture2D(InputTextureSampler, VSOutTexCoord + 0.5 * vec2(widthOffset, -heightOffset)).g;
        
        sum = sum * 0.25;
        
        float hPass = iColor.g - sum + 0.5;
        float flag = step(0.5, hPass);
        
        vec3 r = 2.0 * hPass + resultColor - 1.0;
        vec3 color = mix(max(vec3(0.0), r), min(vec3(1.0), r), flag);
        
        float sharpenV = sharpen;
        if (mutil_face_enable < 0.5 && sharpen > 0.3) {
            sharpenV = 0.3;
        }
        color = mix(resultColor.rgb, color.rgb, sharpenV);
        
        gl_FragColor = vec4(color, 1.0);
    } else {
        gl_FragColor = iColor;
    }
}
