/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.soundcloud.misc.telemetry

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import hoodles.morphe.compatibility.Compat

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables SoundCloud's telemetry system."
) {
    compatibleWith(Compat.SOUNDCLOUD)

    execute {
        HandleMessageFingerprint.method.returnEarly()
    }
}