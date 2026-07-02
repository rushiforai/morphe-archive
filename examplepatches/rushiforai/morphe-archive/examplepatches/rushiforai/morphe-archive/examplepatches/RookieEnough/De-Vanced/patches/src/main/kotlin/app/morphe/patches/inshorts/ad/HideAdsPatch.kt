/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/inshorts/ad/HideAdsPatch.kt
 */
package app.morphe.patches.inshorts.ad

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
) {
    compatibleWith(AppCompatibilities.INSHORTS)

    execute {
        InshortsAdsFingerprint.method.addInstruction(
            0,
            "return-void",
        )
    }
}
