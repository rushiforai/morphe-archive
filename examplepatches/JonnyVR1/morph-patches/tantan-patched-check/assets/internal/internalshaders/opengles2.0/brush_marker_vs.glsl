//******************************************************************************

// @File         brush_ribbon_Vs.glsl

// @Version      1.0

// @Created      

// @Description  

// @HISTORY:

//******************************************************************************/
attribute		vec3		Position0;
attribute		vec2		Texcoord0;
attribute		vec4		Color0;

uniform			mat4		WorldViewProjMatrix;

varying			vec4		VSOutColor0;
varying			vec2		VSOutTexcoord0;

void main(void)
{
	gl_Position = WorldViewProjMatrix * vec4(Position0, 1.0);
	VSOutColor0 = Color0.rgba;
	VSOutTexcoord0 = Texcoord0;
}


