@file:Suppress("unused")

package io.github.sabopura.morphe.patches.twitch

import io.github.sabopura.morphe.patches.twitch.Constants.TWITCH_ADS
import io.github.sabopura.morphe.patches.twitch.ads.adEventsHook
import io.github.sabopura.morphe.patches.twitch.ads.blockAdsResourcePatch
import io.github.sabopura.morphe.patches.twitch.ads.clientAdsHook
import io.github.sabopura.morphe.patches.twitch.ads.pictureByPictureHook
import io.github.sabopura.morphe.patches.twitch.ads.serverAdsHook
import io.github.sabopura.morphe.patches.twitch.ads.stitchedAdsHook
import io.github.sabopura.morphe.patches.twitch.chat.chatRowBase
import io.github.sabopura.morphe.patches.twitch.chat.emotePickerResources
import io.github.sabopura.morphe.patches.twitch.chat.feedHook
import io.github.sabopura.morphe.patches.twitch.chat.highlightFilterHook
import io.github.sabopura.morphe.patches.twitch.chat.landscapeChatHook
import io.github.sabopura.morphe.patches.twitch.chat.miniPlayerHook
import io.github.sabopura.morphe.patches.twitch.chat.unfollowButtonHook
import io.github.sabopura.morphe.patches.twitch.chat.vodChatHook
import io.github.sabopura.morphe.patches.twitch.player.backCloseHook
import io.github.sabopura.morphe.patches.twitch.player.ivsPlayerHooks
import io.github.sabopura.morphe.patches.twitch.player.playerGestureRoot
import io.github.sabopura.morphe.patches.twitch.player.streamProxyHook
import io.github.sabopura.morphe.patches.twitch.player.vodContextHook
import io.github.sabopura.morphe.patches.twitch.player.vodEndHook
import io.github.sabopura.morphe.patches.twitch.player.vodOffsetHook
import io.github.sabopura.morphe.patches.twitch.support.twitchFeaturePatch
import io.github.sabopura.morphe.patches.twitch.ui.classicHomePatch
import io.github.sabopura.morphe.patches.twitch.ui.newHomeFeedHook
import io.github.sabopura.morphe.patches.twitch.ui.hideRecapsHook
import io.github.sabopura.morphe.patches.twitch.ui.playerMenuResourcePatch

// ---- Ads ----

val adsClientPatch = twitchFeaturePatch(
    "Ads: Block client video ads",
    "Stops the pre-roll, mid-roll and VOD ads the app requests and plays itself. Switch it off any time in the settings.",
    "ADS_CLIENT", clientAdsHook, adEventsHook, playerMenuResourcePatch, compatibility = TWITCH_ADS,
)

val adsServerPatch = twitchFeaturePatch(
    "Ads: Block ad server requests",
    "Stops banner, feed and audio ad requests before they are sent, in both the native and React Native screens.",
    "ADS_SERVER", serverAdsHook, playerMenuResourcePatch, compatibility = TWITCH_ADS,
)

val adsReplacePatch = twitchFeaturePatch(
    "Ads: Replace stitched ads",
    "When Twitch stitches an ad into a live stream, swaps in an ad-free playlist of the same stream from Twitch. No third-party server unless you set a stream proxy.",
    "ADS_REPLACE", stitchedAdsHook, playerMenuResourcePatch, compatibility = TWITCH_ADS,
)

val adsCoverPatch = twitchFeaturePatch(
    "Ads: Cover unreplaced ads",
    "Covers and mutes stitched ads that could not be replaced, for example on subscriber-only streams.",
    "ADS_COVER", blockAdsResourcePatch, adEventsHook, playerMenuResourcePatch, compatibility = TWITCH_ADS,
)

val adsPictureByPicturePatch = twitchFeaturePatch(
    "Ads: Disable picture-by-picture",
    "Stops the small picture-by-picture ad player from opening beside the stream.",
    "ADS_PBYP", pictureByPictureHook, adEventsHook, playerMenuResourcePatch, compatibility = TWITCH_ADS,
)

// ---- Chat ----

val chatEmotesPatch = twitchFeaturePatch(
    "Chat: Third-party emotes",
    "Shows 7TV, BetterTTV and FrankerFaceZ emotes in chat. Sends the ID of the channel you watch to those services to fetch its emotes.",
    "CHAT_EMOTES", chatRowBase,
)

val chatPickerPatch = twitchFeaturePatch(
    "Chat: Emote picker",
    "Adds a picker with favorites next to the message box, and suggestions after typing ':'.",
    "CHAT_PICKER", chatEmotesPatch, emotePickerResources,
)

val chatBadgesPatch = twitchFeaturePatch(
    "Chat: Badges and pronouns",
    "Offers third-party badges, 7TV name paints and pronouns. Off until you turn them on in the settings; once on, chatters' IDs are looked up with those services.",
    "CHAT_BADGES", chatRowBase,
)

val chatFiltersPatch = twitchFeaturePatch(
    "Chat: Filters",
    "Hides blocked words, hidden users and repeated messages on this device, and highlights phrases you choose.",
    "CHAT_FILTERS", chatRowBase,
)

val chatAppearancePatch = twitchFeaturePatch(
    "Chat: Appearance",
    "Text size, time stamps, alternating rows and login names.",
    "CHAT_APPEARANCE", chatRowBase,
)

