/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3471
 * https://github.com/MorpheApp/morphe-patches/pull/3014
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * modified by lavinhoque33, 2026-10-17: ported to the RVX fork. The queue capture is inserted
 * right after the super constructor call instead of before each return-void: the queue manager
 * constructor reuses p0 as a scratch register before returning, and the fork has no
 * cloneParameters() helper.
 * Modified by lavinhoque33, 2026-10-24: uses the bridge helpers of the ported Jam patch again,
 * like Morphe, and captures through the super constructor's receiver register.
 */

package app.morphe.patches.music.misc.audiovideoswitch

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.music.interaction.jam.addBridge
import app.morphe.patches.music.interaction.jam.addReferenceGetter
import app.morphe.patches.music.interaction.jam.decode
import app.morphe.patches.music.interaction.jam.installNativeAccessor
import app.morphe.patches.music.interaction.jam.invokeKind
import app.morphe.patches.music.interaction.jam.registerAt
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val SUPER_INIT_OPCODES = setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE)

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/music/patches/misc/EnableAudioVideoSwitchPatch;"
private const val ACCESS =
    $$"Lapp/morphe/extension/music/patches/misc/EnableAudioVideoSwitchPatch$QueueAccess;"

/**
 * Every bridge is named patch_atv* and the original queue operations are never renamed here.
 */
internal fun BytecodePatchContext.installAudioVideoSwitchQueue(queue: AudioVideoQueueAbi) {
    val manager = mutableClassDefBy(queue.managerType)
    manager.interfaces.add(ACCESS)

    manager.addBridge(
        "patch_atvEnqueue",
        listOf("[B"),
        "V",
        4,
        body =
            queue.command.decode("p1", "v0") + """
            ${invokeKind(queue.enqueue)} {p0, v0}, ${queue.enqueue}
            return-void
        """
    )
    manager.addReferenceGetter("patch_atvExecutor", queue.executor)
    installNativeAccessor(
        manager,
        "patch_atvCurrentIndex",
        queue.storage.currentIndex,
        receiverField = queue.storage.field,
    )
    manager.addBridge(
        "patch_atvItems",
        emptyList(),
        "[Ljava/lang/Object;",
        3,
        body = """
            iget-object v0, p0, ${queue.storage.field}
            const/4 v1, 0x0
            ${invokeKind(queue.storage.items)} {v0, v1}, ${queue.storage.items}
            move-result-object v0
            invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """
    )
    installNativeAccessor(
        manager,
        "patch_atvVideoId",
        queue.videoId,
        opaqueReceiver = true,
    )
    manager.addBridge(
        "patch_atvRemove",
        listOf("Ljava/lang/Object;"),
        "V",
        2,
        body = """
            check-cast p1, ${queue.itemType}
            ${invokeKind(queue.remove)} {p0, p1}, ${queue.remove}
            return-void
        """
    )
    manager.addBridge(
        "patch_atvLocal",
        emptyList(),
        "Z",
        3,
        body = """
            iget-object v0, p0, ${queue.storage.field}
            ${invokeKind(queue.storage.mode)} {v0}, ${queue.storage.mode}
            move-result-object v0
            sget-object v1, ${queue.storage.localMode}
            if-ne v0, v1, :remote
            const/4 v0, 0x1
            return v0
            :remote
            const/4 v0, 0x0
            return v0
        """
    )

    installAudioVideoSwitchCapture(queue)
}

/**
 * Captures the manager right after its super constructor call. The receiver register of that call
 * is used instead of p0: the constructor reuses p0 as scratch before returning, and Jam queue
 * sharing may already have cloned the constructor, which moves `this` out of p0.
 */
private fun BytecodePatchContext.installAudioVideoSwitchCapture(queue: AudioVideoQueueAbi) {
    val manager = mutableClassDefBy(queue.managerType)
    val constructor = manager.methods.single {
        it.name == queue.constructor.name &&
            it.parameterTypes.map(CharSequence::toString) ==
            queue.constructor.parameterTypes.map(CharSequence::toString)
    }

    constructor.apply {
        val superInitIndex = indexOfFirstInstructionOrThrow {
            opcode in SUPER_INIT_OPCODES &&
                getReference<MethodReference>()?.let {
                    it.name == "<init>" && it.definingClass == manager.superclass
                } == true
        }
        val thisRegister = (getInstruction(superInitIndex) as ReferenceInstruction).registerAt(0)
            ?: error("Unable to resolve the audio/video switch queue manager receiver")

        addInstructions(
            superInitIndex + 1,
            "invoke-static/range {v$thisRegister .. v$thisRegister}, $EXTENSION_CLASS->capture($ACCESS)V",
        )
    }
}
