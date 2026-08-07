//******************************************************************************

// @File         brush_neon_ps.glsl

// @Version      1.0

// @Created      

// @Description  

// @HISTORY:

//******************************************************************************/
#include "common_ps.glsl"

varying		highp vec4	VSOutColor0;
varying		highp vec2	VSOutTexcoord0;
uniform 	highp float Time;

highp vec4 colorarray[7];
highp mat4 mat0 = mat4(6,0,6,3,1,6,2,6,6,4,4,4,3,6,1,6);
highp mat4 mat1 = mat4(6,2,6,4,3,6,5,3,1,1,3,2,0,0,2,1);

void main(void)
{
	colorarray[0] = vec4(1.0000, 0.0353, 0.3333, 1.0);
	colorarray[1] = vec4(1.0000, 0.5725, 0.1137, 1.0);
	colorarray[2] = vec4(1.0000, 0.9529, 0.0275, 1.0);
	colorarray[3] = vec4(0.3725, 0.9961, 0.1137, 1.0);
	colorarray[4] = vec4(0.1843, 0.7686, 1.0000, 1.0);
	colorarray[5] = vec4(1.0000, 0.1333, 0.8706, 1.0);
	colorarray[6] = vec4(0.0, 0.0, 0.0, 0.0);
	
	highp vec2 texcoord = VSOutTexcoord0;
	highp float itemIndexF = floor(clamp(texcoord.x * 4.0, 0.01, 3.99));
	int itemIndex = int(itemIndexF);

	highp float t = mod(Time, 3.0);
	int colorIndex = int(floor(t / 3.0 * 8.0));

	int ctIndex = 0;
	if(float(colorIndex) < 3.5)
	{
		ctIndex = int(mat0[itemIndex][colorIndex]);
	}
	else
	{
		ctIndex = int(mat1[itemIndex][colorIndex - 4]);
	}
	
	highp vec4 color = colorarray[ctIndex] * VSOutColor0;
	if(color.a < 0.333)
	{
		discard;
	}
	gl_FragColor = color;
}
