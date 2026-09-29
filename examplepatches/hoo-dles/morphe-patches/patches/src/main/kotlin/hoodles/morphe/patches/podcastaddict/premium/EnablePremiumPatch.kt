/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.podcastaddict.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import hoodles.morphe.compatibility.Compat

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(Compat.PODCAST_ADDICT)

    execute {
        HasPremiumFingerprint.method.returnEarly(true)
        IsValidSignatureFingerprint.method.returnEarly(true)
        IsValidPackageSourceFingerprint.method.returnEarly(true)
    }
}