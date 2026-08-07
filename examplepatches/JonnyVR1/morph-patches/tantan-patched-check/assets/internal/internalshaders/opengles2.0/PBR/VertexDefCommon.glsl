#ifndef _VERTEX_DEF_COMMON_GLSL_
#define _VERTEX_DEF_COMMON_GLSL_

#if VERTEX_SHADER

mat3 InternalFunc_VertexDef_CalcTangentToWorld( mat3 TangentToLocal, mat4x3 LocalToWorld, vec3 InvNonUniformScale)
{
	mat3 LocalToWorldWithScale;
	LocalToWorldWithScale[0] = LocalToWorld[0].xyz * InvNonUniformScale.x;
    LocalToWorldWithScale[1] = LocalToWorld[1].xyz * InvNonUniformScale.y;
    LocalToWorldWithScale[2] = LocalToWorld[2].xyz * InvNonUniformScale.z;
	return LocalToWorldWithScale * TangentToLocal;
}

mat3 InternalFunc_VertexDef_CalcTangentToWorld( mat3 TangentToLocal, mat4 LocalToWorld, vec3 InvNonUniformScale)
{
	mat3 LocalToWorldWithScale;
	LocalToWorldWithScale[0] = LocalToWorld[0].xyz * InvNonUniformScale.x;
    LocalToWorldWithScale[1] = LocalToWorld[1].xyz * InvNonUniformScale.y;
    LocalToWorldWithScale[2] = LocalToWorld[2].xyz * InvNonUniformScale.z;
	return LocalToWorldWithScale * TangentToLocal;
}

#endif

#if PIXEL_SHADER

Stru_PixelParam InternalFunc_MaterialInitPixelParameters()
{
	Stru_PixelParam PixelParam;

	PixelParam.TangentToWorld = mat3(1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f);
	return PixelParam;
}

mat3 InternalFunc_MaterialAssembleTangentToWorld( vec3 TangentToWorld0, vec4 TangentToWorld2 )
{
	//vec3 TangentToWorld1 = cross(TangentToWorld0, TangentToWorld2.xyz) * TangentToWorld2.w;	// 副法线老是算反，还没查出原因,该不该负号呢
	//return mat3(TangentToWorld0, TangentToWorld1, TangentToWorld2.xyz);

	vec3 TangentToWorld1 = cross(TangentToWorld2.xyz, TangentToWorld0) * TangentToWorld2.w;
	return mat3(normalize(TangentToWorld0), normalize(TangentToWorld1), normalize(TangentToWorld2.xyz));
}

#endif

#endif //_VERTEX_DEF_LOCAL_GLSL_


