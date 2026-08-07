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
*/
#include "common_vs.glsl"

attribute vec2 Position0;

uniform mat4 		WorldMatrix;
uniform mat4 		ViewProjMatrix;
uniform vec3		EyePos;

// light 
#if defined(_DIRECTION_LIGHT_) || defined(_SPOT_LIGHT_)
uniform vec3		LightDir;
#endif
#if defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)
uniform vec4		g_PointLight_PosAndInvRadius;
#endif

uniform vec4		LodValues;
uniform vec4 		NeighborBlockLod;
uniform vec4 		LandscapeParameters_HeightTextureUVScaleBias;
uniform vec4 		LandscapeParameters_WeightTextureUVScaleBias;
uniform vec4 		LandscapeParameters_BlockSizeVertsLayerUVPan;
uniform sampler2D 	HeightTexture;

varying vec3 		outDebugColor;
varying vec3 		NormalWorld;
varying vec2 		PaintTexCoord_xy;
varying vec2 		PaintTexCoord_xz;
varying vec2 		PaintTexCoord_yz;
varying vec2 		WeightTexCoord;
varying vec2 		HeightTexCoord;

varying vec3		VSOutViewDir;	// In world space
varying vec3		VSOutLightDir;	// In world space

#if defined(_SHADOW_ENABLE_) || defined(_FOG_ENABLE_) || defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)    
varying vec3		VSOutWorldPosition;
#endif
#ifdef _SHADOW_ENABLE_
varying vec4		VSOutScreenPosition;	// For shadow
#endif

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
	
	vec3 worldPos = (WorldMatrix * vec4(vertexAttrib.LocalPosition.x, vertexAttrib.LocalPosition.z, vertexAttrib.LocalPosition.y, 1.0)).xyz;
	
	//ViewDirWorld = ViewPositionWorld - worldPos.xyz;
	NormalWorld = vec3(vertexAttrib.LocalNormal.x, vertexAttrib.LocalNormal.z, vertexAttrib.LocalNormal.y);
	
	PaintTexCoord_yz = 0.3 * vertexAttrib.LocalPosition.zy;
	PaintTexCoord_xy = 0.3 * vertexAttrib.LocalPosition.xz;
	PaintTexCoord_xz = 0.3 * vertexAttrib.LocalPosition.xy;
	//PaintTexCoord *= 0.1f;
	WeightTexCoord = vertexAttrib.LocalPosition.xy * LandscapeParameters_WeightTextureUVScaleBias.xy + LandscapeParameters_WeightTextureUVScaleBias.zw + 0.5*LandscapeParameters_WeightTextureUVScaleBias.xy;
	HeightTexCoord = vertexAttrib.LocalPosition.xy * LandscapeParameters_HeightTextureUVScaleBias.xy + LandscapeParameters_HeightTextureUVScaleBias.zw + 0.5*LandscapeParameters_HeightTextureUVScaleBias.xy;
	
	outDebugColor = (vertexAttrib.LocalPosition.xy * LandscapeParameters_WeightTextureUVScaleBias.xy).xxx;
	
	VSOutViewDir = normalize(EyePos - worldPos.xyz);
	
	gl_Position = ViewProjMatrix* vec4(worldPos, 1.0);
	
#if defined(_SHADOW_ENABLE_) || defined(_FOG_ENABLE_) || defined(_POINT_LIGHT_) || defined(_SPOT_LIGHT_)    
	VSOutWorldPosition = worldPos;
#endif
#ifdef _SHADOW_ENABLE_
	VSOutScreenPosition = gl_Position;
#endif
#ifdef _DIRECTION_LIGHT_
    VSOutLightDir = LightDir;
#endif

#if defined (_POINT_LIGHT_) || defined(_SPOT_LIGHT_)
    VSOutLightDir = (g_PointLight_PosAndInvRadius.xyz - worldPos);
    VSOutLightDir = normalize(VSOutLightDir);
#endif 
}
