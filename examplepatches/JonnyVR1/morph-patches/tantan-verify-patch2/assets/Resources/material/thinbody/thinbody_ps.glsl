precision highp float;
uniform sampler2D InputTextureSampler;
varying vec2 VSOutTexCoord;
void main() {
    gl_FragColor = texture2D(InputTextureSampler, VSOutTexCoord);
}