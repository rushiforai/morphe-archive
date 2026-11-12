/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.blocked.MESSAGE_OBJECT
import app.morphe.patches.telegram.misc.blocked.TL_MESSAGE
import app.morphe.patches.telegram.misc.blocked.insertTypeChecks
import app.morphe.patches.telegram.misc.blocked.resolveOpenChatTypeReads
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val HIDDEN_MESSAGES = "$EXTENSION_PACKAGE/misc/HiddenMessages;"
internal const val HIDDEN_TYPE = "$HIDDEN_MESSAGES->type(Ljava/lang/Object;I)I"
private const val HIDE_OBJECT = "Ljava/lang/Object;"
private const val HIDE_NOTIFICATIONS = "Lorg/telegram/messenger/NotificationCenter;"
private const val HIDE_DRAWABLES = "Lorg/telegram/messenger/R\$drawable;"

/** Hide for me: the open chat's three type tests, or why this build can't leave a message out of them. */
internal class HideForMePlan(val missing: String?, private val sites: List<Pair<MutableMethod, List<Int>>> = emptyList()) {
    fun apply(context: BytecodePatchContext) {
        context.writeHideForMeStubs()
        sites.forEach { (method, reads) -> insertTypeChecks(method, reads, HIDDEN_TYPE) }
    }
}

/**
 * The same type tests Hide blocked users and Hide messages by keyword answer: a hidden message gets
 * Telegram's own mark for one it can't show, and the open chat skips it. The menu item itself
 * takes a message out of the open chat with Telegram's "messages deleted" notice, which the chat,
 * its media viewers and the player act on without touching the server. Resolved after the menu's
 * other parts are in, since the tests are read again here.
 */
internal fun BytecodePatchContext.resolveHideForMe(): HideForMePlan = try {
    requireStatusMethod("hideForMe")
    controlHook(HIDDEN_MESSAGES, "type", listOf(HIDE_OBJECT, "I"), "I")
    for (stub in listOf("apart", "live")) controlHook(HIDDEN_MESSAGES, stub, listOf(HIDE_OBJECT), "Z")
    controlHook(HIDDEN_MESSAGES, "vanish", listOf(HIDE_OBJECT, "Ljava/util/ArrayList;"), "V")
    controlHook(HIDDEN_MESSAGES, "icon", listOf(), "I")
    controlMembers(MESSAGE_OBJECT, "isLiveLocation()Z", "isQuickReply()Z", "scheduled:Z", "currentAccount:I",
        "messageOwner:$TL_MESSAGE", "static getChannelId($TL_MESSAGE)J")
    controlMembers(HIDE_NOTIFICATIONS, "static getInstance(I)$HIDE_NOTIFICATIONS", "postNotificationName(I[Ljava/lang/Object;)V",
        "static messagesDeleted:I")
    controlMembers(HIDE_DRAWABLES, "static msg_archive_hide:I")
    val sites = resolveOpenChatTypeReads()
    // Assembled on copies first, so a refusal leaves the app untouched.
    sites.forEach { (method, reads) -> insertTypeChecks(MutableMethod(ImmutableMethod.of(method)), reads, HIDDEN_TYPE) }
    HideForMePlan(null, sites)
} catch (refused: PatchException) {
    HideForMePlan(refused.message ?: "the open chat's message tests can't be read")
} catch (failed: RuntimeException) {
    HideForMePlan("the open chat's message tests don't compile (${failed.javaClass.simpleName}: ${failed.message})")
}

private fun BytecodePatchContext.writeHideForMeStubs() {
    writeStub(HIDDEN_MESSAGES, "apart", 2, """
        check-cast p0, $MESSAGE_OBJECT
        iget-boolean v0, p0, $MESSAGE_OBJECT->scheduled:Z
        if-nez v0, :hush_apart
        invoke-virtual {p0}, $MESSAGE_OBJECT->isQuickReply()Z
        move-result v0
        :hush_apart
        return v0
    """)
    writeStub(HIDDEN_MESSAGES, "live", 2, """
        check-cast p0, $MESSAGE_OBJECT
        invoke-virtual {p0}, $MESSAGE_OBJECT->isLiveLocation()Z
        move-result v0
        return v0
    """)
    // The six values MessagesController posts with its own deletions: the ids, the channel (0 outside
    // channels and supergroups, whose ids are the account's), not scheduled, and nothing more to do.
    writeStub(HIDDEN_MESSAGES, "vanish", 6, """
        check-cast p0, $MESSAGE_OBJECT
        iget v0, p0, $MESSAGE_OBJECT->currentAccount:I
        invoke-static {v0}, $HIDE_NOTIFICATIONS->getInstance(I)$HIDE_NOTIFICATIONS
        move-result-object v0
        iget-object v1, p0, $MESSAGE_OBJECT->messageOwner:$TL_MESSAGE
        invoke-static {v1}, $MESSAGE_OBJECT->getChannelId($TL_MESSAGE)J
        move-result-wide v1
        invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v1
        const/4 v2, 0x6
        new-array v2, v2, [Ljava/lang/Object;
        const/4 v3, 0x0
        aput-object p1, v2, v3
        const/4 v3, 0x1
        aput-object v1, v2, v3
        sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
        const/4 v3, 0x2
        aput-object v1, v2, v3
        const/4 v3, 0x3
        aput-object v1, v2, v3
        const/4 v3, 0x4
        aput-object v1, v2, v3
        const/4 v1, 0x0
        invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
        move-result-object v1
        const/4 v3, 0x5
        aput-object v1, v2, v3
        sget v1, $HIDE_NOTIFICATIONS->messagesDeleted:I
        invoke-virtual {v0, v1, v2}, $HIDE_NOTIFICATIONS->postNotificationName(I[Ljava/lang/Object;)V
        return-void
    """)
    writeStub(HIDDEN_MESSAGES, "icon", 1, "sget v0, $HIDE_DRAWABLES->msg_archive_hide:I\nreturn v0")
}
