package morningentree.morphe.patches.all.misc.clipboard

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val CLIPBOARD_MANAGER = "Landroid/content/ClipboardManager;"

@Suppress("unused")
val disableClipboardAccessPatch = bytecodePatch(
    name = "Disable clipboard access",
    description = "Blocks apps from clipboard access",
    default = false,
) {
    execute {
        classDefForEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.instructionsOrNull?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@forEachIndexed
                    if (reference.definingClass != CLIPBOARD_MANAGER) return@forEachIndexed
                    when {
                        reference.name in setOf("setPrimaryClip", "setText") && reference.returnType == "V" ->
                            method.replaceInstruction(index, "nop")

                        reference.name == "hasPrimaryClip" && reference.returnType == "Z" -> {
                            val move = instructions.getOrNull(index + 1) as? OneRegisterInstruction
                                ?: return@forEachIndexed
                            if (move.opcode == Opcode.MOVE_RESULT) {
                                method.replaceInstruction(index + 1, "const/4 v${move.registerA}, 0x0")
                            }
                        }

                        reference.name in setOf("getPrimaryClip", "getText", "getPrimaryClipDescription") -> {
                            val move = instructions.getOrNull(index + 1) as? OneRegisterInstruction
                                ?: return@forEachIndexed
                            if (move.opcode == Opcode.MOVE_RESULT_OBJECT) {
                                method.replaceInstruction(index + 1, "const/4 v${move.registerA}, 0x0")
                            }
                        }
                    }
                }
            }
        }
    }
}
