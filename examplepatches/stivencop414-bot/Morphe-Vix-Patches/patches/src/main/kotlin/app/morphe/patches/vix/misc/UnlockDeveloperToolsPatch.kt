package app.morphe.patches.vix.misc

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val unlockDeveloperToolsPatch = patch(
    name = "Unlock Developer Tools",
    description = "Bypasses the passcode gate for ViX's hidden Developer Tools menu. " +
        "Tap the app version 6 times in Settings to open it.",
    default = true,
) {
    category("Misc")
    compatibleWith(*AppCompatibilities.vix())

    execute {
        DevToolsPasscodePromptFingerprint.method.apply {
            val firstOpcode = instructions.firstOrNull()?.opcode
            if (firstOpcode != Opcode.IF_EQZ) {
                throw PatchException("Unexpected entry opcode $firstOpcode in $definingClass->$name")
            }
            removeInstruction(0)
        }

        DevToolsPasscodeVerifyFingerprint.method.apply {
            val insns = instructions.toList()
            val equalsIndex = insns.indexOfFirst { insn ->
                val ref = insn.getReference<MethodReference>()
                ref?.definingClass == "Lkotlin/jvm/internal/Intrinsics;" && ref.name == "areEqual"
            }
            if (equalsIndex < 0 || equalsIndex + 2 >= insns.size) {
                throw PatchException("Passcode equality check not found in $definingClass->$name")
            }
            if (insns[equalsIndex + 1].opcode != Opcode.MOVE_RESULT ||
                insns[equalsIndex + 2].opcode != Opcode.IF_EQZ
            ) {
                throw PatchException(
                    "Unexpected bytecode after Intrinsics.areEqual in $definingClass->$name: " +
                        "${insns[equalsIndex + 1].opcode}, ${insns[equalsIndex + 2].opcode}",
                )
            }
            removeInstruction(equalsIndex + 2)
        }
    }
}
