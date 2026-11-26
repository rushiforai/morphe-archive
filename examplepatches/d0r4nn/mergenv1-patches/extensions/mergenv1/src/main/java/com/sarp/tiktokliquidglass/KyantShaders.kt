package com.sarp.tiktokliquidglass

import android.graphics.BlendMode
import android.graphics.Color
import android.graphics.ColorMatrix
import android.graphics.ColorMatrixColorFilter
import android.graphics.RenderEffect
import android.graphics.RuntimeShader
import android.graphics.Shader
import kotlin.math.PI
import kotlin.math.min

/**
 * Direct port of Kyant0/AndroidLiquidGlass AGSL shaders, RenderEffect chains,
 * and ColorMatrix vibrancy filter to pure Android Graphics APIs (API 33+).
 */
internal object KyantShaders {

    /**
     * Guards against nested RenderNode.beginRecording() / self-capture recursion
     * when multiple Kyant0 Liquid Glass views share the same backdropSource tree.
     */
    var isRecordingBackdrop: Boolean = false

    private const val ROUNDED_RECT_SDF = """
float radiusAt(float2 centeredCoord, float4 radii) {
    if (centeredCoord.x >= 0.0) {
        if (centeredCoord.y <= 0.0) return radii.y;
        else return radii.z;
    } else {
        if (centeredCoord.y <= 0.0) return radii.x;
        else return radii.w;
    }
}

float sdRoundedRect(float2 coord, float2 halfSize, float radius) {
    float2 cornerCoord = abs(coord) - (halfSize - float2(radius));
    float outside = length(max(cornerCoord, 0.0)) - radius;
    float inside = min(max(cornerCoord.x, cornerCoord.y), 0.0);
    return outside + inside;
}

float2 gradSdRoundedRect(float2 coord, float2 halfSize, float radius) {
    float2 cornerCoord = abs(coord) - (halfSize - float2(radius));
    if (cornerCoord.x >= 0.0 || cornerCoord.y >= 0.0) {
        return sign(coord) * normalize(max(cornerCoord, 0.0));
    } else {
        float gradX = step(cornerCoord.y, cornerCoord.x);
        return sign(coord) * float2(gradX, 1.0 - gradX);
    }
}"""

    const val ROUNDED_RECT_REFRACTION_SHADER = """
uniform shader content;

uniform float2 size;
uniform float2 offset;
uniform float4 cornerRadii;
uniform float refractionHeight;
uniform float refractionAmount;
uniform float depthEffect;

$ROUNDED_RECT_SDF

float circleMap(float x) {
    return 1.0 - sqrt(1.0 - x * x);
}

half4 main(float2 coord) {
    float2 halfSize = size * 0.5;
    float2 centeredCoord = (coord + offset) - halfSize;
    float radius = radiusAt(centeredCoord, cornerRadii);

    float sd = sdRoundedRect(centeredCoord, halfSize, radius);
    if (-sd >= refractionHeight) {
        return content.eval(coord);
    }
    sd = min(sd, 0.0);

    float d = circleMap(1.0 - -sd / refractionHeight) * refractionAmount;
    float gradRadius = min(radius * 1.5, min(halfSize.x, halfSize.y));
    float2 grad = normalize(gradSdRoundedRect(centeredCoord, halfSize, gradRadius) + depthEffect * normalize(centeredCoord));

    float2 refractedCoord = coord + d * grad;
    return content.eval(refractedCoord);
}"""

