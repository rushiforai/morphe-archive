/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.flags

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.instagram.misc.settings.EXTENSION_ROOT
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** How far after a flag's id its read may come: 449 puts at most a cast between them. */
private const val READ_WITHIN = 4

/** A read of a server flag: the flag, the method, and the index and register of its move-result. */
internal class FlagRead(
    val flag: Long,
    val type: String,
    val name: String,
    val parameters: List<String>,
    val returnType: String,
    val moveResult: Int,
    val register: Int,
)

/**
 * Every place Instagram loads one of [flags] and reads it as a boolean: on 449 a server flag is
 * `const-wide <id>`, at most a cast, a call taking the id last and answering a boolean
 * (`MobileConfigUnsafeContext.BXd(J)Z` or a static wrapper), and its move-result. Fails, in
 * [patch]'s name, when a flag is never read or is loaded for any other use, since that's an update
 * the patch hasn't seen. The extension's own code is left out.
 */
internal fun BytecodePatchContext.findFlagReads(patch: String, flags: List<Long>): List<FlagRead> {
    val reads = mutableListOf<FlagRead>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        classDef.methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            code.forEachIndexed { index, instruction ->
                if (instruction.opcode != Opcode.CONST_WIDE) return@forEachIndexed
                val flag = (instruction as WideLiteralInstruction).wideLiteral
                if (flag !in flags) return@forEachIndexed
                val where = "${classDef.type}->${method.name} loads ${flag.toString(16)}"
                val id = (instruction as OneRegisterInstruction).registerA
                val callAt = (index + 1..minOf(index + READ_WITHIN, code.lastIndex))
                    .firstOrNull { code[it].methodReference() != null }
                    ?: refuse(patch, "$where with no call after it")
                val call = code[callAt].methodReference()!!
                val passed = code[callAt].arguments()
                if (passed.takeLast(2) != listOf(id, id + 1) || call.parameterTypes.lastOrNull()?.toString() != "J") {
                    refuse(patch, "$where and then calls ${call.definingClass}->${call.name} without it last")
                }
                if (call.returnType != "Z") {
                    refuse(patch, "$where for ${call.definingClass}->${call.name}, which answers ${call.returnType}")
                }
                val result = code.getOrNull(callAt + 1)
                if (result?.opcode != Opcode.MOVE_RESULT) refuse(patch, "$where and drops the answer")
                reads += FlagRead(
                    flag, classDef.type, method.name, method.parameterTypes.map(CharSequence::toString), method.returnType,
                    callAt + 1, (result as OneRegisterInstruction).registerA,
                )
            }
        }
    }
    val unread = flags.filter { flag -> reads.none { it.flag == flag } }
    if (unread.isNotEmpty()) refuse(patch, "nothing reads ${unread.joinToString { it.toString(16) }}")
    return reads
}

/** Passes each read's answer through [hook], an `(I)Z` method, right after its move-result. */
internal fun BytecodePatchContext.answerFlagReads(reads: List<FlagRead>, hook: String) {
    reads.groupBy { Triple(it.type, it.name, it.parameters) }.forEach { (_, inMethod) ->
        val first = inMethod.first()
        val method = mutableClassDefBy(first.type).methods.single {
            it.name == first.name && it.returnType == first.returnType &&
                it.parameterTypes.map(CharSequence::toString) == first.parameters
        }
        inMethod.sortedByDescending { it.moveResult }.forEach { read ->
            method.addInstructions(
                read.moveResult + 1,
                """
                    invoke-static/range { v${read.register} .. v${read.register} }, $hook
                    move-result v${read.register}
                """,
            )
        }
    }
}

private fun Instruction.methodReference(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

/** The registers an invoke passes, in order. */
private fun Instruction.arguments(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

private fun refuse(patch: String, detail: String): Nothing = throw PatchException("$patch: $detail")
