//******************************************************************************

// @File         particle_vs.glsl

//******************************************************************************/
attribute  vec3	Position0;
attribute  vec4	Color0;
attribute  vec2 Texcoord0;

uniform mat4		WorldViewProjMatrix;

varying  vec4		VSOutColor0;
varying  vec2		VSOutTexcoord0;
#ifdef _FOG_ENABLE_
varying  vec3		VSOutWorldPosition;	
#endif

void main(void)
{
	gl_Position = WorldViewProjMatrix * vec4(Position0, 1.0);
	VSOutColor0 = Color0.rgba; 	
	VSOutTexcoord0 = Texcoord0;
	
#ifdef _FOG_ENABLE_
	VSOutWorldPosition = Position0;
#endif
}


