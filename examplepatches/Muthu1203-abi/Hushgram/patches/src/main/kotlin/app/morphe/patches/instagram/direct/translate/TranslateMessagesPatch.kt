/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.direct.translate

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.instagram.direct.buttonlinks.chatButtonLinksPatch
import app.morphe.patches.instagram.direct.history.chatHistoryPatch
import app.morphe.patches.instagram.misc.extension.enableStatus
import app.morphe.patches.instagram.misc.extension.instagramExtensionPatch
import app.morphe.patches.instagram.misc.extension.requireStatusMethod
import app.morphe.patches.instagram.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

/**
 * Translate in the menu you get when you hold a chat message with text. It changes no code of its own:
 * the row goes in through the held message menu's hooks [chatButtonLinksPatch] puts in, and the message's
 * text is read with the message readers [chatHistoryPatch] fills in. Copy link and the chat history tools
 * keep their own switches, which stay off unless turned on.
 */
@Suppress("unused")
val translateMessagesPatch = bytecodePatch(
    name = "Translate chat messages",
    description = "Adds Translate to the menu you get when you hold a chat message with text. It opens Google " +
        "Translate's pop-up over the chat, or Google Translate on the web into Tamil without the Translate app. " +
        "Turn it off in HushGram settings > Messages.",
) {
    category("Messages")
    dependsOn(settingsPatch, instagramExtensionPatch, chatButtonLinksPatch, chatHistoryPatch)
    compatibleWith(*AppCompatibilities.instagram())

    execute {
        requireStatusMethod("translateMessages")
        enableStatus("translateMessages")
    }
}
