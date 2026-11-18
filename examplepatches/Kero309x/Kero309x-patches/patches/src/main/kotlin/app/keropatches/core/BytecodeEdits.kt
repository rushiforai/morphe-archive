// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.core

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Makes this method see a boolean field as false without changing the field.
 *
 * Some flags are filled in reflectively from a server response, which means the
 * bytecode contains no store instruction to rewrite. What it does contain is the
 * read at each place that acts on the flag. Replacing a read with a constant
 * reuses the register the read wrote to, so the surrounding branch keeps testing
 * the same register and takes its "flag is off" path with no other edit.
 *
 * Only the reads in this method change. The object keeps its real value, so code
 * that persists it, compares it or sends it back is unaffected.
 *
 * @param field field reference in smali form, for example
 *   `Lcom/example/Thing;->isEnabled:Z`.
 */
internal fun MutableMethod.replaceBooleanFieldReadsWithFalse(field: String) {
    val indices = instructions.indices.filter { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.IGET_BOOLEAN &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == field
    }

    check(indices.isNotEmpty()) {
        "No read of $field in $definingClass->$name$returnType; the code changed."
    }

    indices.forEach { index ->
        val register = (instructions[index] as OneRegisterInstruction).registerA
        replaceInstruction(index, "const/4 v$register, 0x0")
    }
}

/**
 * Makes every call to this boolean method in this method answer true.
 *
 * The call is kept and its result is discarded in favour of a constant, so the
 * caller's branch, its register usage and its control flow stay as they are. Only
 * the call sites listed here change; the callee is untouched, so other callers
 * keep the real answer.
 *
 * The constant is written with `const/16` rather than `const/4` because the
 * destination register of a call result is not limited to the four-bit range.
 *
 * @param method method reference in smali form, for example
 *   `Lcom/example/Thing;->isEnabled()Z`.
 */
internal fun MutableMethod.answerBooleanCallsWithTrue(method: String) {
    val indices = instructions.indices.filter { index ->
        val instruction = instructions[index]
        instruction.opcode in INVOKE_OPCODES &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == method
    }

    check(indices.isNotEmpty()) {
        "No call to $method in $definingClass->$name$returnType; the code changed."
    }

    indices.forEach { index ->
        val resultIndex = index + 1
        check(resultIndex < instructions.size) {
            "The call to $method at $index has no following instruction in " +
                "$definingClass->$name$returnType."
        }

        val result = instructions[resultIndex]
        check(result.opcode == Opcode.MOVE_RESULT) {
            "The call to $method at $index is not followed by move-result in " +
                "$definingClass->$name$returnType."
        }

        val destination = (result as OneRegisterInstruction).registerA
        replaceInstruction(resultIndex, "const/16 v$destination, 0x1")
    }
}

/**
 * Makes every call to this integer method in this method answer zero.
 *
 * Some guards compare a count against a maximum. Replacing the answer of the
 * count with zero makes the comparison answer "below the maximum", which is the
 * path the code takes when there is nothing to compare. The call is kept, so the
 * caller's register usage and control flow stay as they are; only the answer
 * changes.
 *
 * The constant is written with `const/4`, which needs the destination register
 * to be one of the first sixteen.
 *
 * @param method method reference in smali form, for example
 *   `Ljava/util/List;->size()I`.
 */
internal fun MutableMethod.answerIntCallsWithZero(method: String) {
    val indices = instructions.indices.filter { index ->
        val instruction = instructions[index]
        instruction.opcode in INVOKE_OPCODES &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == method
    }

    check(indices.isNotEmpty()) {
        "No call to $method in $definingClass->$name$returnType; the code changed."
    }

    indices.forEach { index ->
        val resultIndex = index + 1
        check(resultIndex < instructions.size) {
            "The call to $method at $index has no following instruction in " +
                "$definingClass->$name$returnType."
        }

        val result = instructions[resultIndex]
        check(result.opcode == Opcode.MOVE_RESULT) {
            "The call to $method at $index is not followed by move-result in " +
                "$definingClass->$name$returnType."
        }

        val destination = (result as OneRegisterInstruction).registerA
        check(destination <= 15) {
            "The answer to $method lands in v$destination, which const/4 cannot " +
                "write in $definingClass->$name$returnType."
        }

        replaceInstruction(resultIndex, "const/4 v$destination, 0x0")
    }
}

/**
 * Replaces the string this method pushes with another one.
 *
 * A string constant is one instruction whatever its content, so the replacement
 * keeps the method the same size and leaves every register as it was. Only the
 * constants that hold exactly the given text are replaced, which keeps the edit
 * to the one place the text appears.
 *
 * @param from the text to replace, as it is written in the source.
 * @param to the text to write instead.
 */
internal fun MutableMethod.replaceStringConstant(from: String, to: String) {
    val indices = instructions.indices.filter { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.CONST_STRING &&
            (instruction as? ReferenceInstruction)?.reference is StringReference &&
            ((instruction as ReferenceInstruction).reference as StringReference).string == from
    }

    check(indices.isNotEmpty()) {
        "No string constant \"$from\" in $definingClass->$name$returnType; the code changed."
    }

    indices.forEach { index ->
        val register = (instructions[index] as OneRegisterInstruction).registerA
        replaceInstruction(index, "const-string v$register, \"$to\"")
    }
}

