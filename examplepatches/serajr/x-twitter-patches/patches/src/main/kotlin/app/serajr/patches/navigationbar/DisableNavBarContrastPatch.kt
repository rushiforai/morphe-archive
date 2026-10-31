package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.serajr.patches.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

@Suppress("unused")
val disableNavBarContrastPatch = bytecodePatch(
    name = "Disable Navigation Bar Contrast",
    description = "Disables automatic navigation bar contrast in AndroidX and X.",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    execute {
        val targets = mapOf(
            "Landroidx/activity/x;" to "b",
            "Landroidx/activity/z;" to "b",
            "Lcom/x/ui/common/ports/z;" to "d"
        )

        val methods = mutableListOf<Method>()

        classDefForEach { classDef ->
            val name = targets[classDef.type.toString()] ?: return@classDefForEach

            methods += classDef.methods.filter { method ->
                method.name == name &&
                    method.returnType == "V" &&
                    method.parameterTypes.map { it.toString() } ==
                    if (name == "d") {
                        listOf("Landroid/view/Window;")
                    } else {
                        listOf(
                            "Landroidx/activity/m0;",
                            "Landroidx/activity/m0;",
                            "Landroid/view/Window;",
                            "Landroid/view/View;",
                            "Z", "Z"
                        )
                    }
            }
        }

        require(methods.size == 3) {
            "DisableNavBarContrast: expected three target methods."
        }

        methods.forEach { original ->
            val method = mutableClassDefBy(original.definingClass)
                .methods.first { it.toString() == original.toString() }

            val instructions = method.implementation!!.instructions.toList()

            val matches = instructions.indices.filter { index ->
                val instruction = instructions[index]
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    (instruction as? ReferenceInstruction)?.reference?.toString() ==
                    "Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V"
            }

            require(matches.size == 1)

            val index = matches.single()
            val call = instructions[index] as FiveRegisterInstruction
            val booleanRegister = call.registerD

            require(booleanRegister <= 15)

            method.addInstructions(
                index + 1,
                "const/4 v$booleanRegister, 0x1"
            )

            method.addInstructions(
                index,
                "const/4 v$booleanRegister, 0x0"
            )
        }
    }
}
