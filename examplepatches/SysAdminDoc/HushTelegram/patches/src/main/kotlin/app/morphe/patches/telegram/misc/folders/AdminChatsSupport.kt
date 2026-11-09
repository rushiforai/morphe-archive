/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.chattypefolders.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.requireReachable

internal const val ADMIN_CHATS = "$EXTENSION_PACKAGE/misc/AdminChats;"
internal const val TL_CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
internal const val GET_CHAT = "$MESSAGES_CONTROLLER->getChat(Ljava/lang/Long;)$TL_CHAT"
internal const val CHAT_CREATOR = "$TL_CHAT->creator:Z"
internal const val CHAT_ADMIN_RIGHTS = "$TL_CHAT->admin_rights:Lorg/telegram/tgnet/TLRPC\$TL_chatAdminRights;"

/**
 * The Administrators row asks Telegram whether a chat is one you own or manage. The filter itself
 * runs inside the prune hook that already exists, so this only checks the one stub can be given
 * Telegram's code, or throws and the switch is left out.
 */
internal fun BytecodePatchContext.requireAdminChatsRuntime() {
    requireStatusMethod("adminChats")
    controlHook(ADMIN_CHATS, "isAdmin", listOf("Ljava/lang/Object;", "J"), "Z")
    requireReachable(GET_CHAT, false)
    requireReachable(CHAT_CREATOR, false)
    requireReachable(CHAT_ADMIN_RIGHTS, false)
}

internal fun BytecodePatchContext.writeAdminChatsStubs() {
    writeStub(ADMIN_CHATS, "isAdmin", 5, """
        check-cast p0, $MESSAGES_CONTROLLER
        invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v0
        invoke-virtual {p0, v0}, $GET_CHAT
        move-result-object v0
        if-eqz v0, :no
        iget-boolean v1, v0, $CHAT_CREATOR
        if-nez v1, :yes
        iget-object v1, v0, $CHAT_ADMIN_RIGHTS
        if-eqz v1, :no
        :yes
        const/4 v0, 0x1
        return v0
        :no
        const/4 v0, 0x0
        return v0
    """)
}
