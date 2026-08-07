attribute vec3		Position0;
attribute vec2		Texcoord0;
varying   vec2		VSOutTexCoord;

#define MAX_LIQUEFY_COUNT 9
uniform vec3        CameraPos;
uniform mat4        ViewProjectionMatrixInverse;
uniform mat4        PointsMatrixInverse[MAX_LIQUEFY_COUNT];
uniform float       liquefyCount;
uniform float       FaceDetected;
varying vec4		VSOutScreenSpacePointsPos0;
varying vec4		VSOutScreenSpacePointsPos1;
varying vec4		VSOutScreenSpacePointsPos2;
varying vec4		VSOutScreenSpacePointsPos3;

void main(void)
{
	gl_Position = vec4(Position0.xy, 0.0, 1.0);
	VSOutTexCoord.xy = Position0.xy;
	if(FaceDetected > 0.){
		vec4 _3920 = vec4(Position0.xy, -1.0, 1.0);
		vec4 _2994 = ViewProjectionMatrixInverse * _3920;
		vec3 _3000 = _2994.xyz / vec3(_2994.w);
		vec4 _3878 = vec4(_3000, 1.0);

		int index = int(liquefyCount + 0.01);
		for(int i = 0; i < index; ++i)
		{
			vec4 _3228 = PointsMatrixInverse[i] * _3878;
			vec4 _3922 = PointsMatrixInverse[i] * vec4(CameraPos, 1.0);
			vec3 _3921 = normalize(_3228.xyz - _3922.xyz);
			float _3923;
			if (_3921.z != 0.0)
			{
				_3923 = (-_3922.z)/_3921.z;
			}
			else
			{
				_3923 = 10000.0;
			}
			float _3926;
			if (_3923 < 0.0)
			{
				_3926 = 10000.0;
			}
			else
			{
				_3926 = _3923;
			}
			vec2 ans = 200.0 * (_3922.xy + (_3921.xy * _3926));
			int n1 = i / 2;
			int n2 = 2 * int(mod(float(i), 2.0));
			if(n1 == 0)
			{
				VSOutScreenSpacePointsPos0[n2] = ans.x;
				VSOutScreenSpacePointsPos0[n2 + 1] = ans.y; 
			}
			else if(n1 == 1)
			{
				VSOutScreenSpacePointsPos1[n2] = ans.x;
				VSOutScreenSpacePointsPos1[n2 + 1] = ans.y; 
			}
			else if(n1 == 2)
			{
				VSOutScreenSpacePointsPos2[n2] = ans.x;
				VSOutScreenSpacePointsPos2[n2 + 1] = ans.y; 
			}
			else if(n1 == 3)
			{
				VSOutScreenSpacePointsPos3[n2] = ans.x;
				VSOutScreenSpacePointsPos3[n2 + 1] = ans.y; 
			}
		}
	}
}