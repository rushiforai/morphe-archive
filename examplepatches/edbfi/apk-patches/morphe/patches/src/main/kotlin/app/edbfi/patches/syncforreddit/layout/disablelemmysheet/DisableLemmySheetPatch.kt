// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.layout.disablelemmysheet

import app.edbfi.patches.syncforreddit.SYNC_FOR_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.matchSingle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// The helper that shows a bottom sheet given its class.
private val SHOW_SHEET_PARAMETERS = listOf("Ljava/lang/Class;", "Landroidx/fragment/app/FragmentManager;")

@Suppress("unused")
val disableLemmySheetPatch =
    patch(
        name = "Disable Sync for Lemmy bottom sheet",
        description = "Removes the Sync for Lemmy promotion that shows at every start.",
        default = true,
    ) {
        compatibleWith(SYNC_FOR_REDDIT)

        execute {
            val sheet = LemmySheetButtonFingerprint.matchSingle().originalMethod.definingClass
            val onCreate = MainActivityOnCreateFingerprint(sheet).matchSingle().method
            val code = onCreate.instructions.toList()

            val sheetClass =
                code.indices.singleOrNull { i -> code[i].opcode == Opcode.CONST_CLASS && code[i].getReference<TypeReference>()?.type == sheet }
                    ?: throw PatchException("Expected one const-class $sheet in MainActivity.onCreate")
            val classRegister = (code[sheetClass] as OneRegisterInstruction).registerA

            // The class goes to the show-sheet helper in the same straight-line code: no branch in or out, and no write
            // to its register in between. Removing that call leaves nothing else to undo.
            val shows =
                (sheetClass + 1 until code.size)
                    .takeWhile { i ->
                        code[i].location.labels.isEmpty() &&
                            code[i].opcode.canContinue() &&
                            code[i] !is OffsetInstruction &&
                            !code[i].writes(classRegister)
                    }
                    .filter { i ->
                        val reference = code[i].getReference<MethodReference>()
                        code[i].opcode == Opcode.INVOKE_STATIC &&
                            (code[i] as FiveRegisterInstruction).registerC == classRegister &&
                            reference?.returnType == "V" &&
                            reference.parameterTypes.map { it.toString() } == SHOW_SHEET_PARAMETERS
                    }
            val show = shows.singleOrNull() ?: throw PatchException("Expected one call that shows $sheet, found ${shows.size}")
            onCreate.removeInstruction(show)
        }
    }

private fun Instruction.writes(register: Int): Boolean {
    val target = (this as? OneRegisterInstruction)?.registerA ?: return false
    return (opcode.setsRegister() && target == register) || (opcode.setsWideRegister() && target + 1 == register)
}
