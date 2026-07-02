/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/bandcamp/limitations/RemovePlayLimitsPatch.kt
 */
package app.morphe.patches.bandcamp.limitations

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val removePlayLimitsPatch = bytecodePatch(
    name = "Remove play limits",
    description = "Disables purchase nagging and playback limits of not purchased tracks.",
) {
    compatibleWith(AppCompatibilities.BANDCAMP)

    execute {
        HandlePlaybackLimitsFingerprint.method.returnEarly()
    }
}

