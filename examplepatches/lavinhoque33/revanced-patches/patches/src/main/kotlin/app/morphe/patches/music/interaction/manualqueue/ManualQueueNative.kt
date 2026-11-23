/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.patches.music.interaction.manualqueue

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.music.interaction.jam.QueueStorageAbi
import app.morphe.patches.music.interaction.jam.addBridge
import app.morphe.patches.music.interaction.jam.getMutableMethod
import app.morphe.patches.music.interaction.jam.installNativeAccessor
import app.morphe.patches.music.interaction.jam.interfaceClosure
import app.morphe.patches.music.interaction.jam.invokeKind
import app.morphe.patches.music.interaction.jam.p0Register
import app.morphe.patches.music.interaction.jam.queueCallbackCaptureFingerprint
import app.morphe.patches.music.interaction.jam.queueItemEndpointFingerprint
import app.morphe.patches.music.interaction.jam.queuePersistentIdFingerprint
import app.morphe.patches.music.interaction.jam.queueSuccessCallbackFingerprint
import app.morphe.patches.music.interaction.jam.registerAt
import app.morphe.patches.music.interaction.jam.resolveStorage
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField

internal fun ReferenceInstruction.reg(index: Int): Int = requireNotNull(registerAt(index))

internal data class ManualNativeQueue(val modeType: String, val install: () -> Unit)

internal fun BytecodePatchContext.resolveManualQueue(enqueue: Method, resolver: Method): ManualNativeQueue {
    val command = enqueue.parameterTypes.single().toString()
    val manager = mutableClassDefBy(enqueue.definingClass)
    val storage = resolveStorage(classDefBy(manager.type), enqueue)
    val constructor = queueCallbackCaptureFingerprint(enqueue, manager.type).originalMethod
    val mode = constructor.parameterTypes[1].toString()
    val callback = queueSuccessCallbackFingerprint(constructor.definingClass).originalMethod
    val success = nativeBody(callback, "patch_jamLocalSuccess", "MusicQueueCallback onSuccess, numItems")
    val enqueueBody = nativeBody(enqueue, "patch_jamLocalEnqueue", "enqueue item, QueueTarget")
    val firstRoute = resolver.implementation!!.instructions.mapNotNull { it.getReference<MethodReference>() }
        .single { call -> call.definingClass == manager.type && call.parameterTypes.size == 2 &&
            call.parameterTypes[1] == mode && call.returnType == "Z" }
    val itemType = firstRoute.parameterTypes.first().toString()
    val occurrence = queuePersistentIdFingerprint(interfaceClosure(itemType)).matchAll().single {
        queueItemEndpointFingerprint(it.originalClassDef.type, command).matchAllOrNull() != null
    }.originalMethod
    val shuffle = Fingerprint(definingClass = storage.type, parameters = emptyList(), returnType = "L",
        strings = listOf("Trying to call getShuffleType on a non shuffleable queue.")).originalMethod
    val unshuffled = enumField(shuffle.returnType, "SHUFFLE_TYPE_UNDEFINED")
    val installStore = resolveManualStorage(storage, itemType, occurrence, shuffle, unshuffled)
    val installEnqueue = resolveCompletionExecutor(enqueueBody, constructor)
    val installCommit = resolveCommitIndex(success, storage.laneType)

    return ManualNativeQueue(mode) {
        manager.interfaces.add(ACCESS)
        manager.addBridge("rvxManualQueue", emptyList(), QUEUE, 2, body = """
            iget-object v0, p0, ${storage.field}
            return-object v0
        """)
        manager.addBridge("rvxManualDispatch", listOf(OBJECT), "V", 2, body = """
            check-cast p1, $command
            ${invokeKind(enqueue)} {p0, p1}, $enqueue
            return-void
        """)
        installStore()
        installEnqueue()
        installCommit()
    }
}

/** Jam may wrap these methods, but the native body still owns callbacks and insertion. */
private fun BytecodePatchContext.nativeBody(reference: Method, jamName: String, diagnostic: String): MutableMethod {
    val method = reference.getMutableMethod()
    if (method.code().any { it.getReference<StringReference>()?.string?.startsWith(diagnostic) == true }) return method

    return mutableClassDefBy(reference.definingClass).methods.single { it.name == jamName }
}