    const val ROUNDED_RECT_REFRACTION_DISPERSION_SHADER = """
uniform shader content;

uniform float2 size;
uniform float2 offset;
uniform float4 cornerRadii;
uniform float refractionHeight;
uniform float refractionAmount;
uniform float depthEffect;
uniform float chromaticAberration;

$ROUNDED_RECT_SDF

float circleMap(float x) {
    return 1.0 - sqrt(1.0 - x * x);
}

half4 main(float2 coord) {
    float2 halfSize = size * 0.5;
    float2 centeredCoord = (coord + offset) - halfSize;
    float radius = radiusAt(centeredCoord, cornerRadii);

    float sd = sdRoundedRect(centeredCoord, halfSize, radius);
    if (-sd >= refractionHeight) {
        return content.eval(coord);
    }
    sd = min(sd, 0.0);

    float d = circleMap(1.0 - -sd / refractionHeight) * refractionAmount;
    float gradRadius = min(radius * 1.5, min(halfSize.x, halfSize.y));
    float2 grad = normalize(gradSdRoundedRect(centeredCoord, halfSize, gradRadius) + depthEffect * normalize(centeredCoord));

    float2 refractedCoord = coord + d * grad;
    float dispersionIntensity = chromaticAberration * ((centeredCoord.x * centeredCoord.y) / (halfSize.x * halfSize.y));
    float2 dispersedCoord = d * grad * dispersionIntensity;

    half4 color = half4(0.0);

    half4 red = content.eval(refractedCoord + dispersedCoord);
    color.r += red.r / 3.5;
    color.a += red.a / 7.0;

    half4 orange = content.eval(refractedCoord + dispersedCoord * (2.0 / 3.0));
    color.r += orange.r / 3.5;
    color.g += orange.g / 7.0;
    color.a += orange.a / 7.0;

    half4 yellow = content.eval(refractedCoord + dispersedCoord * (1.0 / 3.0));
    color.r += yellow.r / 3.5;
    color.g += yellow.g / 3.5;
    color.a += yellow.a / 7.0;

    half4 green = content.eval(refractedCoord);
    color.g += green.g / 3.5;
    color.a += green.a / 7.0;

    half4 cyan = content.eval(refractedCoord - dispersedCoord * (1.0 / 3.0));
    color.g += cyan.g / 3.5;
    color.b += cyan.b / 3.0;
    color.a += cyan.a / 7.0;

    half4 blue = content.eval(refractedCoord - dispersedCoord * (2.0 / 3.0));
    color.b += blue.b / 3.0;
    color.a += blue.a / 7.0;

    half4 purple = content.eval(refractedCoord - dispersedCoord);
    color.r += purple.r / 7.0;
    color.b += purple.b / 3.0;
    color.a += purple.a / 7.0;

    return color;
}"""

    const val DEFAULT_HIGHLIGHT_SHADER = """
uniform float2 size;
uniform float4 cornerRadii;
layout(color) uniform half4 color;
uniform float angle;
uniform float falloff;

$ROUNDED_RECT_SDF

half4 main(float2 coord) {
    float2 halfSize = size * 0.5;
    float2 centeredCoord = coord - halfSize;
    float radius = radiusAt(centeredCoord, cornerRadii);

    float gradRadius = min(radius * 1.5, min(halfSize.x, halfSize.y));
    float2 grad = gradSdRoundedRect(centeredCoord, halfSize, gradRadius);
    float2 normal = float2(cos(angle), sin(angle));
    float d = dot(grad, normal);
    float intensity = pow(abs(d), falloff);
    return color * intensity;
}"""

    const val INTERACTIVE_HIGHLIGHT_SHADER = """
uniform float2 size;
layout(color) uniform half4 color;
uniform float radius;
uniform float2 position;

half4 main(float2 coord) {
    float dist = distance(coord, position);
    float intensity = smoothstep(radius, radius * 0.5, dist);
    return color * intensity;
}"""

    fun createVibrancyColorFilter(saturation: Float = 1.5f): ColorMatrixColorFilter {
        val invSat = 1f - saturation
        val r = 0.213f * invSat
        val g = 0.715f * invSat
        val b = 0.072f * invSat
        val cm = ColorMatrix(
            floatArrayOf(
                r + saturation, g, b, 0f, 0f,
                r, g + saturation, b, 0f, 0f,
                r, g, b + saturation, 0f, 0f,
                0f, 0f, 0f, 1f, 0f
            )
        )
        return ColorMatrixColorFilter(cm)
    }

    private val vibrancyEffect: RenderEffect by lazy {
        RenderEffect.createColorFilterEffect(createVibrancyColorFilter(1.6f))
    }

    /**
     * Outer pill backdrop effect:
     * Vibrancy (1.5f) -> Blur (8dp, CLAMP) -> RoundedRectRefraction (refractionHeight, -refractionAmount)
     */
    fun createOuterPillRenderEffect(
        width: Float,
        height: Float,
        offsetX: Float,
        offsetY: Float,
        blurRadiusPx: Float,
        refractionHeightPx: Float,
        refractionAmountPx: Float,
        refractionShader: RuntimeShader
    ): RenderEffect {
        val radius = min(width, height) * 0.5f
        return createGlassRenderEffect(
            width = width,
            height = height,
            offsetX = offsetX,
            offsetY = offsetY,
            rTL = radius,
            rTR = radius,
            rBR = radius,
            rBL = radius,
            blurRadiusPx = blurRadiusPx,
            refractionHeightPx = refractionHeightPx,
            refractionAmountPx = refractionAmountPx,
            refractionShader = refractionShader
        )
    }

