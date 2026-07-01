/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/cricbuzz/ads/DisableAdsPatch.kt
 */
package app.morphe.patches.cricbuzz.ads

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Hide ads",
) {
    compatibleWith(AppCompatibilities.CRICBUZZ)

    execute {
        // Force user state to a value that disables ads.
        UserStateSwitchFingerprint.method.returnEarly(true)

        // Remove region-specific Cricbuzz11 elements.
        Cb11ConstructorFingerprint.method.addInstruction(0, "const/4 p7, 0x0")
        // Note: We intentionally skip the extension-based filterCb11() hook here,
        // to avoid requiring an external extensions/cricbuzz.mpe file.
    }
}

