//uniform sampler2D MaterialParam_IrisHeightTexture;
uniform sampler2D MaterialParam_ScleraBaseColorTexture;
//uniform sampler2D MaterialParam_ScleraNormalTexture;
//uniform sampler2D MaterialParam_TilingNoiseTexture;
uniform sampler2D MaterialParam_EyeMidPlaneDisplacementTexture;
uniform sampler2D MaterialParam_VeinsColorTexture;
uniform sampler2D MaterialParam_EyeNTexture;
uniform sampler2D MaterialParam_EyeMaskTexture;
uniform sampler2D MaterialParam_ScleraTintPicker;
uniform sampler2D MaterialParam_IrisColorPicker;

// Iris
//uniform vec4 MaterialParam_CloudyIrisColor;
//uniform vec4 MaterialParam_IrisBleedTint;
//uniform vec4 MaterialParam_IrisParamGroup_0; // PupilScale, CloudyIrisHardness, CloudyIrisRadius, ScaleIrisWithinMask
uniform vec4 MaterialParam_IrisParamGroup_0; // PupilScale, IrisUVRadius, RefractionDepthScale
//uniform vec4 MaterialParam_IrisParamGroup_1; // DistortPanX, DistortPanY, DistortScale, DistortStrength
//uniform vec4 MaterialParam_IrisParamGroup_2; // IrisConcavityPower, IrisConcavityScale, IrisBleedWidth, IrisBorderWidth
uniform vec4 MaterialParam_IrisParamGroup_3; // IrisBrightness, IrisSaturation, IrisRoughness, IrisSpecularity
//uniform vec4 MaterialParam_IrisParamGroup_4; // IrisMaskWidth, IrisUVRadius, PupilShiftX, PupilShiftY

// IrisGenerator
uniform vec4 MaterialParam_IrisGeneratorParamGroup_0; // IrisColor1U, IrisColor1V, IrisColor2U, IrisColor2V
uniform vec4 MaterialParam_IrisGeneratorParamGroup_1; // IrisColorBalance, IrisColorBalanceSmoothness, limbusDarkAmount, RadialStructuralBlendSwitch
uniform vec4 MaterialParam_IrisGeneratorParamGroup_2; // IrisColorHueVariation, IrisColorValueVariation, IrisSaturationVariation, AOinIris

// Refraction
//uniform vec4 MaterialParam_RefractionParamGroup_0; // IoR, POMCutoff, POMHeightRatio, POMReferencePlane
//uniform vec4 MaterialParam_RefractionParamGroup_1; // POMStepsMax, POMStepsMin, RefractionDepthScale

// Sclera
//uniform vec4 MaterialParam_ScleraCornerDarkColor;
//uniform vec4 MaterialParam_ScleraParamGroup_0; // FlattenNormal, ScleraBrightness, ScleraCornerDarkHardness, ScleraCornerDarkRadius
uniform vec4 MaterialParam_ScleraParamGroup_0; // FlattenNormal, ScleraBrightness, ScleraRoughness, ScleraSpecularity
//uniform vec4 MaterialParam_ScleraParamGroup_1; // ScleraPower, ScleraRotate, ScleraRoughness, ScleraSpecularity
uniform vec4 MaterialParam_ScleraParamGroup_1; // ScleraTintU, ScleraTintV, ScleraPower, VeinsPower
//uniform vec4 MaterialParam_ScleraParamGroup_2; // ScleraTintU, ScleraTintV, VeinsPower, VeinsRotate


// Local functions.
vec3 LocalFunc_UnpackNormalMap(sampler2D normalTex, in vec2 texcoord)
{
    vec3 bump = texture(normalTex, texcoord).rgb;
    bump.xy = -1.0 + 2.0 * bump.xy;
    bump.y = -bump.y;
    bump.z = sqrt(clamp(1.0 - dot(bump.xy, bump.xy), 0.0, 1.0));  
    return bump;
}

float LocalFunc_PositiveClampedPow(float X, float Y)
{
    return pow(max(X, 0.0), Y);
}

vec3 LocalFunc_PositiveClampedPow(vec3 X, float Y)
{
    return pow(max(X, vec3(0.0)), vec3(Y));
}

vec3 LocalFunc_sRGBToLiner(vec3 sRGB)
{
	return (sRGB.r < 0.04045 && sRGB.g < 0.04045 && sRGB.b < 0.04045) ? sRGB.rgb / 12.92 : pow((sRGB.rgb + 0.055) / 1.055, vec3(2.4)) ;
}

