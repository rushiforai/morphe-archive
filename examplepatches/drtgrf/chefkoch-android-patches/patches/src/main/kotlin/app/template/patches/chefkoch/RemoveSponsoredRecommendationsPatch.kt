package app.template.patches.chefkoch

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_CHEFKOCH
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val removeSponsoredRecommendationsPatch = patch(
    name = "Remove Sponsored Recommendations",
    description = "Removes the Taboola recommendation widget from recipe detail pages.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CHEFKOCH)

    execute {
        val method = RecipeDetailContentFingerprint.method
        val implementation = method.implementation!!
        val instructions = implementation.instructions

        // Find the Taboola widget registration.
        val widgetIndices = instructions.indices.filter { index ->
            val instruction = instructions[index]

            instruction.opcode == Opcode.CONST_STRING &&
                instruction is ReferenceInstruction &&
                (instruction.reference as? StringReference)?.string == "taboola_widget"
        }

        require(widgetIndices.size == 1) {
            "Expected one Taboola widget registration, found ${widgetIndices.size}."
        }

        val widgetIndex = widgetIndices.single()

        // The method has seven single-register parameters.
        // The second parameter (p1) is the TaboolaWrapper.
        val taboolaRegister = implementation.registerCount - 6

        // Find the IF_EQZ instruction checking p1.
        val candidates = (0 until widgetIndex).filter { index ->
            val instruction = instructions[index]

            instruction is BuilderInstruction21t &&
                instruction.opcode == Opcode.IF_EQZ &&
                instruction.registerA == taboolaRegister
        }

        require(candidates.size == 1) {
            "Expected one Taboola conditional branch, found ${candidates.size}."
        }

        val branchIndex = candidates.single()

        // Force the TaboolaWrapper parameter to null.
        // The original IF_EQZ then skips the widget.
        method.addInstruction(
            branchIndex,
            "const/4 p1, 0x0"
        )
    }
}
