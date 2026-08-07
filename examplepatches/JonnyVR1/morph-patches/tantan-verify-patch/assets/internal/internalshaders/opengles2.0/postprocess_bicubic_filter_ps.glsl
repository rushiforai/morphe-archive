//******************************************************************************

// @File         postprocess_copy_ps.glsl

// @Version       1.0

// @Created      2018, 6, 7

// @Description

// @HISTORY:

//******************************************************************************/
precision highp float;

uniform highp vec4		PosScaleBias;
uniform highp vec4		UVScaleBias;
uniform highp vec4		InvTargetSizeAndTextureSize;
uniform sampler2D		SourceTexture;

varying highp vec2		VSOutTexCoord;

float Triangular(float F)
{
	F = F / 2.0;
	if (F < 0.0)
	{
		return (F + 1.0);
	}
	else
	{
		return (1.0 - F);
	}
	return 0.0;
}

vec4 BicubicFilter(sampler2D Tex, vec2 TexCoord, vec2 TexSize, vec2 TexelSize)
{

	vec4 Sum = vec4(0.0);
	vec4 Denom = vec4(0.0);
	float TexPosX = TexCoord.x * TexSize.x;
	float TexPosY = TexCoord.y * TexSize.y;
	float A = TexPosX - float(int(TexPosX)); // get the decimal part
	float B = TexPosY - float(int(TexPosY)); // get the decimal part

	int X = int(TexCoord.x * TexSize.x);
	int Y = int(TexCoord.y * TexSize.y);
	vec2 TexCoord1 = vec2(float(X) / TexSize.x + 0.5 / TexSize.x,
		float(Y) / TexSize.y + 0.5 / TexSize.y);

	for (int M = -1; M <= 2; M++)
	{
		for (int N = -1; N <= 2; N++)
		{
			vec2 TexCoord2 = TexCoord1 + vec2(TexelSize.x * float(M), TexelSize.y * float(N));
			TexCoord2 = clamp(TexCoord2, UVScaleBias.zw * InvTargetSizeAndTextureSize.zw, (UVScaleBias.xy + UVScaleBias.zw) * InvTargetSizeAndTextureSize.zw);
			vec4 vecData = texture2D(Tex, TexCoord2);
			float F = Triangular(float(M) - A);

			vec4 vecCooef1 = vec4(F, F, F, F);
			float F1 = Triangular(-(float(N) - B));
			vec4 vecCoeef2 = vec4(F1, F1, F1, F1);

			Sum = Sum + (vecData * vecCoeef2 * vecCooef1);
			Denom = Denom + ((vecCoeef2 * vecCooef1));
		}
	}
	return Sum / Denom;
}

void main(void)
{
	vec2 TexSize = 1.0 / InvTargetSizeAndTextureSize.zw;
	vec4 Color = BicubicFilter(SourceTexture, VSOutTexCoord, TexSize, InvTargetSizeAndTextureSize.zw);
	gl_FragColor = Color;
}