vec4 LocalFunc_TextureLookUp(sampler2D tex, vec2 uv, bool sRGB)
{
	vec4 res = texture(tex, uv);
	if (sRGB)
	{
		res.rgb = LocalFunc_sRGBToLiner(res.rgb);
	}
	return res;
}

vec3 GenerateIris(vec2 UV, vec4 EyeMask)
{
    //uniform vec4 MaterialParam_IrisGeneratorParamGroup_0; // IrisColor1U, IrisColor1V, IrisColor2U, IrisColor2V
    //uniform vec4 MaterialParam_IrisGeneratorParamGroup_2; // IrisColorHueVariation, IrisColorValueVariation, IrisSaturationVariation, AOinIris
    //uniform vec4 MaterialParam_IrisGeneratorParamGroup_1; // IrisColorBalance, IrisColorBalanceSmoothness, limbusDarkAmount, RadialStructuralBlendSwitch
    vec4 Local175 = LocalFunc_TextureLookUp(MaterialParam_IrisColorPicker, vec2(MaterialParam_IrisGeneratorParamGroup_0.x + MaterialParam_IrisGeneratorParamGroup_2.x, MaterialParam_IrisGeneratorParamGroup_0.y - MaterialParam_IrisGeneratorParamGroup_2.y), true);
    vec4 Local178 = LocalFunc_TextureLookUp(MaterialParam_IrisColorPicker, vec2(MaterialParam_IrisGeneratorParamGroup_0.x, MaterialParam_IrisGeneratorParamGroup_0.y), true);
    float Local183 = (EyeMask.r * 2.00000000);
    float Local184 = clamp(Local183, 0.0, 1.0);
    vec3 Local185 = mix(Local175.rgb,Local178.rgb,Local184);
    vec4 Local187 = LocalFunc_TextureLookUp(MaterialParam_IrisColorPicker, vec2(MaterialParam_IrisGeneratorParamGroup_0.x - MaterialParam_IrisGeneratorParamGroup_2.x, MaterialParam_IrisGeneratorParamGroup_0.y + MaterialParam_IrisGeneratorParamGroup_2.y), true);
    float Local189 = (Local183 - 1.00000000);
    float Local190 = clamp(Local189, 0.0, 1.0);
    vec3 Local191 = mix(Local185,Local187.rgb,Local190);
    float Local192 = dot(Local191, vec3(0.30000001,0.58999997,0.11000000));
    float Local193 = mix(-1.00000000,1.00000000,EyeMask.r);
    float Local194 = (Local193 * MaterialParam_IrisGeneratorParamGroup_2.z);
    vec3 Local195 = mix(Local191,vec3(Local192,Local192,Local192),Local194);

    vec4 Local197 = LocalFunc_TextureLookUp(MaterialParam_IrisColorPicker, vec2(MaterialParam_IrisGeneratorParamGroup_0.z + MaterialParam_IrisGeneratorParamGroup_2.x, MaterialParam_IrisGeneratorParamGroup_0.w - MaterialParam_IrisGeneratorParamGroup_2.y), true);
    vec4 Local200 = LocalFunc_TextureLookUp(MaterialParam_IrisColorPicker, vec2(MaterialParam_IrisGeneratorParamGroup_0.z, MaterialParam_IrisGeneratorParamGroup_0.w), true);
    vec3 Local202 = mix(Local197.rgb,Local200.rgb,Local184);
    vec4 Local204 = LocalFunc_TextureLookUp(MaterialParam_IrisColorPicker, vec2(MaterialParam_IrisGeneratorParamGroup_0.z - MaterialParam_IrisGeneratorParamGroup_2.x, MaterialParam_IrisGeneratorParamGroup_0.w + MaterialParam_IrisGeneratorParamGroup_2.y), true);
    vec3 Local206 = mix(Local202,Local204.rgb,Local190);
    float Local207 = dot(Local206, vec3(0.30000001,0.58999997,0.11000000));
    vec3 Local208 = mix(Local206,vec3(Local207,Local207,Local207),Local194);
    float Local209 = (1.00000000 - EyeMask.b);
    float ColorMin = MaterialParam_IrisGeneratorParamGroup_1.x - MaterialParam_IrisGeneratorParamGroup_1.y;
    float ColorMax = MaterialParam_IrisGeneratorParamGroup_1.x + MaterialParam_IrisGeneratorParamGroup_1.y;
    float Local210 = smoothstep(ColorMin, ColorMax, Local209);
    vec3 Local211 = mix(Local195,Local208,Local210);
    float Local212 = (1.00000000 - EyeMask.r);
    float Local213 = smoothstep(ColorMin,ColorMax,Local212);
    vec3 Local214 = mix(Local195,Local208,Local213);
    vec3 Local215 = mix(Local211,Local214,MaterialParam_IrisGeneratorParamGroup_1.w);
    vec3 Local216 = (Local215 * EyeMask.a);
    vec3 Local217 = (Local216 * EyeMask.g);
    vec3 Local218 = mix(Local216,Local217,MaterialParam_IrisGeneratorParamGroup_2.w);
    vec3 Local219 = LocalFunc_PositiveClampedPow(Local218, MaterialParam_IrisGeneratorParamGroup_1.z + 1.0);
    vec2 Local220 = (UV + vec2(-0.5, -0.5));
    vec2 Local221 = (Local220 - 0.00000000);
    float Local222 = dot(Local221, Local221);
    float Local223 = sqrt(Local222);
    float Local224 = smoothstep(0.27500001,0.50000000,Local223);
    vec3 Local225 = mix(Local218,Local219,Local224);

    return Local225;
}

