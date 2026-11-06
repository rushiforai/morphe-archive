/**
 * Adapted from De-Vanced's Icon Pack Studio patch
 * https://github.com/RookieEnough/De-Vanced
 * which in turn forked ReVanced Patches (GPL-3.0)
 * https://github.com/ReVanced/revanced-patches
 */

package app.mrcool.patches.iconpackstudio.pro

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.mrcool.patches.iconpackstudio.iconPackStudio

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks Pro features that normally require a purchase."
) {
    compatibleWith(iconPackStudio)

    execute {
        // The check ORs the lifetime, subscription, and FX pack purchase flags.
        // Force it to report the paid state; the original stores are untouched.
        CheckProFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
    }
}
