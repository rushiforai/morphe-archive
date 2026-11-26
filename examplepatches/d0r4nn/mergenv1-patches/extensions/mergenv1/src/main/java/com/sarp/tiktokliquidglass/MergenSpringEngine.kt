package com.sarp.tiktokliquidglass

import android.annotation.SuppressLint
import android.content.Context
import android.view.Choreographer
import android.view.MotionEvent
import android.view.View
import java.util.WeakHashMap
import kotlin.math.PI
import kotlin.math.abs
import kotlin.math.sqrt

/**
 * Centralized 120Hz Choreographer Spring Physics Engine for MergenV1 (Animations 2.0).
 *
 * Implements Apple Fluid Interfaces principles:
 *  - Parameterized by dampingRatio + responseSeconds (natural settle without fixed duration walls)
 *  - Interruptible: retargets directly from the live on-screen presentation value & velocity
 *  - Velocity handoff & exponential momentum projection (`current + (v/1000) * d / (1 - d)`)
 *  - Progressive boundary rubber-banding
 *  - Animation Profile integration (`0 = Fluid`, `1 = Snappy`, `2 = Reduced Motion`)
 */
object MergenSpringEngine {

    class Spring1D(
        initial: Float,
        var dampingRatio: Float = 1f,
        var stiffness: Float = 380f
    ) {
        var value: Float = initial
        var velocity: Float = 0f
        var target: Float = initial

        fun snapTo(newVal: Float) {
            value = newVal
            target = newVal
            velocity = 0f
        }

        fun retarget(newTarget: Float, initialVelocity: Float? = null, threshold: Float = 0.001f) {
            target = newTarget
            if (initialVelocity != null) {
                velocity = initialVelocity
            }
            if (abs(target - value) < threshold && abs(velocity) < threshold * 4f) {
                value = target
                velocity = 0f
            }
        }

        fun step(dt: Float, valueEpsilon: Float = 0.001f, velEpsilon: Float = 0.004f): Boolean {
            val steps = 4
            val subDt = dt / steps
            val damping = 2f * dampingRatio * sqrt(stiffness.coerceAtLeast(1f))
            for (i in 0 until steps) {
                val accel = stiffness * (target - value) - damping * velocity
                velocity += accel * subDt
                value += velocity * subDt
            }
            if (abs(target - value) <= valueEpsilon && abs(velocity) <= velEpsilon) {
                value = target
                velocity = 0f
                return false
            }
            return true
        }
    }

    private class ActiveSpringRunner(
        var frameCallback: Choreographer.FrameCallback? = null
    ) {
        var cancelled: Boolean = false
        var xSpring: Spring1D? = null
        var ySpring: Spring1D? = null
        var popSxSpring: Spring1D? = null
        var popSySpring: Spring1D? = null
        var popAlphaSpring: Spring1D? = null

        fun cancel(clearBlurView: View? = null) {
            cancelled = true
            frameCallback?.let { cb ->
                Choreographer.getInstance().removeFrameCallback(cb)
            }
            frameCallback = null
            if (clearBlurView != null) {
                MergenMotionBlur.clearEffectOnly(clearBlurView)
            }
        }
    }

    private val txRunners = WeakHashMap<View, ActiveSpringRunner>()
    private val tyRunners = WeakHashMap<View, ActiveSpringRunner>()
    private val popRunners = WeakHashMap<View, ActiveSpringRunner>()

    fun stiffnessForResponse(responseSec: Float): Float {
        val omega = (2.0 * PI) / responseSec.coerceAtLeast(0.08f).toDouble()
        return (omega * omega).toFloat()
    }

    fun projectMomentum(current: Float, velocityPxPerSec: Float, decelRate: Float = 0.998f): Float {
        val d = decelRate.coerceIn(0.90f, 0.9995f)
        return current + (velocityPxPerSec / 1000f) * d / (1f - d)
    }

    fun rubberband(overshoot: Float, dimension: Float, constant: Float = 0.55f): Float {
        val dim = dimension.coerceAtLeast(1f)
        return (overshoot * dim * constant) / (dim + constant * abs(overshoot))
    }

