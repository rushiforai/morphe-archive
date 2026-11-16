package io.github.jordanwoodson.patches.kick.badges

import app.morphe.patcher.patch.bytecodePatch
import io.github.jordanwoodson.patches.kick.chat.kickChatPagePatch
import io.github.jordanwoodson.patches.kick.chat.kickHttpPatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

@Suppress("unused")
val thirdPartyBadgesPatch = bytecodePatch(
    name = "Third-party badges",
    description = "Adds a switch that shows the 7TV badge each chatter chose next to their name in chat. Off until " +
        "turned on in Lurk settings. It keeps a connection to 7TV's event service (events.7tv.io) while a " +
        "channel's chat is open, which tells 7TV the channel (its owner's Kick user ID), as the 7TV emotes switch " +
        "does, and nothing about you or the chatters you see; 7TV sends the badges of that channel's chatters and " +
        "their images come from cdn.7tv.app. FrankerFaceZ, Chatterino and pronouns.alejo.io only know Twitch " +
        "accounts, so Kick has no switches for them.",
) {
    compatibleWith(COMPATIBILITY_KICK)
    // The chat page script draws the badges; KickHttp reads the channel's owner from Kick's own channel responses.
    dependsOn(kickChatPagePatch, kickHttpPatch)

    execute {
        kickSettings.add(
            SwitchSetting(
                "badges_7tv",
                "7TV badges",
                "Shows the 7TV badge each chatter chose (subscriber tiers, staff, event badges) in chat. Keeps a " +
                    "connection to events.7tv.io while a channel's chat is open, which tells 7TV the channel; 7TV " +
                    "sends its chatters' badges, and the images load from cdn.7tv.app. No chatter is looked up.",
                Section.CHAT,
                default = false,
                // KickHttp, which learns the channel's owner, is added to Kick's HTTP clients when they are built.
                restart = true,
            ),
        )
    }
}
