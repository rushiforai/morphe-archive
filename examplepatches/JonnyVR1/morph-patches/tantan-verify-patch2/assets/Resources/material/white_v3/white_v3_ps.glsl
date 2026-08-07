precision highp float;
varying vec2 VSOutTexCoord;
uniform sampler2D InputTextureSampler;

uniform sampler2D TextureWhittenV1;
uniform sampler2D TextureWhittenV2;
uniform sampler2D TextureWhittenV3;

uniform sampler2D TextureReddenV1;
uniform sampler2D TextureReddenV2;


uniform float whitenDegree;
uniform float whitenDegreeVersion;
uniform float redDegree;
uniform float redDegreeVersion;

vec3 lookupFilterColor(vec3 src, sampler2D table, float factor)
{
    highp float blue = src.b * 63.0;
    highp vec2 q1;
    float fb = floor(blue);
    q1.y = floor(fb * 0.125);
    q1.x = fb - (q1.y * 8.0);
    highp vec2 q2;
    float cb = ceil(blue);
    q2.y = floor(cb * 0.125);
    q2.x = cb - (q2.y * 8.0);

    vec2 t = 0.123 * src.rg + vec2(0.000976563);
    vec2 t1 = q1 * 0.125 + t;
    vec3 p1 = texture2D(table, t1).rgb;

    vec2 t2 = q2 * 0.125 + t;
    vec3 p2 = texture2D(table, t2).rgb;

    vec3 filtered = mix(p1, p2, fract(blue));
    return mix(src, filtered, factor);
}

vec3 lineLookupFilterColor(float ruddy_level, vec4 C, sampler2D texture){
        vec4 C_origin = C;
        vec2 st = C.xy * (15.0 / 16.0) + (0.5 / 16.0);//clamp(C.xy,0.5/16.0,15.5/16.0);
        float b16 = C.z * 15.0 + 0.1;//C.z*(255.0/16.0);
        float slice0 = min(floor(b16),15.0);
        float slice1 = min(slice0 + 1.0,15.0);
        float slice_w = b16 - slice0;
        vec3 color0 = texture2D(texture, vec2((slice0 + st.x) * (1.0 / 16.0),st.y)).xyz;
        vec3 color1 = texture2D(texture, vec2((slice1 + st.x) * (1.0 / 16.0),st.y)).xyz;
        
        C = vec4(color0 + slice_w * (color1 - color0), C.w);
        C = C_origin + (C - C_origin) * ruddy_level;
        
        return C.rgb;
    }

void main()
{
    vec4 src = texture2D(InputTextureSampler, VSOutTexCoord);
    vec3 resultColor = src.rgb;

    if (whitenDegree > 0.001) {
        if (whitenDegreeVersion >= 2.0) {
            resultColor = lookupFilterColor(resultColor, TextureWhittenV1, whitenDegree);
            resultColor = lineLookupFilterColor(min(whitenDegree, 0.4), vec4(resultColor, src.a), TextureWhittenV3);
        } else if (whitenDegreeVersion >= 1.0) {
            resultColor = lookupFilterColor(src.rgb, TextureWhittenV2, whitenDegree);
        } else {
            resultColor = lookupFilterColor(src.rgb, TextureWhittenV1, whitenDegree);
        }
    }

    if (redDegreeVersion >= 1.0) {
        resultColor = lineLookupFilterColor(redDegree, vec4(resultColor, src.a),  TextureReddenV2);
    } else {
        resultColor = lookupFilterColor(resultColor,  TextureReddenV1, redDegree);
    }
    gl_FragColor = vec4(resultColor, src.a);

}