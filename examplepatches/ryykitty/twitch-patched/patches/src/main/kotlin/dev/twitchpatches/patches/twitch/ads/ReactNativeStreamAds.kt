package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.patch.resourcePatch
import dev.twitchpatches.patches.twitch.shared.*
import dev.twitchpatches.patches.twitch.shared.hermes.HermesBundle
import dev.twitchpatches.patches.twitch.shared.hermes.MetroExports

internal val reactNativeStreamAdsPatch = resourcePatch {
    dependsOn(reactNativeBridgePatch)
    execute {
        val exports = MetroExports(HermesBundle(get("assets/index.android.bundle").readBytes()))
        val hook = exports.resolve("useControllerState", setOf("useRef", "useSyncExternalStore"), 4)
        exports.requireFunctionContract("useControllerState", 4, setOf("subscribe", "current", "has", "value"))
        val controller = exports.resolve("createAdStateController", setOf("createNativeModuleBacking"))
        exports.requireFunctionContract("createAdStateController", 2, setOf("getState", "subscribe", "subscribeCueEvents"))
        exports.requireFunctionContract("TheatreContent", 1, setOf("adState", "useControllerState", "TheatreVideoComposition"))
        exports.resolve("TheatreAdOverlays", setOf("adIsPlaying", "adState", "TheatreAdControlsOverlay"))
        val welcome = exports.resolve("useWelcomeBannerState", setOf("channelName", "adState", "useSyncExternalStore"))
        exports.requireFunctionContract("useWelcomeBannerState", 2,
            setOf("subscribe", "getState", "playing", "ad", "adFormat", "rollType"))
        exports.resolveMemo("WelcomeBanner", "WelcomeBannerImpl",
            setOf("channelName", "isPreroll", "isLandscape", "playerWidth", "formatMessage",
                "Welcome! This ad supports {channelName}", "Thanks for watching this ad to support {channelName}"))
        exports.requireFunctionContract("TheatreContent", 1,
            setOf("useWelcomeBannerState", "isShowing", "useTheatreLayout", "showStripWelcomeBanner",
                "showInFlowWelcomeBanner", "WelcomeBanner"))
        get(RN_ASSET).appendText("\n" + assetSource("stream-ad-state.js")
            .replace("__TWITCH_CONTROLLER_HOOK_MODULE__", hook.module.toString())
            .replace("__TWITCH_AD_CONTROLLER_MODULE__", controller.module.toString()))
        get(RN_ASSET).appendText("\n" + assetSource("stream-ad-welcome.js")
            .replace("__TWITCH_WELCOME_HOOK_MODULE__", welcome.module.toString()))
    }
}
