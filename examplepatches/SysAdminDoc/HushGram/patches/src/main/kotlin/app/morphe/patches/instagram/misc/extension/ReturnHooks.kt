/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Modified for HushGram (Instagram), 2026.
 */
package app.morphe.patches.instagram.misc.extension

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.instagram.misc.settings.EXTENSION_ROOT
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Passes every object this method returns through [filter], a static `(T)T` call, so the caller
 * gets the filter's answer. The call goes in at the return's own label, so a branch that jumps
 * straight to a return passes through it too. Throws naming [patch] when the method returns no
 * object.
 */
internal fun MutableMethod.filterEveryReturn(patch: String, filter: String) {
    val implementation = implementation ?: throw PatchException("$patch: $definingClass->$name has no body")
    val returns = implementation.instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN_OBJECT }
        .map { it.index to (it.value as OneRegisterInstruction).registerA }
    if (returns.isEmpty()) throw PatchException("$patch: $definingClass->$name returns no object")

    returns.asReversed().forEach { (index, register) ->
        addInstructionsAtControlFlowLabel(
            index,
            """
                invoke-static/range { v$register .. v$register }, $filter
                move-result-object v$register
            """,
        )
    }
}

/**
 * Passes every `const-string` of [value] in the app's own code through [filter], a static
 * `(String)String` call, right after the string is loaded. Only the path through the load reaches
 * the call: a branch to the next instruction still lands on it. Answers how many loads it found.
 */
internal fun BytecodePatchContext.filterEveryStringLoad(value: String, filter: String): Int {
    val owners = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        if (classDef.methods.any { method -> method.stringLoads(value).isNotEmpty() }) owners += classDef.type
    }
    var count = 0
    owners.forEach { type ->
        mutableClassDefBy(type).methods.forEach { method ->
            method.stringLoads(value).asReversed().forEach { (index, register) ->
                method.addInstructions(
                    index + 1,
                    """
                        invoke-static/range { v$register .. v$register }, $filter
                        move-result-object v$register
                    """,
                )
                count++
            }
        }
    }
    return count
}

/** The index and target register of each `const-string` of [value] in this method. */
private fun com.android.tools.smali.dexlib2.iface.Method.stringLoads(value: String): List<Pair<Int, Int>> =
    implementation?.instructions?.withIndex()?.filter { (_, instruction) ->
        (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
            ((instruction as ReferenceInstruction).reference as StringReference).string == value
    }?.map { (index, instruction) -> index to (instruction as OneRegisterInstruction).registerA }.orEmpty()
