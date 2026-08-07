precision highp float;
uniform vec4 Coeffs[9];
uniform float Number;
uniform sampler2D InputTextureSampler;
uniform sampler2D InputTextureSampler_1;//original input
varying vec4 VSOutTexCoord;
varying vec4		VSOutScreenSpacePointsPos0;
varying vec4		VSOutScreenSpacePointsPos1;
varying vec4		VSOutScreenSpacePointsPos2;
varying vec4		VSOutScreenSpacePointsPos3;
void main() 
{
    vec2 Texcoord = VSOutTexCoord.xy;
    int index = int(Number + 0.01);
    for(int i = 0; i < index; ++i)
    {
        int n1 = i / 2;
        int n2 = 2 * int(mod(float(i), 2.0));
        vec2 D;
        if(n1 == 0)
        {
            D.x = VSOutScreenSpacePointsPos0[n2];
            D.y = VSOutScreenSpacePointsPos0[n2 + 1];
        }
        else if(n1 == 1)
        {
            D.x = VSOutScreenSpacePointsPos1[n2];
            D.y = VSOutScreenSpacePointsPos1[n2 + 1];
        }
        else if(n1 == 2)
        {
            D.x = VSOutScreenSpacePointsPos2[n2];
            D.y = VSOutScreenSpacePointsPos2[n2 + 1];
        }
        else if(n1 == 3)
        {
            D.x = VSOutScreenSpacePointsPos3[n2];
            D.y = VSOutScreenSpacePointsPos3[n2 + 1];
        }
        float _2993 = dot(D, D);
        vec2 _3433 = (VSOutTexCoord.xy - Coeffs[i].xy) * 
        (
            (pow(clamp(_2993 / Coeffs[i].w, 0.00078125, 1.0), Coeffs[i].z) - 1.0) * step(_2993, Coeffs[i].w)    // 这里是剔除
        );
        Texcoord = Texcoord + _3433;
    }
    
    Texcoord = ((Texcoord * 0.5) + vec2(0.5));
    Texcoord = Texcoord + VSOutTexCoord.zw;
#ifndef GLTEXTURE_FLIP_Y
	Texcoord.y = 1.0 - Texcoord.y;
#endif 
    gl_FragColor = texture2D(InputTextureSampler, Texcoord);
}