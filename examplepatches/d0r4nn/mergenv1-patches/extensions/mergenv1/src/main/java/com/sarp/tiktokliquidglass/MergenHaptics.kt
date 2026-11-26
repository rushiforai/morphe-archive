package com.sarp.tiktokliquidglass

import android.content.Context
import android.os.VibrationEffect
import android.os.Vibrator
import android.os.VibratorManager

/**
 * Tactile haptic language engine tailored for modern Galaxy linear motors (Android 13+).
 */
object MergenHaptics {

    private fun vibrator(context: Context): Vibrator? {
        return try {
            val vm = context.applicationContext.getSystemService(Context.VIBRATOR_MANAGER_SERVICE) as? VibratorManager
            val v = vm?.defaultVibrator
            if (v != null && v.hasVibrator()) v else null
        } catch (_: Throwable) {
            null
        }
    }

    private fun shouldPlay(context: Context, bypassGate: Boolean): Boolean {
        if (bypassGate) return true
        return MergenPrefs.isModEffectivelyActive(context) && MergenPrefs.isHapticsEnabled(context)
    }

    fun playTap(context: Context) {
        if (!shouldPlay(context, bypassGate = false)) return
        playPrimitives(
            context,
            intArrayOf(VibrationEffect.Composition.PRIMITIVE_CLICK),
            floatArrayOf(0.45f),
            intArrayOf(0),
            fallbackMs = 12L,
            fallbackAmp = 100
        )
    }

    fun playTick(context: Context) {
        if (!shouldPlay(context, bypassGate = false)) return
        playPrimitives(
            context,
            intArrayOf(VibrationEffect.Composition.PRIMITIVE_TICK),
            floatArrayOf(0.35f),
            intArrayOf(0),
            fallbackMs = 8L,
            fallbackAmp = 70
        )
    }

    fun playToggle(context: Context, enabled: Boolean, bypassGate: Boolean = false) {
        if (!shouldPlay(context, bypassGate)) return
        if (enabled) {
            playPrimitives(
                context,
                intArrayOf(
                    VibrationEffect.Composition.PRIMITIVE_LOW_TICK,
                    VibrationEffect.Composition.PRIMITIVE_CLICK
                ),
                floatArrayOf(0.35f, 0.55f),
                intArrayOf(0, 28),
                fallbackMs = 18L,
                fallbackAmp = 130
            )
        } else {
            playPrimitives(
                context,
                intArrayOf(VibrationEffect.Composition.PRIMITIVE_LOW_TICK),
                floatArrayOf(0.38f),
                intArrayOf(0),
                fallbackMs = 10L,
                fallbackAmp = 80
            )
        }
    }

    fun playSnap(context: Context) {
        if (!shouldPlay(context, bypassGate = false)) return
        playPrimitives(
            context,
            intArrayOf(
                VibrationEffect.Composition.PRIMITIVE_QUICK_RISE,
                VibrationEffect.Composition.PRIMITIVE_CLICK
            ),
            floatArrayOf(0.35f, 0.50f),
            intArrayOf(0, 22),
            fallbackMs = 16L,
            fallbackAmp = 120
        )
    }

    fun playSuccess(context: Context) {
        if (!shouldPlay(context, bypassGate = true)) return
        playPrimitives(
            context,
            intArrayOf(
                VibrationEffect.Composition.PRIMITIVE_TICK,
                VibrationEffect.Composition.PRIMITIVE_CLICK,
                VibrationEffect.Composition.PRIMITIVE_QUICK_RISE
            ),
            floatArrayOf(0.40f, 0.55f, 0.65f),
            intArrayOf(0, 35, 30),
            fallbackMs = 28L,
            fallbackAmp = 160
        )
    }

    fun playError(context: Context) {
        if (!shouldPlay(context, bypassGate = true)) return
        try {
            val v = vibrator(context) ?: return
            v.vibrate(
                VibrationEffect.createWaveform(
                    longArrayOf(0L, 24L, 55L, 28L),
                    intArrayOf(0, 140, 0, 160),
                    -1
                )
            )
        } catch (_: Throwable) {
        }
    }

    private fun playPrimitives(
        context: Context,
        primitives: IntArray,
        scales: FloatArray,
        delays: IntArray,
        fallbackMs: Long,
        fallbackAmp: Int
    ) {
        try {
            val v = vibrator(context) ?: return
            if (v.areAllPrimitivesSupported(*primitives)) {
                val comp = VibrationEffect.startComposition()
                for (i in primitives.indices) {
                    comp.addPrimitive(primitives[i], scales[i], delays[i])
                }
                v.vibrate(comp.compose())
            } else {
                v.vibrate(VibrationEffect.createOneShot(fallbackMs, fallbackAmp))
            }
        } catch (_: Throwable) {
        }
    }
}
