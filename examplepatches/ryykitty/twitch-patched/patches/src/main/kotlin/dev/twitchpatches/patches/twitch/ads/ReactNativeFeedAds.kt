package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import dev.twitchpatches.patches.twitch.shared.*
import dev.twitchpatches.patches.twitch.shared.hermes.HermesBundle
import dev.twitchpatches.patches.twitch.shared.hermes.MetroExports

internal val reactNativeFeedAdsPatch = resourcePatch {
    dependsOn(reactNativeAssetsPatch)
    execute {
        val bundle = HermesBundle(get("assets/index.android.bundle").readBytes())
        val exports = MetroExports(bundle)
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
        val stream = exports.resolve("StreamDisplayAdSurface", emptySet())
        exports.requireNestedContract("StreamDisplayAdSurface",
            setOf("enabled", "sdaState", "pushdownSlotAvailable", "leftStripAvailable", "StreamDisplayAdCreative"))
        val item = exports.resolveMemo("FeedAdItem", "FeedAdItemComponent",
            setOf("node", "active", "DisplayAdRenderer", "VideoAdRenderer", "freeScroll"))
        get(RN_ASSET).appendText("\n" + assetSource("display-ad-surfaces.js")
            .replace("__TWITCH_STREAM_DISPLAY_MODULE__", stream.module.toString())
            .replace("__TWITCH_FEED_AD_ITEM_MODULE__", item.module.toString()))
        appendChannelSkins(exports)
        if (bundle.functions.any { bundle.strings[it.name] == "useSkylineBannerSlot" }) {
            val slot = exports.resolve("useSkylineBannerSlot",
                setOf("sdaState", "skylineBannerSlotAvailable", "useControllerState", "skylineBannerSize"), params = 5)
            exports.requireFunctionContract("skylineBannerSlotAvailable", 2,
                setOf("enabled", "chromeActive", "splitLayout", "isTheatreDocked", "pipSettled", "adIsPlaying"))
            get(RN_ASSET).appendText("\n" + assetSource("skyline-banner.js")
                .replace("__TWITCH_SKYLINE_BANNER_SLOT_MODULE__", slot.module.toString()))
        }
    }
}

private fun ResourcePatchContext.appendChannelSkins(exports: MetroExports) {
    val ribbon = exports.resolve("useChannelSkinsRibbon",
        setOf("CHANNEL_SKINS_QUERY", "useQuery", "selectChannelSkinRibbon", "usePubsubTopic"),
        params = 4)
    val campaign = exports.resolve("useChannelSkinCampaignActive",
        setOf("CHANNEL_SKINS_QUERY", "useQuery", "channelSkin", "loading"), params = 3)
    exports.requireFunctionContract("useChannelSkinsRibbon", 4,
        setOf("model", "onPressCTA", "skip", "channel_skins_actions", "render", "activationProgression"))
    exports.requireFunctionContract("useChannelSkinCampaignActive", 3, setOf("active", "resolved", "skip"))
    exports.requireFunctionContract("resolveChannelSkinsRibbonPlacement", 3, setOf("belowPlayer", "strip", "inset"))
    get(RN_ASSET).appendText("\n" + assetSource("channel-skins.js")
        .replace("__TWITCH_CHANNEL_SKINS_RIBBON_MODULE__", ribbon.module.toString())
        .replace("__TWITCH_CHANNEL_SKINS_CAMPAIGN_MODULE__", campaign.module.toString()))
}
