//******************************************************************************

// @File         postprocess_copy_ps.glsl

// @Version       1.0

// @Created      2018, 6, 7

// @Description

// @HISTORY:

//******************************************************************************/
precision highp float;

uniform highp vec4		InvTargetSizeAndTextureSize;
uniform sampler2D		SourceTexture;

varying highp vec2		VSOutTexCoord;

float GaussianKernel[9];

void main(void)
{
	GaussianKernel[0] = 0.0625;
	GaussianKernel[1] = 0.125;
	GaussianKernel[2] = 0.0625;
	GaussianKernel[3] = 0.125;
	GaussianKernel[4] = 0.25;
	GaussianKernel[5] = 0.125;
	GaussianKernel[6] = 0.0625;
	GaussianKernel[7] = 0.125;
	GaussianKernel[8] = 0.0625;

	vec4 FilteredColor = vec4(0.0, 0.0, 0.0, 0.0);
	for (int M = -1; M <= 1; M++)
	{
		for (int N = -1; N <= 1; N++)
		{
			vec2 TexCoord = VSOutTexCoord + vec2(InvTargetSizeAndTextureSize.z * float(M), InvTargetSizeAndTextureSize.w * float(N));
			vec4 TexelColor = texture2D(SourceTexture, TexCoord);
			FilteredColor += TexelColor * GaussianKernel[(M + 1) * 3 + (N + 1)];
			//FilteredColor += TexelColor * (1.0 / 9.0);
		}
	}

	gl_FragColor = FilteredColor;
}