private fun BytecodePatchContext.enumField(type: String, label: String): FieldReference {
    val initializer = classDefBy(type).methods.single { it.name == "<clinit>" }
    val code = initializer.implementation!!.instructions.toList()
    val name = code.indexOfFirst { it.getReference<StringReference>()?.string == label }
    check(name >= 0) { "Native enum does not define $label" }
    return code.drop(name + 1).first { it.opcode == Opcode.SPUT_OBJECT }.getReference<FieldReference>()!!
}

private fun BytecodePatchContext.resolveManualStorage(
    storage: QueueStorageAbi,
    item: String,
    occurrence: Method,
    shuffle: Method,
    unshuffled: FieldReference,
): () -> Unit {
    val owner = mutableClassDefBy(storage.type)
    val lane = mutableClassDefBy(storage.laneType)
    check(lane.methods.any { it.name == "get" && it.parameterTypes == listOf("I") && it.returnType == OBJECT }) {
        "Native queue lane has no direct row accessor"
    }
    val state = "${owner.type}->rvxManualQueueState:$STATE"
    val resets = resolveQueueResets(storage)

    return {
        owner.interfaces.add(QUEUE)
        lane.interfaces.add(LANE)
        owner.instanceFields.add(ImmutableField(owner.type, "rvxManualQueueState", STATE,
            AccessFlags.PRIVATE.value or AccessFlags.VOLATILE.value, null, null, null).toMutable())
        owner.addBridge("rvxManualState", emptyList(), STATE, 2, body = """
            iget-object v0, p0, $state
            return-object v0
        """)
        owner.addBridge("rvxManualState", listOf(STATE), "V", 2, body = """
            iput-object p1, p0, $state
            return-void
        """)
        owner.addBridge("rvxManualLane", emptyList(), LANE, 2, body = """
            const/4 v0, 0x0
            ${invokeKind(storage.lane)} {p0, v0}, ${storage.lane}
            move-result-object v0
            return-object v0
        """)
        installNativeAccessor(owner, "rvxManualCurrent", storage.currentIndex)
        owner.addBridge("applyAsLong", listOf(OBJECT), "J", 4, body = """
            instance-of v0, p1, $item
            if-eqz v0, :unknown
            check-cast p1, ${occurrence.definingClass}
            invoke-interface {p1}, $occurrence
            move-result-wide v0
            return-wide v0
            :unknown
            const-wide/high16 v0, -0x8000000000000000L
            return-wide v0
        """)
        owner.addBridge("rvxManualLocal", emptyList(), "Z", 3,
            body = nativeEnumComparison(storage.mode, storage.localMode))
        owner.addBridge("rvxManualUnshuffled", emptyList(), "Z", 3,
            body = nativeEnumComparison(shuffle, unshuffled))
        resets()
    }
}

private fun BytecodePatchContext.nativeEnumComparison(getter: MethodReference, value: FieldReference) = """
    ${invokeKind(getter)} {p0}, $getter
    move-result-object v0
    sget-object v1, $value
    if-ne v0, v1, :other
    const/4 v0, 0x1
    return v0
    :other
    const/4 v0, 0x0
    return v0
"""

private data class QueueReset(val method: MutableMethod, val index: Int, val result: Int = -1)

