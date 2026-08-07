precision highp float;
uniform sampler2D InputTextureSampler;
uniform sampler2D InputTextureSampler_1;
uniform sampler2D MaskTextureSampler;

varying vec2 VSOutTexCoord;
varying vec2 maskCoordinate;

uniform float intensity2;
uniform float sharpen;
uniform vec2 ViewportSize;

const float theta = 0.1;
const float skinMaskValue = 1.0;

void main() {

    vec4 iColor = texture2D(InputTextureSampler, VSOutTexCoord);
    if (intensity2 > 0.0001 || sharpen > 0.0001) {
        vec4 meanColor = texture2D(InputTextureSampler_1, VSOutTexCoord);
        vec4 maskColor = texture2D(MaskTextureSampler, maskCoordinate);

        if (maskColor.b < 0.04) {
            gl_FragColor = iColor;
        } else {
            float p = clamp((min(iColor.r, meanColor.r - 0.1) - 0.2) * 4.0, 0.0, 1.0);
            float kMin = (1.0 - meanColor.a / (meanColor.a + theta)) * p * intensity2 * maskColor.b;
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
            
            color = mix(resultColor.rgb, color.rgb, sharpen * maskColor.b);
            gl_FragColor = vec4(color, 1.0);
        }
    } else {
        gl_FragColor = iColor;
    }
}
