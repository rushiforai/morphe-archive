package app.zdrgon.patches.timemark.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.timemark.shared.Constants.COMPATIBILITY_TIMEMARK

/**
 * Timemark v10.0.316 — Use device date/time.
 *
 * The watermark clock reads TimeUtils.getExactTime(), but TimeUtils itself
 * lives in the SecNeo-encrypted payload (assets/dexdata4) and is not defined
 * in any dex the patcher can scan, so it cannot be fingerprinted directly.
 *
 * The visible accessor is Ly50/d;->B()J: its return value is the
 * getExactTime() timestamp (it builds the capture-info bean with that value
 * and returns the bean's timestamp field), and every watermark formatting
 * path in Ly50/d; reads the time through B(). Pinning B() to
 * System.currentTimeMillis() makes the stamp show device wall time instead
 * of the frozen verified-time default (1970-12-01 GMT+08) that re-signed
 * builds fall back to.
 */
private object WatermarkClockFingerprint : Fingerprint(
    returnType = "J",
    parameters = listOf(),
    definingClass = "Ly50/d;",
    name = "B"
)

@Suppress("unused")
val useDeviceDateTimePatch = bytecodePatch(
    name = "Use device date & time",
    description = "Uses Android's current device time instead of Timemark's network-synchronized timestamp for the watermark clock.",
    default = false
) {
    compatibleWith(COMPATIBILITY_TIMEMARK)

    execute {
        WatermarkClockFingerprint.method.addInstructions(
            0,
            """
                invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
                move-result-wide v0
                return-wide v0
            """.trimIndent()
        )
    }
}
