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

internal const val LOCAL_PINS = "$EXTENSION_PACKAGE/misc/LocalPins;"

/**
 * Pin on this phone rides on hooks that already exist: the hidden chats' sort hook orders the list,
 * the date order's stubs tell a chat's last message date and the archive's row, and the long press
 * item's hooks carry the two menu items. Its own part is one stub that reads the chat list's
 * selection, so the menu can offer Unpin on this phone for chats already pinned here. This only
 * checks that stub can be given Telegram's code, or throws and the switch is left out.
 */
internal fun BytecodePatchContext.requireLocalPinsRuntime() {
    requireStatusMethod("localPins")
    controlHook(LOCAL_PINS, "selectedOf", listOf("Ljava/lang/Object;"), "Ljava/util/ArrayList;")
}

/** Gives the stub DialogsActivity.selectedDialogs, which the long press item's own stub reaches through the click handler. */
internal fun BytecodePatchContext.writeLocalPinsStubs(refs: HideMenuRefs) {
    writeStub(LOCAL_PINS, "selectedOf", 2, """
        check-cast p0, ${refs.selected.substringBefore("->")}
        iget-object v0, p0, ${refs.selected}
        return-object v0
    """)
}
