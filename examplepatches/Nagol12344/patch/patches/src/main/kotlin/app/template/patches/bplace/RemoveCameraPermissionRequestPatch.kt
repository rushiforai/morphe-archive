package app.template.patches.bplace

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

val removeCameraPermissionRequestPatch = bytecodePatch(
    name = "Remove unnecessary camera permission request",
    description = "Prevents the file picker from requesting CAMERA permission or forcing camera capture.",
    default = true
) {
    compatibleWith(Compatibility(
            name = "Better Place",
            packageName = "com.bplace",
            appIconColor = 0x2196f2,
            targets = listOf(AppTarget(null), AppTarget("1.0.7"))
        ))

    execute {
        val chooserMatch = OpenFileChooserFingerprint.match()
        val chooserMethod = chooserMatch.method
        val captureCallIndex = chooserMatch.instructionMatches.single().index
        val captureResult = chooserMethod
            .getInstruction<OneRegisterInstruction>(captureCallIndex + 1)

        if (captureResult.opcode == Opcode.MOVE_RESULT) {
            chooserMethod.replaceInstruction(
                captureCallIndex + 1,
                "const/4 v${captureResult.registerA}, 0x0"
            )
        } else {
            check(captureResult.opcode == Opcode.CONST_4) {
                "Unexpected isCaptureEnabled result in ${chooserMethod.definingClass}."
            }
        }

        val fileChooserMatch = OnShowFileChooserFingerprint.match()
        val fileChooserMethod = fileChooserMatch.method
        val permissionCallIndex = fileChooserMatch.instructionMatches[1].index
        val permissionResult = fileChooserMethod
            .getInstruction<OneRegisterInstruction>(permissionCallIndex + 1)

        if (permissionResult.opcode == Opcode.MOVE_RESULT) {
            fileChooserMethod.replaceInstruction(
                permissionCallIndex + 1,
                "const/4 v${permissionResult.registerA}, 0x0"
            )
        } else {
            check(permissionResult.opcode == Opcode.CONST_4) {
                "Unexpected CAMERA permission result in ${fileChooserMethod.definingClass}."
            }
        }
    }
}
