//******************************************************************************

// @File         ui_batch_vs.glsl

// @Version      1.0

// @Description  used for 2d ui sprite batch inc non-mask & mask.

// @HISTORY:
//
//******************************************************************************/
attribute vec4		Position0;
attribute vec4		Texcoord0;
attribute vec4		Color0;

uniform  mat4		WorldViewProjMatrix;
uniform  vec2       vScreenResolution;

varying  vec4		VSOutColor0;
varying  vec4		VSOutTexcoord0_mask;
varying  vec4		PosAndWH;
varying  vec2       WorldPos;

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

highp vec3 get_mask_3dui_status(highp float compress_data)
{
    highp float data = compress_data;
    
    highp float mask = floor(data * SHIFT_RIGHT19);
    data -= mask * SHIFT_LEFT19;
	highp float _3dui = floor(data * SHIFT_RIGHT18);
    data -= _3dui * SHIFT_LEFT18;
 
    return vec3(mask,_3dui,data);
}
void main(void)
{
	VSOutColor0 = Color0.bgra;
	float data = Position0.w;
    // extrude(2-bit)
	
    highp float mask = floor(data * SHIFT_RIGHT19);
    data -= mask * SHIFT_LEFT19;
    highp float is3d = floor(data * SHIFT_RIGHT18);
    data -= is3d * SHIFT_LEFT18;
   
    
	VSOutTexcoord0_mask.xy = Texcoord0.xy;
	VSOutTexcoord0_mask.z  = mask;

	if(mask > 0.5)
	{
		PosAndWH.xy = unpack_float_4096(Texcoord0.z);
        PosAndWH.zw = unpack_float_4096(Texcoord0.w);
		PosAndWH.xz *= vScreenResolution.x;
		PosAndWH.yw *= vScreenResolution.y;
	}

	WorldPos    = Position0.xy; 
	gl_Position = WorldViewProjMatrix * vec4(Position0.xyz, 1.0);
	if(is3d < 0.1)
    {
      gl_Position.z = 0.0;
    }
}

