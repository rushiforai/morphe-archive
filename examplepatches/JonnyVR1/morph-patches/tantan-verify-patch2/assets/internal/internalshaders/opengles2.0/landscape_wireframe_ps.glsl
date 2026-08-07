//******************************************************************************

// @File         landscape_ps.glsl

// @Version       1.0

// @Created      2020, 1, 20

// @Description  This file is landscape_ps.glsl.

// @HISTORY:

//******************************************************************************/

/* Macros in this shader:
*/

#include "common_ps.glsl"


varying highp vec3 vBC;

uniform sampler2D HeightTexturePS;

/*float edgeFactor(){
        vec3 d = fwidth(vBC);
        vec3 a3 = smoothstep(vec3(0.0), d*1.5, vBC);
        return min(min(a3.x, a3.y), a3.z);
    }*/
varying highp vec4 Color;

void main(){

      // coloring by edge
     /* vec4 color;
      color.rgb = mix(vec3(0.0), vec3(0.5), edgeFactor());
      color.a = 1.0;
      FragColor = color;*/


        // aliased boolean decision
        
        if(any(lessThan(vBC, vec3(0.02)))){
            gl_FragColor = Color + vec4(1.0, 1.0, 1.0, 1.0);
        }
        else{
        //gl_FragColor = Color;
           discard;
        }
		
		//gl_FragColor = SampleDiffuseTexture(HeightTexturePS, uv);// texture2D(HeightTexturePS, uv);
		//gl_FragColor = Color;
         //FragColor = vec4(vBC, 1.0);
    }