    fun isReducedMotion(context: Context): Boolean =
        MergenPrefs.getAnimationProfile(context) == 2

    fun scaledResponse(context: Context, baseResponseSec: Float): Float =
        when (MergenPrefs.getAnimationProfile(context)) {
            1 -> (baseResponseSec * 0.72f).coerceAtLeast(0.11f)
            2 -> (baseResponseSec * 0.56f).coerceAtLeast(0.09f)
            else -> baseResponseSec.coerceAtLeast(0.12f)
        }

    fun effectiveDamping(context: Context, baseDamping: Float): Float =
        when (MergenPrefs.getAnimationProfile(context)) {
            2 -> 1.0f
            1 -> baseDamping.coerceAtLeast(0.86f)
            else -> baseDamping.coerceIn(0.45f, 1.4f)
        }

    fun cancelTranslationX(view: View) {
        txRunners.remove(view)?.cancel(view)
    }

    fun cancelTranslationY(view: View) {
        tyRunners.remove(view)?.cancel(view)
    }

    fun cancelPop(view: View) {
        popRunners.remove(view)?.cancel(view)
    }

    fun cancelViewSprings(view: View) {
        txRunners.remove(view)?.cancel()
        tyRunners.remove(view)?.cancel()
        popRunners.remove(view)?.cancel()
        MergenMotionBlur.clearEffectOnly(view)
    }

    fun springTranslationX(
        view: View,
        targetX: Float,
        initialVelocityPxPerSec: Float? = null,
        dampingRatio: Float = 0.96f,
        responseSec: Float = 0.28f,
        maxBlurDp: Float = 11f,
        onUpdate: ((currentX: Float) -> Unit)? = null,
        onEnd: (() -> Unit)? = null
    ) {
        val ctx = view.context
        val prevRunner = txRunners.remove(view)
        val carriedVel = prevRunner?.xSpring?.velocity ?: 0f
        prevRunner?.cancel()

        val startX = view.translationX
        val startVel = initialVelocityPxPerSec ?: carriedVel
        val effDamp = effectiveDamping(ctx, dampingRatio)
        val effResp = scaledResponse(ctx, responseSec)

        if (abs(targetX - startX) < 0.5f && abs(startVel) < 4f) {
            view.translationX = targetX
            onUpdate?.invoke(targetX)
            MergenMotionBlur.clearEffectOnly(view)
            onEnd?.invoke()
            return
        }

        val spring = Spring1D(startX, effDamp, stiffnessForResponse(effResp)).apply {
            target = targetX
            velocity = startVel
        }
        val runner = ActiveSpringRunner().apply { xSpring = spring }
        txRunners[view] = runner

        var lastNanos = 0L
        val cb = object : Choreographer.FrameCallback {
            override fun doFrame(frameTimeNanos: Long) {
                if (runner.cancelled || txRunners[view] !== runner) return
                if (!view.isAttachedToWindow && view.parent == null) {
                    txRunners.remove(view, runner)
                    runner.cancel(view)
                    return
                }
                val dt = if (lastNanos == 0L) 1f / 120f else ((frameTimeNanos - lastNanos) / 1_000_000_000f).coerceIn(0.001f, 0.045f)
                lastNanos = frameTimeNanos

                val moving = spring.step(dt, valueEpsilon = 0.35f, velEpsilon = 3.5f)
                view.translationX = spring.value
                onUpdate?.invoke(spring.value)

                if (maxBlurDp > 0.1f && !isReducedMotion(ctx)) {
                    MergenMotionBlur.applyDragVelocityBlur(view, spring.velocity, 0f, maxBlurDp)
                }

                if (moving) {
                    Choreographer.getInstance().postFrameCallback(this)
                } else {
                    txRunners.remove(view, runner)
                    view.translationX = targetX
                    onUpdate?.invoke(targetX)
                    MergenMotionBlur.clearEffectOnly(view)
                    onEnd?.invoke()
                }
            }
        }
        runner.frameCallback = cb
        Choreographer.getInstance().postFrameCallback(cb)
    }

