// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.layout.disablelemmysheet

import app.edbfi.patches.syncforreddit.SYNC_PACKAGE
import app.edbfi.patches.syncforreddit.SYNC_VERSION
import app.revanced.patcher.extensions.instructions
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.extensions.removeInstruction
import app.revanced.patcher.extensions.type
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

// The helper that shows a bottom sheet given its class.
private val SHOW_SHEET_PARAMETERS = listOf("Ljava/lang/Class;", "Landroidx/fragment/app/FragmentManager;")

@Suppress("unused")
val disableLemmySheetPatch =
    bytecodePatch(
        name = "Disable Sync for Lemmy bottom sheet",
        description = "Removes the Sync for Lemmy promotion that shows at every start.",
    ) {
        compatibleWith(SYNC_PACKAGE(SYNC_VERSION))

        apply {
            val sheet = lemmySheetButtonMethod().definingClass
            val onCreate = mainActivityOnCreateMethod(sheet)
            val code = onCreate.instructions.toList()

            val sheetClass =
                code.indices.singleOrNull { i -> code[i].opcode == Opcode.CONST_CLASS && code[i].type == sheet }
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
                        val reference = code[i].methodReference
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
