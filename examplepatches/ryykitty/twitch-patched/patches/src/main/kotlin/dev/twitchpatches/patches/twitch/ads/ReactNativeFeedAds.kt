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
    }
}
