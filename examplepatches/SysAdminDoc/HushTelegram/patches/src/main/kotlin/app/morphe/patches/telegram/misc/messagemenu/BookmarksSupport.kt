/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.blocked.MESSAGE_OBJECT
import app.morphe.patches.telegram.misc.blocked.TL_MESSAGE
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers

internal const val BOOKMARKS = "$EXTENSION_PACKAGE/misc/Bookmarks;"
private const val BOOKMARK_OBJECT = "Ljava/lang/Object;"
private const val BOOKMARK_DRAWABLES = "Lorg/telegram/messenger/R\$drawable;"
internal const val BOOKMARK_TOPIC = "$MESSAGE_OBJECT->getTopicId(I${TL_MESSAGE}Z)J"

/** Bookmark in the message menu: the stubs that read a message's place and Telegram's star icons, or why this build has none. */
internal class BookmarksPlan(val missing: String?) {
    fun apply(context: BytecodePatchContext) = context.writeBookmarkStubs()
}

/**
 * The menu item rides the menu's own fill and choose hooks, so all it needs from Telegram is whether
 * a message is numbered apart from its chat (scheduled or a quick reply), the forum topic it's in,
 * and the two stars Telegram draws beside Add to Favorites and Remove from Favorites.
 */
internal fun BytecodePatchContext.resolveBookmarks(): BookmarksPlan = try {
    requireStatusMethod("bookmarks")
    controlHook(BOOKMARKS, "apart", listOf(BOOKMARK_OBJECT), "Z")
    controlHook(BOOKMARKS, "topic", listOf(BOOKMARK_OBJECT), "J")
    for (icon in listOf("markIcon", "unmarkIcon")) controlHook(BOOKMARKS, icon, listOf(), "I")
    controlMembers(MESSAGE_OBJECT, "isQuickReply()Z", "scheduled:Z", "currentAccount:I", "messageOwner:$TL_MESSAGE",
        "static getTopicId(I${TL_MESSAGE}Z)J")
    controlMembers(BOOKMARK_DRAWABLES, "static msg_fave:I", "static msg_unfave:I")
    BookmarksPlan(null)
} catch (refused: PatchException) {
    BookmarksPlan(refused.message ?: "the message's place can't be read")
} catch (failed: RuntimeException) {
    BookmarksPlan("the message's place can't be read (${failed.javaClass.simpleName}: ${failed.message})")
}

private fun BytecodePatchContext.writeBookmarkStubs() {
    writeStub(BOOKMARKS, "apart", 2, """
        check-cast p0, $MESSAGE_OBJECT
        iget-boolean v0, p0, $MESSAGE_OBJECT->scheduled:Z
        if-nez v0, :hush_apart
        invoke-virtual {p0}, $MESSAGE_OBJECT->isQuickReply()Z
        move-result v0
        :hush_apart
        return v0
    """)
    // Telegram's own answer for the topic a message sits in, the one its chat and replies read.
    writeStub(BOOKMARKS, "topic", 4, """
        check-cast p0, $MESSAGE_OBJECT
        iget v0, p0, $MESSAGE_OBJECT->currentAccount:I
        iget-object v1, p0, $MESSAGE_OBJECT->messageOwner:$TL_MESSAGE
        const/4 v2, 0x0
        invoke-static {v0, v1, v2}, $BOOKMARK_TOPIC
        move-result-wide v0
        return-wide v0
    """)
    writeStub(BOOKMARKS, "markIcon", 1, "sget v0, $BOOKMARK_DRAWABLES->msg_fave:I\nreturn v0")
    writeStub(BOOKMARKS, "unmarkIcon", 1, "sget v0, $BOOKMARK_DRAWABLES->msg_unfave:I\nreturn v0")
}
