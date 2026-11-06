package app.template.patches.smartnews.share

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SMARTNEWS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val popupShareMenuPatch = bytecodePatch(
    name = "Popup share menu",
    description = "Restores the legacy popup share menu when tapping the top-right share button, replacing the default system share sheet (identical to the menu used in web mode).",
    default = true
) {
    compatibleWith(COMPATIBILITY_SMARTNEWS)

    execute {
        val method = ArticleContainerShareMenuFingerprint.method
        val impl = method.implementation ?: return@execute
        val instructions = impl.instructions

        // Find the first IF_EQZ instruction (which checks whether to inflate the bottom sheet)
        val targetIndex = instructions.indexOfFirst { it.opcode == Opcode.IF_EQZ }
        if (targetIndex != -1) {
            val ifEqzInst = instructions.elementAt(targetIndex) as? OneRegisterInstruction
            val reg = ifEqzInst?.registerA ?: 1

            // Force the tested register to 0x0, guaranteeing the branch to the PopupMenu path is taken
            method.addInstruction(targetIndex, "const/4 v$reg, 0x0")
        }
    }
}
