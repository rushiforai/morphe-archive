package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.patch.resourcePatch
import dev.twitchpatches.patches.twitch.shared.RN_ASSET
import dev.twitchpatches.patches.twitch.shared.assetSource
import dev.twitchpatches.patches.twitch.shared.hermes.MetroExports
import dev.twitchpatches.patches.twitch.shared.hermes.twitchBundle
import dev.twitchpatches.patches.twitch.shared.hermes.dependencyModule
import dev.twitchpatches.patches.twitch.shared.reactNativeBridgePatch

internal val reactNativeFavoriteEmotesPatch = resourcePatch {
    dependsOn(reactNativeBridgePatch)
    execute {
        val bundle = twitchBundle()
        val exports = MetroExports(bundle)
        val picker = exports.resolveDeferred("EmotePickerTray", setOf("channelID", "sections", "recents",
            "useEmotePreview", "previewEmote", "dismissPreview", "emote-preview-insert", "figure", "emote-nav-tablist"))
        val preview = exports.resolve("useEmotePreview", setOf("generatedBy", "channelId", "emotePickerSID"))
        val card = exports.resolve("EmoteCard", setOf("emote", "imageURL", "fetchEmoteCardData", "useTheme", "testID"))
        val cardHost = bundle.dependencyModule("ChatArea", "ChatCardHost")
        exports.requireFunctionContract("ChatCardHost", 2, setOf("openCard", "kind", "emote", "emoteID", "token", "onClose"))
        exports.requireNestedContract("EmoteCard", setOf("-image", "headerRow", "emoteType", "emoteChannelID"))
        exports.requireFunctionContract("EmoteRowComponent", 2, setOf("onSelectEmote"))
        exports.requireFunctionContract("buildNavCategories", 4, setOf("category", "id", "title", "CurrentChannel"))
        exports.requireNestedContract("NavTabComponent", setOf("category", "emote-nav-tab-glyph-", "fillColor"))
        val cardData = bundle.dependencyModule("EmoteCard", "fetchEmoteCardData")
        val theme = bundle.dependencyModule("EmoteCard", "useTheme")
        val icons = bundle.dependencyModule("ResubShareTray", "IconStar")
        require(bundle.dependencyModule("PartialFillStar", "IconStarHollow") == icons) {
            "Favorite emotes: star icons moved to different modules."
        }
        val reactNative = bundle.dependencyModule("openContentPreferencesOrWeb", "Linking")
        get(RN_ASSET).appendText("\n" + assetSource("emote-favorites.js")
            .replace("__TWITCH_EMOTE_PICKER_MODULE__", picker.module.toString())
            .replace("__TWITCH_EMOTE_PREVIEW_MODULE__", preview.module.toString())
            .replace("__TWITCH_CHAT_CARD_HOST_MODULE__", cardHost.toString())
            .replace("__TWITCH_EMOTE_CARD_MODULE__", card.module.toString())
            .replace("__TWITCH_EMOTE_CARD_DATA_MODULE__", cardData.toString())
            .replace("__TWITCH_THEME_MODULE__", theme.toString())
            .replace("__TWITCH_ICONS_MODULE__", icons.toString())
            .replace("__TWITCH_REACT_NATIVE_MODULE__", reactNative.toString()))
    }
}
