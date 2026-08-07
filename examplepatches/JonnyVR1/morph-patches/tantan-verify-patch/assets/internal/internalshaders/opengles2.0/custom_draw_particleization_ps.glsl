//******************************************************************************

// @File         custom_draw_particleization_vs.glsl

// @Version      1.0

// @Description  used to draw particleization texture.

// @HISTORY:

//******************************************************************************/

#include "common_ps.glsl"

varying highp	vec2		VSOutTexcoordLocal;//local space
varying highp   vec2		VSOutTexcoordOrigin;//inerp origin uv for the vertex.
varying highp   float       VSOutKeyId;
varying  highp  float       VSOutRandomFactor;
uniform highp   vec2        g_TextureSize;
uniform sampler2D			g_DiffuseTexture;
uniform highp   float       FactorCount;
uniform highp   float       UseTextureColor;

#define MAX_CHANING_FACTOR_NUM 100
//编码数据=> x: 整数部分为声明的最小粒子索引值，小数部分为需要用到的参数1
//编码数据=> y: 整数部分为声明的最大粒子索引值，小数部分为需要用到的参数2
//编码数据=> z: 整数部分为声明的参数定义，见下面说明，小数部分为需要用到的参数3
//编码数据=> w: 整数部分为声明的KeyID，小数部分为需要用到的参数4
//当当前顶点中的粒子索引在最小最大值范围内时，该参数值有效
uniform vec4 ChangingFactors[MAX_CHANING_FACTOR_NUM];
//参数定义
//0: 顶点动画-percent
//1: 叠乘渐入Alpha-percent, 小数部分f * 100.0
//2: 叠乘渐出Alpha-percent, 小数部分f * 100.0
//3: 叠乘颜色-RGBA : 小数部分f * 100.0, 如(0.00125, 999.22500, 2.12503, 0.00426), 表示粒子范围为[0,999], RGBA的颜色值为(0.125, 22.5, 12.503, 0.426)，sRGB颜色
#define FACTOR_ANIM_VERTEX        0
#define FACTOR_MUL_ALPHA_FADE_IN  1
#define FACTOR_MUL_ALPHA_FADE_OUT 2
#define FACTOR_MUL_COLOR          3


//hdr support
vec3 reinhardToneMapping(vec3 color, float exposure) {
    color *= exposure;
    return color / (color + vec3(1.0));
}

vec3 toneMappingReinhardExtended(vec3 color, float exposure) {
    color *= exposure;
    float luminance = dot(color, vec3(0.2126, 0.7152, 0.0722));
    vec3 toneMapped = color * (1.0 + (color / vec3(luminance * luminance))) / (1.0 + color);
    return toneMapped;
}

vec3 toneMappingFilmic(vec3 color, float exposure) {
    color = max(vec3(0.0), color - vec3(0.004));
    color = (color * (6.2 * color + .5)) / (color * (6.2 * color + 1.7) + 0.06);
    return color;
}

vec3 toneMappingACES(vec3 color, float exposure) {
    const float a = 2.51;
    const float b = 0.03;
    const float c = 2.43;
    const float d = 0.59;
    const float e = 0.14;
    color *= exposure;
    color = clamp((color * (a * color + b)) / (color * (c * color + d) + e), 0.0, 1.0);
    return color;
}

vec3 toneMappingUncharted2(vec3 color, float exposure) {
    float A = 0.15;
    float B = 0.50;
    float C = 0.10;
    float D = 0.20;
    float E = 0.02;
    float F = 0.30;
    color *= exposure;
    return ((color * (A * color + C * B) + D * E) / (color * (A * color + B) + D * F)) - E / F;
}

// sRGB 到线性 RGB 的转换函数
vec3 srgbToLinear(vec3 srgb) {
    vec3 linear = vec3(0.0);
    // 对每个颜色通道进行转换
    for (int i = 0; i < 3; ++i) {
        if (srgb[i] <= 0.04045) {
            linear[i] = srgb[i] / 12.92;
        } else {
            linear[i] = pow((srgb[i] + 0.055) / 1.055, 2.4);
        }
    }
    return linear;
}

