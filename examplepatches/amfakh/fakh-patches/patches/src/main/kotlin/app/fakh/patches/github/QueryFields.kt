/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

// Adds fields the app does not ask GitHub for to one of its GraphQL queries, and has the matching response parser hand
// their values to an extension class.

private const val STRING = "Ljava/lang/String;"

private const val LIST = "Ljava/util/List;"

internal val Instruction.string get() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

internal val MethodReference.types get() = parameterTypes.map(CharSequence::toString)

internal val Method.instructions get() = implementation?.instructions?.toList().orEmpty()

/** Whether a call reads the next field name of a response: it takes the names to look for and returns the index. */
internal val Instruction.selectsName
    get() = opcode == Opcode.INVOKE_INTERFACE && method?.let { it.returnType == "I" && it.types == listOf(LIST) } == true

/** Writes [fields] into every query string of this method, right after [anchor]. */
internal fun MutableMethod.addToQuery(anchor: String, fields: String) {
    instructions.forEachIndexed { index, instruction ->
        val query = instruction.string?.takeIf { anchor in it } ?: return@forEachIndexed
        val register = (instruction as OneRegisterInstruction).registerA
        val text = ImmutableStringReference(query.replace(anchor, "$anchor$fields "))
        replaceInstruction(
            index,
            if (instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, text)
            } else {
                BuilderInstruction21c(Opcode.CONST_STRING, register, text)
            },
        )
    }
}

/**
 * Makes the response parser [type] read two added fields. Their names join the end of its field names, and are handled
 * right after a name is read, before the switch whose default would end the loop.
 *
 * @param extension The class with `names(List): List`, which adds the two names, and the two methods below.
 * @param first The method taking the value of the first added field, as `(Object)V`.
 * @param second The method taking the value of the second.
 * @param any The app's reader of any JSON value, `(Reader)Object`, when the second field is not a string.
 */
internal fun readAddedFields(
    type: String,
    extension: String,
    first: String,
    second: String,
    any: MethodReference? = null,
) {
    val parserClass = mutableClassDefBy(type)
    val parser = parserClass.methods.single { method -> method.instructions.any { it.selectsName } }
    val instructions = parser.instructions
    val selectAt = instructions.indices.single { instructions[it].selectsName }
    val reader = instructions[selectAt].method!!.definingClass
    val adapters = parser.parameterTypes[1].toString()
    if (instructions[selectAt - 1].opcode != Opcode.SGET_OBJECT ||
        instructions[selectAt + 1].opcode != Opcode.MOVE_RESULT
    ) {
        throw PatchException("Parser $type: the field name loop changed")
    }
    // The reader and the adapters are read again here, so the loop may not store anything in their registers. A parser
    // may reuse one for the name of a missing field, which it loads on its way to throwing.
    val parameters = parser.implementation!!.registerCount - 2
    val passed = "{ v$parameters .. v${parameters + 1} }"
    val overwritten = instructions.indices.any { index ->
        val instruction = instructions[index]
        instruction.opcode.setsRegister() && (instruction as OneRegisterInstruction).registerA >= parameters &&
            instructions.getOrNull(index + 2)?.opcode != Opcode.THROW
    }
    if (overwritten) throw PatchException("Parser $type reuses its parameter registers")
    // The adapter the parser itself reads a string with: a static field, called right before a cast to a string.
    val callAt = instructions.indices.firstOrNull { index ->
        index > 0 && instructions[index - 1].opcode == Opcode.SGET_OBJECT &&
            instructions[index].method?.types == listOf(reader, adapters) &&
            instructions.subList(index + 1, minOf(index + 4, instructions.size)).any {
                it.opcode == Opcode.CHECK_CAST && it.typeReference == STRING
            }
    } ?: throw PatchException("Parser $type: string adapter not found")
    val call = instructions[callAt].method!!
    val adapter = instructions[callAt - 1].field!!
    val invoke = if (instructions[callAt].opcode == Opcode.INVOKE_INTERFACE) "invoke-interface" else "invoke-virtual"

    val existing = parserClass.methods.count { it.name.startsWith("fakhFirst") }
    val firstName = if (existing == 0) "fakhFirst" else "fakhFirst$existing"
    val secondName = if (existing == 0) "fakhSecond" else "fakhSecond$existing"

    listOf(firstName to first, secondName to second).forEach { (name, take) ->
        parserClass.methods.add(
            ImmutableMethod(
                type,
                name,
                listOf(ImmutableMethodParameter(reader, null, null), ImmutableMethodParameter(adapters, null, null)),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(3),
            ).toMutable().apply {
                val value = any?.takeIf { name == secondName }?.let { "invoke-static { p0 }, ${it.smali}" }
                    ?: "sget-object v0, ${adapter.smali}\n$invoke { v0, p0, p1 }, ${call.smali}"
                addInstructions(
                    0,
                    """
                        $value
                        move-result-object v0
                        invoke-static { v0 }, $extension->$take(Ljava/lang/Object;)V
                        return-void
                    """,
                )
            },
        )
    }

    val classInit = parserClass.methods.single { it.name == "<clinit>" }
    val init = classInit.instructions
    val firstListAt = init.indices.first { init[it].method?.returnType == LIST }
    val lastListAt = init.indices.last { init[it].method?.returnType == LIST }
    val baseNames = (init[firstListAt - 2] as? RegisterRangeInstruction)?.registerCount
        ?: throw PatchException("Parser $type: field names not found")
    val names = baseNames + existing * 2

    val register = (instructions[selectAt + 1] as OneRegisterInstruction).registerA
    parser.addInstructionsWithLabels(
        selectAt + 2,
        """
            add-int/lit8 v$register, v$register, -$names
            if-ltz v$register, :known
            if-nez v$register, :second
            invoke-static/range $passed, $type->$firstName($reader$adapters)V
            goto/32 :next
            :second
            invoke-static/range $passed, $type->$secondName($reader$adapters)V
            goto/32 :next
            :known
            add-int/lit8 v$register, v$register, $names
        """,
        ExternalLabel("next", instructions[selectAt - 1]),
    )

    val list = (init[lastListAt + 1] as OneRegisterInstruction).registerA
    classInit.addInstructions(
        lastListAt + 2,
        """
            invoke-static/range { v$list .. v$list }, $extension->names($LIST)$LIST
            move-result-object v$list
        """,
    )
}
