package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.serajr.patches.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private const val MAIN_ACTIVITY =
    "Lcom/x/android/main/MainActivity;"

/**
 * Structural fingerprint for MainActivity.onStart().
 *
 * Independent of obfuscated superclass names and
 * fixed register counts.
 *
 * Returns the unique superclass lifecycle call index.
 */
private fun Method.navigationContrastAnchor(): Int? {
    if (name != "onStart") return null
    if (returnType != "V") return null
    if (parameterTypes.isNotEmpty()) return null

    // Reject static methods.
    if ((accessFlags and 0x8) != 0) return null

    val impl = implementation ?: return null

    // An instance method without explicit parameters
    // has its receiver in the last register.
    val receiver = impl.registerCount - 1

    val matches = impl.instructions
        .toList()
        .mapIndexedNotNull { index, instruction ->

            if (
                instruction.opcode != Opcode.INVOKE_SUPER &&
                instruction.opcode != Opcode.INVOKE_SUPER_RANGE
            ) {
                return@mapIndexedNotNull null
            }

            val reference =
                (instruction as? ReferenceInstruction)
                    ?.reference as? MethodReference
                    ?: return@mapIndexedNotNull null

            if (
                reference.name != "onStart" ||
                reference.returnType != "V" ||
                reference.parameterTypes.isNotEmpty()
            ) {
                return@mapIndexedNotNull null
            }

            val validReceiver = when (instruction) {
                is FiveRegisterInstruction ->
                    instruction.registerCount == 1 &&
                        instruction.registerC == receiver

                is RegisterRangeInstruction ->
                    instruction.registerCount == 1 &&
                        instruction.startRegister == receiver

                else -> false
            }

            if (validReceiver) index else null
        }

    return matches.singleOrNull()
}

@Suppress("unused")
val disableNavBarContrastPatch = bytecodePatch(
    name = "Disable Navigation Bar Contrast",
    description = "Disables system navigation bar contrast while preserving X's native Haze effect (Blur/Scrim).",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    execute {
        val candidates =
            mutableListOf<Pair<Method, Int>>()

        classDefForEach { classDef ->
            if (classDef.type == MAIN_ACTIVITY) {
                classDef.methods.forEach { method ->
                    method.navigationContrastAnchor()
                        ?.let { index ->
                            candidates.add(method to index)
                        }
                }
            }
        }

        require(candidates.size == 1) {
            "DisableNavBarContrast: expected exactly one " +
                "structural lifecycle match; " +
                "found ${candidates.size}."
        }

        val (target, anchor) = candidates.single()

        val method = mutableClassDefBy(
            target.definingClass
        ).methods.first {
            it.toString() == target.toString()
        }

        val implementation = requireNotNull(
            method.implementation
        ) {
            "DisableNavBarContrast: missing method body."
        }

        // Keep the original injection register layout
        // until an independent helper is introduced.
        require(implementation.registerCount == 4) {
            "DisableNavBarContrast: unsupported register " +
                "layout (${implementation.registerCount})."
        }

        method.addInstructions(
            anchor + 1,
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
