// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.shared

import app.revanced.com.android.tools.smali.dexlib2.mutable.MutableMethod
import app.revanced.patcher.extensions.addInstructions
import app.revanced.patcher.extensions.getInstruction
import app.revanced.patcher.extensions.instructions
import app.revanced.patcher.extensions.replaceInstruction
import app.revanced.patcher.extensions.string
import app.revanced.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

/**
 * A change to one method, checked but not yet made. The patcher keeps a failed patch's changes, so a patch looks up
 * and checks everything it needs, then [apply]s its edits.
 */
internal class Edit(
    /** How many places the edit changes. */
    val count: Int,
    private val change: () -> Unit,
) {
    fun apply() = change()
}

/**
 * Rewrites the method's string literals: [transform] returns the new value, or null to keep a literal. The edit holds
 * the literals' indices, so apply it before edits that insert instructions into the same method. It reads each literal
 * again when applied, so a second rewrite of the same literal sees the first one's result, and must still change it.
 */
internal fun MutableMethod.rewriteStrings(transform: (String) -> String?): Edit {
    val indices = instructions.withIndex().filter { (_, instruction) -> instruction.rewritten(transform) != null }.map { it.index }
    return Edit(indices.size) {
        for (index in indices) {
            val instruction = getInstruction<Instruction>(index)
            // Another edit to this method ran first, against the order above.
            val new = instruction.rewritten(transform) ?: throw PatchException("Instruction $index in $name no longer holds the literal to rewrite")
            val register = (instruction as OneRegisterInstruction).registerA
            replaceInstruction(index, constString(register, new, jumbo = instruction.opcode == Opcode.CONST_STRING_JUMBO))
        }
    }
}

private fun Instruction.rewritten(transform: (String) -> String?): String? {
    if (opcode != Opcode.CONST_STRING && opcode != Opcode.CONST_STRING_JUMBO) return null
    val old = string ?: return null
    return transform(old)?.takeIf { it != old }
}

/** Makes a `()Z` method return [value]. The original body stays behind the early return. */
internal fun MutableMethod.returnBoolean(value: Boolean): Edit {
    if ((implementation?.registerCount ?: 0) < 1) throw PatchException("$name has no register for a boolean")
    return Edit(1) {
        addInstructions(
            0,
            """
                const/4 v0, ${if (value) "0x1" else "0x0"}
                return v0
            """,
        )
    }
}

/** Makes the method return [value]. The original body stays behind the early return. */
internal fun MutableMethod.returnString(value: String): Edit {
    if ((implementation?.registerCount ?: 0) < 1) throw PatchException("$name has no register for a string")
    return Edit(1) {
        addInstructions(0, listOf<BuilderInstruction>(constString(0, value, jumbo = false), BuilderInstruction11x(Opcode.RETURN_OBJECT, 0)))
    }
}

private fun constString(
    register: Int,
    value: String,
    jumbo: Boolean,
): BuilderInstruction = if (jumbo) {
    BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, ImmutableStringReference(value))
} else {
    BuilderInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(value))
}
