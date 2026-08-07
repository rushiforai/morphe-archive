precision highp float;
uniform sampler2D InputTextureSampler;
varying vec2 VSOutTexCoord;
varying vec4 VSOutScreenSpacePointsPos0;
varying vec4 VSOutScreenSpacePointsPos1;
varying vec4 VSOutScreenSpacePointsPos2;
varying vec4 VSOutScreenSpacePointsPos3;


#define MAX_LIQUEFY_COUNT 9
#define COEFF_GROUPS 8
uniform float Coefficients[COEFF_GROUPS * MAX_LIQUEFY_COUNT];//center.xy, scale.xy, intensity.xy, radius, radiuscoeff
uniform float liquefyCount;
uniform float FaceDetected;
uniform vec2  ViewportSize;

vec2 UserToNDC(vec2 v)
{
	return vec2(2.0 * v.x - 1.0, 1.0 - 2.0 * v.y);
}

void main() {
    vec2 Texcoord = VSOutTexCoord.xy;
    if(FaceDetected > 0.){
        int index = int(liquefyCount + 0.01);
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

            vec2 intensity = vec2(Coefficients[i * COEFF_GROUPS + 4], Coefficients[i * COEFF_GROUPS + 5]);
            float radius = Coefficients[i * COEFF_GROUPS + 6];//in the space of viewport-size
            float radiusCoeff = Coefficients[i * COEFF_GROUPS + 7];

            vec2 faceCenter   = vec2(Coefficients[i * COEFF_GROUPS], Coefficients[i * COEFF_GROUPS + 1]);//uv
            faceCenter = UserToNDC(faceCenter);//ndc
            float squreRadius = radius * radius;

            vec2 _3433 = (VSOutTexCoord.xy - faceCenter) * vec2(
                (pow(clamp(_2993 / squreRadius, 0.00078125, 1.0), intensity.x) - 1.0) * step(_2993, squreRadius),   // 这里是剔除
                (pow(clamp(_2993 / squreRadius, 0.00078125, 1.0), intensity.y) - 1.0) * step(_2993, squreRadius)    // 这里是剔除
            );
            Texcoord = Texcoord + _3433;
        }
    }
    Texcoord = ((Texcoord * 0.5) + vec2(0.5));
#ifndef GLTEXTURE_FLIP_Y
	Texcoord.y = 1.0 - Texcoord.y;
#endif 
    gl_FragColor = texture2D(InputTextureSampler, Texcoord);
}