package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.serajr.patches.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction

private const val HAZE_GRADIENT_CLASS = "Lcom/x/composer/minimal/o0;"

private const val ORIGINAL_DIVISOR_BITS = 0x40000000 // 2.0f
private const val SHORTENED_DIVISOR_BITS = 0x40800000 // 4.0f

@Suppress("unused")
val shortenBottomHazeGradientPatch = bytecodePatch(
    name = "Shorten Bottom Haze Gradient - Experimental",
    description = "Shortens the native bottom Haze mask gradient while preserving the original blur rendering and Compose layout.",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    execute {
        // Find the native bottom Haze gradient class.
        var original: Method? = null

        classDefForEach { classDef ->
            if (classDef.type == HAZE_GRADIENT_CLASS) {
                original = classDef.methods.singleOrNull { method ->
                    method.name == "c" &&
                        method.returnType == "Landroid/graphics/Shader;" &&
                        method.parameterTypes.map { it.toString() } ==
                        listOf("J")
                }
            }
        }

        val target = requireNotNull(original) {
            "D3-J1: native bottom Haze gradient method not found."
        }

        val method = mutableClassDefBy(target.definingClass)
            .methods.first { it.toString() == target.toString() }

        val instructions = requireNotNull(method.implementation) {
            "D3-J1: missing gradient method implementation."
        }.instructions.toList()

        // Match the original gradient calculation:
        //
        // sub-float/2addr p1, p0
        // const/high16 p0, 2.0f
        // div-float/2addr p1, p0
        //
        // Validate the literal and neighboring opcodes before replacing.

        val matches = instructions.indices.filter { index ->
            if (index == 0 || index >= instructions.lastIndex) {
                return@filter false
            }

            val instruction = instructions[index]

            instruction.opcode == Opcode.CONST_HIGH16 &&
                (instruction as? NarrowLiteralInstruction)
                    ?.narrowLiteral == ORIGINAL_DIVISOR_BITS &&
                instructions[index - 1].opcode == Opcode.SUB_FLOAT_2ADDR &&
                instructions[index + 1].opcode == Opcode.DIV_FLOAT_2ADDR
        }

        require(matches.size == 1) {
            "D3-J1: expected one original 2.0f gradient divisor, found ${matches.size}."
        }

        // Replace only the divisor.
        // No additional registers or control-flow changes.
        method.replaceInstruction(
            matches.single(),
            "const/high16 p0, 0x40800000"
        )
    }
}
