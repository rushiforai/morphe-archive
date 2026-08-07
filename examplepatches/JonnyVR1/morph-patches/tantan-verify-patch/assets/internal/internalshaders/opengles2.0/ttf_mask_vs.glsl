//******************************************************************************

// @File         2d_vs.glsl

// @Version      1.0

// @Description  used for 2d element such as ui etc.

// @HISTORY:

//******************************************************************************/
#define SHIFT_RIGHT18 1.0 / 262144.0
#define SHIFT_RIGHT19 1.0 / 524288.0
#define SHIFT_LEFT18 262144.0
#define SHIFT_LEFT19 524288.0
attribute vec4		Position0;
attribute vec4		Texcoord0;
attribute vec4		PositionT0;

uniform  mat4		WorldViewProjMatrix;
uniform  vec2       vScreenResolution;

varying  vec4		VSFontColor;
varying  vec4		VSOutLineColor;
varying  vec4		PosAndWH;
varying  vec4		compressed;
varying  vec2   WorldPos;
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
//suppose tex maxsize[4096,4096]
highp vec2 unpack_float_4096(highp float packedValue) {
  int packedIntValue = int(packedValue);
  int v0 = packedIntValue / 4096;
  return vec2(v0, packedIntValue - v0 * 4096)/4095.0;
}

void main(void)
{
    float data = Position0.w;
    // extrude(2-bit)
    highp float mask = floor(data * SHIFT_RIGHT19);
    data -= mask * SHIFT_LEFT19;
    
    highp float outline = floor(data * SHIFT_RIGHT18);
    data -= outline * SHIFT_LEFT18;
    if(outline < 0.1){
       VSFontColor  = PositionT0;
    }
	else{
	     VSFontColor     = decode_color(vec2(PositionT0.x,PositionT0.y));
         VSOutLineColor  = decode_color(vec2(PositionT0.z,PositionT0.w));
	}
	compressed = vec4(Texcoord0.xy,outline,mask);
	PosAndWH.xy = unpack_float_4096(Texcoord0.z);
	PosAndWH.zw = unpack_float_4096(Texcoord0.w);
	PosAndWH.xz *= vScreenResolution.x;
	PosAndWH.yw *= vScreenResolution.y;
	gl_Position = WorldViewProjMatrix * vec4(Position0.xyz, 1.0);
  WorldPos    = Position0.xy;
	gl_Position.z = -1.0;
}

