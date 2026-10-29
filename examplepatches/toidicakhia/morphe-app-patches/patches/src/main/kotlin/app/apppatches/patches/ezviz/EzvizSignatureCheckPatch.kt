package app.apppatches.patches.ezviz

import app.apppatches.patches.shared.Constants.EZVIZ_COMPATIBILITY
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ORIGINAL_SIGNATURE_HASH = 0x14ddad3d

@Suppress("unused")
val ezvizSignatureCheckPatch = bytecodePatch(
    name = "Bypass Signature Check",
    description = "Skips the repack signature hash check in LoadingActivity that closes the app before it " +
        "can start.",
    default = true
) {
    compatibleWith(EZVIZ_COMPATIBILITY)

    execute {
        EzvizSignatureCheckFingerprint.match().method.apply {
            val implementation = implementation
                ?: throw PatchException("LoadingActivity.onCreate has no implementation")
            val instructions = implementation.instructions

            val hashCodeCallIndex = instructions.indexOfFirst { instruction ->
                instruction is ReferenceInstruction &&
                    (instruction.reference as? MethodReference)?.let { reference ->
                        reference.definingClass == "Landroid/content/pm/Signature;" &&
                            reference.name == "hashCode"
                    } == true
            }
            if (hashCodeCallIndex == -1) {
                throw PatchException("Could not find the signature hashCode call")
            }

            val hashConstantIndex = (hashCodeCallIndex + 1 until instructions.size).firstOrNull { index ->
                (instructions[index] as? NarrowLiteralInstruction)?.narrowLiteral == ORIGINAL_SIGNATURE_HASH
            } ?: throw PatchException("Could not find the original signature hash constant")

            val branchIndex = (hashConstantIndex + 1 until instructions.size).firstOrNull { index ->
                (instructions[index] as? BuilderInstruction22t)?.opcode == Opcode.IF_EQ
            } ?: throw PatchException("Could not find the signature hash comparison")

            val successLabel = (instructions[branchIndex] as BuilderInstruction22t).target
            replaceInstruction(branchIndex, BuilderInstruction30t(Opcode.GOTO_32, successLabel))
        }
    }
}
