package app.template.patches.bplace

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.fieldAccess

val removeCameraPermissionRequestPatch = bytecodePatch(
    name = "Remove unnecessary camera permission request",
    description = "Prevents the file picker from proactively requesting CAMERA permission.",
    default = true
) {
    compatibleWith(Compatibility(
            name = "Better Place",
            packageName = "com.bplace",
            appIconColor = 0x2196f2,
            targets = listOf(AppTarget(null), AppTarget("1.0.7"))
        ))

 execute {
        OnShowFileChooserFingerprint.let {
            it.method.apply {
                // instructionMatches[1] = the methodCall match; the move-result follows immediately after
                val checkCallIndex = it.instructionMatches[1].index
                val moveResultIndex = checkCallIndex + 1
                val register = getInstruction<OneRegisterInstruction>(moveResultIndex).registerA

                replaceInstruction(moveResultIndex, "const/4 v$register, 0x0")
            }
        }
    }
}