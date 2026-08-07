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
uniform 	highp float BrushLength;
uniform		sampler2D	DiffuseTexture;

highp float rand(highp vec2 n) { 
    return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

highp float noise(highp vec2 p){
    highp vec2 ip = floor(p);
    highp vec2 u = fract(p);
    u = u*u*(3.0-2.0*u);

    highp float res = mix(
        mix(rand(ip),rand(ip+vec2(1.0,0.0)),u.x),
        mix(rand(ip+vec2(0.0,1.0)),rand(ip+vec2(1.0,1.0)),u.x),u.y);
    return res*res;
}

void main(void)
{
	highp float n = noise(2.0 * vec2(5.0 * VSOutTexcoord0.x, 100.0 * VSOutTexcoord0.y));	
	highp float alpha = n + (1.0 - 2.0 * abs(VSOutTexcoord0.x - 0.5));
	if(alpha < 0.333)
	{
		discard;
	}
	highp vec4 color = VSOutColor0 + 0.3 * vec4(n, n, n, 1.0);
	gl_FragColor = color;
}
