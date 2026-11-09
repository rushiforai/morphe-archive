/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val CHAT_SORT = "$EXTENSION_PACKAGE/misc/ChatSort;"
internal const val DIALOG_LAST_DATE = "Lorg/telegram/tgnet/TLRPC\$Dialog;->last_message_date:I"
internal const val ARCHIVE_ROW = "Lorg/telegram/tgnet/TLRPC\$TL_dialogFolder;"

/**
 * The chat list's date order reads each chat's last message date and tells the archive's row from
 * a chat. The order itself runs inside the prune hook that already exists, so this only checks the
 * two stubs can be given Telegram's code, or throws and the switch is left out.
 */
internal fun BytecodePatchContext.requireChatSortRuntime() {
    requireStatusMethod("sortByDate")
    controlHook(CHAT_SORT, "lastDate", listOf("Ljava/lang/Object;"), "I")
    controlHook(CHAT_SORT, "isFolder", listOf("Ljava/lang/Object;"), "Z")
    requireReachable(DIALOG_LAST_DATE, false)
    controlShape(tgMutableClassDefByOrNull(ARCHIVE_ROW) != null, "$ARCHIVE_ROW is missing")
}

internal fun BytecodePatchContext.writeChatSortStubs() {
    writeStub(CHAT_SORT, "lastDate", 2, """
        check-cast p0, ${DIALOG_LAST_DATE.substringBefore("->")}
        iget v0, p0, $DIALOG_LAST_DATE
        return v0
    """)
    writeStub(CHAT_SORT, "isFolder", 2, """
        instance-of v0, p0, $ARCHIVE_ROW
        return v0
    """)
}
