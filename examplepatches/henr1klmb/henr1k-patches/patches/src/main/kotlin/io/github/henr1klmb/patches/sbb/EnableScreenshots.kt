package io.github.henr1klmb.patches.sbb

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val enableScreenshotsPatch = patch(
    name = "Enable screenshots",
    description = "Allows taking screenshots and screen recordings.",
) {
    compatibleWith(SBB_COMPATIBILITY)

    execute {
        val method = DatatransSecureDialogFingerprint.method
        val index = method.implementation?.instructions?.indexOfFirst {
            it.opcode == Opcode.CONST_16
        } ?: -1
        if (index != -1) {
            method.replaceInstruction(index, "const/4 v0, 0x0")
        }
    }
}
