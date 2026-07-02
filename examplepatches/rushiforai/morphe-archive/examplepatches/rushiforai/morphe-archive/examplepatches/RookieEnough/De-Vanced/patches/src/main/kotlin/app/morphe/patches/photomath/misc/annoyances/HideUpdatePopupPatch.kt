/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/photomath/misc/annoyances/HideUpdatePopupPatch.kt
 */
package app.morphe.patches.photomath.misc.annoyances

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.photomath.detection.signature.signatureDetectionPatch

@Suppress("unused")
val hideUpdatePopupPatch = bytecodePatch(
    name = "Hide update popup",
    description = "Prevents the update popup from showing up.",
) {
    dependsOn(signatureDetectionPatch)

    compatibleWith(AppCompatibilities.PHOTOMATH)

    execute {
        HideUpdatePopupFingerprint.method.addInstructions(
            2, // Insert after the null check.
            "return-void",
        )
    }
}

