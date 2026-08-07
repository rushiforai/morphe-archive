//******************************************************************************

// @File         2d_vs.glsl

// @Version      1.0

// @Description  used for 2d element such as ui etc.

// @HISTORY:

//******************************************************************************/

attribute vec4		Position0;
attribute vec4		Texcoord0;
attribute vec4		PositionT0;

uniform  mat4		WorldViewProjMatrix;

varying  vec4		VSFontColor;
varying  vec4		VSOutLineColor;
varying  vec3		VSOutTexcoordAndOutLine0;
varying  vec2   WorldPos;
highp vec2 unpack_float(highp float packedValue) {
  int packedIntValue = int(packedValue);
  int v0 = packedIntValue / 256;
  return vec2(v0, packedIntValue - v0 * 256);
}
highp vec4 decode_color(highp vec2 encodedColor) {
  return vec4(
    unpack_float(encodedColor[0]) / 255.0,
    unpack_float(encodedColor[1]) / 255.0
  );
}
void main(void)
{
    if(Position0.w < 0.1){
       VSFontColor  = PositionT0;
    }
	else{
	     VSFontColor     = decode_color(vec2(PositionT0.x,PositionT0.y));
       VSOutLineColor  = decode_color(vec2(PositionT0.z,PositionT0.w));
	}
	VSOutTexcoordAndOutLine0 = vec3(Texcoord0.xy,Position0.w);
  WorldPos    = Position0.xy;
	gl_Position = WorldViewProjMatrix * vec4(Position0.xyz, 1.0);
	gl_Position.z = -1.0;
}

