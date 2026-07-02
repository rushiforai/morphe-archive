/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/strava/privacy/BlockSnowplowTrackingPatch.kt
 */
package app.morphe.patches.strava.privacy

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val blockSnowplowTrackingPatch = bytecodePatch(
    name = "Block Snowplow tracking",
    description = "Blocks Snowplow analytics. See https://snowplow.io for more information.",
) {
    compatibleWith(AppCompatibilities.STRAVA)

    execute {
        // Keep events list empty, otherwise sent to https://c.strava.com/com.snowplowanalytics.snowplow/tp2.
        InsertEventFingerprint.method.returnEarly()
    }
}

