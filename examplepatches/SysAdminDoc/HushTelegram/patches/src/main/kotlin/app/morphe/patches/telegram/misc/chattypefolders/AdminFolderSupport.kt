/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.chattypefolders

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.requireReachable

internal const val ADMIN_FOLDER = "$EXTENSION_PACKAGE/misc/AdminFolder;"
private const val ADMIN_FOLDER_CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
private const val ADMIN_FOLDER_DIALOG = "Lorg/telegram/tgnet/TLRPC\$Dialog;"
private const val ADMIN_FOLDER_ALL_DIALOGS = "$MESSAGES_CONTROLLER->allDialogs:Ljava/util/ArrayList;"
private const val ADMIN_FOLDER_DIALOG_ID = "$ADMIN_FOLDER_DIALOG->id:J"
private const val ADMIN_FOLDER_GET_CHAT = "$MESSAGES_CONTROLLER->getChat(Ljava/lang/Long;)$ADMIN_FOLDER_CHAT"
private const val ADMIN_FOLDER_LEFT = "$ADMIN_FOLDER_CHAT->left:Z"
private const val ADMIN_FOLDER_DEACTIVATED = "$ADMIN_FOLDER_CHAT->deactivated:Z"
private const val ADMIN_FOLDER_MONOFORUM = "$ADMIN_FOLDER_CHAT->monoforum:Z"
private const val ADMIN_FOLDER_CREATOR = "$ADMIN_FOLDER_CHAT->creator:Z"
private const val ADMIN_FOLDER_RIGHTS = "$ADMIN_FOLDER_CHAT->admin_rights:Lorg/telegram/tgnet/TLRPC\$TL_chatAdminRights;"
private const val ADMIN_FOLDER_CHATS_DEFAULT = "$MESSAGES_CONTROLLER->dialogFiltersChatsLimitDefault:I"
private const val ADMIN_FOLDER_CHATS_PREMIUM = "$MESSAGES_CONTROLLER->dialogFiltersChatsLimitPremium:I"
private const val ADMIN_FOLDER_INCLUDE = "$SERVER_FILTER->include_peers:Ljava/util/ArrayList;"
private const val ADMIN_FOLDER_INPUT_PEER = "$MESSAGES_CONTROLLER->getInputPeer(J)Lorg/telegram/tgnet/TLRPC\$InputPeer;"
private const val ADMIN_FOLDER_RELOAD = "$MESSAGES_CONTROLLER->loadRemoteFilters(ZLorg/telegram/messenger/Utilities\$Callback;)V"

/**
 * The Admin folder's stubs, on top of the ones Folders by chat type writes: the loaded chats, your
 * role in each, how many chats a folder holds, a folder's chats, the request that saves a folder
 * with only chats in it, and Telegram's own reload of its folders. Nothing in Telegram is hooked.
 */
internal fun BytecodePatchContext.resolveAdminFolder() {
    requireStatusMethod("adminFolder")
    controlHook(ADMIN_FOLDER, "dialogCount", listOf("I"), "I")
    controlHook(ADMIN_FOLDER, "dialogId", listOf("I", "I"), "J")
    controlHook(ADMIN_FOLDER, "chatRole", listOf("I", "J"), "I")
    controlHook(ADMIN_FOLDER, "chatLimit", listOf("I"), "I")
    controlHook(ADMIN_FOLDER, "folderChats", listOf("I", "I"), "Ljava/lang/Object;")
    controlHook(ADMIN_FOLDER, "saveAdminFolder", listOf("I", "I", "Ljava/lang/String;", "[J", "Ljava/lang/Object;"), "V")
    controlHook(ADMIN_FOLDER, "reloadFolders", listOf("I"), "V")
    for (reference in listOf(ADMIN_FOLDER_ALL_DIALOGS, ADMIN_FOLDER_DIALOG_ID, ADMIN_FOLDER_GET_CHAT, ADMIN_FOLDER_LEFT,
        ADMIN_FOLDER_DEACTIVATED, ADMIN_FOLDER_MONOFORUM, ADMIN_FOLDER_CREATOR, ADMIN_FOLDER_RIGHTS, ADMIN_FOLDER_CHATS_DEFAULT,
        ADMIN_FOLDER_CHATS_PREMIUM, ADMIN_FOLDER_INCLUDE, ADMIN_FOLDER_INPUT_PEER, ADMIN_FOLDER_RELOAD)) {
        requireReachable(reference, false)
    }
}

