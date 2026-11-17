/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.patches.music.interaction.smartshuffle

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.music.interaction.downloads.addDownloadsBridge
import app.morphe.patches.music.interaction.jam.invokeKind
import app.morphe.patches.music.interaction.jam.registerAt
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val KEEP = "Lapp/morphe/extension/music/patches/smartshuffle/SmartShuffleKeep;"
private const val KEEP_REQUEST = $$"Lapp/morphe/extension/music/patches/smartshuffle/SmartShuffleKeep$Request;"
private const val OBJECT = "Ljava/lang/Object;"
private const val MESSAGE = "Lcom/google/protobuf/MessageLite;"
private const val FUTURE = "Lcom/google/common/util/concurrent/ListenableFuture;"

private fun Method.creates(type: String): Boolean = implementation?.instructions?.any {
    it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == type
} == true

/** Match the modern future and legacy callback paths at their actual network submission. */
internal fun Method.keepRequestSubmissionIndex(requestBase: String, networkOwner: String): Int? {
    if (AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.firstOrNull() != requestBase ||
        (returnType != FUTURE && returnType != "V")) return null

    val body = implementation ?: return null
    val code = body.instructions.toList()
    val submissions = code.indices.filter { index ->
        val instruction = code[index]
        (instruction.opcode == Opcode.INVOKE_VIRTUAL || instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
            instruction.getReference<MethodReference>()?.let {
                it.definingClass == networkOwner && it.parameterTypes.size == 3 &&
                    it.parameterTypes.first().toString() == requestBase && it.returnType == returnType
            } == true
    }
    if (submissions.isEmpty()) return null

    val submission = submissions.single()
    val requestRegister = body.registerCount - parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
    check((code[submission] as ReferenceInstruction).registerAt(1) == requestRegister) {
        "Playlist edit submission does not preserve the original request identity"
    }
    check(code.any { instruction ->
        val constructor = instruction.getReference<MethodReference>()
        constructor?.name == "<init>" && constructor.parameterTypes.firstOrNull()?.toString() == definingClass &&
            constructor.parameterTypes.count { it.toString() == requestBase } == 1 &&
            (instruction as ReferenceInstruction).registerAt(
                constructor.parameterTypes.indexOfFirst { it.toString() == requestBase } + 1
            ) == requestRegister
    }) { "Playlist edit completion does not capture the submitted request identity" }

    return submission
}

internal fun MutableMethod.addKeepRequestSubmission(index: Int) {
    val instruction = implementation!!.instructions.elementAt(index) as ReferenceInstruction
    val requestRegister = requireNotNull(instruction.registerAt(1))

    addInstructionsAtControlFlowLabel(
        index,
        "invoke-static/range {v$requestRegister .. v$requestRegister}, $KEEP->onEditStarted($OBJECT)V",
    )
}

internal fun MutableMethod.addKeepEditCompletion() {
    check(!AccessFlags.STATIC.isSet(accessFlags) && parameterTypes.size == 2 && returnType == "V")

    addInstruction(0, "invoke-static/range {p1 .. p2}, $KEEP->onEditCompleted($OBJECT$OBJECT)V")
}

/** Resolve request serialization, submission and the matching response before installing any hooks. */
internal fun BytecodePatchContext.resolveSmartShuffleKeep(): () -> Unit {
    val request = Fingerprint(strings = listOf("browse/edit_playlist")).classDef
    val requestType = request.type
    val requestBase = request.superclass ?: error("Playlist edit request has no base")
    val builder = request.methods.single { method ->
        method.parameterTypes.isEmpty() && method.returnType.startsWith("L") &&
            method.implementation?.instructions?.any {
                it.getReference<MethodReference>()?.name == "createBuilder"
            } == true
    }
    check(!AccessFlags.STATIC.isSet(builder.accessFlags)) { "Playlist edit builder is static" }
    val build = classDefBy(builder.returnType).methods.single {
        it.name == "build" && it.parameterTypes.isEmpty() && it.returnType == MESSAGE
    }
    val serialize = classDefBy(MESSAGE).methods.single {
        it.name == "toByteArray" && it.parameterTypes.isEmpty() && it.returnType == "[B"
    }
    val services = buildList {
        classDefForEach { owner ->
            if (owner.methods.any { it.returnType == requestType && it.creates(requestType) }) {
                add(owner)
            }
        }
    }
    val service = services.single()
    val callbacks = service.fields.mapNotNull { classDefByOrNull(it.type) }.filter { callback ->
        callback.fields.any { it.type == service.type } && callback.methods.any {
            it.returnType == "V" && it.parameterTypes == listOf(requestBase, OBJECT)
        }
    }.distinctBy { it.type }.single()
    val completed = callbacks.methods.single {
        it.returnType == "V" && it.parameterTypes == listOf(requestBase, OBJECT) && it.implementation != null
    }
    check(!AccessFlags.STATIC.isSet(completed.accessFlags)) { "Playlist edit completion is static" }

    // The similarly shaped one-request callback reports network failures, not request submission.
    // Both success paths submit the populated request here and retain it in their completion closures.
    val shared = classDefBy(callbacks.superclass ?: error("Playlist edit callback has no shared service"))
    val networkOwner = shared.superclass ?: error("Playlist edit shared service has no network dispatcher")
    val submissions = shared.methods.mapNotNull { method ->
        method.keepRequestSubmissionIndex(requestBase, networkOwner)?.let { method to it }
    }
    check(submissions.size == 2 && submissions.map { it.first.returnType }.toSet() == setOf(FUTURE, "V")) {
        "Playlist edit future/callback submission paths are missing or ambiguous"
    }
    check(service.methods.any { method ->
        method.parameterTypes == listOf(requestType, "Ljava/util/concurrent/Executor;") &&
            method.returnType == FUTURE && method.implementation?.instructions?.any {
                it.getReference<MethodReference>()?.let { call ->
                    call.definingClass == shared.type &&
                        call.parameterTypes == listOf(requestBase, "Ljava/util/concurrent/Executor;") &&
                        call.returnType == FUTURE
                } == true
            } == true
    }) { "Playlist edit service does not use the resolved future submission path" }

    return {
        mutableClassDefBy(requestType).apply {
            interfaces.add(KEEP_REQUEST)
            addDownloadsBridge("rvxKeepRequest", emptyList(), "[B", 2, """
                invoke-virtual {p0}, $builder
                move-result-object v0
                ${invokeKind(build)} {v0}, $build
                move-result-object v0
                ${invokeKind(serialize)} {v0}, $serialize
                move-result-object v0
                return-object v0
            """)
        }
        val submissionOwner = mutableClassDefBy(shared.type)
        submissions.forEach { (method, index) ->
            submissionOwner.findMutableMethodOf(method).addKeepRequestSubmission(index)
        }
        mutableClassDefBy(callbacks.type).findMutableMethodOf(completed).addKeepEditCompletion()
    }
}
