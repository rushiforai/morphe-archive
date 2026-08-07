//******************************************************************************

// @File         2d_vs.glsl

// @Version      1.0

// @Description  used for 2d element such as ui etc.

// @HISTORY:

//******************************************************************************/

attribute vec3		Position0;
attribute vec2		Texcoord0;

uniform  mat4		WorldViewProjMatrix;

varying  vec2		VSOutTexcoord0;
varying  vec4		VSOutScreenPosition;
varying  vec2		VSOutTexcoordMask;

uniform  vec2 		g_maskSize;
uniform	 mat4 		g_warpMat;
uniform  vec2       ViewportSize;

void main(void)
{
	VSOutTexcoord0 = Texcoord0;
	gl_Position = WorldViewProjMatrix * vec4(Position0, 1.0);
    VSOutScreenPosition = gl_Position;

    vec2 orgTexCoordinate = vec2(VSOutTexcoord0.x * ViewportSize.x, VSOutTexcoord0.y * ViewportSize.y);
    vec2 segmaskCoord =  (g_warpMat * vec4(orgTexCoordinate.x, orgTexCoordinate.y, 1.0, 0.0)).xy;
    VSOutTexcoordMask = vec2(segmaskCoord.x / g_maskSize.x, segmaskCoord.y / g_maskSize.y);

}

