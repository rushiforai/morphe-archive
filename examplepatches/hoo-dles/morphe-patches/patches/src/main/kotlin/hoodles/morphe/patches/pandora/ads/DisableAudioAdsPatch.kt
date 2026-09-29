/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.pandora.ads

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import hoodles.morphe.compatibility.Compat

@Suppress("unused")
val disableAudioAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables ads during audio streaming."
) {
    compatibleWith(Compat.PANDORA)

    execute {
        GetIsAdSupportedFingerprint.method.returnEarly(false)
        RequestAudioAdFingerprint.method.returnEarly()
    }
}
