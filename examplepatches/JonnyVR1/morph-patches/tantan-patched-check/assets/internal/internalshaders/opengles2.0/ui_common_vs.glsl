

//******************************************************************************

// @File         ui_common_vs.glsl

// @Version       1.0

// @Created      2020, 8, 22

// @Description  This file is ui_common_vs.glsl by ysf

// @HISTORY:

//******************************************************************************/

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

highp vec2 get_mask_3dui_status(highp float compress_data)
{
    highp float data = compress_data;

    highp float mask = floor(data * SHIFT_RIGHT19);
    data -= mask * SHIFT_LEFT19;

	  highp float _3dui = floor(data * SHIFT_RIGHT18);
    data -= _3dui * SHIFT_LEFT18;
    
    

    return vec2(mask,_3dui);
}