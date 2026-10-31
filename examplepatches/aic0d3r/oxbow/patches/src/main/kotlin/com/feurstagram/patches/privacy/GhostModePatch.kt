package com.feurstagram.patches.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.feurstagram.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import com.feurstagram.patches.shared.Constants.EXTENSION
import com.feurstagram.patches.shared.holdReceipt
import com.feurstagram.patches.shared.rememberStringsIf
import com.feurstagram.patches.shared.returnEarlyIf
import com.feurstagram.patches.shared.returnTrueIf

// Story views. The pending-seen state class builds the media/seen request...
internal object PendingStorySeenStateFingerprint : Fingerprint(
    strings = listOf("media/seen/?reel=%s&live_vod=0"),
)

// ...and its store sends it, in the one void method taking that state.
internal object PendingStorySeenStoreFingerprint : Fingerprint(
    strings = listOf("PendingReelSeenStateStore.deserializeFromDisk"),
)

// What was viewed and when, serialized into the reels_tray request body.
internal object StoriesViewInfoFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/util/Map;"),
    strings = listOf("reel_media_owner_id", "reel_media_creation_seen_at"),
)

// DM read receipts: the one sender of a chat's seen receipt, the only method that turns one into
// a request. Its second parameter is the queued task's callback.
internal object DmThreadSeenFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("IGDirectItemSeenMutation", "xig_direct_item_seen"),
    custom = { method, _ ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 3
    },
)

// Where Instagram queues that receipt: the chat key and the message id it would report, which is
// the only place Ghost mode learns what you read without asking the server.
internal object DmThreadSeenQueueFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("mark_thread_seen-"),
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)

private const val USER_SESSION = "Lcom/instagram/common/session/UserSession;"
private const val TEXT = "Ljava/lang/String;"

/**
 * The chat summary's answer whether a chat shows unread: it asks itself a few no-argument
 * booleans (Mark as unread among them), then whether the account has seen the chat's newest
 * message, a three-String check on itself. That shape is unique to this answer, and unlike its
 * obfuscated name it survives version bumps.
 */
internal object ChatUnreadAnswerFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(USER_SESSION),
    custom = { method, _ -> method.answersWhetherUnread() },
)

private fun MethodReference.isSeenCheck() =
    returnType == "Z" && parameterTypes.map(CharSequence::toString) == listOf(TEXT, TEXT, TEXT)

private fun Method.answersWhetherUnread(): Boolean {
    var flags = 0
    var seenChecks = 0
    for (instruction in implementation?.instructions ?: return false) {
        val call = instruction.getReference<MethodReference>() ?: continue
        if (call.definingClass != definingClass || call.returnType != "Z") continue
        if (call.parameterTypes.isEmpty()) flags++
        else if (call.parameterTypes.map(CharSequence::toString) == listOf(TEXT, TEXT, TEXT)) seenChecks++
    }
    return flags >= 3 && seenChecks == 1
}

// Typing indicator: the one sender of the MQTT "indicate_activity" command.
internal object TypingIndicatorFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("indicate_activity"),
)

@Suppress("unused")
val ghostModePatch = bytecodePatch(
    name = "Ghost mode",
    description = "Optional: watch stories without being listed as a viewer, read DMs without " +
        "sending read receipts, type without showing \"typing...\". Each is a runtime toggle.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    extendWith(EXTENSION)

    execute {
        // Stories: never even build the request (the network block in Block.java is the backstop).
        val stateType = PendingStorySeenStateFingerprint.classDef.type
        val send = PendingStorySeenStoreFingerprint.classDef.methods.singleOrNull {
            it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(stateType)
        } ?: throw PatchException("Story seen store: no single send(state) method")
        mutableClassDefBy(PendingStorySeenStoreFingerprint.classDef).methods
            .first { it.name == send.name && it.parameterTypes == send.parameterTypes }
            .returnEarlyIf("isStorySeenHidden")
        StoriesViewInfoFingerprint.method.returnEarlyIf("isStorySeenHidden", "const-string v0, \"[]\"\nreturn-object v0")

        // Skipping the request alone leaves the queued receipt unfinished, and Instagram clears
        // your own unread mark only once the queue reports it done: finish it here, without the
        // request, so the chat stops showing as unread for you while the sender hears nothing.
        val receipt = DmThreadSeenFingerprint.method
        val done = classDefBy(receipt.parameterTypes[1].toString()).methods.singleOrNull {
            it.returnType == "V" && !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.parameterTypes.size == 2 && it.parameterTypes[1].toString() == "Ljava/lang/String;"
        } ?: throw PatchException("Receipt callback: no single completion taking (Object, String)")
        receipt.holdReceipt(
            "isDmSeenHidden",
            "${done.definingClass}->${done.name}(${done.parameterTypes.joinToString("")})V",
        )

        // Instagram rebuilds the inbox from the server, which never hears about these receipts, so
        // a ghosted chat comes back unread after a sync. Keep what you read locally here...
        val queued = DmThreadSeenQueueFingerprint.method
        queued.rememberStringsIf(
            "isDmSeenHidden",
            "rememberSeenItem",
            queued.parameterTypes.indices.filter { queued.parameterTypes[it].toString() == TEXT },
        )
        // ...and let the chat summary's own "has this account seen that message" check answer for
        // it, so the chat still reads as read with the receipt never having left.
        val unread = ChatUnreadAnswerFingerprint.method
        val check = unread.implementation?.instructions.orEmpty()
            .mapNotNull { it.getReference<MethodReference>() }
            .singleOrNull { it.definingClass == unread.definingClass && it.isSeenCheck() }
            ?: throw PatchException("Inbox unread answer: no single seen check to hook")
        mutableClassDefBy(unread.definingClass).methods.singleOrNull {
            it.name == check.name && it.returnType == "Z" &&
                it.parameterTypes.map(CharSequence::toString) == check.parameterTypes.map(CharSequence::toString)
        }?.returnTrueIf("isItemSeen", 1)
            ?: throw PatchException("Inbox unread answer: no single ${check.name}")
        TypingIndicatorFingerprint.method.returnEarlyIf("isTypingHidden")
    }
}