/**
 * Removes the call to this method from this method.
 *
 * Some code overwrites a value the caller has already filled in. Removing the
 * call keeps the value the object was built with, which is the one the rest of
 * the application reads. The call is removed rather than its answer replaced,
 * because the answer of the call is not read by the caller.
 *
 * The calls are removed from the last one backwards, so the positions of the
 * calls that are still to be removed stay correct.
 *
 * @param method method reference in smali form, for example
 *   `Lcom/example/Thing;->setName(Ljava/lang/String;)V`.
 */
internal fun MutableMethod.removeCallTo(method: String) {
    val indices = instructions.indices.filter { index ->
        val instruction = instructions[index]
        instruction.opcode in INVOKE_OPCODES &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == method
    }

    check(indices.isNotEmpty()) {
        "No call to $method in $definingClass->$name$returnType; the code changed."
    }

    indices.sortedDescending().forEach { index ->
        removeInstruction(index)
    }
}

/**
 * Replaces the call to this method with a block of instructions.
 *
 * Some guards need more than a constant: a branch, or a value taken from another
 * field. The block is written as smali and compiled against this method, so its
 * registers and its parameters are the ones of the method it replaces.
 *
 * The call is removed on its own and the block is put in its place. The two
 * are not done in one step, because the step that replaces instructions
 * removes as many instructions as the block holds, which would take the
 * instructions that follow the call with it.
 *
 * @param method method reference in smali form, for example
 *   `Lcom/example/Thing;->setName(Ljava/lang/String;)V`.
 * @param block the instructions that take the place of the call.
 */
internal fun MutableMethod.replaceCallWithBlock(method: String, block: String) {
    val index = instructions.indexOfFirst { instruction ->
        instruction.opcode in INVOKE_OPCODES &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == method
    }

    check(index >= 0) {
        "No call to $method in $definingClass->$name$returnType; the code changed."
    }

    removeInstruction(index)
    addInstructions(index, block)
}

/**
 * Removes the call to this method from this method, and the move that reads its
 * answer with it.
 *
 * A call whose answer is used is followed by a move that takes it. Removing the
 * call alone would leave that move reading nothing, which the verifier refuses,
 * so the two are removed together. The calls are removed from the last one
 * backwards, so the positions of the calls that are still to be removed stay
 * correct.
 *
 * @param method method reference in smali form, for example
 *   `Lcom/example/Builder;->add(Ljava/lang/String;)Lcom/example/Builder;`.
 */
internal fun MutableMethod.removeCallAndResult(method: String) {
    val indices = instructions.indices.filter { index ->
        val instruction = instructions[index]
        instruction.opcode in INVOKE_OPCODES &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == method
    }

    check(indices.isNotEmpty()) {
        "No call to $method in $definingClass->$name$returnType; the code changed."
    }

    val removals = mutableListOf<Int>()
    indices.forEach { index ->
        removals += index
        val result = instructions.getOrNull(index + 1)
        if (result != null && result.opcode in MOVE_RESULT_OPCODES) {
            removals += index + 1
        }
    }

    removals.sortedDescending().forEach { index ->
        removeInstruction(index)
    }
}

/**
 * Makes this method answer null without running its body.
 *
 * Some callers treat a null getter answer as "this surface is not configured" and
 * skip building the row or cell that would otherwise show it. Returning null is
 * therefore preferable to hiding the result afterwards: nothing is allocated, no
 * adapter position is reserved, and no empty space is left behind.
 *
 * The injected ending needs one local register for the null constant. It is
 * derived from the method's own register frame rather than assumed, so a method
 * that loses its locals fails the patch instead of producing a broken frame.
 */
internal fun MutableMethod.returnNullEarly() {
    check(returnType.startsWith("L") || returnType.startsWith("[")) {
        "returnNullEarly needs an object or array return type, but " +
            "$definingClass->$name returns $returnType."
    }

    val parameterRegisters = parameterTypes.sumOf { type ->
        when (type.firstOrNull()) {
            'J', 'D' -> 2
            else -> 1
        }
    }
    val receiver = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    val locals = checkNotNull(implementation) {
        "$definingClass->$name has no implementation to inspect."
    }.registerCount - receiver - parameterRegisters

    check(locals >= 1) {
        "$definingClass->$name has no local register to hold the null answer."
    }

    addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
}

/** Every invoke form, so a call is recognised regardless of its register width. */
private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_SUPER,
    Opcode.INVOKE_DIRECT,
    Opcode.INVOKE_STATIC,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_SUPER_RANGE,
    Opcode.INVOKE_DIRECT_RANGE,
    Opcode.INVOKE_STATIC_RANGE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

/** Every move that reads the answer of the call before it. */
private val MOVE_RESULT_OPCODES = setOf(
    Opcode.MOVE_RESULT,
    Opcode.MOVE_RESULT_WIDE,
    Opcode.MOVE_RESULT_OBJECT,
)
