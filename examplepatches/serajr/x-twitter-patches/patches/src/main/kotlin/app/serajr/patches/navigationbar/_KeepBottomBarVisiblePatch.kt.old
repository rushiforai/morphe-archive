
package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.serajr.patches.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val DEBUG = false

private const val BOTTOM_BAR_ANIMATION =
    "BottomBarOffsetAnimation"

private const val HAZE_STATE =
    "Ldev/chrisbanes/haze/w0;"

private const val ANIMATED_VISIBILITY =
    "Landroidx/compose/animation/p;"

private const val ANIMATED_VISIBILITY_METHOD = "h"

private fun debug(message: String) {
    if (DEBUG) {
        println("KeepBottomBarVisible -> $message")
    }
}

private fun Method.hasBottomBarAnimation(): Boolean {
    val instructions = implementation?.instructions ?: return false

    return instructions.any { instruction ->
        if (instruction.opcode != Opcode.CONST_STRING &&
            instruction.opcode != Opcode.CONST_STRING_JUMBO
        ) {
            false
        } else {
            val reference =
                (instruction as? ReferenceInstruction)?.reference
                    as? StringReference

            reference?.string == BOTTOM_BAR_ANIMATION
        }
    }
}

private fun Method.hasHazeState(): Boolean {
    return parameterTypes.any {
        it.toString() == HAZE_STATE
    }
}

private fun Method.animatedVisibilityCalls(): List<Int> {
    val instructions =
        implementation?.instructions?.toList() ?: return emptyList()

    return instructions.withIndex().filter { (_, instruction) ->
        if (instruction.opcode != Opcode.INVOKE_STATIC_RANGE) {
            return@filter false
        }

        val reference =
            (instruction as? ReferenceInstruction)?.reference
                as? MethodReference
                ?: return@filter false

        reference.definingClass.toString() ==
            ANIMATED_VISIBILITY &&
            reference.name == ANIMATED_VISIBILITY_METHOD &&
            reference.returnType == "V" &&
            reference.parameterTypes.size == 10 &&
            reference.parameterTypes[1].toString() == "Z"
    }.map { it.index }
}

@Suppress("unused")
val keepBottomBarVisiblePatch = bytecodePatch(
    name = "Keep Bottom Bar Visible",
    description =
        "Keeps the bottom navigation bar visible while scrolling the timeline.",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    execute {
        val candidates = mutableListOf<Method>()

        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                if (
                    method.returnType == "V" &&
                    method.hasHazeState() &&
                    method.hasBottomBarAnimation() &&
                    method.animatedVisibilityCalls().size == 1
                ) {
                    candidates.add(method)
                }
            }
        }

        if (candidates.size != 1) {
            throw IllegalStateException(
                "KeepBottomBarVisible: expected one matching " +
                    "bottom bar method, found ${candidates.size}."
            )
        }

        val method = candidates.single()

        debug("Target method: $method")

        val mutableClass =
            mutableClassDefBy(method.definingClass)

        val mutableMethod =
            mutableClass.methods.firstOrNull {
                it.toString() == method.toString()
            } ?: throw IllegalStateException(
                "KeepBottomBarVisible: mutable method not found."
            )

        val instructions =
            mutableMethod.implementation?.instructions?.toList()
                ?: throw IllegalStateException(
                    "KeepBottomBarVisible: method has no implementation."
                )

        val matches = mutableMethod.animatedVisibilityCalls()

        if (matches.size != 1) {
            throw IllegalStateException(
                "KeepBottomBarVisible: AnimatedVisibility " +
                    "call not uniquely identified."
            )
        }

        val index = matches.single()

        val invoke =
            instructions[index] as? Instruction3rc
                ?: throw IllegalStateException(
                    "KeepBottomBarVisible: unexpected invoke format."
                )

        if (invoke.registerCount != 10) {
            throw IllegalStateException(
                "KeepBottomBarVisible: unexpected argument count."
            )
        }

        // The second argument is the visibility boolean.
        val visibleRegister = invoke.startRegister + 1

        // const/16 supports destination registers v0..v255.
        if (visibleRegister > 255) {
            throw IllegalStateException(
                "KeepBottomBarVisible: visibility register " +
                    "is outside the supported range."
            )
        }

        debug("AnimatedVisibility instruction index: $index")
        debug("Visibility register: v$visibleRegister")

        /*
         * Forces only AnimatedVisibility.visible = true.
         *
         * All original animations, modifiers, HazeState
         * and layout calculations remain unchanged.
         */
        mutableMethod.addInstructions(
            index,
            "const/16 v$visibleRegister, 0x1"
        )

        debug("Bottom bar visibility patch applied.")
    }
}