float smootherstep(float edge0, float edge1, float x) {
    x = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0);
    return x * x * x * (x * (x * 6.0 - 15.0) + 10.0);
}

// 一个简单的哈希函数，用于产生伪随机数
float hash(float n) {
    return fract(sin(n) * 93758.23);
}

void main (void)
{	
    vec2 pixels = VSOutTexcoordLocal;
    vec2 pixel_center = vec2(0.5);
    float dis_to_center = distance(pixels, pixel_center) / 0.5;
    float alpha = 1.0 - dis_to_center;

    vec2 pos = 0.5 - pixels;
    float dist = 1.0/length(pos);
    dist *= 0.45;
    dist = pow(dist, 2.2);

    // float alpha_final_anim = 0.1;
    // alpha = smoothstep(0.0, 1.0, alpha);
    alpha = smootherstep(0.0, 1.0, alpha);
    // alpha *= 1.0 - ((anim_percent - 1. + alpha_final_anim) * step(1. - alpha_final_anim, anim_percent)) / alpha_final_anim;
    int key_id = int(VSOutKeyId + 0.1);
    int factor_count = int(FactorCount + 0.1);

    //multiply alpha
#ifdef _ANIM_ENABLE_
    float mul_alpha_fade_in  = 1.;
    float mul_alpha_fade_out = 0.;
    for(int i = 0; i < factor_count; ++i){
        vec4 factor       = ChangingFactors[i];
        int factor_code   = int(factor.z);
        int motion_id     = int(floor(factor.w + 0.1) / 1000. + 0.1);//int part: motion_id*1000 + factor_id
		if(motion_id == key_id){
            if(factor_code == FACTOR_MUL_ALPHA_FADE_IN){
                mul_alpha_fade_in = fract(factor.x) * 100.;
            }
            else if(factor_code == FACTOR_MUL_ALPHA_FADE_OUT){
                mul_alpha_fade_out = fract(factor.x) * 100.;
            }
		}
    }
    float mul_alpha = min(mul_alpha_fade_in, 1.0 - mul_alpha_fade_out);
    alpha *= smootherstep(0., 1., mul_alpha);
    // alpha += 0.1 * VSOutRandomFactor;
#endif

    vec4 clDiffuse = SampleDiffuseTexture(g_DiffuseTexture, VSOutTexcoordOrigin);
    float alpha_diffuse = step(20./255., clDiffuse.r + clDiffuse.g + clDiffuse.b);
    clDiffuse      = mix(vec4(1.), clDiffuse, UseTextureColor);//only if the UseTextureColor is 1.0 that use the clDiffuse

    clDiffuse.a    = alpha;
    clDiffuse.a   *= alpha_diffuse;
    // clDiffuse.rgb  = mix(vec3(1.,0.,0.), vec3(alpha), alpha) ;

    //multiply hdr-color:sRGB
#ifdef _ANIM_ENABLE_
    vec4 hdr_fade = vec4(1.);
    for(int i = 0; i < factor_count; ++i){
        vec4 factor       = ChangingFactors[i];
        int factor_code   = int(factor.z);
		int motion_id     = int(floor(factor.w + 0.1) / 1000. + 0.1);//int part: motion_id*1000 + factor_id
		if(factor_code == FACTOR_MUL_COLOR && motion_id == key_id){
			hdr_fade  = fract(factor) * 100.;
            break;
		}
    }

    clDiffuse.xyz *= hdr_fade.xyz;
    if(clDiffuse.x > 1. || clDiffuse.y > 1. || clDiffuse.z > 1. || hdr_fade.a > 1.){
        clDiffuse.xyz = reinhardToneMapping(clDiffuse.xyz, hdr_fade.a);
    }
#endif

    gl_FragColor = clDiffuse;
}