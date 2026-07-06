/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/soundcloud/analytics/DisableTelemetryPatch.kt
 */
package app.morphe.patches.soundcloud.analytics

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables SoundCloud's telemetry system.",
) {
    compatibleWith(AppCompatibilities.SOUNDCLOUD)

    execute {
        // Empty the "backend" argument to abort the initializer.
        CreateTrackingApiFingerprint.method.addInstruction(0, "const-string p1, \"\"")
    }
}