    fun springTranslationY(
        view: View,
        targetY: Float,
        initialVelocityPxPerSec: Float? = null,
        dampingRatio: Float = 0.96f,
        responseSec: Float = 0.28f,
        maxBlurDp: Float = 10f,
        onUpdate: ((currentY: Float) -> Unit)? = null,
        onEnd: (() -> Unit)? = null
    ) {
        val ctx = view.context
        val prevRunner = tyRunners.remove(view)
        val carriedVel = prevRunner?.ySpring?.velocity ?: 0f
        prevRunner?.cancel()

        val startY = view.translationY
        val startVel = initialVelocityPxPerSec ?: carriedVel
        val effDamp = effectiveDamping(ctx, dampingRatio)
        val effResp = scaledResponse(ctx, responseSec)

        if (abs(targetY - startY) < 0.5f && abs(startVel) < 4f) {
            view.translationY = targetY
            onUpdate?.invoke(targetY)
            MergenMotionBlur.clearEffectOnly(view)
            onEnd?.invoke()
            return
        }

        val spring = Spring1D(startY, effDamp, stiffnessForResponse(effResp)).apply {
            target = targetY
            velocity = startVel
        }
        val runner = ActiveSpringRunner().apply { ySpring = spring }
        tyRunners[view] = runner

        var lastNanos = 0L
        val cb = object : Choreographer.FrameCallback {
            override fun doFrame(frameTimeNanos: Long) {
                if (runner.cancelled || tyRunners[view] !== runner) return
                if (!view.isAttachedToWindow && view.parent == null) {
                    tyRunners.remove(view, runner)
                    runner.cancel(view)
                    return
                }
                val dt = if (lastNanos == 0L) 1f / 120f else ((frameTimeNanos - lastNanos) / 1_000_000_000f).coerceIn(0.001f, 0.045f)
                lastNanos = frameTimeNanos

                val moving = spring.step(dt, valueEpsilon = 0.35f, velEpsilon = 3.5f)
                view.translationY = spring.value
                onUpdate?.invoke(spring.value)

                if (maxBlurDp > 0.1f && !isReducedMotion(ctx)) {
                    MergenMotionBlur.applyDragVelocityBlur(view, 0f, spring.velocity, maxBlurDp)
                }

                if (moving) {
                    Choreographer.getInstance().postFrameCallback(this)
                } else {
                    tyRunners.remove(view, runner)
                    view.translationY = targetY
                    onUpdate?.invoke(targetY)
                    MergenMotionBlur.clearEffectOnly(view)
                    onEnd?.invoke()
                }
            }
        }
        runner.frameCallback = cb
        Choreographer.getInstance().postFrameCallback(cb)
    }

