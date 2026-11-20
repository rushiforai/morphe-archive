package io.github.jordanwoodson.patches.kick.chat

import app.morphe.patcher.patch.bytecodePatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

@Suppress("unused")
val chatSearchPatch = bytecodePatch(
    name = "Chat search",
    description = "Adds a search button to the top right of chat. Type a word or a username and only the messages " +
        "from or containing it stay shown, new ones included, until the box is cleared or closed. It searches the " +
        "messages the chat still holds, not older ones. Kick's chat page draws chat, so a change to that page can " +
        "stop it. Starts off. Turn it on in Lurk settings > Chat.",
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickChatPagePatch)

    execute {
        // KickChat's page script adds the button and filters the page's chat lines (chat-page.js, search).
        kickSettings.add(
            SwitchSetting("chat_search", "Chat search",
                "A search button in chat that shows only the messages from or containing what you type. Applies to " +
                    "chats opened afterwards.", Section.CHAT, default = false),
        )
    }
}
