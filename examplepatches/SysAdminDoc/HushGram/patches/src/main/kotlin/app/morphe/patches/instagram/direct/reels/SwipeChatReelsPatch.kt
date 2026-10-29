/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.direct.reels

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.instagram.misc.extension.enableStatus
import app.morphe.patches.instagram.misc.extension.instagramExtensionPatch
import app.morphe.patches.instagram.misc.extension.methodsCalling
import app.morphe.patches.instagram.misc.extension.requireStatusMethod
import app.morphe.patches.instagram.misc.flags.FlagLoad
import app.morphe.patches.instagram.misc.flags.answerFlagLoads
import app.morphe.patches.instagram.misc.flags.findFlagLoads
import app.morphe.patches.instagram.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

private const val PATCH = "Swipe through a chat's reels"
internal const val CHAT_REELS = "$EXTENSION_PACKAGE/direct/ChatReels;"
internal const val CHAIN = "$CHAT_REELS->chain(I)Z"

private const val USER_SESSION = "Lcom/instagram/common/session/UserSession;"

/** What a chat's reel opener is handed: the chat and the message holding the reel. Redex keeps both names. */
internal const val THREAD_KEY = "Lcom/instagram/model/direct/DirectThreadKey;"
internal const val MESSAGE_ID = "Lcom/instagram/model/direct/messageid/MessageIdentifier;"

/**
 * The server flag behind Instagram's own chat reels test. On 453 it's read once, in a test taking
 * the session and answering it (LX/01Oo;->A00 on 385914285, LX/01PZ;->A00 on 385914282, an instance
 * method of a singleton), which the opener of a reel shared in a chat asks before it hands the chat's
 * other shared reels to the Reels viewer, and which the chat and the Reels viewer ask too. 452.1's
 * was 0x81155f00006ed0.
 */
internal const val CHAT_REELS_FLAG = 0x81153c00006fb6L

/**
 * Swiping up on a reel opened from a chat goes through the other reels shared in that chat before
 * any suggested reels (#350). In the default selection with its switch off. It answers Instagram's own
 * test, so the chain, its order and Back to the chat are Instagram's.
 */
@Suppress("unused")
val swipeChatReelsPatch = bytecodePatch(
    name = "Swipe through a chat's reels",
    description = "Swiping up on a reel you opened from a chat goes through the other reels shared in that chat before " +
        "any suggested reels. Starts off. Turn it on in HushGram settings > Messages.",
) {
    category("Messages")
    dependsOn(settingsPatch, instagramExtensionPatch)
    compatibleWith(*AppCompatibilities.instagram())

    execute {
        requireStatusMethod("chatReels")
        chainChatReels()
        enableStatus("chatReels")
    }
}

/** Finds the chat reels test's read with [findChatReels] and has the extension answer it through [CHAIN]. */
internal fun BytecodePatchContext.chainChatReels() {
    answerFlagLoads(listOf(findChatReels() to CHAIN))
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

/**
 * Finds the one read of [CHAT_REELS_FLAG]. It has to be the flag's own read, in a test taking the
 * session and answering a boolean, and a method handed a chat ([THREAD_KEY]) and one of its messages
 * ([MESSAGE_ID]), the opener of a reel shared there, has to ask that test. Fails before anything
 * changes when any of it isn't so, since that's an update this patch hasn't seen.
 */
internal fun BytecodePatchContext.findChatReels(): FlagLoad {
    val flag = CHAT_REELS_FLAG.toString(16)
    val reads = findFlagLoads(PATCH, CHAT_REELS_FLAG, "Z")
    val read = reads.singleOrNull() ?: refuse("expected one read of the chat reels flag $flag, found ${reads.size}")
    val where = "${read.type}->${read.name}"
    if (read.shared) refuse("the read of $flag in $where is shared with another flag")
    if (read.parameters != listOf(USER_SESSION) || read.returnType != "Z") {
        refuse("$flag is read in $where(${read.parameters.joinToString("")})${read.returnType}, not in a test of the session")
    }
    val openers = methodsCalling(read.type, read.name).filter { caller ->
        val takes = caller.parameterTypes.map(CharSequence::toString)
        THREAD_KEY in takes && MESSAGE_ID in takes
    }
    if (openers.isEmpty()) refuse("nothing handed a chat and a message asks $where, so it isn't the chat reels test")
    return read
}
