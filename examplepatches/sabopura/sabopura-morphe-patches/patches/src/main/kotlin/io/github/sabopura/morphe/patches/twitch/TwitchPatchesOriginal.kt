@file:Suppress("unused")

package io.github.sabopura.morphe.patches.twitch

import io.github.sabopura.morphe.patches.twitch.danmaku.liveChatHook
import io.github.sabopura.morphe.patches.twitch.original.channelProfileHook
import io.github.sabopura.morphe.patches.twitch.original.hypeMeterResources
import io.github.sabopura.morphe.patches.twitch.original.originalRuntimeHook
import io.github.sabopura.morphe.patches.twitch.original.playerWatchHook
import io.github.sabopura.morphe.patches.twitch.original.quickPhrasesResources
import io.github.sabopura.morphe.patches.twitch.original.raidHoldHook
import io.github.sabopura.morphe.patches.twitch.original.ttsQueriesPatch
import io.github.sabopura.morphe.patches.twitch.player.ivsPlayerHooks
import io.github.sabopura.morphe.patches.twitch.support.twitchFeaturePatch
import io.github.sabopura.morphe.patches.twitch.ui.playerMenuResourcePatch

val chatTtsPatch = twitchFeaturePatch(
    "Chat: Read chat aloud",
    "Reads live chat aloud with the device's text-to-speech. Off until you switch it on in the settings. Nothing leaves the device.",
    "CHAT_TTS", originalRuntimeHook, liveChatHook, ttsQueriesPatch, playerMenuResourcePatch,
)

val raidHoldPatch = twitchFeaturePatch(
    "Player: Stay on channel during raids",
    "Stops Twitch moving you to another channel when a raid happens and shows a pill to go there instead. Nothing leaves the device. Off until you switch it on in the settings.",
    "RAID_HOLD", originalRuntimeHook, raidHoldHook, playerMenuResourcePatch,
)

val autoRecoverPatch = twitchFeaturePatch(
    "Player: Reload when stalled",
    "Reloads the stream the player menu's way when the on-screen player keeps buffering although the network is up, at most three times per stream. Off until you switch it on in the settings.",
    "AUTO_RECOVER", originalRuntimeHook, playerWatchHook, ivsPlayerHooks, playerMenuResourcePatch,
)

val quickPhrasesPatch = twitchFeaturePatch(
    "Chat: Quick phrases",
    "Adds a row of phrases above the chat box that type into it when tapped; nothing is sent by itself. Off until you switch it on in the settings.",
    "QUICK_PHRASES", originalRuntimeHook, quickPhrasesResources, playerMenuResourcePatch,
)

val channelProfilesPatch = twitchFeaturePatch(
    "Player: Remember settings per channel",
    "Remembers volume, danmaku, VOD speed and chat text size per channel once you ask it to from the player menu, and restores them when that channel opens. Stored only on this device.",
    "CHANNEL_PROFILES", originalRuntimeHook, playerWatchHook, channelProfileHook, ivsPlayerHooks, playerMenuResourcePatch,
)

val hypeMeterPatch = twitchFeaturePatch(
    "Player: Chat speed graph",
    "Draws a small graph of chat speed over the player and notes sudden jumps. Nothing leaves the device. Off until you switch it on in the settings.",
    "HYPE_METER", originalRuntimeHook, liveChatHook, hypeMeterResources, playerMenuResourcePatch,
)

val patchStatsPatch = twitchFeaturePatch(
    "Tools: Lifetime totals",
    "Shows how many ads this patch stopped, replaced and covered, channel point bonuses claimed and hours watched, at the top of the settings screen and on its About page. Stored only on this device.",
    "PATCH_STATS", originalRuntimeHook, playerWatchHook, ivsPlayerHooks, playerMenuResourcePatch,
)
