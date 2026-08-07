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
uniform 	highp float BrushLength;
uniform		highp float g_TileU;
uniform		highp float g_IndexU;
uniform		sampler2D	DiffuseTexture;

void main(void)
{
	highp float capLength = 0.8;
	highp float stretchLength = 2.0;	
	highp float invstretchLength = 0.5;

	highp vec2 texcoord = VSOutTexcoord0;
	highp float y = texcoord.y;
	if (BrushLength < stretchLength) 
	{
   		y = y / BrushLength;
	} 
	else 
	{
		if (y < capLength)  
		{
			y = y * invstretchLength;
		} 
		else if ( y < BrushLength - capLength) 
		{
			y = mix(capLength * invstretchLength, 1.0 - capLength * invstretchLength, y / BrushLength);
		}
		else 
		{
			y = (y - BrushLength + stretchLength) * invstretchLength;
		}
	}

	texcoord.x = (texcoord.x + g_IndexU) / g_TileU;
	texcoord.y = y;

	highp float alpha = SampleDiffuseTexture(DiffuseTexture, texcoord).a * VSOutColor0.a;
	if(alpha < 0.333)
	{
		discard;
	}
	gl_FragColor = vec4(0.184313725490196, 0.768627450980392, 1.0, alpha);
}
