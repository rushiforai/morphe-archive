//******************************************************************************

// @File         landscape_ps.glsl

// @Version       1.0

// @Created      2020, 1, 20

// @Description  This file is landscape_ps.glsl.

// @HISTORY:

//******************************************************************************/

/* Macros in this shader:
*/

//#include "common_ps.glsl"

varying highp vec3 VertexWorldPosition;

uniform highp vec3 HitWorldPosition;
uniform highp vec4 BrushParameters;
uniform highp float HighLightBlock;

highp float InnerOuterLine(highp float Radius, highp float Falloff, highp float Distance)
{
	highp float linethickness = 0.05;
	
	highp float inner = abs(Distance - Radius);
	if(inner < linethickness)
  		return 1.0 - pow(inner / linethickness, 2.0);
	
	highp float outer = abs(Distance - Radius * Falloff);
	if(outer < linethickness)
  		return 1.0 - pow(outer / linethickness, 2.0);
	
	return 0.0;
}

highp float AreaColor(highp float Radius, highp float Falloff, highp float Distance)
{
	if(Distance < Radius)
	return 1.0;
	
	if(Distance - Radius - Falloff < 0.0){
		highp float y = mix(1.0, 0.0, (Distance - Radius) / Falloff );
  		return y * y * (3.0 - 2.0 * y);
  	}
	return 0.0;
}

void main()
{
	if(HighLightBlock > 0.0)
	{
		gl_FragColor = vec4(1.0, 0.5, 0.0, 0.5);
	}
	else if(HighLightBlock < 0.0)
	{
		gl_FragColor = vec4(0.0);
	}
	else if(HighLightBlock > -0.5 && HighLightBlock < 0.5)
	{
		highp vec3 DirVectorWorld = HitWorldPosition - VertexWorldPosition;
		highp float Distance = sqrt(dot(DirVectorWorld.xyz, DirVectorWorld.xyz));
		highp float LineColorRatio = InnerOuterLine(BrushParameters.x, 1.0 - BrushParameters.y, Distance);
		highp float AreaColorRatio = AreaColor(BrushParameters.x, 1.0 - BrushParameters.y, Distance);
		highp float Alpha = min(1.0, max(AreaColorRatio * 0.5, LineColorRatio));
		highp vec3 Color = LineColorRatio * vec3(1.0, 1.0, 1.0);
		Color += vec3(0.5, 0.5, 1.0);
		gl_FragColor = vec4(Color, Alpha);
	}	
}