package com.sarp.tiktokliquidglass

import android.animation.TimeInterpolator
import android.graphics.RenderEffect
import android.graphics.Shader
import android.util.TypedValue
import android.view.View
import kotlin.math.abs
import kotlin.math.max
import kotlin.math.roundToInt

/**
 * Hardware-accelerated directional motion blur (API 31+ RenderEffect, zero-cost at rest).
 * Quantizes blur radii to 0.5px increments to eliminate per-frame RenderEffect allocations
 * and delegates slide/pop helpers to the interruptible 120Hz [MergenSpringEngine].
 */
object MergenMotionBlur {

    private const val TAG_LAST_BLUR_KEY = 0x53415299

    private fun dpF(view: View, dp: Float): Float =
        TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, dp, view.resources.displayMetrics)

    fun clear(view: View) {
        MergenSpringEngine.cancelViewSprings(view)
        clearEffectOnly(view)
    }

    internal fun clearEffectOnly(view: View) {
        val last = view.getTag(TAG_LAST_BLUR_KEY) as? Int
        if (last != null && last == 0) return
        view.setTag(TAG_LAST_BLUR_KEY, 0)
        try {
            view.setRenderEffect(null)
        } catch (_: Throwable) {
        }
    }

    private fun applyDirectionalBlur(view: View, rxPx: Float, ryPx: Float) {
        if (MergenSpringEngine.isReducedMotion(view.context) || max(rxPx, ryPx) < 0.75f) {
            clearEffectOnly(view)
            return
        }
        // Quantize to 0.5px buckets so consecutive 120Hz frames share cached RenderEffect states
        val qRxHalf = (rxPx.coerceIn(0f, 48f) * 2f).roundToInt()
        val qRyHalf = (ryPx.coerceIn(0f, 48f) * 2f).roundToInt()
        val key = (qRxHalf shl 10) or qRyHalf
        if ((view.getTag(TAG_LAST_BLUR_KEY) as? Int) == key) {
            return
        }
        view.setTag(TAG_LAST_BLUR_KEY, key)

        val qRx = qRxHalf * 0.5f
        val qRy = qRyHalf * 0.5f
        try {
            view.setRenderEffect(RenderEffect.createBlurEffect(qRx, qRy, Shader.TileMode.CLAMP))
        } catch (_: Throwable) {
            try {
                view.setRenderEffect(
                    RenderEffect.createBlurEffect(
                        qRx.coerceAtLeast(0.5f),
                        qRy.coerceAtLeast(0.5f),
                        Shader.TileMode.CLAMP
                    )
                )
            } catch (_: Throwable) {
                clearEffectOnly(view)
            }
        }
    }

    fun applyDragVelocityBlur(
        view: View,
        vxPxPerSec: Float,
        vyPxPerSec: Float,
        maxBlurDp: Float = 9f
    ) {
        if (MergenSpringEngine.isReducedMotion(view.context)) {
            clearEffectOnly(view)
            return
        }
        val refSpeed = dpF(view, 1600f).coerceAtLeast(1f)
        val maxPx = dpF(view, maxBlurDp)
        val rx = (abs(vxPxPerSec) / refSpeed).coerceIn(0f, 1f) * maxPx
        val ry = (abs(vyPxPerSec) / refSpeed).coerceIn(0f, 1f) * maxPx
        applyDirectionalBlur(view, rx, ry)
    }

    fun animateTranslationX(
        view: View,
        fromX: Float,
        toX: Float,
        durationMs: Long,
        @Suppress("UNUSED_PARAMETER") interpolator: TimeInterpolator,
        maxBlurDp: Float = 12f,
        onEnd: (() -> Unit)? = null
    ) {
        view.translationX = fromX
        val responseSec = (durationMs.coerceAtLeast(120L) / 720f).coerceIn(0.18f, 0.42f)
        MergenSpringEngine.springTranslationX(
            view = view,
            targetX = toX,
            dampingRatio = 0.96f,
            responseSec = responseSec,
            maxBlurDp = maxBlurDp,
            onEnd = onEnd
        )
    }

    fun animateTranslationY(
        view: View,
        fromY: Float,
        toY: Float,
        durationMs: Long,
        @Suppress("UNUSED_PARAMETER") interpolator: TimeInterpolator,
        maxBlurDp: Float = 11f,
        onEnd: (() -> Unit)? = null
    ) {
        view.translationY = fromY
        val responseSec = (durationMs.coerceAtLeast(120L) / 720f).coerceIn(0.18f, 0.42f)
        MergenSpringEngine.springTranslationY(
            view = view,
            targetY = toY,
            dampingRatio = 0.92f,
            responseSec = responseSec,
            maxBlurDp = maxBlurDp,
            onEnd = onEnd
        )
    }

    fun animatePop(
        view: View,
        fromScale: Float,
        toScale: Float,
        fromAlpha: Float,
        toAlpha: Float,
        durationMs: Long,
        @Suppress("UNUSED_PARAMETER") interpolator: TimeInterpolator,
        maxBlurDp: Float = 7f,
        onEnd: (() -> Unit)? = null
    ) {
        val responseSec = (durationMs.coerceAtLeast(110L) / 760f).coerceIn(0.16f, 0.36f)
        MergenSpringEngine.springPop(
            view = view,
            fromScaleX = fromScale,
            fromScaleY = fromScale,
            toScaleX = toScale,
            toScaleY = toScale,
            fromAlpha = fromAlpha,
            toAlpha = toAlpha,
            dampingRatioX = if (toScale >= fromScale) 0.84f else 0.98f,
            responseX = responseSec,
            dampingRatioY = if (toScale >= fromScale) 0.84f else 0.98f,
            responseY = responseSec,
            maxBlurDp = maxBlurDp,
            onEnd = onEnd
        )
    }
}
