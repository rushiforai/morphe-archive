precision highp float;
uniform sampler2D InputTextureSampler;
uniform sampler2D SucaiTextureSampler;
varying vec2 VSOutTexCoord;

uniform float intensity;

vec3 lut2DfilterColor(vec3 src, sampler2D colorSampler, float factor) {
        float blue = src.b * 63.0;
        
        vec2 q1;
        float fb = floor(blue);
        q1.y = floor(fb * 0.125);
        q1.x = fb - (q1.y * 8.0);
        
        vec2 q2;
        float cb = ceil(blue);
        q2.y = floor(cb * 0.125);
        q2.x = cb - (q2.y * 8.0);
        
        vec2 t = 0.123 * src.rg + vec2(0.000976563);
        vec2 t1 = q1 * 0.125 + t;
        vec3 p1 = texture2D(colorSampler, t1).rgb;
        
        vec2 t2 = q2 * 0.125 + t;
        vec3 p2 = texture2D(colorSampler, t2).rgb;
        
        vec3 filtered = mix(p1, p2, fract(blue));
        return mix(src, filtered, factor);
    }

void main() {
    vec4 color = texture2D(InputTextureSampler, VSOutTexCoord);
    if(intensity > 0.0) {
        vec3 lutColor = lut2DfilterColor(color.rgb, SucaiTextureSampler, intensity);
        gl_FragColor = vec4(lutColor, color.a);    
    } else {
        gl_FragColor = color;    
    }
}