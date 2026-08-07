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

attribute vec3		Position0;
attribute vec3		Normal0;
attribute vec2		Texcoord0;

uniform mat4 WorldMatrix;
uniform mat4 ViewProjMatrix;
uniform float Time;
uniform	float WindIntensity;
uniform float WindWeight;
uniform float WindSpeed;

uniform sampler2D GrassWPOTexture;

varying vec3 VertexWorldPosition;
varying vec2 v_UV;

vec3 RotateAboutAxis(vec4 NormalizedRotationAxisAndAngle, vec3 PositionOnAxis, vec3 Position)
{

	vec3 ClosestPointOnAxis = PositionOnAxis + NormalizedRotationAxisAndAngle.xyz * dot(NormalizedRotationAxisAndAngle.xyz, Position - PositionOnAxis);

	vec3 UAxis = Position - ClosestPointOnAxis;
	vec3 VAxis = cross(NormalizedRotationAxisAndAngle.xyz, UAxis);
	float CosAngle = sin(NormalizedRotationAxisAndAngle.w);
	float SinAngle = cos(NormalizedRotationAxisAndAngle.w);

	vec3 R = UAxis * CosAngle + VAxis * SinAngle;

	vec3 RotatedPosition = ClosestPointOnAxis + R;

	return RotatedPosition - Position;
}

vec3 SimpleGrassWindVertOffset(vec3 WorldPos, float WindIntensity, float WindWeight, float WindSpeed, vec3 AdditionalWorldPositionOffset)
{
	vec4 v1 = vec4(1.0, 0.0, 0.0, 1.0);
	vec3 RotateAxis = normalize(v1.xyz);
	RotateAxis = cross(RotateAxis, vec3(0.0, 1.0, 0.0));
	
	vec3 SpeedMulTime = fract(WindSpeed * Time * -0.5 * v1.a * normalize(v1.xyz) + WorldPos / 10.0 + vec3(0.5));
	
	vec3 RotateV1 = abs(SpeedMulTime * 2.0 - 1.0);
	RotateV1 = (vec3(3.0) - 2.0 * RotateV1) * RotateV1 * RotateV1;
	
	vec3 RotateV2 = normalize(v1.xyz);
	vec3 temp = vec3(WindSpeed * Time * -0.5 * v1.a + WorldPos / 0.8 + 0.5);
	temp = temp - floor(temp);
	temp = abs(2.0 * temp - 1.0);
	temp = (3.0 - 2.0 * temp) * temp * temp;
	float dis = distance(temp, vec3(0.0));
	float RotateAngle = dot(RotateV1, RotateV2) + dis;
   
    vec3 PivotPoint = vec3(0.0, -5.0, 0.0) + AdditionalWorldPositionOffset;
    
    vec3 Offset = RotateAboutAxis(vec4(RotateAxis, RotateAngle), PivotPoint, AdditionalWorldPositionOffset.xyz);
    
    Offset = Offset * WindWeight * WindIntensity + AdditionalWorldPositionOffset;
    
    return Offset;
}

void main()
{
	v_UV = Texcoord0;
	
	vec3 WorldPos = Position0;
	vec3 AdditionalWorldPositionOffset = texture2D(GrassWPOTexture, Texcoord0).xyz;
	vec3 VertOffset = SimpleGrassWindVertOffset(WorldPos, WindIntensity, WindWeight, WindSpeed, AdditionalWorldPositionOffset);
	gl_Position =ViewProjMatrix * vec4(Position0 + VertOffset / 100.0, 1.0);
}