    fun springPop(
        view: View,
        fromScaleX: Float? = null,
        fromScaleY: Float? = null,
        toScaleX: Float = 1f,
        toScaleY: Float = 1f,
        fromAlpha: Float? = null,
        toAlpha: Float = 1f,
        dampingRatioX: Float = 0.82f,
        responseX: Float = 0.24f,
        dampingRatioY: Float = 0.82f,
        responseY: Float = 0.24f,
        maxBlurDp: Float = 7f,
        onEnd: (() -> Unit)? = null
    ) {
        val ctx = view.context
        val prevRunner = popRunners.remove(view)
        val velSx = prevRunner?.popSxSpring?.velocity ?: 0f
        val velSy = prevRunner?.popSySpring?.velocity ?: 0f
        val velA = prevRunner?.popAlphaSpring?.velocity ?: 0f
        prevRunner?.cancel()

        val reduced = isReducedMotion(ctx)
        val startSx = if (reduced) toScaleX else (fromScaleX ?: view.scaleX)
        val startSy = if (reduced) toScaleY else (fromScaleY ?: view.scaleY)
        val startA = fromAlpha ?: view.alpha

        view.scaleX = startSx
        view.scaleY = startSy
        view.alpha = startA.coerceIn(0f, 1f)

        val sxSpring = Spring1D(
            startSx,
            effectiveDamping(ctx, dampingRatioX),
            stiffnessForResponse(scaledResponse(ctx, responseX))
        ).apply {
            target = toScaleX
            velocity = if (reduced) 0f else velSx
        }
        val sySpring = Spring1D(
            startSy,
            effectiveDamping(ctx, dampingRatioY),
            stiffnessForResponse(scaledResponse(ctx, responseY))
        ).apply {
            target = toScaleY
            velocity = if (reduced) 0f else velSy
        }
        val alphaSpring = Spring1D(
            startA,
            1.0f,
            stiffnessForResponse(scaledResponse(ctx, minOf(responseX, responseY) * 0.85f))
        ).apply {
            target = toAlpha
            velocity = velA
        }

        val runner = ActiveSpringRunner().apply {
            popSxSpring = sxSpring
            popSySpring = sySpring
            popAlphaSpring = alphaSpring
        }
        popRunners[view] = runner

        var lastNanos = 0L
        val cb = object : Choreographer.FrameCallback {
            override fun doFrame(frameTimeNanos: Long) {
                if (runner.cancelled || popRunners[view] !== runner) return
                if (!view.isAttachedToWindow && view.parent == null) {
                    popRunners.remove(view, runner)
                    runner.cancel(view)
                    return
                }
                val dt = if (lastNanos == 0L) 1f / 120f else ((frameTimeNanos - lastNanos) / 1_000_000_000f).coerceIn(0.001f, 0.045f)
                lastNanos = frameTimeNanos

                val mX = sxSpring.step(dt, valueEpsilon = 0.0015f, velEpsilon = 0.01f)
                val mY = sySpring.step(dt, valueEpsilon = 0.0015f, velEpsilon = 0.01f)
                val mA = alphaSpring.step(dt, valueEpsilon = 0.004f, velEpsilon = 0.02f)

                view.scaleX = sxSpring.value.coerceAtLeast(0.02f)
                view.scaleY = sySpring.value.coerceAtLeast(0.02f)
                view.alpha = alphaSpring.value.coerceIn(0f, 1f)

                if (maxBlurDp > 0.1f && !reduced) {
                    val rate = (abs(sxSpring.velocity) + abs(sySpring.velocity)) * 0.5f
                    MergenMotionBlur.applyDragVelocityBlur(view, rate * 360f, rate * 360f, maxBlurDp)
                }

                if (mX || mY || mA) {
                    Choreographer.getInstance().postFrameCallback(this)
                } else {
                    popRunners.remove(view, runner)
                    view.scaleX = toScaleX
                    view.scaleY = toScaleY
                    view.alpha = toAlpha.coerceIn(0f, 1f)
                    MergenMotionBlur.clearEffectOnly(view)
                    onEnd?.invoke()
                }
            }
        }
        runner.frameCallback = cb
        Choreographer.getInstance().postFrameCallback(cb)
    }

    @SuppressLint("ClickableViewAccessibility")
    fun attachSpringPress(view: View, pressedScale: Float = 0.94f) {
        view.setOnTouchListener { v, ev ->
            when (ev.actionMasked) {
                MotionEvent.ACTION_DOWN -> {
                    springPop(
                        view = v,
                        toScaleX = pressedScale,
                        toScaleY = pressedScale,
                        toAlpha = 0.90f,
                        dampingRatioX = 1.0f,
                        responseX = 0.13f,
                        dampingRatioY = 1.0f,
                        responseY = 0.13f,
                        maxBlurDp = 0f
                    )
                }
                MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> {
                    springPop(
                        view = v,
                        toScaleX = 1f,
                        toScaleY = 1f,
                        toAlpha = 1f,
                        dampingRatioX = 0.72f,
                        responseX = 0.22f,
                        dampingRatioY = 0.72f,
                        responseY = 0.22f,
                        maxBlurDp = 0f
                    )
                }
            }
            false
        }
    }
}
