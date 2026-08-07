//******************************************************************************

// @File         ssao_ps.glsl

// @Version       1.0

// @Created      2018, 11, 12

// @Description

// @HISTORY:

//******************************************************************************/
precision highp float;

uniform sampler2D	DepthSampler;
uniform sampler2D	NormalSampler;

uniform vec4		InvTargetSizeAndTextureSize;
uniform vec4		CameraProjParam;
uniform float		KernelRadius;

varying vec2		VSOutScreenPos;
varying vec2		VSOutTexCoord;

vec3 samples[64];

float PseudoRandom(vec2 XY)
{
	return fract(sin(dot(XY, vec2(12.9898, 78.233))) * 43758.5453);
}

void main(void)
{
	samples[0] = vec3(0.0497709, -0.0447092, 0.0499634);
	samples[1] = vec3(0.0145746, 0.0165311, 0.00223862);
	samples[2] = vec3(-0.0406477, -0.0193748, 0.0319336);
	samples[3] = vec3(0.0137781, -0.091582, 0.0409242);
	samples[4] = vec3(0.055989, 0.0597915, 0.0576589);
	samples[5] = vec3(0.0922659, 0.0442787, 0.0154511);
	samples[6] = vec3(-0.00203926, -0.054402, 0.066735);
	samples[7] = vec3(-0.00033053, -0.000187337, 0.000369319);
	samples[8] = vec3(0.0500445, -0.0466499, 0.0253849);
	samples[9] = vec3(0.0381279, 0.0314015, 0.032868);
	samples[10] = vec3(-0.0318827, 0.0204588, 0.0225149);
	samples[11] = vec3(0.0557025, -0.0369742, 0.0544923);
	samples[12] = vec3(0.0573717, -0.0225403, 0.0755416);
	samples[13] = vec3(-0.0160901, -0.00376843, 0.0554733);
	samples[14] = vec3(-0.0250329, -0.024829, 0.0249512);
	samples[15] = vec3(-0.0336879, 0.0213913, 0.0254024);
	samples[16] = vec3(-0.0175298, 0.0143856, 0.00534829);
	samples[17] = vec3(0.0733586, 0.112052, 0.0110145);
	samples[18] = vec3(-0.0440559, -0.0902836, 0.083683);
	samples[19] = vec3(-0.0832772, -0.00168341, 0.0849867);
	samples[20] = vec3(-0.0104057, -0.0328669, 0.019273);
	samples[21] = vec3(0.00321131, -0.00488206, 0.00416381);
	samples[22] = vec3(-0.00738321, -0.0658346, 0.067398);
	samples[23] = vec3(0.0941413, -0.00799846, 0.14335);
	samples[24] = vec3(0.0768329, 0.126968, 0.106999);
	samples[25] = vec3(0.000392719, 0.000449695, 0.00030161);
	samples[26] = vec3(-0.104793, 0.0654448, 0.101737);
	samples[27] = vec3(-0.00445152, -0.119638, 0.161901);
	samples[28] = vec3(-0.0745526, 0.0344493, 0.224138);
	samples[29] = vec3(-0.0027583, 0.00307776, 0.00292255);
	samples[30] = vec3(-0.108512, 0.142337, 0.166435);
	samples[31] = vec3(0.046882, 0.103636, 0.0595757);
	samples[32] = vec3(0.134569, -0.0225121, 0.130514);
	samples[33] = vec3(-0.16449, -0.155644, 0.12454);
	samples[34] = vec3(-0.187666, -0.208834, 0.0577699);
	samples[35] = vec3(-0.043722, 0.0869255, 0.0747969);
	samples[36] = vec3(-0.00256364, -0.00200082, 0.00406967);
	samples[37] = vec3(-0.0966957, -0.182259, 0.299487);
	samples[38] = vec3(-0.225767, 0.316061, 0.089156);
	samples[39] = vec3(-0.0275051, 0.287187, 0.317177);
	samples[40] = vec3(0.207216, -0.270839, 0.110132);
	samples[41] = vec3(0.0549017, 0.104345, 0.323106);
	samples[42] = vec3(-0.13086, 0.119294, 0.280219);
	samples[43] = vec3(0.154035, -0.0653706, 0.229843);
	samples[44] = vec3(0.0529379, -0.227866, 0.148478);
	samples[45] = vec3(-0.187305, -0.0402247, 0.0159264);
	samples[46] = vec3(0.141843, 0.0471631, 0.134847);
	samples[47] = vec3(-0.0442676, 0.0556155, 0.0558594);
	samples[48] = vec3(-0.0235835, -0.0809697, 0.21913);
	samples[49] = vec3(-0.142147, 0.198069, 0.00519361);
	samples[50] = vec3(0.158646, 0.230457, 0.0437154);
	samples[51] = vec3(0.03004, 0.381832, 0.163825);
	samples[52] = vec3(0.083006, -0.309661, 0.0674131);
	samples[53] = vec3(0.226953, -0.23535, 0.193673);
	samples[54] = vec3(0.381287, 0.332041, 0.529492);
	samples[55] = vec3(-0.556272, 0.294715, 0.301101);
	samples[56] = vec3(0.42449, 0.00564689, 0.117578);
	samples[57] = vec3(0.3665, 0.00358836, 0.0857023);
	samples[58] = vec3(0.329018, 0.0308981, 0.178504);
	samples[59] = vec3(-0.0829377, 0.512848, 0.0565553);
	samples[60] = vec3(0.867363, -0.00273376, 0.100138);
	samples[61] = vec3(0.455745, -0.772006, 0.0038413);
	samples[62] = vec3(0.41729, -0.154846, 0.462514);
	samples[63] = vec3(-0.442722, -0.679282, 0.186503);

	// Reconstruct view space position
	float depth = texture2D(DepthSampler, VSOutTexCoord).x;
	if (depth == 1.0) { discard; }
	float viewZ = CameraProjParam.w / (2.0 * depth - 1.0 - CameraProjParam.z);
	float viewX = (VSOutScreenPos.x / CameraProjParam.x) * viewZ;
	float viewY = (VSOutScreenPos.y / CameraProjParam.y) * viewZ;
	vec3 viewPos = vec3(viewX, viewY, viewZ);

	// Fetch view space normal from texture
	vec3 viewNormal = texture2D(NormalSampler, VSOutTexCoord).xyz;
	viewNormal = 2.0 * viewNormal - 1.0;
	viewNormal = normalize(viewNormal);

	// Create TBN change-of-basis matrix: from tangent-space to view-space
	//vec3 randomVec = texture2D(texNoise, TexCoords * noiseScale).xyz;
	vec3 randomVec = vec3(PseudoRandom(VSOutScreenPos),
		PseudoRandom(VSOutScreenPos + vec2(-1.0 / InvTargetSizeAndTextureSize.x, 0.0)),
		PseudoRandom(VSOutScreenPos + vec2(1.0 / InvTargetSizeAndTextureSize.x, 0.0)));
	randomVec = normalize(randomVec);	
	vec3 tangent = normalize(randomVec - viewNormal * dot(randomVec, viewNormal));
	vec3 bitangent = cross(viewNormal, tangent);
	mat3 TBN = mat3(tangent, bitangent, viewNormal);

	// Iterate over the sample kernel and calculate occlusion factor
	float occlusion = 0.0;
	for (int i = 0; i < 64; ++i)
	{
		// get sample position
		vec3 sample = TBN * samples[i]; // From tangent to view-space
		sample = viewPos + sample * KernelRadius;

		// project sample position (to sample texture) (to get position on screen/texture)
		vec4 offset;
		//offset = projection * offset; // from view to clip-space
		offset.x = sample.x * CameraProjParam.x;
		offset.y = sample.y * CameraProjParam.y;
		offset.z = sample.z * CameraProjParam.z + CameraProjParam.w;
		offset.w = sample.z;
		offset.xyz /= offset.w; // perspective divide
		offset.xyz = offset.xyz * 0.5 + 0.5; // transform to range 0.0 - 1.0

		// get sample depth
		float sampleDepth = texture2D(DepthSampler, offset.xy).x; // Get depth value of kernel sample
		float sampleViewZ = CameraProjParam.w / (2.0 * sampleDepth - 1.0 - CameraProjParam.z);

		// range check & accumulate
		float rangeCheck = smoothstep(0.0, 1.0, KernelRadius / abs(viewZ - sampleViewZ));
		occlusion += (sampleViewZ < sample.z ? 1.0 : 0.0) * rangeCheck;
	}
	occlusion = 1.0 - (occlusion / 64.0);

	gl_FragColor = vec4(occlusion, occlusion, occlusion, 1.0);
}