/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.stories.seen

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.instagram.misc.extension.enableStatus
import app.morphe.patches.instagram.misc.extension.instagramExtensionPatch
import app.morphe.patches.instagram.misc.extension.requireLocals
import app.morphe.patches.instagram.misc.extension.uniqueMethod
import app.morphe.patches.instagram.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "View stories anonymously"
internal const val HOLD_BACK = "$EXTENSION_PACKAGE/stories/StorySeen;->holdBack()Z"

/**
 * Keeps the stories you watch from being reported, which is what puts you on their viewer lists.
 * Only the viewing report stops: replies and reactions go out through their own requests.
 *
 * Off in the default selection, since it changes what other people see. Picked, its switch starts
 * on.
 */
@Suppress("unused")
val viewStoriesAnonymouslyPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "View stories anonymously",
    description = "Keeps you off the viewer list of the stories you watch, because Instagram isn't told which " +
        "ones you've seen. Replying or reacting still shows you, and stories you've watched keep showing as new.",
    default = false,
) {
    category("Privacy")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.instagram())
    dependsOn(instagramExtensionPatch)

    execute {
        holdBackStoryViews()
        enableStatus("storySeen")
    }
}

/**
 * Instagram gathers the stories you've seen into a batch and posts it to media/seen/ from one
 * method of PendingReelSeenStateStore, the send: it builds the request from the batch and schedules
 * it, and returns without either when the batch is empty. Each caller (the viewer stopping or
 * closing, the tray loading) hands it a copy of its batch and clears its own. The guard goes first
 * in the send and returns the same way when the extension says the views stay on the phone, so a
 * batch held back is dropped, not kept for later. The store's retry queue is filled only from
 * batches a session before this one saved to disk, and Instagram 449 saves none there.
 */
internal fun BytecodePatchContext.holdBackStoryViews() {
    val request = uniqueMethod(PATCH, "story seen request", StorySeenRequestFingerprint)
    val batch = request.definingClass
    val store = uniqueMethod(PATCH, "pending story seen store", PendingStorySeenStoreFingerprint).definingClass
    val senders = mutableClassDefBy(store).methods.filter { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
            method.parameterTypes.map(Any::toString) == listOf(batch) &&
            method.implementation?.instructions?.any { instruction ->
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                    it.definingClass == batch && it.name == request.name && it.returnType == request.returnType &&
                        it.parameterTypes.map(Any::toString) == request.parameterTypes.map(Any::toString)
                } == true
            } == true
    }
    val send = senders.singleOrNull() ?: throw PatchException(
        "$PATCH: expected one instance method ($batch)V in $store that builds the seen request, found ${senders.size}",
    )
    send.requireLocals(PATCH, 1)
    send.addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $HOLD_BACK
            move-result v0
            if-eqz v0, :send
            return-void
        """,
        ExternalLabel("send", send.getInstruction(0)),
    )
}
