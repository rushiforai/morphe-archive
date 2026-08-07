//******************************************************************************

// @File         custom_draw_particleization_vs.glsl

// @Version      1.0

// @Description  used to draw particleization texture.

// @HISTORY:

//******************************************************************************/

attribute vec3		Position0;
attribute vec2		Texcoord0;//local uv
attribute vec4		BlendIndices0;//ParticleIdx,KeyId, VertLocalIdx,Extend
attribute vec4		Position1;//Animation: vertexFinalMovingDirLength(xyz), and Scale(w)
uniform  mat4       ViewProjMatrix;
uniform  mat4       WorldMatrix;
uniform float       TimeElapse;
uniform float       FactorCount;
uniform  vec2       g_TextureSize;
uniform  vec2       ViewportSize;
varying  vec2		VSOutTexcoordOrigin;
varying  vec2		VSOutTexcoordLocal;
varying  float      VSOutKeyId;
varying  float      VSOutRandomFactor;

#define MAX_CHANING_FACTOR_NUM 100
//小数部分f * 100.0,
//编码数据=> x: 整数部分为声明的最小粒子索引值，小数部分为需要用到的参数1
//编码数据=> y: 整数部分为声明的最大粒子索引值，小数部分为需要用到的参数2
//编码数据=> z: 整数部分为声明的参数定义，见下面说明，小数部分为需要用到的参数3
//编码数据=> w: 整数部分为声明的参数ID，小数部分为需要用到的参数4
//当当前顶点中的粒子索引在最小最大值范围内时，该参数值有效
uniform vec4        ChangingFactors[MAX_CHANING_FACTOR_NUM];
//参数定义
//0: 顶点动画-percent
//1: 叠乘渐入Alpha-percent, 小数部分f * 100.0
//2: 叠乘渐出Alpha-percent, 小数部分f * 100.0
//3: 叠乘颜色-RGBA :  如(0.00125, 999.22500, 2.12503, 0.00426), 表示粒子范围为[0,999], RGBA的颜色值为(0.125, 22.5, 12.503, 0.426)，sRGB颜色
#define FACTOR_ANIM_VERTEX        0
#define FACTOR_MUL_ALPHA_FADE_IN  1
#define FACTOR_MUL_ALPHA_FADE_OUT 2
#define FACTOR_MUL_COLOR          3

#define PI 3.14159265358979323846
#define T 6.0 //interval, in seconds.


// 一个简单的哈希函数，用于产生伪随机数
float hash(float n) {
    return fract(sin(n) * 93758.23);
}

// 一个简单的随机函数，基于哈希函数
vec2 random(vec2 st) {
    return vec2(hash(st.x), hash(st.y));
}

// 绕 Z 轴旋转矩阵
mat3 rotationMatrixZ(float angle) {
    float c = cos(angle);
    float s = sin(angle);
    return mat3(
        c, -s, 0.0,
        s,  c, 0.0,
        0.0, 0.0, 1.0
    );
}


void main(void)
{
	vec2 offsetPos[4];
	offsetPos[0] 		  = vec2(-1.0, 1.0);
	offsetPos[1] 		  = vec2(-1.0,-1.0);
	offsetPos[2] 		  = vec2(1.0 ,-1.0);
	offsetPos[3] 		  = vec2(1.0 , 1.0);
	int particle_index    = int(BlendIndices0.x);
	int key_id            = int(BlendIndices0.y);
	int local_index       = int(BlendIndices0.z);
	float offset_radius   = BlendIndices0.w;//in pixel
	mat4 wolrd_matrix     = WorldMatrix;

#ifdef _ANIM_ENABLE_
	int factor_count      = int(FactorCount);
	float anim_percent    = 1.;
	//取顶点动画的percent数据
	for(int i = 0; i < factor_count; ++i){
		vec4 factor       = ChangingFactors[i];
		int factor_code   = int(factor.z);
		int motion_id     = int(floor(factor.w + 0.1) / 1000. + 0.1);//int part: motion_id*1000 + factor_id
		if(motion_id == key_id && factor_code == FACTOR_ANIM_VERTEX){
			anim_percent  = fract(factor.x) * 100.;
			break;
		}
	}
#else
	float anim_percent    = 1.;
#endif

VSOutRandomFactor         = 0.;
#ifdef _MOVING_WITH_DIR_ENABLE_
	vec3  dir_len         = Position1.xyz;
	float scale           = Position1.w;
	scale                 = 1.0 - (1.0 - scale) * anim_percent;
	VSOutRandomFactor     = hash(dir_len.x);
	mat4 rotate_matrix    = wolrd_matrix;
	rotate_matrix[3]      = vec4(0.,0.,0.,1.);
	//keep rotate only.
    for (int i = 0; i < 3; ++i) {
        float scale_rot = length(rotate_matrix[i].xyz);
        rotate_matrix[i].xyz /= scale_rot;
    }
	dir_len               = (rotate_matrix * vec4(dir_len, 1.)).xyz;

#ifdef _MOVING_WITH_SCALE_ENABLE_
	offset_radius        *= scale;
#endif
	wolrd_matrix[3].xyz  += dir_len * anim_percent;//add the offset
#endif

	vec4 pos 			  = vec4(Position0, 1.0);
	pos.xy               += offsetPos[local_index] * offset_radius;
	vec2 uvOrigin         = pos.xy / g_TextureSize;//0,1
	//center-algin
	vec2 offset_lefttop   = (ViewportSize - g_TextureSize) * 0.5;
	pos.xy               += offset_lefttop;
	pos.xy               /= ViewportSize; 
	pos.xy                = pos.xy * 2.0 - 1.0;//-1, 1

#ifdef _REVERSE_UV_OF_V
	uvOrigin.y            = 1. - uvOrigin.y;
#endif

	float weight          = -2.* PI / T * (TimeElapse/1.e3);//negative is CCW, positive is CW
	vec2 randomVec        = random(Position0.xy + 0.01 * Position0.z);//the origin is fixed for every 4 vertices.
	vec3 rotate_center    = pos.xyz + 0.005 * vec3(randomVec, 0.0);
	vec3 rotate_pos       = pos.xyz - rotate_center;

	pos.xyz               = rotate_pos * rotationMatrixZ(weight) + pos.xyz;
	VSOutTexcoordOrigin   = uvOrigin;
	VSOutTexcoordLocal    = Texcoord0;
	VSOutKeyId            = BlendIndices0.y;  

	gl_Position           =  ViewProjMatrix * wolrd_matrix * pos;
}

