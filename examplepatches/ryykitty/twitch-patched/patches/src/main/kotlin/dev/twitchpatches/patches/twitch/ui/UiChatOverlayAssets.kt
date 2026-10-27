package dev.twitchpatches.patches.twitch.ui

import dev.twitchpatches.patches.twitch.shared.assetSource
import dev.twitchpatches.patches.twitch.shared.hermes.HermesBundle
import dev.twitchpatches.patches.twitch.shared.hermes.MetroExports

internal fun renderUiChatOverlays(bundle: HermesBundle): String {
    val exports = MetroExports(bundle)
    val train = bundle.functions.single { bundle.strings[it.name] == "TheatrePlayerHypeTrain" && it.params == 2 }
    val wrapped = bundle.instructions(train).any { it.name.startsWith("GetById") && bundle.strings[it.args.last()] == "ErrorBoundary" }
    val trainProperties = if (wrapped) setOf("ErrorBoundary") else
        setOf("channelId", "useHypeTrainOverlayState", "useCondensedHypeTrainDisplayState")
    val targets = mapOf(
        "BOARDS" to exports.resolve("ChannelLeaderboardStripHost", setOf("useChannelLeaderboard", "hiddenForTray", "ChatTopBannerCarousel")),
        "TRAIN_PLAYER" to exports.resolve("TheatrePlayerHypeTrain", trainProperties),
        "TRAIN_SKYLINE" to exports.resolve("SkylineHypeTrainHost", setOf("useHighlightSelector", "HypeTrainHighlightRenderer", "HighlightChrome")),
        "TRAIN_RENDERER" to exports.resolveDeferred("HypeTrainHighlightRenderer", setOf("highlight", "expanded", "onToggleExpanded")),
        "HIGHLIGHTS" to exports.resolve("useHighlightSelector", setOf("useContext", "useStore")),
    )
    val maybe = exports.resolve("useMaybeHighlightSelector", setOf("useContext", "useStore"))
    require(maybe.module == targets.getValue("HIGHLIGHTS").module) { "UI settings: highlight selectors moved to separate modules." }
    exports.requireFunctionContract("initialHighlightStackState", 2, setOf("Set", "EMPTY_LEDGER"))
    exports.requireFunctionContract("selectHighlightCarousel", 3, setOf("filter", "hidden", "sticky"))
    exports.requireFunctionContract("setCurrentIndex", 2, setOf("set-current-index", "index"))
    for (name in listOf("useHighlightDispatch", "useMaybeHighlightDispatch")) {
        require(exports.resolve(name, setOf("useContext", "useStore"), params = 1).module == maybe.module) {
            "UI settings: highlight dispatch moved to a separate module."
        }
    }
    exports.requireFunctionContract("SkylineHypeTrainHost", 2, setOf("skyline-hype-train", "skyline-hype-train-chrome"))
    var source = assetSource("ui-chat-overlays.js")
    targets.forEach { (key, target) -> source = source.replace("__TWITCH_UI_${key}_MODULE__", target.module.toString()) }
    return source
}
