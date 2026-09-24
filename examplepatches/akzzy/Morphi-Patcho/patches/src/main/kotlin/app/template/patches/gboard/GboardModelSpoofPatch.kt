package app.template.patches.gboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val gboardModelSpoofPatch = bytecodePatch(
    name = "Gboard Model Spoof (Pixel 9 Pro)",
    description = "將 Gboard 內部讀取的裝置型號與產品名稱改為 Pixel 9 Pro，藉此解除 Pixel 8 等舊裝置的官方限制。\nSpoof Gboard's device model, device name, and product name to Pixel 9 Pro to bypass model restrictions natively.",
    default = false
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            mutableClass.methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                val instructions = implementation.instructions

                var index = 0
                while (index < instructions.size) {
                    val instruction = instructions[index]
                    if (instruction.opcode == Opcode.SGET_OBJECT) {
                        val refInst = instruction as? ReferenceInstruction
                        val fieldRef = refInst?.reference as? FieldReference

                        if (fieldRef?.definingClass == "Landroid/os/Build;") {
                            val register = (instruction as OneRegisterInstruction).registerA
                            val value = when (fieldRef.name) {
                                "MODEL" -> "Pixel 9 Pro"
                                "DEVICE" -> "caiman"
                                "PRODUCT" -> "caiman"
                                "BOARD" -> "caiman"
                                else -> null
                            }
                            if (value != null) {
                                method.addInstructions(index, "const-string v$register, \"$value\"")
                                method.removeInstruction(index + 1)
                            }
                        }
                    }
                    index++
                }
            }
        }
    }
}
