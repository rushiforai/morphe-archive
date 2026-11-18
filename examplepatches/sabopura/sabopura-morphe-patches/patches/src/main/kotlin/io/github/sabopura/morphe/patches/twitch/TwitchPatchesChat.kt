@file:Suppress("unused")

package io.github.sabopura.morphe.patches.twitch

import io.github.sabopura.morphe.patches.twitch.chat.chatRowBase
import io.github.sabopura.morphe.patches.twitch.chat.compactChatHook
import io.github.sabopura.morphe.patches.twitch.chat.firstChatterHook
import io.github.sabopura.morphe.patches.twitch.support.twitchFeaturePatch

val chatCompactPatch = twitchFeaturePatch(
    "Chat: Compact chat",
    "Offers to leave badges out of chat lines and to show emotes as their text, so no emote images load. Off until you turn it on in the settings.",
    "COMPACT_CHAT", compactChatHook, chatRowBase,
)

val chatFirstTimeChattersPatch = twitchFeaturePatch(
    "Chat: Highlight first-time chatters",
    "Offers to tint a viewer's first message in a channel, using the first-msg tag from Twitch's chat server. Nothing leaves the device.",
    "FIRST_TIME_CHATTERS", firstChatterHook, chatRowBase,
)

val chatEmotePreviewPatch = twitchFeaturePatch(
    "Chat: Emote and badge info",
    "Offers a small sheet with the larger image, name and source when you tap a third-party emote or badge, and copies the name. Loads the image from the provider's CDN.",
    "EMOTE_PREVIEW", chatEmotesPatch, chatRowBase,
)