private fun BytecodePatchContext.resolveQueueResets(storage: QueueStorageAbi): () -> Unit {
    val owner = mutableClassDefBy(storage.type)
    val current = storage.currentIndex.getMutableMethod()
    val model = current.code().mapNotNull { it.getReference<FieldReference>() }
        .single { it.definingClass == storage.type }
    val writes = owner.methods.filter { it.name != "<init>" && it.implementation != null }.flatMap { method ->
        method.code().mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.IPUT_OBJECT && instruction.getReference<FieldReference>() == model) {
                check((instruction as TwoRegisterInstruction).registerB == method.p0Register)
                QueueReset(method, index + 1)
            } else null
        }
    }
    check(writes.isNotEmpty()) { "Native queue model replacement is unavailable" }
    val clear = classDefBy(storage.type).methods.single { method ->
        val code = method.implementation?.instructions?.toList()
        if (method.parameters.isNotEmpty() || method.returnType != "V" || code?.size != 3) false
        else {
            val call = code[1].getReference<MethodReference>()
            code[0].opcode == Opcode.IGET_OBJECT && code[0].getReference<FieldReference>() == model &&
                code[1].opcode == Opcode.INVOKE_INTERFACE && call?.definingClass == model.type &&
                call.parameterTypes.isEmpty() && call.returnType == "V"
        }
    }.getMutableMethod()
    val replace = owner.methods.single { method ->
        method.implementation?.instructions?.any {
            it.getReference<StringReference>()?.string?.contains("replaceQueueContents") == true
        } == true
    }
    val code = replace.code()
    val mutation = code.indices.single { index ->
        code[index].getReference<MethodReference>()?.parameterTypes?.let {
            it.size == 4 && it[0] == "Ljava/util/List;" && it[1] == "Ljava/util/List;" && it[2] == "I"
        } == true
    }
    val reset = when (code[mutation].getReference<MethodReference>()!!.returnType) {
        "V" -> QueueReset(replace, mutation + 1)
        "Z" -> {
            val result = code[mutation + 1]
            check(result.opcode == Opcode.MOVE_RESULT)
            QueueReset(replace, mutation + 2, (result as OneRegisterInstruction).registerA)
        }
        else -> error("Native in-place queue replacement has an unknown result")
    }

    return {
        for ((method, index, result) in (writes + reset + QueueReset(clear, 0)).sortedByDescending { it.index }) {
            val invoke = "invoke-static/range {p0 .. p0}, $EXT->replaced($QUEUE)V"
            if (result < 0) method.addInstructions(index, invoke)
            else method.addInstructionsWithLabels(index, """
                if-eqz v$result, :unchanged
                $invoke
            """, ExternalLabel("unchanged", method.code()[index]))
        }
    }
}

private fun resolveCompletionExecutor(method: MutableMethod, constructor: Method): () -> Unit {
    val code = method.code()
    val create = code.indices.single { code[it].getReference<MethodReference>() == constructor }
    val callback = (code[create] as ReferenceInstruction).reg(0)
    val register = code.indices.single { index ->
        index > create && code[index].getReference<MethodReference>()?.let {
            it.returnType == "V" && it.parameterTypes.lastOrNull() == EXECUTOR
        } == true
    }
    val subscribe = code[register] as ReferenceInstruction
    val executor = subscribe.reg((subscribe.reference as MethodReference).parameterTypes.lastIndex)

    return {
        method.addInstructions(register, """
            invoke-static/range {v$executor .. v$executor}, $EXT->completionExecutor($EXECUTOR)$EXECUTOR
            move-result-object v$executor
        """)
        method.addInstructions(create + 1, "invoke-static/range {v$callback .. v$callback}, $EXT->bindCallback($OBJECT)V")
    }
}

private fun resolveCommitIndex(method: MutableMethod, laneType: String): () -> Unit {
    val code = method.code()
    val commit = code.indices.single { index ->
        code[index].getReference<MethodReference>()?.let {
            it.definingClass == laneType && it.name == "addAll" && it.parameterTypes == listOf("I", COLLECTION) &&
                it.returnType == "Z"
        } == true
    }
    check(code[commit + 1].opcode != Opcode.MOVE_RESULT) { "Native insertion consumes its boolean return" }
    val add = code[commit] as ReferenceInstruction
    val lane = add.reg(0)
    val index = add.reg(1)
    val items = add.reg(2)
    check(listOf(lane, index, items, method.p0Register).all { it <= 15 }) { "Native insertion registers unavailable" }

    return {
        method.addInstructions(commit + 1, """
            move-result v$index
            invoke-static {p0, v$items, v$index}, $EXT->committed($OBJECT${COLLECTION}Z)V
        """)
        method.addInstructions(commit, """
            invoke-static {p0, v$lane, v$index, v$items}, $EXT->insertionIndex($OBJECT${OBJECT}I$COLLECTION)I
            move-result v$index
        """)
    }
}