// Calculate iris mask.
vec3 CustomExpression0(float IrisUVRadius, vec2 UV, vec3 LimbusUVWidth)
{
	// Iris Mask with Limbus Ring falloff
	UV = UV - vec2(0.5f, 0.5f);

	vec3 m, r;
	r = (vec3(length(UV)) - (vec3(IrisUVRadius) - LimbusUVWidth)) / LimbusUVWidth;
	m = clamp(vec3(1.0) - r, 0.0, 1.0);
	m = smoothstep(vec3(0.0), vec3(1.0), m);
	return m;
}

// Refraction.
vec3 CustomExpression1(float internalIoR, vec3 normalW, vec3 cameraW)
{
	float airIoR = 1.00029;
	float n = airIoR / internalIoR;
	float facing = dot(normalW, cameraW);
	float w = n * facing;
	float k = sqrt(1.0 + (w - n) * (w + n));

	vec3 t;
	t = (w - k) * normalW - n * cameraW;
	t = normalize(t);
	return -t;
}

// Scale pupils.
//vec2 CustomExpression2(vec2 UV, float PupilScale, float PupilShiftX, float PupilShiftY)
vec2 CustomExpression2(vec2 UV, float PupilScale)
{
	// Scale UVs from from unit circle in or out from center
	// float2 UV, float PupilScale

	//float UVlength = length(UV - vec2(0.5f, 0.5f));
	//float ShiftMask = pow(clamp(2.0 * ( (UVlength - 0.45f ) / -0.5f), 0.0, 1.0), 0.7);
	//PupilShiftX *= ShiftMask * (-0.1f);
	//PupilShiftY *= ShiftMask * (0.1f);
	//vec2 UVshifted = UV + vec2(PupilShiftX, PupilShiftY);
	//vec2 UVcentered = UVshifted - vec2(0.5f, 0.5f);
	//UVlength = length(UVcentered);
	// UV on circle at distance 0.5 from the center, in direction of original UV
	//vec2 UVmax = normalize(UVcentered) * 0.5f;
	//vec2 UVscaled = mix(UVmax, vec2(0.0f, 0.0f), clamp((1.0f - UVlength * 2.0f) * PupilScale, 0.0, 1.0)) + vec2(0.5f, 0.5f);
    
    vec2 UVcentered = UV - vec2(0.5f, 0.5f);
    float UVlength = length(UVcentered);
    // UV on circle at distance 0.5 from the center, in direction of original UV
    vec2 UVmax = normalize(UVcentered) * 0.5f;
    vec2 UVscaled = mix(UVmax, vec2(0.0f, 0.0f), clamp((1.0f - UVlength * 2.0f) * PupilScale, 0.0, 1.0)) + vec2(0.5f, 0.5f);

	return UVscaled;
}

// Parallax only mapping.
//vec4 CustomExpression3(sampler2D Tex, vec2 UV, float MaxSteps, float stepsize, vec2 UVDist, vec2 InDDX, vec2 InDDY, vec4 HeightMapChannel)
//{
//	float rayheight = 1.0;
//	float oldray = 1.0;
//	vec2 offset = vec2(0.0);
//	float oldtex = 1.0;
//	float texatray;
//	float yintersect;
//	int i = 0;
//
//	while (i < (int(MaxSteps) + 2))
//	{
//		texatray = dot(HeightMapChannel, textureGrad(Tex, UV+offset, InDDX, InDDY));
//
//		if (rayheight < texatray)
//		{
//			float xintersect = (oldray - oldtex) + (texatray - rayheight);
//			xintersect = (texatray - rayheight) / xintersect;
//			yintersect = (oldray * (xintersect)) + (rayheight * (1.0 - xintersect));
//			offset -= (xintersect * UVDist);
//			break;
//		}
//
//		oldray = rayheight;
//		rayheight -= stepsize;
//		offset += UVDist;
//		oldtex = texatray;
//
//		i++;
//	}
//
//	vec4 output1;
//	output1.xy = offset;
//	output1.z = yintersect;
//	output1.w = 1.0;
//	return output1; 
//}


