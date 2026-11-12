/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-11.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.music.interaction.jam.addBridge
import app.morphe.patches.music.interaction.jam.invokeKind
import app.morphe.patches.music.interaction.jam.p0Register
import app.morphe.patches.music.interaction.jam.registerAt
import app.morphe.util.cloneMutable
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val EXECUTOR = "Ljava/util/concurrent/Executor;"
private const val OPTIONAL = "Lj$/util/Optional;"

internal data class PureSongMenuLookup(
    val method: MutableMethod,
    val contextRead: String,
    val lower: Method,
    val raw: MethodReference,
    val receiver: FieldReference?,
)

/** Preserve native request construction and item mapping, without consuming queue commands or response context. */
internal fun BytecodePatchContext.resolvePureSongMenuLookup(
    lookup: Method,
    requestType: String,
    requesterType: String,
    requester: FieldReference,
): PureSongMenuLookup {
    val code = lookup.implementation!!.instructions.toList()
    val constructors = code.indices.filter {
        code[it].getReference<MethodReference>()?.let { call ->
            call.definingClass == requestType && call.name == "<init>"
        } == true
    }
    val requestIndex = if (constructors.isNotEmpty()) constructors.single() else code.indices.single {
        code[it].getReference<MethodReference>()?.returnType == requestType
    }
    val request = code[requestIndex].getReference<MethodReference>()!!
    val contextArgument = if (constructors.isNotEmpty()) {
        check(request.parameterTypes.size == 8 && request.parameterTypes.drop(5).all { it == OPTIONAL }) {
            "unsupported native menu request constructor context"
        }
        6
    } else {
        check(request.parameterTypes.map { it.toString() } ==
                listOf("Ljava/lang/String;", "Ljava/util/List;", "Ljava/lang/String;", "I", OPTIONAL)) {
            "unsupported native menu request factory context"
        }
        5
    }
    val contextRegister = (code[requestIndex] as ReferenceInstruction).registerAt(contextArgument)!!
    val contextEnd = (0 until requestIndex).last {
        code[it].opcode == Opcode.MOVE_RESULT_OBJECT &&
                (code[it] as OneRegisterInstruction).registerA == contextRegister
    }
    val contextStart = contextEnd - 5
    val context = code.subList(contextStart, contextEnd + 1)
    check(context.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE,
        Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT)) {
        "unsupported native menu context provider"
    }
    val contextProvider = context[0].getReference<FieldReference>()!!
    val providerGet = context[1].getReference<MethodReference>()!!
    val contextRead = context[4].getReference<MethodReference>()!!
    check(contextProvider.definingClass == requesterType && contextProvider.type == providerGet.definingClass &&
            contextRead.returnType == OPTIONAL && contextRead.parameterTypes.isEmpty() &&
            context[3].getReference<TypeReference>()?.type == contextRead.definingClass) {
        "native menu context does not belong to the captured requester"
    }

    val sendIndex = (requestIndex + 1 until code.size).first {
        code[it].getReference<MethodReference>()?.let { call ->
            call.parameterTypes.size == 2 && call.parameterTypes[1] == EXECUTOR &&
                    call.returnType == lookup.returnType
        } == true
    }
    val send = code[sendIndex].getReference<MethodReference>()!!
    val sendRegisters = (code[sendIndex] as ReferenceInstruction).let {
        listOf(it.registerAt(0)!!, it.registerAt(1)!!, it.registerAt(2)!!)
    }
    val future = (code[sendIndex + 1] as OneRegisterInstruction).registerA
    check(code[sendIndex + 1].opcode == Opcode.MOVE_RESULT_OBJECT)
    val (lower, receiver) = resolveMenuRawTransport(send)
    val rawOwner = receiver?.definingClass ?: lower.definingClass
    val raw = ImmutableMethodReference(rawOwner, "rvxRawSongMenu",
        listOf(rawOwner, send.parameterTypes[0].toString(), EXECUTOR), lookup.returnType)

    val registration = (sendIndex + 2 until code.size).single {
        code[it].getReference<MethodReference>()?.let { call ->
            call.returnType == "V" && call.parameterTypes.size == 3 &&
                    call.parameterTypes[0] == lookup.returnType && call.parameterTypes[2] == EXECUTOR &&
                    (code[it] as ReferenceInstruction).registerAt(0) == future
        } == true
    }
    val callback = (code[registration] as ReferenceInstruction).registerAt(1)!!
    val allocation = (sendIndex + 2 until registration).last {
        code[it].opcode == Opcode.NEW_INSTANCE && (code[it] as OneRegisterInstruction).registerA == callback
    }
    val callbackType = code[allocation].getReference<TypeReference>()!!.type
    val initialization = (allocation + 1 until registration).single {
        code[it].getReference<MethodReference>()?.let { call ->
            call.name == "<init>" && call.definingClass == callbackType &&
                    (code[it] as ReferenceInstruction).registerAt(0) == callback
        } == true
    }
    check(code.subList(allocation + 1, initialization).all {
        it.opcode == Opcode.CONST_4 || it.opcode == Opcode.CONST_16
    }) { "native menu observer has shared initialization" }
    val removed = (allocation..initialization).toMutableSet().apply { add(registration) }
    val executor = (code[registration] as ReferenceInstruction).registerAt(2)!!
    if (code.drop(registration + 1).none { executor in it.lookupRegisters() }) {
        val producer = (initialization + 1 until registration).last {
            it >= 0 && (code[it] as? OneRegisterInstruction)?.registerA == executor
        }
        check(code[producer].opcode == Opcode.MOVE_RESULT_OBJECT || code[producer].opcode == Opcode.SGET_OBJECT)
        removed.add(producer)
        if (code[producer].opcode == Opcode.MOVE_RESULT_OBJECT) {
            check(code[producer - 1].getReference<MethodReference>()?.let {
                it.returnType == EXECUTOR && it.parameterTypes.isEmpty()
            } == true)
            removed.add(producer - 1)
        }
    }
    val mapper = code.drop(registration + 1).mapNotNull { it.getReference<MethodReference>() }.single {
        it.parameterTypes.size == 3 && it.parameterTypes[0] == lookup.returnType &&
                it.parameterTypes[2] == EXECUTOR && it.returnType == lookup.returnType
    }
    check(mapper.definingClass == code[registration].getReference<MethodReference>()!!.definingClass) {
        "native menu item mapping is not independent of its observer"
    }

    val replacements = mapOf(
        contextStart to "move-object/from16 v$contextRegister, p3",
        sendIndex to "invoke-static {${sendRegisters.joinToString { "v$it" }}}, $raw",
    )
    removed.addAll(contextStart..contextEnd)
    removed.add(sendIndex)
    requireNoEntryInto(lookup, removed)
    val clone = lookup.cloneMutable(name = "rvxLookupSongMenu",
        registerCount = lookup.implementation!!.registerCount + 1,
        parameters = lookup.parameters + ImmutableMethodParameter(OPTIONAL, null, null))
    for (index in code.indices.reversed()) {
        if (index in removed) clone.implementation!!.removeInstruction(index)
        replacements[index]?.let { clone.addInstruction(index, it) }
    }
    val cast = if (requester.type == requesterType) "" else "check-cast v1, $requesterType"
    return PureSongMenuLookup(clone, """
        iget-object v1, p0, $requester
        $cast
        iget-object v1, v1, $contextProvider
        ${invokeKind(providerGet)} {v1}, $providerGet
        move-result-object v1
        check-cast v1, ${contextRead.definingClass}
        ${invokeKind(contextRead)} {v1}, $contextRead
        move-result-object v1
    """, lower, raw, receiver)
}

