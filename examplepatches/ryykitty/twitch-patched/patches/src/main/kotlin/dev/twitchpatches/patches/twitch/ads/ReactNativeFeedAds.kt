package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.patch.resourcePatch
import dev.twitchpatches.patches.twitch.shared.*
import dev.twitchpatches.patches.twitch.shared.hermes.HermesBundle
import dev.twitchpatches.patches.twitch.shared.hermes.MetroExports

internal val reactNativeFeedAdsPatch = resourcePatch {
    dependsOn(reactNativeAssetsPatch)
    execute {
        val exports = MetroExports(HermesBundle(get("assets/index.android.bundle").readBytes()))
        val target = exports.resolveAsync("requestInFeedAd",
            setOf("fetchImpl", "parseVast", "urlParams", "adPlacementId", "adType", "adjacentItems", "adEdgeRequestInit"),
            setOf("native-feed-no-fill-object"))
        exports.requireNestedContract("useFeedAdCoordinator",
            setOf("requestInFeedAd", "onAdRemoved", "slots", "NoAdReturned", "getState"))
        get(RN_ASSET).appendText("\n" + assetSource("feed-no-fill.js")
            .replace("__TWITCH_TARGET_MODULE__", target.module.toString()))
        val headliner = exports.resolveAsync("requestHeadlinerAd",
            setOf("url", "adSessionId", "fetchImpl", "track", "adEdgeRequestInit"),
            setOf("native-feed-no-fill-object"))
        val headlinerState = exports.resolve("useHeadlinerAd",
            setOf("enabled", "visible", "deps", "fetchImpl", "useRef", "useEffect"))
        exports.requireNestedContract("useHeadlinerAd", setOf("requestHeadlinerAd", "success", "bid", "Unfilled"))
        get(RN_ASSET).appendText("\n" + assetSource("headliner-no-fill.js")
            .replace("__TWITCH_HEADLINER_REQUEST_MODULE__", headliner.module.toString())
            .replace("__TWITCH_HEADLINER_STATE_MODULE__", headlinerState.module.toString()))
        val stream = exports.resolve("StreamDisplayAdSurface",
            setOf("enabled", "sdaState", "pushdownSlotAvailable", "leftStripAvailable", "StreamDisplayAdCreative"))
        val item = exports.resolveMemo("FeedAdItem", "FeedAdItemComponent",
            setOf("node", "active", "DisplayAdRenderer", "VideoAdRenderer", "freeScroll"))
        get(RN_ASSET).appendText("\n" + assetSource("display-ad-surfaces.js")
            .replace("__TWITCH_STREAM_DISPLAY_MODULE__", stream.module.toString())
            .replace("__TWITCH_FEED_AD_ITEM_MODULE__", item.module.toString()))
    }
}