// Material virtual user functions.
vec3 UserFunc_GetWorldPositionOffset(Stru_VertexParam VertexParameters)
{
	return vec3(0.0, 0.0, 0.0);
}

struct Stru_SharedVariables
{
    vec3 BaseColor;
    float Specular;
    float Roughness;
    vec3 Normal;
	vec3 TangentOutput;
	float IrisMask;
	float IrisDistance;
};

// TangentNormal, WorldNormal and ReflectionVector in PixelParameters are invalid.
void UserFunc_GetSharedVariables(Stru_PixelParam PixelParameters, inout Stru_SharedVariables SharedVariables)
{
	// EyeMidPlaneDisplacement
    vec4 Local1 = LocalFunc_TextureLookUp(MaterialParam_EyeMidPlaneDisplacementTexture, PixelParameters.TexCoord0.xy, false);
    Local1.a = LocalFunc_TextureLookUp(MaterialParam_EyeNTexture, PixelParameters.TexCoord0.xy, false).a; // Store mask to alpha channel of N texture.
    
	// TexCoord for sclera color and normal textures.
	//float Local3 = (MaterialParam_ScleraParamGroup_1.y * Local1.a);
    //float Local4 = (Local3 * 6.28318501);
    //float Local5 = cos(Local4);
    //float Local6 = sin(Local4);
    //float Local7 = (-1.00000000 * Local6);
    //vec2 Local8 = (PixelParameters.TexCoord0.xy.rg - vec2(0.50000000,0.50000000));
    //float Local9 = dot(vec2(Local5,Local7), Local8);
    //float Local10 = dot(vec2(Local6,Local5), Local8);
	//vec2 Local11 = (PixelParameters.TexCoord0.xy - vec2(0.50000000,0.50000000));
    //float Local12 = dot(vec2(Local5,Local7), Local11);
    //float Local13 = dot(vec2(Local6,Local5), Local11);
    //vec2 Local14 = (vec2(Local12,Local13) + vec2(0.50000000,0.50000000));

    float IrisUVRadius = MaterialParam_IrisParamGroup_0.y * 0.03 + 0.15;

	// Sclera and iris Normal.
    //vec3 Local16 = LocalFunc_UnpackNormalMap(MaterialParam_ScleraNormalTexture, PixelParameters.TexCoord0.xy);
    //vec2 Local18 = (PixelParameters.TexCoord0.xy - vec2(0.5, 0.5));
    //vec2 Local19 = (Local18 / IrisUVRadius);
    //vec2 Local20 = (Local19 - 0.00000000);
    //float Local21 = dot(Local20, Local20);
    //float Local22 = sqrt(Local21);
    //float Local23 = (Local22 * (1.00000000 / max(0.00001000,1.00000000)));
    //float Local24 = (1.00000000 - Local23);
    //float Local25 = (Local24 * (1.00000000 / max((1.00000000 - 0.49000001),0.00001000)));
    //float Local26 = min(max(Local25,0.00000000),1.00000000);
    //float Local27 = (1.00000000 - Local26);
    //float Local28 = clamp(Local27, 0.0, 1.0);
    //vec2 Local29 = (PixelParameters.TexCoord0.xy / MaterialParam_IrisParamGroup_1.z);
    //vec2 Local30 = (Local29 + vec2(MaterialParam_IrisParamGroup_1.x, MaterialParam_IrisParamGroup_1.y) / 100.0);
    //vec4 Local32 = LocalFunc_TextureLookUp(MaterialParam_TilingNoiseTexture, Local30, false);
    //float Local34 = mix(MaterialParam_IrisParamGroup_1.w, 0.0 - MaterialParam_IrisParamGroup_1.w, Local32.r);
    //vec2 Local35 = (Local18 * Local34);
    //vec2 Local36 = (Local28 * Local35); // FIXME!! Not important at all, remove later.
    //vec2 Local37 = (PixelParameters.TexCoord0.xy + Local36);
    vec2 Local37 = PixelParameters.TexCoord0.xy;
    //vec3 Local38 = CustomExpression0(IrisUVRadius, Local37, vec3(MaterialParam_IrisParamGroup_2.w, MaterialParam_IrisParamGroup_2.z, MaterialParam_IrisParamGroup_4.x)); // IrisMask
    vec3 Local38 = CustomExpression0(IrisUVRadius, Local37, vec3(0.04, 0.035, 0.045)); // IrisMask, constant vec3(IrisBorderWidth, IrisBleedWidth, IrisMaskWidth) = vec3(0.04, 0.035, 0.045)
    //float Local39 = mix(MaterialParam_ScleraParamGroup_0.x,1.00000000,Local38.r);
    //vec3 Local40 = mix(Local16.rgb,vec3(0.00000000,0.00000000,1.00000000),float(Local39));
    vec3 Local40 = vec3(0.00000000,0.00000000,1.00000000);

	//-----------------------------------------
	// Make normal and reflection vector valid.
	SharedVariables.Normal = Local40;
	PixelParameters.TangentNormal = Local40;
	PixelParameters.WorldNormal = normalize(InternalFunc_TransformTangentVectorToWorld(PixelParameters.TangentToWorld, PixelParameters.TangentNormal));
	PixelParameters.WorldNormal *= PixelParameters.TwoSidedSign;
	PixelParameters.ReflectionVector = InternalFunc_Material_ReflectionAboutCustomWorldNormal(PixelParameters, PixelParameters.WorldNormal, false);
	//-----------------------------------------

	// ScleraCornerDark
    //float Local42 = dot(Local18, Local18);
    //float Local43 = sqrt(Local42);
    //float Local44 = (Local43 * MaterialParam_ScleraParamGroup_0.w);
    //float Local45 = (1.00000000 - Local44);
    //float Local46 = (Local45 * MaterialParam_ScleraParamGroup_0.z);
    //float Local47 = min(max(Local46,0.00000000),1.00000000);
    //vec3 Local48 = mix(MaterialParam_ScleraCornerDarkColor.rgb,vec3(1.00000000,1.00000000,1.00000000),float(Local47));
	
    //-------------Begin of EyeRefraction-------------
	// Begin of derive tangents.
 	//  Begin ofTangentBasis XU.
	vec3 Local49 = PixelParameters.TangentToWorld * vec3(1.00000000,0.00000000,0.00000000);
    float Local50 = dot(Local49, Local49);
    float Local51 = sqrt(Local50);
    vec3 Local52 = (Local49 / Local51); // Normalize
	//  End of TangentBasis XU.
    // Eye N texture, important to reverse TexCoord0.y.
    vec3 Local54 = LocalFunc_UnpackNormalMap(MaterialParam_EyeNTexture, vec2(PixelParameters.TexCoord0.x, 1.0 - PixelParameters.TexCoord0.y));
	vec3 Local56 = PixelParameters.TangentToWorld * Local54.rgb; // EyeDirectionWorld
    float Local57 = dot(Local52, Local56);
    vec3 Local58 = (Local57 * Local56);
    vec3 Local59 = (Local52 - Local58);
    float Local60 = dot(Local59, Local59);
    float Local61 = sqrt(Local60);
    vec3 Local62 = (Local59 / Local61); // Normalize
	// Refraction direction.
    vec3 Local63 = CustomExpression1(1.336,PixelParameters.WorldNormal,PixelParameters.CameraVector); // Constant IoR 1.336
    // DepthPlaneOffset
	vec4 Local65 = LocalFunc_TextureLookUp(MaterialParam_EyeMidPlaneDisplacementTexture, vec2(IrisUVRadius + 0.5, 0.5), false);
    vec3 Local67 = (Local1.rgb - Local65.r);
    vec3 Local68 = max(Local67,vec3(0.00000000,0.00000000,0.00000000));
    vec3 Local69 = (Local68 * MaterialParam_IrisParamGroup_0.z); // Iris depth.
    float Local70 = dot(PixelParameters.CameraVector, Local56);
    float Local71 = (Local70 * Local70);
    float Local72 = mix(0.32499999,1.00000000,Local71);
    vec3 Local73 = (Local69 / Local72); // HeightW / cosAlpha - scale distance to iris plane by facing ratio of camera and plane.
    vec3 Local74 = (Local63 * Local73); // Scale refracted offset direction.
    float Local75 = dot(Local62, Local74);
    vec3 Local76 = cross(Local62,Local56);
    float Local77 = dot(Local76, Local74);
	vec2 RefractedUVOffset = vec2(Local75,Local77); // Refracted UV Offset.
	// End of derive tangents.
    vec2 Local78 = (vec2(0.0-IrisUVRadius, IrisUVRadius) * RefractedUVOffset); // Scale offset to within Iris.
    vec2 Local79 = (Local78 + Local37); 
    vec2 Local80 = mix(Local37,Local79,float(Local38.rg.r)); // Refracted UV, Use Refracted UV within Iris based on Iris Mask.
    //-------------End of EyeRefraction-------------
    
    vec2 Local81 = (Local80 - 0.50000000); // Center refracted UVs.
    vec2 Local82 = ((1.0 / (2.0 * IrisUVRadius)) * Local81);
    vec2 Local83 = (Local82 + 0.50000000); // UV
	// ScalePupils
    //vec2 Local84 = CustomExpression2(Local83,MaterialParam_IrisParamGroup_0.x,MaterialParam_IrisParamGroup_4.z,MaterialParam_IrisParamGroup_4.w);
    vec2 Local84 = CustomExpression2(Local83,MaterialParam_IrisParamGroup_0.x);
    // ScaleUVsByCenter
	//vec2 Local85 = (Local84 / MaterialParam_IrisParamGroup_0.w);
    //vec2 Local86 = (Local85 + 0.50000000);
    //vec2 Local87 = (Local86 - (0.5 / MaterialParam_IrisParamGroup_0.w)); // ScaleUVByCenter, UV input to MF_ParallaxOcclusionMappingEye.
    vec2 Local87 = Local84;
    
    //-------------Begin of ParallaxOcclusionMapping-------------
	// Begin of height ratio.
	//vec3 Local88 = vec3(0.00000000,0.00000000,-1.00000000) * mat3(UniParam_WorldToView); // ??? Transform from view space to world space.
    //vec3 Local89 = Local88;
    //float Local90 = dot(Local89, Local56);
    //float Local91 = ((MaterialParam_RefractionParamGroup_0.y+1.0) * Local90);
    //float Local92 = (Local91 - MaterialParam_RefractionParamGroup_0.y);
    //float Local93 = clamp(Local92, 0.0, 1.0);
    //float Local94 = (Local93 * MaterialParam_RefractionParamGroup_0.z);
	// End of height ratio.
    //float Local95 = dot(Local54.rgb, Local54.rgb);
    //float Local96 = sqrt(Local95);
    //vec3 Local97 = (Local54.rgb / Local96);
    //float Local98 = dot(Local97, Local97);
    //float Local99 = sqrt(Local98);
    //vec3 Local100 = (Local97 / Local99);
    //vec3 Local101 = cross(Local100,(vec3(1.00000000,0.00000000,0.00000000) / sqrt(dot(vec3(1.00000000,0.00000000,0.00000000),vec3(1.00000000,0.00000000,0.00000000)))));
    //vec3 Local102 = cross(Local101,Local100);
    //float Local103 = dot(Local102, Local102);
    //float Local104 = sqrt(Local103);
    //vec3 Local105 = (Local102 / Local104);
    //vec4 Local106 = ((abs(Local103 - 0.00000100) > 0.00001000) ? (Local103 >= 0.00000100 ? vec4(Local105,0.00000000) : vec4(vec3(0.00000000,0.00000000,0.00000000),1.00000000)) : vec4(vec3(0.00000000,0.00000000,0.00000000),1.00000000));
	//vec3 Local107 = PixelParameters.CameraVector * PixelParameters.TangentToWorld; // Transform camera vector from world space to tangent space.
    //vec3 Local108 = (Local107 - vec3(0.00000000,0.00000000,0.00000000)); // Vector to transform
    //float Local109 = dot(Local106.rgb, Local108);
    //float Local110 = dot(Local101, Local101);
    //float Local111 = sqrt(Local110);
    //vec3 Local112 = (Local101 / Local111);
    //vec4 Local113 = ((abs(Local110 - 0.00000100) > 0.00001000) ? (Local110 >= 0.00000100 ? vec4(Local112,0.00000000) : vec4(vec3(0.00000000,0.00000000,0.00000000),1.00000000)) : vec4(vec3(0.00000000,0.00000000,0.00000000),1.00000000));
    //float Local114 = dot(Local113.rgb, Local108);
    //float Local115 = dot(Local100, Local108); // TransformToZVector
	//vec2 Local116 = (vec3(vec2(Local109,Local114),Local115).rg * -1.00000000);
    //vec2 Local117 = (Local116 / vec3(vec2(Local109,Local114),Local115).b);
    //vec2 Local118 = (Local94 * Local117);
    //vec2 Local119 = (Local118 * (MaterialParam_RefractionParamGroup_0.w-1.0)); // Reference plane
    //vec2 Local120 = (Local87 + Local119); // UV input to "Parallax Only Mapping".
    //float Local121 = mix(MaterialParam_RefractionParamGroup_1.x,MaterialParam_RefractionParamGroup_1.y,0.50000000);
    //float Local122 = floor(Local121); // MaxSteps
    //float Local123 = (1.00000000 / Local121); // StepSize
    //vec2 Local124 = (Local118 * Local123); // UVDist
    ////vec2 Local125 = dFdx(Local120);
    ////vec2 Local126 = dFdy(Local120);
	//vec2 Local125 = vec2(0.0);
    //vec2 Local126 = vec2(0.0);
    //vec4 Local127 = CustomExpression3(MaterialParam_IrisHeightTexture,Local120,Local122,Local123,Local124,Local125,Local126,vec4(1.00000000,0.00000000,0.00000000,0.00000000));
	//vec2 Local128 = (Local120 + Local127.rg); // !!! ParallaxUVs
    //-------------End of ParallaxOcclusionMapping-------------
    
    vec2 Local128 = Local87;

	// CloudyIris
    //vec2 Local129 = (Local128 - 0.50000000);
    //float Local130 = dot(Local129, Local129);
    //float Local131 = sqrt(Local130);
    //float Local132 = (Local131 * MaterialParam_IrisParamGroup_0.z);
    //float Local133 = (1.00000000 - Local132);
    //float Local134 = (Local133 * MaterialParam_IrisParamGroup_0.y);
    //float Local135 = min(max(Local134,0.00000000),1.00000000);
    //vec3 Local136 = (Local135 * MaterialParam_CloudyIrisColor.rgb);

	// Sclera color
    /*vec4 Local138 = LocalFunc_TextureLookUp(MaterialParam_ScleraBaseColorTexture, Local14, true);
    vec3 Local140 = (Local138.rgb * MaterialParam_ScleraParamGroup_0.y);
    vec3 Local141 = (Local140 * MaterialParam_ScleraTint.rgb);
    vec3 Local142 = LocalFunc_PositiveClampedPow(Local141, MaterialParam_ScleraParamGroup_1.x);
    vec3 Local143 = (Local142 * MaterialParam_IrisBleedTint.rgb);
    vec3 Local144 = mix(Local142,Local143,float(Local38.g));*/
    vec4 Local138 = LocalFunc_TextureLookUp(MaterialParam_ScleraBaseColorTexture, PixelParameters.TexCoord0.xy, true);
    vec3 Local139 = LocalFunc_PositiveClampedPow(Local138.rgb,MaterialParam_ScleraParamGroup_1.z);
    vec3 Local140 = (Local139 * (MaterialParam_ScleraParamGroup_0.y * 1.1 + 0.8));
    vec4 Local141 = LocalFunc_TextureLookUp(MaterialParam_ScleraTintPicker, vec2(MaterialParam_ScleraParamGroup_1.x, MaterialParam_ScleraParamGroup_1.y), true);
    vec3 Local142 = (Local139 * Local141.rgb);
    vec3 Local143 = Local142;//(Local142 * MaterialParam_IrisBleedTint.rgb);
    vec3 Local144 = mix(Local142,Local143,Local38.g); // Sclera color.

	// Veins color
    //float Local145 = (MaterialParam_ScleraParamGroup_2.w * Local1.a);
    //float Local146 = (Local145 * 6.28318501);
    //float Local147 = cos(Local146);
    //float Local148 = sin(Local146);
    //float Local149 = (-1.00000000 * Local148);
    ////float Local150 = dot(vec2(Local147,Local149), Local8);
    ////float Local151 = dot(vec2(Local148,Local147), Local8);
    //float Local152 = dot(vec2(Local147,Local149), Local11);
    //float Local153 = dot(vec2(Local148,Local147), Local11);
    //vec2 Local154 = (vec2(Local152,Local153) + vec2(0.50000000,0.50000000));
    //vec4 Local156 = LocalFunc_TextureLookUp(MaterialParam_VeinsColorTexture, Local154, true);
    vec4 Local156 = LocalFunc_TextureLookUp(MaterialParam_VeinsColorTexture, PixelParameters.TexCoord0.xy, true);
    vec3 Local158 = LocalFunc_PositiveClampedPow(Local156.rgb, (MaterialParam_ScleraParamGroup_1.w * 1.6)); // Veins color.

	// Combine sclera and veins colors.
    vec3 Local159 = (Local144 * Local158);

	// Iris color	
    /*vec4 Local162 = LocalFunc_TextureLookUp(MaterialParam_IrisBaseColorTexture, Local128, true);
    vec2 Local164 = (Local128 + (-0.50000000));
    vec2 Local165 = (Local164 * MaterialParam_IrisParamGroup_4.w);
    vec2 Local166 = (Local165 - 0.00000000);
    float Local167 = dot(Local166, Local166);
    float Local168 = sqrt(Local167);
    float Local169 = LocalFunc_PositiveClampedPow(Local168, MaterialParam_IrisParamGroup_4.z);
    float Local170 = (1.00000000 - Local169);
    float Local171 = clamp(Local170, 0.0, 1.0);
    vec3 Local172 = (Local162.rgb * Local171);
    vec3 Local173 = (Local172 * MaterialParam_IrisParamGroup_3.x); // Iris base color
    vec4 Local175 = LocalFunc_TextureLookUp(MaterialParam_IrisAOTexture, Local128, true);
    float Local177 = LocalFunc_PositiveClampedPow(Local175.r, MaterialParam_IrisParamGroup_0.x); // Iris AO
    vec3 Local178 = (Local173 * Local177);
    float Local179 = dot(Local178, vec3(0.30000001,0.58999997,0.11000000));
    vec3 Local180 = mix(Local178,vec3(Local179,Local179,Local179),(1.0-MaterialParam_IrisParamGroup_3.y));*/
    vec4 EyeMask = LocalFunc_TextureLookUp(MaterialParam_EyeMaskTexture, Local128, false);
    vec3 IrisColor = GenerateIris(Local128, EyeMask);
    // Iris brightness.
    vec3 Local226 = (IrisColor * MaterialParam_IrisParamGroup_3.x);
    // Desaturation.
    float Local227 = dot(Local226, vec3(0.30000001,0.58999997,0.11000000));
    vec3 Local228 = mix(Local226,vec3(Local227,Local227,Local227),(MaterialParam_IrisParamGroup_3.y - 0.5) * (-2.0));

	// Combine sclera, veins and iris colors.
    vec3 Local181 = mix(Local159,Local228,float(Local38.r));

	// Combine all colors.
    //vec3 Local182 = (Local136 + Local181);
    //vec3 Local183 = (Local48 * Local182); // BaseColor

    float Local184 = mix(MaterialParam_ScleraParamGroup_0.w,MaterialParam_IrisParamGroup_3.w,Local38.r); // Specular
    float Local185 = mix(MaterialParam_ScleraParamGroup_0.z,MaterialParam_IrisParamGroup_3.z,Local38.r); // Roughness

	// Iris distance.
    vec2 Local186 = (Local81 - 0.00000000);
    float Local187 = dot(Local186, Local186);
    float Local188 = sqrt(Local187);
    float Local189 = (Local188 / IrisUVRadius); // Scale UV distance to match Iris size in UV space.
    //float Local190 = (Local189 * MaterialParam_IrisParamGroup_2.y);
    //float Local191 = LocalFunc_PositiveClampedPow(Local190,MaterialParam_IrisParamGroup_2.x); // Adjust distance - Drives concavity.


	//SharedVariables.Normal = Local40;
    SharedVariables.BaseColor = Local181;//Local183;
    SharedVariables.Specular = Local184;
    SharedVariables.Roughness = Local185;
	SharedVariables.IrisMask = Local38.b;
    SharedVariables.IrisDistance = Local189;//Local191;
	SharedVariables.TangentOutput = Local56;
}

vec3 UserFunc_GetBaseColor(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return SharedVariables.BaseColor;
}

float UserFunc_GetMetallic(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return 0.0;
}

float UserFunc_GetSpecular(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return SharedVariables.Specular;
}

float UserFunc_GetRoughness(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return SharedVariables.Roughness;
}

vec3 UserFunc_GetNormal(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return SharedVariables.Normal;
}

vec3 UserFunc_GetEmissive(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return vec3(0.0, 0.0, 0.0);
}

float UserFunc_GetOpacity(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return 1.0;
}

float UserFunc_GetOpacityMask(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return 1.0;
}

float UserFunc_GetOpacityClip()
{
	return 0.333;
}

float UserFunc_GetIrisMask(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return SharedVariables.IrisMask;
}

float UserFunc_GetIrisDistance(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return SharedVariables.IrisDistance;
}

vec3 UserFunc_GetTangentOutput(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
    return SharedVariables.TangentOutput;
}

float UserFunc_GetAmbientOcclusion(Stru_PixelParam PixelParameters, Stru_SharedVariables SharedVariables)
{
	return 1.0;
}