val chatHistoryPatch = twitchFeaturePatch(
    "Chat: History tools",
    "Recent chat from a public log, a search over messages you have seen, and a user lookup.",
    "CHAT_HISTORY", chatRowBase,
)

val chatVodPatch = twitchFeaturePatch(
    "Chat: VOD support",
    "Applies the selected chat patches to VOD chat replay too.",
    "CHAT_VOD", vodChatHook, vodContextHook, chatRowBase,
)

val chatHideHighlightsPatch = twitchFeaturePatch(
    "Chat: Hide highlights",
    "Offers to hide hype trains, pinned messages, gift banners, Bits and gift leaderboards, and watch-streak pop-ups above chat.",
    "CHAT_HIDE_HIGHLIGHTS", highlightFilterHook, playerMenuResourcePatch,
)

// ---- Interface ----

val declutterPatch = twitchFeaturePatch(
    "Interface: Hide elements",
    "Offers to hide buttons and panels you do not use, such as leaderboards, Bits, clip, share and the unfollow heart.",
    "DECLUTTER", unfollowButtonHook, classicHomePatch, newHomeFeedHook, playerMenuResourcePatch,
)

val navigationPositionPatch = twitchFeaturePatch(
    "Interface: Navigation bar position",
    "Moves the bottom navigation bar to the top of the screen, or hides it.",
    "NAV_POSITION", playerMenuResourcePatch,
)

val followingFeedPatch = twitchFeaturePatch(
    "Interface: Following feed filters",
    "Chooses which sections appear in Following and how large stream cards are. On phones with Twitch 31.9.0 or later, the card size and the recommended streams need the classic home screen, switched on in the settings.",
    "FOLLOWING_FEED", feedHook, classicHomePatch, newHomeFeedHook, playerMenuResourcePatch,
)

val hideRecapsPatch = twitchFeaturePatch(
    "Interface: Hide recaps",
    "Offers to hide stream recaps (reels of a stream's clips) from the classic home feed and channel pages. On phones with Twitch 31.9.0 or later, the new home keeps its recap shelf unless the classic home screen is switched on in the settings.",
    "HIDE_RECAPS", hideRecapsHook, classicHomePatch, playerMenuResourcePatch,
)

// ---- Player ----

val playbackSpeedPatch = twitchFeaturePatch(
    "Player: Playback speed",
    "Adds 0.25x to 2x playback. Faster than 1x on a live stream catches up, then returns to 1x.",
    "PLAY_SPEED", ivsPlayerHooks, playerMenuResourcePatch,
)

val seekButtonsPatch = twitchFeaturePatch(
    "Player: Seek buttons",
    "Adds rewind and forward with your own step to the player menu for VODs.",
    "PLAY_SEEK", ivsPlayerHooks, playerMenuResourcePatch,
)

val sleepTimerPatch = twitchFeaturePatch(
    "Player: Sleep timer",
    "Pauses playback after the time you choose, or stops when the video ends.",
    "PLAY_SLEEP", ivsPlayerHooks, vodEndHook, playerMenuResourcePatch,
)

val noAutoplayPatch = twitchFeaturePatch(
    "Player: No autoplay after videos",
    "Offers to keep Twitch from playing another video by itself when a VOD or clip ends.",
    "NO_AUTOPLAY", vodEndHook, playerMenuResourcePatch,
)

val playbackToolsPatch = twitchFeaturePatch(
    "Player: Reload, stats, mute and lock",
    "Adds a stream reload, a playback statistics panel, a mute and a touch lock to the player menu.",
    "PLAY_TOOLS", ivsPlayerHooks, playerMenuResourcePatch,
)

val vodChaptersPatch = twitchFeaturePatch(
    "Player: VOD chapters",
    "Lists a VOD's chapters from Twitch's public data and jumps to them.",
    "VOD_CHAPTERS", ivsPlayerHooks, vodContextHook, playerMenuResourcePatch,
)

val vodOffsetPatch = twitchFeaturePatch(
    "Player: VOD chat offset",
    "Shifts VOD chat earlier or later when it does not match the video.",
    "VOD_OFFSET", ivsPlayerHooks, vodContextHook, vodOffsetHook, playerMenuResourcePatch,
)

val streamProxyPatch = twitchFeaturePatch(
    "Player: Stream proxy",
    "Fetches live playlists through a proxy you choose. The proxy sees the channel you watch and your IP address.",
    "STREAM_PROXY", streamProxyHook, stitchedAdsHook, playerMenuResourcePatch, default = false,
)

val playerGesturesPatch = twitchFeaturePatch(
    "Player: Gestures",
    "Offers brightness and volume swipes along the edges of the player.",
    "GESTURES", playerGestureRoot, playerMenuResourcePatch,
)

val landscapeChatPatch = twitchFeaturePatch(
    "Player: Landscape chat layout",
    "Changes the width and background of the chat beside the video in landscape.",
    "LANDSCAPE_CHAT", landscapeChatHook, playerMenuResourcePatch,
)

val miniPlayerPatch = twitchFeaturePatch(
    "Player: Mini player size",
    "Makes the floating mini player larger or smaller.",
    "MINI_PLAYER", miniPlayerHook, playerMenuResourcePatch,
)

val backClosesPlayerPatch = twitchFeaturePatch(
    "Player: Close instead of mini player",
    "Offers to close the player with back instead of shrinking it to the floating mini player.",
    "BACK_CLOSES_PLAYER", backCloseHook, playerMenuResourcePatch,
)
