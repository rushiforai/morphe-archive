//******************************************************************************

// @File         landscape_vs.glsl

// @Version       1.0

// @Created      2020, 1, 20

// @Description  This file is landscape_vs.glsl.

// @HISTORY:

//******************************************************************************/

/* Macros in this shader:
_DIRECTION_LIGHT_
_POINT_LIGHT_		
_SPOT_LIGHT_
REFLECT_ENABLE
*/

#include "common_vs.glsl"

attribute vec2		Position0;

uniform sampler2D HeightTexture;


uniform vec4 LodValues;
uniform vec4 NeighborBlockLod;
uniform vec4 LandscapeParameters_HeightTextureUVScaleBias;
uniform vec4 LandscapeParameters_BlockSizeVertsLayerUVPan;

uniform mat4 WorldMatrix;
uniform mat4 ViewProjMatrix;

varying vec3 VertexWorldPosition;

struct VertexAttrib
{
	vec3 LocalPosition;
	vec3 LocalNormal;
};

//DecodeHeightValue
float DecodePackedTwoChannelValue(vec2 PackedHeight)
{
	return PackedHeight.x * 255.0 * 256.0 + PackedHeight.y * 255.0;
}
float DecodeHeightValue(float InValue)
{
	return (InValue - 32768.0) *  (1.0/128.0) ;
}
float DecodePackedHeight(vec2 PackedHeight)
{
	return DecodeHeightValue(DecodePackedTwoChannelValue(PackedHeight));
}

float CalcLod(vec2 xy)
{
	vec4 L0 = vec4(xy.y, xy.x, (1.0-xy.x), (1.0-xy.y)) * 2.0;
	vec4 LodCalculated4;
	
	float BlockLod = LodValues.y;
	LodCalculated4 = L0 * BlockLod + (vec4(1.0, 1.0, 1.0, 1.0) - L0) * NeighborBlockLod;
	
	float LodCalculated;
	if((xy.x + xy.y) > 1.0)
	{
		if (xy.x < xy.y)
		{
			LodCalculated = LodCalculated4.w;
		}
		else
		{
			LodCalculated = LodCalculated4.z;
		}
	}
	else
	{
		if (xy.x < xy.y)
		{
			LodCalculated = LodCalculated4.y;
		}
		else
		{
			LodCalculated = LodCalculated4.x;
		}
	}
	return LodCalculated;
}

VertexAttrib calcFinalLocalPos(vec2 inLocalVertex)
{
	VertexAttrib vertexAttrib;

	vec2 xy = inLocalVertex.xy * LodValues.w;
	
	float LodCalculated = CalcLod(xy);
	
	float LodValue = floor(LodCalculated);
	float MorphAlpha = LodCalculated - LodValue;
	
	vec2 ActualLodCoordsInt = floor(inLocalVertex.xy * pow(2.0, -(LodValue - LodValues.x)));
	float InvLodScaleFactor = pow(2.0, -LodValue);
	
	vec2 CoordTranslate = vec2(LandscapeParameters_BlockSizeVertsLayerUVPan.x * InvLodScaleFactor - 1.0, max(LandscapeParameters_BlockSizeVertsLayerUVPan.x * 0.5 * InvLodScaleFactor, 2.0) - 1.0 ) * LandscapeParameters_BlockSizeVertsLayerUVPan.y;
	vec2 InputPositionLodAdjusted = ActualLodCoordsInt / CoordTranslate.x;
	
	vec2 NextLodCoordsInt = floor(ActualLodCoordsInt * 0.5);
	vec2 InputPositionNextLod = NextLodCoordsInt / CoordTranslate.y;
	
	vec2 SampleCoords = InputPositionLodAdjusted *LandscapeParameters_HeightTextureUVScaleBias.xy + LandscapeParameters_HeightTextureUVScaleBias.zw + 0.5 * LandscapeParameters_HeightTextureUVScaleBias.xy;
	vec4 SampleValue = texture2DLod(HeightTexture, SampleCoords, LodValue);
	float Height = DecodePackedHeight(SampleValue.xy);
	
	vec2 SampleCoordsNextLod = InputPositionNextLod * LandscapeParameters_HeightTextureUVScaleBias.xy + LandscapeParameters_HeightTextureUVScaleBias.zw + 0.5*LandscapeParameters_HeightTextureUVScaleBias.xy;
	vec4 SampleValueNextLod = texture2DLod(HeightTexture, SampleCoordsNextLod, LodValue + 1.0);
	float HeightNextLod = DecodePackedHeight(SampleValueNextLod.xy);

	
	vec3 LocalPosition = mix(vec3(InputPositionLodAdjusted, Height), vec3(InputPositionNextLod, HeightNextLod), MorphAlpha);
	
	vec2 Normal = vec2(SampleValue.b, SampleValue.a);
	vec2 NormalNextLod = vec2(SampleValueNextLod.b, SampleValueNextLod.a);
	vec2 InterpNormal = mix(Normal, NormalNextLod, MorphAlpha) * 2.0 - 1.0;
	
	vertexAttrib.LocalPosition = LocalPosition;
	vertexAttrib.LocalNormal = vec3(InterpNormal, sqrt(max(1.0 - dot(InterpNormal, InterpNormal), 0.0)));
	
	return vertexAttrib;
}

void main()
{
	VertexAttrib vertexAttrib = calcFinalLocalPos(Position0);
	vec4 WorldPosition = WorldMatrix * vec4(vertexAttrib.LocalPosition.x, vertexAttrib.LocalPosition.z, vertexAttrib.LocalPosition.y, 1.0);
	VertexWorldPosition = WorldPosition.xyz;
	//gl_Position = WorldViewProjMatrix * vec4(Position0.x, 0.0, Position0.y, 1.0);
	//gl_Position = WorldViewProjMatrix * vec4(vertexAttrib.LocalPosition.x, 0.0, vertexAttrib.LocalPosition.y, 1.0);
	gl_Position =ViewProjMatrix *  WorldPosition;
}
