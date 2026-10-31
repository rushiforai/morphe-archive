package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Bigger speedometer and speed-limit sign (opt-in, default off).
 *
 * The speedometer cluster is inflated from `res/layout/speedometer.xml`: a 110dp FrameLayout holding
 * the coloured ring, the speed number (26dp), the unit (12dp), and - as its own child - the limit
 * sign (40dp text in a wrap_content FrameLayout). Sizes are hardcoded dp, so there is no scale value
 * to turn; this patch scales the views at runtime instead.
 *
 * Two independent factors:
 *  - `com/waze/main_screen/floating_buttons/b/e` field `a` is the cluster root. Scaling it scales
 *    ring + number + unit + sign together, pivoting on its bottom-left corner so it grows up and to
 *    the right from where it already sits.
 *  - Field `d` is the sign's own container. It is counter-scaled by (sign / dial), so its final
 *    visual size follows the sign option alone; pivot is its bottom-right corner, which keeps it
 *    pinned where Waze put it.
 *
 * The host FrameLayout (`e`, also the class the fields live on) gets clipChildren/clipToPadding off,
 * otherwise the enlarged cluster is cut at the stock 110dp bounds.
 *
 * Injected at the head of the cluster's show method `g()`, which Waze calls when the speedometer is
 * made visible and again on later shows. That method has 7 registers (p0 in v6), which matters
 * because the patcher's smali compiler only resolves `p0` up to v15 - the update method `h(...)`
 * holds `this` in v41 and its injected block was silently truncated there.
 *
 * Verified targets: 5.25.0.1 and 5.25.90.900 - fields `a`/`d` and methods `g()`/`h(...)` are
 * identical on both; only `h`'s argument class letter shifts (`bv/i` -> `bw/i`).
 */
private val SpeedometerUpdateFingerprint = Fingerprint(
    definingClass = "Lcom/waze/main_screen/floating_buttons/b/e;",
    name = "g",
    returnType = "V",
)

/** Raw IEEE-754 bits as a smali `const` literal. */
private fun floatBits(value: Float): String =
    "0x%08x".format(java.lang.Float.floatToRawIntBits(value).toLong() and 0xffffffffL)

/** Density-corrected pivot for [dp], left in v1; [view] must already be in v0. */
private fun pivot(dp: Float, axis: String) = buildString {
    appendLine("invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;")
    appendLine("move-result-object v1")
    appendLine("invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;")
    appendLine("move-result-object v1")
    appendLine("iget v1, v1, Landroid/util/DisplayMetrics;->density:F")
    appendLine("const v2, ${floatBits(dp)}")
    appendLine("mul-float/2addr v1, v2")
    appendLine("invoke-virtual {v0, v1}, Landroid/view/View;->setPivot$axis(F)V")
}

/**
 * Scale block. The dial scales the whole cluster; the sign is counter-scaled so it ends up at its
 * own factor regardless of the dial's.
 */
private fun scaleBlock(dial: Float, sign: Float) = buildString {
    val counter = sign / dial
    // Dial: root view, pivot bottom-left (stock cluster is 110dp square).
    appendLine("iget-object v0, p0, Lcom/waze/main_screen/floating_buttons/b/e;->a:Landroid/view/View;")
    appendLine("const/4 v1, 0x0")
    appendLine("int-to-float v1, v1")
    appendLine("invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V")
    append(pivot(110f, "Y"))
    appendLine("const v2, ${floatBits(dial)}")
    appendLine("invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V")
    appendLine("invoke-virtual {v0, v2}, Landroid/view/View;->setScaleY(F)V")
    // Sign: its own container, pivot bottom-right (stock sign is a 40dp square).
    appendLine("iget-object v0, p0, Lcom/waze/main_screen/floating_buttons/b/e;->d:Landroid/view/View;")
    append(pivot(40f, "X"))
    append(pivot(40f, "Y"))
    appendLine("const v2, ${floatBits(counter)}")
    appendLine("invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V")
    appendLine("invoke-virtual {v0, v2}, Landroid/view/View;->setScaleY(F)V")
    // The stock bounds are 110dp; let the cluster draw outside them.
    appendLine("const/4 v1, 0x0")
    appendLine("invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V")
    appendLine("invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V")
}

@Suppress("unused")
val speedometerScalePatch = bytecodePatch(
    name = "Speedometer & limit sign",
    description = "Size of the speedometer and limit sign, and keeps them on screen.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("UI Customization")

    // Without the emitter patch the keys recorded below are never written, so ticking this row on
    // its own would produce a build with no override at all.
    dependsOn(configOverridesPatch)

    val always by booleanOption(
        "always", true,
        title = "Always show speedometer",
        description = "Keeps the speedometer on screen from the first drive. Stock: appears after a few sessions.",
    )

    val dial by stringOption(
        "dial", "1.0x",
        mapOf(
            "1.0 (stock)" to "1.0x",
            "1.15x" to "1.15x",
            "1.3x" to "1.3x",
            "1.5x" to "1.5x",
            "2.0x" to "2.0x",
        ),
        title = "Speedometer size",
        description = "Ring, speed number and unit.",
    )

    val sign by stringOption(
        "sign", "1.0x",
        mapOf(
            "1.0 (stock)" to "1.0x",
            "1.15x" to "1.15x",
            "1.3x" to "1.3x",
            "1.5x" to "1.5x",
            "2.0x" to "2.0x",
        ),
        title = "Speed limit sign size",
        description = "The limit sign next to the speedometer.",
    )

    execute {
        if (always == true) {
            recordBoolean("spd", true, "CONFIG_VALUE_MAP_SHOW_SPEEDOMETER")
            recordLong("spd", "CONFIG_VALUE_MAP_SPEEDOMETER_MIN_SPEED_KPH" to 0L)
            recordLong("spd", "CONFIG_VALUE_MAP_SHOW_SPEEDOMETER_AFTER_NUM_SESSIONS" to 2_147_483_647L)
        }
        val dialScale = (dial ?: "1.0x").removeSuffix("x").toFloat()
        val signScale = (sign ?: "1.0x").removeSuffix("x").toFloat()
        if (dialScale == 1f && signScale == 1f) {
            println("speedometerScalePatch: both at stock size, always-on = ${if (always == true) "on" else "off"}")
            return@execute
        }
        val method = SpeedometerUpdateFingerprint.method
        method.implementation
            ?: error("speedometerScalePatch: speedometer update method found but has no body")
        method.addInstructions(0, scaleBlock(dialScale, signScale))
        println("speedometerScalePatch: dial ${dialScale}x, sign ${signScale}x")
    }
}