internal fun BytecodePatchContext.writeAdminFolderStubs() {
    writeStub(ADMIN_FOLDER, "dialogCount", 1, """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object p0
        iget-object p0, p0, $ADMIN_FOLDER_ALL_DIALOGS
        invoke-virtual {p0}, Ljava/util/ArrayList;->size()I
        move-result p0
        return p0
    """)
    writeStub(ADMIN_FOLDER, "dialogId", 5, """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v0
        iget-object v0, v0, $ADMIN_FOLDER_ALL_DIALOGS
        invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
        move-result-object v0
        check-cast v0, $ADMIN_FOLDER_DIALOG
        iget-wide v1, v0, $ADMIN_FOLDER_DIALOG_ID
        return-wide v1
    """)
    // What AdminChats and Telegram's own admin checks go by: you made the chat or have admin rights there,
    // and you're still in it. A channel's direct messages have their own rights and stay out.
    writeStub(ADMIN_FOLDER, "chatRole", 6, """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v0
        neg-long v1, p1
        invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v1
        invoke-virtual {v0, v1}, $ADMIN_FOLDER_GET_CHAT
        move-result-object v0
        if-eqz v0, :hush_unknown
        iget-boolean v1, v0, $ADMIN_FOLDER_LEFT
        if-nez v1, :hush_other
        iget-boolean v1, v0, $ADMIN_FOLDER_DEACTIVATED
        if-nez v1, :hush_other
        iget-boolean v1, v0, $ADMIN_FOLDER_MONOFORUM
        if-nez v1, :hush_other
        iget-boolean v1, v0, $ADMIN_FOLDER_CREATOR
        if-nez v1, :hush_managed
        iget-object v1, v0, $ADMIN_FOLDER_RIGHTS
        if-nez v1, :hush_managed
        :hush_other
        const/4 v0, 0x0
        return v0
        :hush_managed
        const/4 v0, 0x1
        return v0
        :hush_unknown
        const/4 v0, -0x1
        return v0
    """)
    writeStub(ADMIN_FOLDER, "chatLimit", 2, """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v0
        invoke-static {p0}, $USER_CONFIG_INSTANCE
        move-result-object p0
        invoke-virtual {p0}, $IS_PREMIUM
        move-result p0
        if-eqz p0, :hush_free
        iget p0, v0, $ADMIN_FOLDER_CHATS_PREMIUM
        return p0
        :hush_free
        iget p0, v0, $ADMIN_FOLDER_CHATS_DEFAULT
        return p0
    """)
    writeStub(ADMIN_FOLDER, "folderChats", 3, """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v0
        iget-object v0, v0, $FILTERS_BY_ID
        invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;
        move-result-object v0
        if-eqz v0, :hush_gone
        check-cast v0, $LOCAL_FILTER
        iget-object v0, v0, $LOCAL_ALWAYS
        :hush_gone
        return-object v0
    """)
    // The request Telegram's folder screen sends for a folder with chats added and no chat types.
    writeStub(ADMIN_FOLDER, "saveAdminFolder", 13, """
        new-instance v0, $NEW_FILTER
        invoke-direct {v0}, $NEW_FILTER_INIT
        iput p1, v0, $FILTER_ID
        new-instance v1, $TITLE
        invoke-direct {v1}, $TITLE-><init>()V
        iput-object p2, v1, $TITLE_TEXT
        iput-object v1, v0, $FILTER_TITLE
        iget-object v1, v0, $ADMIN_FOLDER_INCLUDE
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v2
        array-length v3, p3
        const/4 v4, 0x0
        :hush_next
        if-ge v4, v3, :hush_send
        aget-wide v5, p3, v4
        invoke-virtual {v2, v5, v6}, $ADMIN_FOLDER_INPUT_PEER
        move-result-object v7
        invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        add-int/lit8 v4, v4, 0x1
        goto :hush_next
        :hush_send
        new-instance v1, $UPDATE_FILTER
        invoke-direct {v1}, $UPDATE_INIT
        iput p1, v1, $UPDATE_ID
        iget v2, v1, $UPDATE_FLAGS
        or-int/lit8 v2, v2, 0x1
        iput v2, v1, $UPDATE_FLAGS
        iput-object v0, v1, $UPDATE_FILTER_FIELD
        invoke-static {p0}, $CONNECTIONS_INSTANCE
        move-result-object v0
        check-cast p4, $REQUEST_DELEGATE
        invoke-virtual {v0, v1, p4}, $SEND_REQUEST
        return-void
    """)
    // What Telegram does at a start and when another device changes a folder: the server's folders, loaded again.
    writeStub(ADMIN_FOLDER, "reloadFolders", 4, """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v0
        const/4 v1, 0x1
        const/4 v2, 0x0
        invoke-virtual {v0, v1, v2}, $ADMIN_FOLDER_RELOAD
        return-void
    """)
}
