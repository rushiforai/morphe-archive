package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.serajr.patches.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val MAIN_ACTIVITY = "Lcom/x/android/main/MainActivity;"
private const val ON_START_SUPER = "Landroidx/appcompat/app/n;->onStart()V"

@Suppress("unused")
val disableNavBarContrastPatch = bytecodePatch(
    name = "Disable Navigation Bar Contrast",
    description = "Disables system navigation bar contrast while preserving X's native Haze effect (Blur/Scrim).",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    execute {
        // 1. Locate MainActivity.onStart() using its method signature.
        var original: Method? = null

        classDefForEach { classDef ->
            if (classDef.type == MAIN_ACTIVITY) {
                original = classDef.methods.firstOrNull { method ->
                    method.name == "onStart" &&
                        method.returnType == "V" &&
                        method.parameterTypes.isEmpty()
                }
            }
        }

        val target = requireNotNull(original) {
            "DisableNavBarContrast: MainActivity.onStart() not found."
        }

        val method = mutableClassDefBy(target.definingClass)
            .methods.first { it.toString() == target.toString() }

        val implementation = requireNotNull(method.implementation) {
            "DisableNavBarContrast: missing method body."
        }

        // 2. Verify the register layout before injecting instructions.
        require(implementation.registerCount == 4) {
            "DisableNavBarContrast: unexpected onStart() register count."
        }

        // 3. Locate the superclass lifecycle call.
        val superCalls = implementation.instructions.toList()
            .mapIndexedNotNull { index, instruction ->
                if (
                    instruction.opcode == Opcode.INVOKE_SUPER &&
                    (instruction as? ReferenceInstruction)
                        ?.reference?.toString() == ON_START_SUPER
                ) index else null
            }

        require(superCalls.size == 1) {
            "DisableNavBarContrast: expected exactly one super.onStart() call."
        }

        // 4. Make the navigation bar transparent and disable contrast enforcement.
        // The native Haze behind the system navigation buttons remains untouched.
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
