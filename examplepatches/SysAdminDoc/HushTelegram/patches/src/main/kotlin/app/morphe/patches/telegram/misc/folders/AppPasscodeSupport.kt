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
import app.morphe.patches.telegram.misc.localcontrols.requireReachable

internal const val APP_PASSCODE = "$EXTENSION_PACKAGE/misc/AppPasscode;"
internal const val SHARED_CONFIG = "Lorg/telegram/messenger/SharedConfig;"
internal const val PASSCODE_HASH = "$SHARED_CONFIG->passcodeHash:Ljava/lang/String;"
internal const val PASSCODE_TYPE = "$SHARED_CONFIG->passcodeType:I"
internal const val CHECK_PASSCODE = "$SHARED_CONFIG->checkPasscode(Ljava/lang/String;)Z"

/**
 * The app passcode the hidden chats ask for again. The runtime only reads Telegram's own passcode
 * state and has Telegram check what was typed, so there is no hook in Telegram's code: this checks
 * the three things the stubs read are reachable, or throws and the switch is left out.
 */
internal fun BytecodePatchContext.requireAppPasscodeRuntime() {
    requireStatusMethod("hiddenPasscode")
    controlHook(APP_PASSCODE, "passcodeSet", emptyList(), "Z")
    controlHook(APP_PASSCODE, "passcodePin", emptyList(), "Z")
    controlHook(APP_PASSCODE, "passcodeMatches", listOf("Ljava/lang/String;"), "Z")
    requireReachable(PASSCODE_HASH, true)
    requireReachable(PASSCODE_TYPE, true)
    requireReachable(CHECK_PASSCODE, true)
}

internal fun BytecodePatchContext.writeAppPasscodeStubs() {
    // Telegram keeps "" for no passcode, and a PIN is type 0.
    writeStub(APP_PASSCODE, "passcodeSet", 1, """
        sget-object v0, $PASSCODE_HASH
        if-eqz v0, :none
        invoke-virtual {v0}, Ljava/lang/String;->length()I
        move-result v0
        if-eqz v0, :none
        const/4 v0, 0x1
        return v0
        :none
        const/4 v0, 0x0
        return v0
    """)
    writeStub(APP_PASSCODE, "passcodePin", 1, """
        sget v0, $PASSCODE_TYPE
        if-nez v0, :password
        const/4 v0, 0x1
        return v0
        :password
        const/4 v0, 0x0
        return v0
    """)
    writeStub(APP_PASSCODE, "passcodeMatches", 2, """
        invoke-static {p0}, $CHECK_PASSCODE
        move-result v0
        return v0
    """)
}
