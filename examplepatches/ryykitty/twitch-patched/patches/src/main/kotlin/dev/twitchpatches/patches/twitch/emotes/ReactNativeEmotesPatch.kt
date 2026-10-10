package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.patch.resourcePatch
import dev.twitchpatches.patches.twitch.shared.RN_ASSET
import dev.twitchpatches.patches.twitch.shared.assetSource
import dev.twitchpatches.patches.twitch.shared.reactNativeBridgePatch
import dev.twitchpatches.patches.twitch.shared.hermes.HermesBundle
import dev.twitchpatches.patches.twitch.shared.hermes.MetroExports

internal val reactNativeEmotesPatch = resourcePatch {
    dependsOn(reactNativeBridgePatch)
    execute {
        val bundle = HermesBundle(get("assets/index.android.bundle").readBytes())
        val exports = MetroExports(bundle)
        val row = exports.resolveMemo("ChatMessageRow", "ChatMessageRowComponent",
            setOf("message", "channelID", "sourceRoomID", "body", "emotes", "stripReplyMention", "MessageBody"))
        val image = exports.resolve("EmotePart", setOf("emoteId", "forceStatic", "emoteAnimationsEnabled", "CoreImage"))
        val card = exports.resolve("EmoteCard", setOf("emote", "imageURL", "fetchEmoteCardData", "useTheme", "testID"))
        val sheet = exports.resolveDeferred("BottomSheet", setOf("visible", "onClose", "onClosed", "accessibilityLabel", "children"))
        val picker = exports.resolveDeferred("EmotePickerTray", setOf("channelID", "sections", "recents", "onSelectEmote",
            "onBackspace", "onOpenKeyboard", "emote-nav-tablist", "emote-grid-list", "useTheme"))
        val url = exports.resolve("makeEmoteURL", setOf("scale", "theme", "animated"))
        val prefetch = exports.resolveDeferred("useEmoteImagePrefetch", setOf("sections", "recents", "theme", "animated", "resetKey", "prefetch"))
        val coreImage = exports.resolve("CoreImage", setOf("src", "onError", "onLoad", "Image"))
        exports.requireNestedContract("EmoteCard", setOf("-code", "-type", "-image", "-report", "unknown"))
        exports.requireFunctionContract("fetchEmoteCardData", 2, setOf("emote", "token", "type", "owner", "unknown"))
        exports.resolve("MessageBody", setOf("body", "emotes", "segmentMessageBody", "maskedRanges"))
        exports.resolve("CoreImage", setOf("src", "onError", "onLoad", "Image"))
        exports.requireFunctionContract("segmentMessageBody", 7, setOf("from", "start", "end", "id", "slice", "join"))
        listOf("emote-providers.js", "emote-catalog.js", "emote-details.js", "emote-renderer.js", "emote-picker.js").forEach { name ->
            get(RN_ASSET).appendText("\n" + assetSource(name)
                .replace("__TWITCH_CHAT_ROW_MODULE__", row.module.toString())
                .replace("__TWITCH_EMOTE_PART_MODULE__", image.module.toString())
                .replace("__TWITCH_EMOTE_CARD_MODULE__", card.module.toString())
                .replace("__TWITCH_BOTTOM_SHEET_MODULE__", sheet.module.toString())
                .replace("__TWITCH_EMOTE_PICKER_MODULE__", picker.module.toString())
                .replace("__TWITCH_EMOTE_URL_MODULE__", url.module.toString())
                .replace("__TWITCH_EMOTE_PREFETCH_MODULE__", prefetch.module.toString())
                .replace("__TWITCH_CORE_IMAGE_MODULE__", coreImage.module.toString()))
        }
    }
}
