package dev.twitchpatches.patches.twitch.shared

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.ResourcePatchContext
import dev.twitchpatches.patches.twitch.shared.hermes.HermesBundle
import dev.twitchpatches.patches.twitch.shared.hermes.MetroExports
import dev.twitchpatches.patches.twitch.shared.hermes.HermesFeedTheme
import dev.twitchpatches.patches.twitch.shared.hermes.themePaletteModule

internal const val RN_ASSET = "assets/twitchpatches-runtime.js"

internal val reactNativeAssetsPatch = resourcePatch {
    execute {
        val original = HermesBundle(get("assets/index.android.bundle").readBytes())
        val exports = MetroExports(original)
        val react = exports.reactModule()
        val core = exports.resolve("AppCore", setOf("identity", "initialRoute", "colorScheme"))
        get("assets/index.android.bundle").writeBytes(HermesFeedTheme.apply(original))
        val playback = exports.resolve("PlaybackSettingsSheet", setOf("isParticipatingDJ", "hasAudioRendition",
            "onAudioOnlyChange", "onBgaSettingChange", "onPipAutoPopoutChange"))
        exports.requireFunctionContract("ViewingOptionsSection", 2,
            setOf("isParticipatingDJ", "onAudioOnlyChange", "ToggleableSettingsListItem"))
        exports.requireFunctionContract("BgaSettingRow", 2,
            setOf("isParticipatingDJ", "onBgaSettingChange", "SelectSettingsListItem"))
        get(RN_ASSET).writeText(assetSource("bootstrap.js").replace("__TWITCH_REACT_MODULE__", react.toString()))
        get(RN_ASSET).appendText("\n" + assetSource("theme.js")
            .replace("__TWITCH_APP_CORE_MODULE__", core.module.toString()))
        appendFeedThemeAdapters(exports, themePaletteModule(original))
        get(RN_ASSET).appendText("\n" + assetSource("playback-settings.js")
            .replace("__TWITCH_PLAYBACK_SETTINGS_MODULE__", playback.module.toString()))
    }
}

private fun ResourcePatchContext.appendFeedThemeAdapters(exports: MetroExports, palette: Int) {
    val theme = exports.resolve("ThemeProvider", setOf("theme", "children", "darkTheme", "Provider"))
    val stream = exports.resolveMemo("FeedStreamItem", "FeedStreamItemGuard", setOf("node", "content", "broadcaster"))
    exports.requireFunctionContract("FeedStreamItemComponent", 2, setOf("freeScroll", "CoreText", "FeedFollowButton"))
    val clips = exports.resolve("ClipsFeedPage", setOf("children", "topSlot", "warm"))
    val scrim = exports.resolve("FeedTopScrim", setOf("stops", "translateY", "LinearGradient"))
    val chrome = exports.resolveMemo("FeedTopChrome", "FeedTopChromeComponent",
        setOf("tabsBarHeight", "FeedTopScrim", "scrimTranslateY", "topInset", "feedTheme"))
    exports.requireNestedContract("FeedTopChromeComponent", setOf("feed-top-chrome"))
    exports.requireNestedContract("FeedTopScrim", setOf("Stop", "#000000"))
    get(RN_ASSET).appendText("\n" + assetSource("feed-theme.js")
        .replace("__TWITCH_PALETTE_MODULE__", palette.toString())
        .replace("__TWITCH_THEME_MODULE__", theme.module.toString())
        .replace("__TWITCH_STREAM_ITEM_MODULE__", stream.module.toString())
        .replace("__TWITCH_CLIPS_FEED_MODULE__", clips.module.toString())
        .replace("__TWITCH_FEED_SCRIM_MODULE__", scrim.module.toString())
        .replace("__TWITCH_FEED_CHROME_MODULE__", chrome.module.toString()))
}

internal fun ResourcePatchContext.appendReactAdapter(export: String, properties: Set<String>, policy: Int?) {
    val bundle = HermesBundle(get("assets/index.android.bundle").readBytes())
    val target = MetroExports(bundle).resolve(export, properties)
    val source = if (policy == null) assetSource("auto-claim.js") else assetSource("hide-component.js")
    get(RN_ASSET).appendText("\n" + source.replace("__TWITCH_TARGET_MODULE__", target.module.toString())
        .replace("__TWITCH_TARGET_EXPORT__", export).replace("__TWITCH_POLICY_INDEX__", policy.toString())
        .replace("__TWITCH_TARGET_REGISTRATION__", "undefined"))
}

internal fun assetSource(name: String): String = requireNotNull(TwitchTarget::class.java
    .getResourceAsStream("/reactnative/$name")).bufferedReader().use { it.readText() }
