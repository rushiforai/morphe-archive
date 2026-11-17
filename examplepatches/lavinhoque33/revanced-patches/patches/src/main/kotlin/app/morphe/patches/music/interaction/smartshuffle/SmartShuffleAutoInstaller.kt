/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.patches.music.interaction.smartshuffle

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.music.interaction.jam.QueueEnqueueFingerprint
import app.morphe.patches.music.interaction.jam.implementsType
import app.morphe.patches.music.interaction.jam.registerAt
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val AUTO = "Lapp/morphe/extension/music/patches/smartshuffle/SmartShuffleAuto;"
private const val COMPAT_ITEM = "Landroid/support/v4/media/session/MediaSessionCompat\$QueueItem;"
private const val COMPAT_DESCRIPTION = "Landroid/support/v4/media/MediaDescriptionCompat;"
private const val FRAMEWORK_ITEM = "Landroid/media/session/MediaSession\$QueueItem;"
private const val FRAMEWORK_DESCRIPTION = "Landroid/media/MediaDescription;"
private const val SESSION = "Landroid/media/session/MediaSession;"
private const val SET_QUEUE = "$SESSION->setQueue(Ljava/util/List;)V"
private const val COMPAT_CONSTRUCTOR = "$COMPAT_ITEM-><init>($FRAMEWORK_ITEM${COMPAT_DESCRIPTION}J)V"
private const val FRAMEWORK_CONSTRUCTOR = "$FRAMEWORK_ITEM-><init>(${FRAMEWORK_DESCRIPTION}J)V"

private val nativeAutoQueueFingerprint = Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("BT metadata: Set playing queue item: %s, %s, %s"),
    filters = listOf(methodCall(COMPAT_CONSTRUCTOR)),
)

private val platformAutoQueueFingerprint = Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(SET_QUEUE),
        methodCall(FRAMEWORK_CONSTRUCTOR),
        methodCall(SET_QUEUE),
    ),
)

/**
 * Preflight only: the outer Smart Shuffle patch gates versions and installs this with every other required hook.
 *
 * 9.40: hes.j passes hxj.m()J into the compat QueueItem, then copies its ID into the platform QueueItem.
 * 9.15: kyi.j passes noq.m()J into the compat QueueItem; ii.q performs the platform conversion/publication.
 * Only the final platform publication is projected. Compat state, media IDs and native commands are unchanged.
 */
internal fun BytecodePatchContext.resolveSmartShuffleAuto(): () -> Unit {
    val nativeBuilder = nativeAutoQueueFingerprint.originalMethod
    val manager = mutableClassDefBy(QueueEnqueueFingerprint.match().originalClassDef.type)
    val persistentId = manager.methods.single { it.name == "patch_jamItemId" }.instructions
        .mapNotNull { it.getReference<MethodReference>() }.single()
    verifyAutoOccurrence(nativeBuilder, persistentId)

    val publisher = platformAutoQueueFingerprint.originalMethod
    verifyPlatformOccurrence(publisher)
    val calls = publisher.instructions.withIndex().filter {
        it.value.getReference<MethodReference>()?.toString() == SET_QUEUE
    }
    check(calls.size == 2) { "Smart Shuffle Auto requires both null and populated queue publication paths" }

    val replacements = calls.map { (index, instruction) ->
        val call = instruction as ReferenceInstruction
        val receiver = requireNotNull(call.registerAt(0))
        val queue = requireNotNull(call.registerAt(1))
        val registers = when {
            receiver <= 15 && queue <= 15 -> "invoke-static {v$receiver, v$queue}"
            queue == receiver + 1 -> "invoke-static/range {v$receiver .. v$queue}"
            else -> error("Smart Shuffle Auto cannot preserve queue publication registers")
        }
        index to "$registers, $AUTO->publish(${SESSION}Ljava/util/List;)V"
    }

    return {
        val mutablePublisher = mutableClassDefBy(publisher.definingClass).findMutableMethodOf(publisher)
        replacements.forEach { (index, replacement) ->
            mutablePublisher.replaceInstruction(index, replacement)
        }
    }
}

/** Verifies that the compat constructor receives the same native persistent occurrence used by the manager. */
private fun BytecodePatchContext.verifyAutoOccurrence(builder: Method, persistentId: MethodReference) {
    val instructions = builder.instructions.toList()
    val constructorIndex = instructions.indices.single {
        instructions[it].getReference<MethodReference>()?.toString() == COMPAT_CONSTRUCTOR
    }
    check(constructorIndex >= 3) { "Smart Shuffle Auto occurrence construction is incomplete" }

    val identity = instructions[constructorIndex - 3].getReference<MethodReference>()
        ?: error("Smart Shuffle Auto has no native occurrence getter")
    check(identity.name == persistentId.name && identity.returnType == "J" && identity.parameterTypes.isEmpty() &&
        implementsType(identity.definingClass, persistentId.definingClass)) {
        "Smart Shuffle Auto queue IDs do not match native persistent occurrences"
    }

    val result = instructions[constructorIndex - 2]
    val constructor = instructions[constructorIndex] as ReferenceInstruction
    check(result.opcode == Opcode.MOVE_RESULT_WIDE &&
        (result as OneRegisterInstruction).registerA == constructor.registerAt(3)) {
        "Smart Shuffle Auto occurrence is not passed unchanged to the compat queue item"
    }
}

/** Verifies that framework queue IDs are copied from the compat constructor's original long ID field. */
private fun BytecodePatchContext.verifyPlatformOccurrence(publisher: Method) {
    val compatConstructor = classDefBy(COMPAT_ITEM).methods.single { it.toString() == COMPAT_CONSTRUCTOR }
    val storedId = compatConstructor.instructions.single { it.opcode == Opcode.IPUT_WIDE }
        .getReference<FieldReference>() ?: error("Smart Shuffle Auto compat occurrence storage is missing")

    val instructions = publisher.instructions.toList()
    val constructorIndex = instructions.indices.single {
        instructions[it].getReference<MethodReference>()?.toString() == FRAMEWORK_CONSTRUCTOR
    }
    check(constructorIndex >= 3) { "Smart Shuffle Auto platform occurrence construction is incomplete" }

    val source = instructions[constructorIndex - 3]
    val constructor = instructions[constructorIndex] as ReferenceInstruction
    check(source.opcode == Opcode.IGET_WIDE && source.getReference<FieldReference>() == storedId &&
        (source as TwoRegisterInstruction).registerA == constructor.registerAt(2)) {
        "Smart Shuffle Auto platform occurrence does not preserve the native compat ID"
    }
}
