/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/photomath/misc/unlock/plus/UnlockPlusPatch.kt
 */
package app.morphe.patches.photomath.misc.unlock.plus

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.photomath.detection.signature.signatureDetectionPatch
import app.morphe.patches.photomath.misc.unlock.bookpoint.enableBookpointPatch

@Suppress("unused")
val unlockPlusPatch = bytecodePatch(
    name = "Unlock plus",
) {
    dependsOn(signatureDetectionPatch, enableBookpointPatch)

    compatibleWith(AppCompatibilities.PHOTOMATH)

    execute {
        IsPlusUnlockedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
    }
}

