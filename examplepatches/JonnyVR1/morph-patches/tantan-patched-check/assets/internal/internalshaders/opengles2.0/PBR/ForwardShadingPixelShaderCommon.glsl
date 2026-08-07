#ifndef _FORWARD_SHADING_PIXEL_SHADER_COMMON_GLSL_
#define _FORWARD_SHADING_PIXEL_SHADER_COMMON_GLSL_

in vec4 VSOutWorldPosition;
in vec4 VSOutWorldPosition_CamRelative;
in vec4 VSOutScreenPosition;
in vec4 VSOutPreScreenPosition;
in vec4 VSOutPosition;

layout (location = 0) out vec4 PSOutColor;

#if RENDER_SUBSURFACE_PROFILE
	layout (location = 1) out vec4 PSOutBaseColor;
	layout (location = 2) out vec4 PSOutCustomData;
	#if RENDER_VELOCITY
		layout (location = 3) out vec2 PSOutVelocity;
	#endif
#else	//!RENDER_SUBSURFACE_PROFILE
	#if RENDER_VELOCITY
		layout (location = 1) out vec2 PSOutVelocity;
	#endif
#endif

vec4 ComFunc_ForwardShadingCommon_OpaqueBlendBase(vec4 ScreenPosition, vec3 Color)
{
	return vec4(Color, ScreenPosition.z / ScreenPosition.w);
}
vec4 ComFunc_ForwardShadingCommon_OpaqueBlendAdd(vec4 ScreenPosition, vec3 Color)
{
	return vec4(Color, 1.0f);
}

#if MATERIAL_BLEND_MODE_TRANSLUCENT
	#if FORWARD_SHADING_OPAQUE_LAYER
		vec4 ComFunc_ForwardShadingCommon_BlendBase(Stru_PixelParam PixelParameters, vec4 ScreenPosition, vec3 Color) 
		{ 
			return ComFunc_ForwardShadingCommon_OpaqueBlendBase(ScreenPosition, Color); 
		}

		vec4 ComFunc_ForwardShadingCommon_BlendAdd(Stru_PixelParam PixelParameters, vec4 ScreenPosition, vec3 Color) 
		{ 
			return ComFunc_ForwardShadingCommon_OpaqueBlendAdd(ScreenPosition,Color); 
		}
	#else
		vec4 ComFunc_ForwardShadingCommon_BlendBase(Stru_PixelParam PixelParameters, vec4 ScreenPosition, vec3 Color) 
		{
			return ComFunc_ForwardShadingCommon_OpaqueBlendBase(ScreenPosition, Color);
		}
		vec4 ComFunc_ForwardShadingCommon_BlendAdd(Stru_PixelParam PixelParameters, vec4 ScreenPosition, vec3 Color) 
		{
			return ComFunc_ForwardShadingCommon_OpaqueBlendAdd(ScreenPosition, Color);
		}
	#endif
#elif MATERIAL_BLEND_MODE_ADDITIVE
	#if FORWARD_SHADING_OPAQUE_LAYER
		vec4 ComFunc_ForwardShadingCommon_BlendBase(Stru_PixelParam PixelParameters,vec4 ScreenPosition, vec3 Color) 
		{  
			return ComFunc_ForwardShadingCommon_OpaqueBlendBase(ScreenPosition, Color); 
		}

		vec4 ComFunc_ForwardShadingCommon_BlendAdd(Stru_PixelParam PixelParameters, vec4 ScreenPosition, vec3 Color) 
		{  
			return ComFunc_ForwardShadingCommon_OpaqueBlendAdd(ScreenPosition, Color); 
		}
	#else
		vec4 ComFunc_ForwardShadingCommon_BlendBase(Stru_PixelParam PixelParameters, vec4 ScreenPosition, vec3 Color) 
		{
			return ComFunc_ForwardShadingCommon_OpaqueBlendBase(ScreenPosition, Color);
		}

		vec4 ComFunc_ForwardShadingCommon_BlendAdd(Stru_PixelParam PixelParameters, vec4 ScreenPosition, vec3 Color) 
		{
			return ComFunc_ForwardShadingCommon_OpaqueBlendAdd(ScreenPosition, Color);
		}
	#endif
#else
	vec4 ComFunc_ForwardShadingCommon_BlendBase(Stru_PixelParam PixelParameters, vec4 ScreenPosition, vec3 Color) 
	{  
		return ComFunc_ForwardShadingCommon_OpaqueBlendBase(ScreenPosition,Color); 
	}

	vec4 ComFunc_ForwardShadingCommon_BlendAdd(Stru_PixelParam PixelParameters, vec4 ScreenPosition, vec3 Color) 
	{ 
		return ComFunc_ForwardShadingCommon_OpaqueBlendAdd(ScreenPosition,Color); 
	}
#endif

#endif