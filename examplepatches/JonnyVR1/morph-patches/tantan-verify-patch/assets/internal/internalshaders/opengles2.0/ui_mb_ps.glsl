//******************************************************************************

// @File         2d_ps.glsl

// @Version      1.0

// @Description  used for 2d element such as ui etc.

// @HISTORY:

//******************************************************************************/

uniform lowp vec4 Centers[120];
uniform lowp float Number;
uniform lowp float Radius;
uniform lowp float EnergyThreshold;
uniform lowp float RadiusExtent;
uniform lowp vec2 	TargetSize;
uniform lowp vec4	MBColor;

varying lowp vec2 VSOutScreenPos;

void main (void)
{	
	// 这是第一个能用的版本，很卡
	// highp float Threshold = 1.0;
	// highp float TestRadius = 50.0;
	// highp float energy = 0.0;
	// for(int i = 0; i < int(Number); i++)
	// {
	// 	highp float exit = 0.0;	
	// 	highp vec2 ScreenCenter	= 0.5 * TargetSize * (Centers[i].xy + vec2(1.0, 1.0));
	// 	highp float i1 = (ScreenCenter.x - VSOutScreenPos.x);
	// 	highp float i2 = (ScreenCenter.y - VSOutScreenPos.y);
	// 	highp float distance1 = TestRadius / (i1 * i1 + i2 * i2);
	// 	for(int j = 0; j < int(Number); j++)
	// 	{
	// 		if(i == j)
	// 		{
	// 			continue;
	// 		}
	// 		highp vec2 ScreenCenter1 = 0.5 * TargetSize * (Centers[j].xy + vec2(1.0, 1.0));
	// 		highp float j1 = (ScreenCenter1.x - VSOutScreenPos.x);
	// 		highp float j2 = (ScreenCenter1.y - VSOutScreenPos.y);
	// 		highp float distance2 = TestRadius / (j1 * j1 + j2 * j2);
	// 		energy = distance1 + distance2;
	// 		if(energy > Threshold)
	// 		{
	// 			exit = 1.0;
	// 			break;
	// 		}
	// 	}
	// 	if(exit > 0.5)
	// 		break;
	// }
	// if(energy < Threshold - 0.01)
	// 	discard;
	// gl_FragColor = vec4(0.03, 0.525, 0.93, 1.0);

	// // 这是第二个尝试，用一次循环
	// highp float energy = 0.0;
	// for(int i = 0; i < int(Number / 2.0); i++)
	// {
	// 	highp vec2 ScreenCenter = 0.5 * TargetSize * (Centers[i].xy + vec2(1.0, 1.0));
	// 	highp float i1 = (ScreenCenter.x - VSOutScreenPos.x);
	//  	highp float i2 = (ScreenCenter.y - VSOutScreenPos.y);
	//  	highp float energy1 = Radius * Radius / (i1 * i1 + i2 * i2);
	// 	highp float realdistance = distance(ScreenCenter.xy, VSOutScreenPos.xy);
	// 	if(realdistance < Radius + RadiusExtent)
	// 	{
	// 		energy += energy1;
	// 	}
	// 	if(energy > EnergyThreshold)
	// 	{
	// 		break;
	// 	}

	// 	ScreenCenter = 0.5 * TargetSize * (Centers[i].zw + vec2(1.0, 1.0));
	// 	i1 = (ScreenCenter.x - VSOutScreenPos.x);
	//  	i2 = (ScreenCenter.y - VSOutScreenPos.y);
	//  	energy1 = Radius * Radius / (i1 * i1 + i2 * i2);
	// 	realdistance = distance(ScreenCenter.xy, VSOutScreenPos.xy);
	// 	if(realdistance < Radius + RadiusExtent)
	// 	{
	// 		energy += energy1;
	// 	}
	// 	if(energy > EnergyThreshold)
	// 	{
	// 		break;
	// 	}
	// }
	// if(energy < EnergyThreshold - 0.01)
	// 	discard;
	// gl_FragColor = MBColor;

	// 这是第三次尝试, 主要做优化
	lowp float energy = 0.0;
	for(int i = 0; i < int(Number / 2.0); i++)
	{
		lowp vec4 i4 = Centers[i] - VSOutScreenPos.xyxy;
		i4 = i4 * i4;
		lowp float energy1 = Radius / (i4.x + i4.y) - 1.0;
		lowp float energy2 = Radius / (i4.z + i4.w) - 1.0;
		energy1 = clamp(energy1, 0.0, 1.0);
		energy2 = clamp(energy2, 0.0, 1.0);
		energy += energy1 + energy2;
	}
	if(energy > EnergyThreshold)
	{
		gl_FragColor = MBColor;
		return;
	}
	discard;
}
