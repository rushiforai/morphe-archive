precision mediump float;
varying vec2 VSOutTexCoord;
uniform sampler2D InputTextureSampler;
uniform float skinLightingScale;
uniform vec3 skinDefaultRGB;

vec3 rgb2yuv(vec3 c)
{
    return clamp(vec3(0.299 * c.r + 0.587 * c.g + 0.114 * c.b, -0.169 * c.r - 0.331 * c.g + 0.499 * c.b + 0.5, 0.499 * c.r - 0.418 * c.g - 0.0813* c.b + 0.5), 0., 1.);
}

vec3 yuv2rgb(vec3 c)
{
    return clamp(vec3(c.r + 1.402 * (c.b - 0.5), c.r - 0.344 * (c.g - 0.5) - 0.714 * (c.b - 0.5), c.r + 1.772 * (c.g - 0.5)), 0., 1.);
}

vec3 adjustYUV(vec3 c, float highThreshold)
{
    if(c.x < 0.1){
        c.x = 0.;
    }else if (c.x > highThreshold){
        c.x = 1.;
    }else{
        c.x = (c.x - 0.1)/(highThreshold - 0.1);
    }
    return c;
}

void main() {

    vec4 textureColor = texture2D(InputTextureSampler, VSOutTexCoord);
    vec4 rColor = vec4(0.0);
    float epslone = 0.006 * skinLightingScale * skinLightingScale;
    vec4 source = textureColor;
    rColor = source;
    
    if(skinLightingScale < 0.05){
        gl_FragColor = rColor;
        return;
    }
    
    vec3 relation = vec3(1.0) - abs(skinDefaultRGB.rbg - source.xyz);
    relation = 1./(1. + exp(39. - 60. * relation));
    vec4 eps = vec4(epslone * relation, epslone);
    if(eps.x <0.000001 || eps.y <0.000001 || eps.z <0.000001 || eps.w <0.000001){
        gl_FragColor = rColor;
        return;
    }
    
    float param = 1.05 + relation.x * relation.y * relation.z * relation.x * relation.y * relation.z * relation.x * relation.y * relation.z * skinLightingScale;
    
    vec3 paramVec = vec3(param*1.4, param*1.1, param*1.3);

    vec3 a = log(rColor.rgb*(paramVec - vec3(1.)) + vec3(1.));
    rColor.rgb = clamp(a/log(paramVec),0.,1.);
    gl_FragColor.rgb = a / log(paramVec);
}