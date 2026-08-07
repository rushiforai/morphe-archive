//******************************************************************************

// @File         skeleton2d_vs.glsl

// @Version      1.0

// @Description  used for skeleton 2d. 2020/12/25.

// @HISTORY:

//******************************************************************************/
attribute vec4		Position0;
attribute vec4		Texcoord0;
attribute vec4		PositionT0;

uniform  mat4		WorldViewProjMatrix;
uniform  vec2       vScreenResolution;

varying  vec4		VSLightColor;
varying  vec4		VSDarkColor;
varying  vec4		uv_tint_mask;
varying  vec4		PosAndWH;
varying  vec2       WorldPos;
highp vec2 unpack_float_color(highp float packedValue) {
  int packedIntValue = int(packedValue);
  int v0 = packedIntValue / 256;
  return vec2(v0, packedIntValue - v0 * 256);
}
highp vec4 decode_color(highp vec2 encodedColor) {
  return vec4(
    unpack_float_color(encodedColor[0]) / 255.0,
    unpack_float_color(encodedColor[1]) / 255.0
  );
}
#define SHIFT_RIGHT18 1.0 / 262144.0
#define SHIFT_RIGHT19 1.0 / 524288.0
#define SHIFT_RIGHT20 1.0 / 1048576.0

#define SHIFT_LEFT18 262144.0
#define SHIFT_LEFT19 524288.0
#define SHIFT_LEFT20 1048576.0

//suppose tex maxsize[4096,4096]
//float => vec2
highp vec2 unpack_float_4096(highp float packedValue)
{
  int packedIntValue = int(packedValue);
  int v0 = packedIntValue / 4096;
  return vec2(v0, packedIntValue - v0 * 4096)/4095.0;
}


void main(void)
{
    float data = Position0.w;
    // extrude(3-bit)]
    highp float use_tint = floor(data * SHIFT_RIGHT20);
    data -= use_tint * SHIFT_LEFT20;
    highp float mask = floor(data * SHIFT_RIGHT19);
    data -= mask * SHIFT_LEFT19;
    highp float is3d = floor(data * SHIFT_RIGHT18);
    data -= is3d * SHIFT_LEFT18;
 



    VSLightColor     = decode_color(vec2(PositionT0.x,PositionT0.y));
    VSDarkColor      = decode_color(vec2(PositionT0.z,PositionT0.w));
    if(mask > 0.5) {
      	PosAndWH.xy  = unpack_float_4096(Texcoord0.z);
        PosAndWH.zw  = unpack_float_4096(Texcoord0.w);
        PosAndWH.xz *= vScreenResolution.x;
        PosAndWH.yw *= vScreenResolution.y;
    }

    WorldPos           = Position0.xy; 
    uv_tint_mask.xy    = Texcoord0.xy;
    uv_tint_mask.z     = use_tint;
    uv_tint_mask.w     = mask;
	  gl_Position        = WorldViewProjMatrix * vec4(vec3(Position0.xyz), 1.0);
    if(is3d < 0.1)
    {
      gl_Position.z = -1.0;
    }

}

