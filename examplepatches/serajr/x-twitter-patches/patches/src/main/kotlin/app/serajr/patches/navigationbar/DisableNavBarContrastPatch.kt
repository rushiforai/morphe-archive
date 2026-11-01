package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.serajr.patches.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val MAIN_ACTIVITY =
    "Lcom/x/android/main/MainActivity;"

private const val ON_START_SUPER =
    "Landroidx/appcompat/app/n;->onStart()V"

@Suppress("unused")
val disableNavBarContrastPatch = bytecodePatch(
    name = "Disable Navigation Bar Contrast",
    description = "Disables navigation bar contrast directly in X's main activity.",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    execute {
        var targetMethod: Method? = null

        classDefForEach { classDef ->
            if (classDef.type.toString() != MAIN_ACTIVITY) {
                return@classDefForEach
            }

            targetMethod = classDef.methods.firstOrNull { method ->
                method.name == "onStart" &&
                    method.returnType == "V" &&
                    method.parameterTypes.isEmpty()
            }
        }

        val original = requireNotNull(targetMethod) {
            "DisableNavBarContrast: MainActivity.onStart() not found."
        }

        val method = mutableClassDefBy(original.definingClass)
            .methods.first { it.toString() == original.toString() }

        val implementation = requireNotNull(method.implementation) {
            "DisableNavBarContrast: onStart() has no implementation."
        }

        require(implementation.registerCount == 4) {
            "DisableNavBarContrast: unexpected onStart() register count."
        }

        val instructions = implementation.instructions.toList()

        val superCalls = instructions.indices.filter { index ->
            val instruction = instructions[index]

            instruction.opcode == Opcode.INVOKE_SUPER &&
                (instruction as? ReferenceInstruction)
                    ?.reference?.toString() == ON_START_SUPER
        }

        require(superCalls.size == 1) {
            "DisableNavBarContrast: expected one super.onStart() call."
        }

        method.addInstructions(
            superCalls.single() + 1,
            """
                invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                move-result-object v0

                const/4 v1, 0x0

                invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

                invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V
            """.trimIndent()
        )
    }
}