    fun createGlassRenderEffect(
        width: Float,
        height: Float,
        offsetX: Float,
        offsetY: Float,
        rTL: Float,
        rTR: Float,
        rBR: Float,
        rBL: Float,
        blurRadiusPx: Float,
        refractionHeightPx: Float,
        refractionAmountPx: Float,
        refractionShader: RuntimeShader
    ): RenderEffect {
        val baseWithBlur = if (blurRadiusPx > 0.5f) {
            RenderEffect.createBlurEffect(
                blurRadiusPx,
                blurRadiusPx,
                vibrancyEffect,
                Shader.TileMode.CLAMP
            )
        } else {
            vibrancyEffect
        }

        if (refractionHeightPx <= 0.5f || refractionAmountPx <= 0.5f || width <= 1f || height <= 1f) {
            return baseWithBlur
        }

        refractionShader.apply {
            setFloatUniform("size", width, height)
            setFloatUniform("offset", offsetX, offsetY)
            setFloatUniform("cornerRadii", rTL, rTR, rBR, rBL)
            setFloatUniform("refractionHeight", refractionHeightPx)
            setFloatUniform("refractionAmount", -refractionAmountPx)
            setFloatUniform("depthEffect", 0f)
        }
        val lensEffect = RenderEffect.createRuntimeShaderEffect(refractionShader, "content")
        return RenderEffect.createChainEffect(lensEffect, baseWithBlur)
    }

    /**
     * Active draggable jelly lens indicator effect:
     * RoundedRectRefractionWithDispersion (chromaticAberration = 1f)
     */
    fun createActiveLensRenderEffect(
        width: Float,
        height: Float,
        offsetX: Float,
        offsetY: Float,
        refractionHeightPx: Float,
        refractionAmountPx: Float,
        dispersionShader: RuntimeShader
    ): RenderEffect? {
        if (refractionHeightPx <= 0.5f || refractionAmountPx <= 0.5f || width <= 1f || height <= 1f) {
            return null
        }

        val radius = min(width, height) * 0.5f
        dispersionShader.apply {
            setFloatUniform("size", width, height)
            setFloatUniform("offset", offsetX, offsetY)
            setFloatUniform("cornerRadii", radius, radius, radius, radius)
            setFloatUniform("refractionHeight", refractionHeightPx)
            setFloatUniform("refractionAmount", -refractionAmountPx)
            setFloatUniform("depthEffect", 0f)
            setFloatUniform("chromaticAberration", 1f)
        }
        return RenderEffect.createRuntimeShaderEffect(dispersionShader, "content")
    }

    fun configureHighlightShader(
        shader: RuntimeShader,
        width: Float,
        height: Float,
        colorArgb: Int = Color.WHITE,
        angleDegrees: Float = 45f,
        falloff: Float = 1f
    ) {
        val radius = min(width, height) * 0.5f
        configureHighlightShader(
            shader = shader,
            width = width,
            height = height,
            rTL = radius,
            rTR = radius,
            rBR = radius,
            rBL = radius,
            colorArgb = colorArgb,
            angleDegrees = angleDegrees,
            falloff = falloff
        )
    }

    fun configureHighlightShader(
        shader: RuntimeShader,
        width: Float,
        height: Float,
        rTL: Float,
        rTR: Float,
        rBR: Float,
        rBL: Float,
        colorArgb: Int = Color.WHITE,
        angleDegrees: Float = 45f,
        falloff: Float = 1f
    ) {
        shader.apply {
            setFloatUniform("size", width, height)
            setFloatUniform("cornerRadii", rTL, rTR, rBR, rBL)
            setColorUniform("color", colorArgb)
            setFloatUniform("angle", angleDegrees * (PI / 180.0).toFloat())
            setFloatUniform("falloff", falloff)
        }
    }

    fun configureInteractiveHighlightShader(
        shader: RuntimeShader,
        width: Float,
        height: Float,
        centerX: Float,
        centerY: Float,
        alpha: Float
    ) {
        val radius = min(width, height) * 1.5f
        val a = (alpha.coerceIn(0f, 1f) * 255f).toInt()
        shader.apply {
            setFloatUniform("size", width, height)
            setColorUniform("color", Color.argb(a, 255, 255, 255))
            setFloatUniform("radius", radius)
            setFloatUniform("position", centerX.coerceIn(0f, width), centerY.coerceIn(0f, height))
        }
    }

    val plusBlendMode: BlendMode = BlendMode.PLUS
}
