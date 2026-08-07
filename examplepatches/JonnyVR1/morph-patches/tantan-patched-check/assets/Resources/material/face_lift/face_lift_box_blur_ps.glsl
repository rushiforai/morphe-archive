precision highp float;
uniform sampler2D InputTextureSampler;
varying vec2        VSOutTexCoord;

varying vec4		textureShift_1;
varying vec4		textureShift_2;

void main() {
    vec4 color = texture2D(InputTextureSampler, VSOutTexCoord);

    vec3 sum = color.rgb;
    sum += texture2D(InputTextureSampler, textureShift_1.xy).rgb;
    sum += texture2D(InputTextureSampler, textureShift_1.zw).rgb;
    sum += texture2D(InputTextureSampler, textureShift_2.xy).rgb;
    sum += texture2D(InputTextureSampler, textureShift_2.zw).rgb;
    gl_FragColor = vec4(sum * 0.2, color.a);
}