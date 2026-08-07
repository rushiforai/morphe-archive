//******************************************************************************

// @File         model_ps.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is model_vs.glsl.

// @HISTORY:

//******************************************************************************/


#include "common_ps.glsl"


/* Macros in this shader:
_ALPHATEST_
NORMAL_ENABLE
*/

//-----------------------------------------------------------------
// Parameter
//-----------------------------------------------------------------
uniform highp float		g_smoothNess;

//Textures
uniform sampler2D		g_DiffuseSampler;
uniform sampler2D		g_NormalSampler;

//Varyings
varying highp vec2		VSOutTexcoord0;
varying highp vec3		VSOutNormal0;
varying highp vec3		VSOutTangent;
varying highp vec3		VSOutBinormal;

void main(void)
{
	// ¼ÆËãUV×ø±ê
	highp vec2 Texcoord0 = VSOutTexcoord0;

	// Normal
#ifdef NORMAL_ENABLE
	highp vec3 normal = glb_SamplerNormalMap(g_NormalSampler, Texcoord0, g_smoothNess);
#else
	highp vec3 normal = vec3(0.0, 0.0, 1.0);
#endif
	if (!gl_FrontFacing)
		normal = -normal;

	// Sample the diffuse texture.
	highp vec4 colBaseTex = SampleDiffuseTexture(g_DiffuseSampler, Texcoord0);

#ifdef _ALPHATEST_
	if (colBaseTex.a < 0.5)
		discard;
#endif // #ifdef _ALPHATEST_

	highp mat3 matTangentToView;
	matTangentToView[0] = normalize(VSOutTangent.xyz);
	matTangentToView[1] = normalize(VSOutBinormal.xyz);
	matTangentToView[2] = normalize(VSOutNormal0.xyz);
	highp vec3 ViewNormal = normalize(matTangentToView * normal);
	highp vec3 PackedViewNormal = ViewNormal * 0.5 + 0.5;
  
	gl_FragColor = vec4(PackedViewNormal.xyz, 1.0);
}
