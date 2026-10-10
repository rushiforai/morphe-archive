/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.chats

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.facebook.shared.redexOriginalName
import app.morphe.patches.shared.compat.AppCompatibilities

/**
 * Keeps Facebook from showing others that you're typing, in chats that open inside Facebook and in
 * comment boxes. See TypingAnchors.kt for where each hook goes, and the extension's TypingIndicator
 * for when.
 *
 * In the default selection with both switches off, so nothing changes until one is turned on.
 */
@Suppress("unused")
val hideTypingIndicatorPatch = bytecodePatch(
    // The README table check reads this literal; TYPING_PATCH carries the same text for the messages.
    name = "Hide typing indicator",
    description = "Others don't see that you're typing, in chats that open inside Facebook and in comment boxes, " +
        "so you can write without anyone watching. Your messages send as usual. Starts off. Turn on the parts " +
        "you want in Hushfacebook settings > Privacy.",
) {
    category("Privacy")
    dependsOn(settingsPatch, facebookExtensionPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        hideTypingIndicator()
        enableStatus("typingIndicator")
    }
}

/** Puts the three hooks in, each on the one method it found. */
internal fun BytecodePatchContext.hideTypingIndicator() {
    val setters = mutableListOf<Pair<String, String>>()
    val runnables = mutableMapOf<String, MutableList<String>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_CLASSES)) return@classDefForEach
        when (val original = redexOriginalName(classDef)) {
            CHAT_SEND_TYPING, COMMENT_SEND_TYPING -> runnables.getOrPut(original) { mutableListOf() } += classDef.type
            else -> classDef.methods.filter(::isMailboxTypingSetter).forEach { setters += classDef.type to it.name }
        }
    }

    val (owner, name) = setters.singleTypingTarget("Mailbox typing setter holding \"$MAILBOX_TYPING\"")
    mutableClassDefBy(owner).methods.single { it.name == name && isMailboxTypingSetter(it) }.sendNotTyping()

    for ((original, holds) in listOf(CHAT_SEND_TYPING to HOLDS_CHAT_TYPING, COMMENT_SEND_TYPING to HOLDS_COMMENT_TYPING)) {
        val type = runnables[original].orEmpty().singleTypingTarget("class Redex names $original")
        mutableClassDefBy(type).methods.filter(::isRunMethod).singleTypingTarget("run() in $type").holdBackTyping(holds)
    }
}