internal fun BytecodePatchContext.installPureSongMenuLookup(plan: PureSongMenuLookup) {
    mutableClassDefBy(plan.raw.definingClass).addBridge(plan.raw.name,
        plan.raw.parameterTypes.map { it.toString() }, plan.raw.returnType, 4,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, body = """
        const/4 v0, 0x0
        ${plan.receiver?.let { "iget-object p0, p0, $it" } ?: ""}
        ${invokeKind(plan.lower)} {p0, p1, p2, v0}, ${plan.lower}
        move-result-object v0
        return-object v0
    """)
    mutableClassDefBy(plan.method.definingClass).methods.add(plan.method)
}

private fun BytecodePatchContext.menuRawCandidates(send: MethodReference): List<Method> {
    val candidates = mutableListOf<Method>()
    var parent = classDefBy(send.definingClass).superclass
    while (parent != null) {
        val owner = classDefByOrNull(parent) ?: break
        candidates.addAll(owner.methods.filter { method ->
            method.parameterTypes.size == 3 && method.parameterTypes.take(2) == send.parameterTypes &&
                    method.parameterTypes[2].toString().startsWith("L") && method.returnType == send.returnType &&
                    !AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation?.instructions?.any {
                        it.opcode == Opcode.IGET_OBJECT && (it as TwoRegisterInstruction).registerB == method.p0Register
                    } == true
        })
        parent = owner.superclass
    }
    return candidates
}

private fun BytecodePatchContext.resolveMenuRawTransport(send: MethodReference): Pair<Method, FieldReference?> {
    val direct = menuRawCandidates(send)
    if (direct.isNotEmpty()) {
        val lower = direct.single()
        check(AccessFlags.PUBLIC.isSet(lower.accessFlags)) { "native raw menu transport is not accessible" }
        return lower to null
    }
    val delegate = classDefBy(send.definingClass).methods.single {
        it.name == send.name && it.parameterTypes == send.parameterTypes && it.returnType == send.returnType
    }
    val code = delegate.implementation!!.instructions.toList()
    check(code.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT)) {
        "native menu factory send is not a direct transport delegate"
    }
    val receiver = code[0].getReference<FieldReference>()!!
    val nested = code[1].getReference<MethodReference>()!!
    val read = code[0] as TwoRegisterInstruction
    val invocation = code[1] as ReferenceInstruction
    check(receiver.definingClass == send.definingClass && read.registerB == delegate.p0Register &&
            invocation.registerAt(0) == read.registerA && invocation.registerAt(1) == delegate.p0Register + 1 &&
            invocation.registerAt(2) == delegate.p0Register + 2 && nested.returnType == send.returnType) {
        "native menu transport delegate does not retain its request and executor"
    }
    val lower = menuRawCandidates(nested).singleOrNull()
        ?: error("native delegated menu raw transport is missing or ambiguous")
    check(AccessFlags.PUBLIC.isSet(lower.accessFlags)) { "native delegated menu raw transport is not accessible" }
    return lower to receiver
}

internal fun Instruction.lookupRegisters(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
    is TwoRegisterInstruction -> listOf(registerA, registerB)
    is OneRegisterInstruction -> listOf(registerA)
    else -> emptyList()
}

internal fun requireNoEntryInto(method: Method, removed: Set<Int>) {
    val code = method.implementation!!.instructions.toList()
    val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    val removedAddresses = removed.map { addresses[it] }.toSet()
    for ((index, instruction) in code.withIndex()) {
        if (index !in removed && instruction is OffsetInstruction) {
            check(addresses[index] + instruction.codeOffset !in removedAddresses) {
                "native lookup adaptation intersects a branch target"
            }
        }
    }
    check(method.implementation!!.tryBlocks.flatMap { it.exceptionHandlers }.none {
        it.handlerCodeAddress in removedAddresses
    }) { "native lookup adaptation intersects an exception handler" }
}
