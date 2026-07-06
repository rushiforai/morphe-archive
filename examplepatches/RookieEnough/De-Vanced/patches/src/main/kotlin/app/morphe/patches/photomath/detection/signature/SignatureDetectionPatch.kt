/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/photomath/detection/signature/SignatureDetectionPatch.kt
 */
package app.morphe.patches.photomath.detection.signature

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val signatureDetectionPatch = bytecodePatch(
    description = "Disables detection of incorrect signature.",
) {

    execute {
        val replacementIndex = CheckSignatureFingerprint.instructionMatches.last().index
        val checkRegister =
            CheckSignatureFingerprint.method.getInstruction<OneRegisterInstruction>(replacementIndex).registerA
        CheckSignatureFingerprint.method.replaceInstruction(
            replacementIndex,
            "const/4 v$checkRegister, 0x1",
        )
    }
}

