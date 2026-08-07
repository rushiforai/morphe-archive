//******************************************************************************

// @File         ui_batch_vs.glsl

// @Version      1.0

// @Description  used for 2d ui sprite batch inc non-mask & mask.

// @HISTORY:

//******************************************************************************/
#define SHIFT_RIGHT19 1.0 / 524288.0
#define SHIFT_LEFT19 524288.0
attribute vec4		Position0;
attribute vec4		Texcoord0;
attribute vec4		Color0;

uniform  mat4		WorldViewProjMatrix;
uniform  vec2       vScreenResolution;

varying  vec4		VSOutColor0;
varying  vec4		VSOutTexcoord0_mask;
varying  vec4		PosAndWH;
varying  vec2       WorldPos;
//suppose tex maxsize[4096,4096]
highp vec2 unpack_float_4096(highp float packedValue) {
  int packedIntValue = int(packedValue);
  int v0 = packedIntValue / 4096;
  return vec2(v0, packedIntValue - v0 * 4096)/4095.0;
}
void main(void)
{
	VSOutColor0 = Color0.bgra;
	float data = Position0.w;
    // extrude(1-bit)
    highp float mask = floor(data * SHIFT_RIGHT19);
    data -= mask * SHIFT_LEFT19;
    
	VSOutTexcoord0_mask.xy = Texcoord0.xy;
	VSOutTexcoord0_mask.z  = mask;
	if(mask > 0.5){
		PosAndWH.xy = unpack_float_4096(Texcoord0.z);
		PosAndWH.zw = unpack_float_4096(Texcoord0.w);
		PosAndWH.xz *= vScreenResolution.x;
		PosAndWH.yw *= vScreenResolution.y;
	}
	WorldPos = Position0.xy; 
	gl_Position = WorldViewProjMatrix * vec4(Position0.xyz, 1.0);
	gl_Position.z = -1.0;
}

