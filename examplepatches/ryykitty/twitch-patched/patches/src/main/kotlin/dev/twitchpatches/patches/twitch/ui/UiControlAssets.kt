package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.patch.ResourcePatchContext
import dev.twitchpatches.patches.twitch.shared.*
import dev.twitchpatches.patches.twitch.shared.hermes.HermesBundle
import dev.twitchpatches.patches.twitch.shared.hermes.MetroExports

internal fun ResourcePatchContext.appendUiControls(bundle: HermesBundle) {
    get(RN_ASSET).appendText("\n" + renderUiControls(bundle))
}

internal fun renderUiControls(bundle: HermesBundle): String {
    val exports = MetroExports(bundle)
    val support = exports.resolve("SupportActionRow", setOf("buttons", "expanded", "compact", "onOpenSubscribe"))
    val skylineSupport = if (bundle.functions.any { bundle.strings[it.name] == "SkylineSupportActionRow" })
        exports.resolve("SkylineSupportActionRow", setOf("buttons", "expanded", "compact", "onOpenSubscribe")) else support
    exports.requireNestedContract(support.name, setOf("FollowButton", "notificationSetting", "map"))
    val trophy = bundle.functions.filter { bundle.strings[it.name] == "SkylineLeaderboardTrophy" }
    val leaderboard = if (trophy.isNotEmpty()) {
        val params = trophy.single().params
        exports.requireFunctionContract("SkylineLeaderboardTrophy", params, setOf("skyline-leaderboard-trophy", "openSheetOnBoard"))
        exports.resolve("SkylineLeaderboardTrophy", setOf("useChannelLeaderboard", "hasBoards", "IconButton"), params = params)
    } else null
    val targets = mapOf(
        "CLASSIC" to exports.resolve("PlayerControlsOverlay", setOf("onMuteToggle", "visible", "IconButton", "Tooltip")),
        "VERTICAL" to exports.resolve("SkylineControlsOverlay", setOf("onMuteToggle", "onShare", "TheatreClipButton", "IconButton")),
        "CLIP" to exports.resolveMemo("TheatreClipButton", "TheatreClipButtonImpl", setOf("onPress", "dimmed")),
        "SUPPORT_ROW" to support,
        "METADATA" to exports.resolve("ChannelMetadata", setOf("actions", "showExtensionsIcon", "collapsed", "ClassicExtensionsIcon")),
        "SKYLINE_ROW" to skylineSupport,
        "BAND" to exports.resolve("SkylineBandActions", setOf(skylineSupport.name, "supportButtonState", "channel", "support")),
        "SHEET_ACTIONS" to exports.resolve("SkylineSheetActions", setOf(skylineSupport.name, "supportButtonState", "channel", "support")),
        "OVERLAY_ACTIONS" to exports.resolve("OverlayActionButtons", setOf("testID", "showCheerButton", "onSubscribe", "onGift")),
        "CHAT_BAND" to exports.resolve("SkylineChatBand", setOf("ChatArea", "channelID", "onTrayChange")),
        "COMPOSER" to exports.resolve("ChatComposerBar", setOf("showBitsButton", "onOpenQuickCheering", "channelID")),
        "EXTENSIONS" to exports.resolve("ClassicExtensionsIcon", setOf("installations", "onOpen", "testID", "hasInstalledExtensions")),
    )
    exports.requireNestedContract("PlayerControlsOverlay", setOf("player-controls-cast", "player-controls-share"))
    exports.requireNestedContract("SkylineControlsOverlay", setOf("-share"))
    exports.requireNestedContract("OverlayActionButtons", setOf("-subscribe", "-upgrade", "-gift", "-bits"))
    val extensionEntry = if (bundle.functions.any { bundle.strings[it.name] == "ExtensionsEntryButton" })
        exports.resolve("ExtensionsEntryButton", setOf("onPress", "testID", "IconExtensions", "IconButton")) else null
    exports.requireNestedContract("ClassicExtensionsIcon", setOf("extensions-icon"))
    exports.requireNestedContract("ChannelMetadata", setOf("channel-metadata-persistent-row", "channel-metadata-actions"))
    var source = assetSource("ui-controls.js").replace("__TWITCH_UI_LEADERBOARD_MODULE__", leaderboard?.module?.toString() ?: "null")
        .replace("__TWITCH_UI_EXTENSION_ENTRY_MODULE__", extensionEntry?.module?.toString() ?: "null")
        .replace("__TWITCH_UI_SKYLINE_ROW_EXPORT__", skylineSupport.name)
    targets.forEach { (key, target) -> source = source.replace("__TWITCH_UI_${key}_MODULE__", target.module.toString()) }
    return source + "\n" + renderUiChatOverlays(bundle)
}
