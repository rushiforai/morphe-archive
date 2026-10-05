package dev.twitchpatches.patches.twitch.promotions

import app.morphe.patcher.patch.resourcePatch
import dev.twitchpatches.patches.twitch.shared.appendReactAdapter
import dev.twitchpatches.patches.twitch.shared.reactNativeAssetsPatch
import dev.twitchpatches.patches.twitch.shared.RN_ASSET
import dev.twitchpatches.patches.twitch.shared.assetSource
import dev.twitchpatches.patches.twitch.shared.hermes.HermesBundle
import dev.twitchpatches.patches.twitch.shared.hermes.MetroExport
import dev.twitchpatches.patches.twitch.shared.hermes.MetroExports
import dev.twitchpatches.patches.twitch.shared.hermes.MetroRegistrations
import app.morphe.patcher.patch.ResourcePatchContext

private val promotionElementsPatch = resourcePatch {
    dependsOn(reactNativeAssetsPatch)
    execute { get(RN_ASSET).appendText("\n" + assetSource("promotion-elements.js")) }
}

internal val reactNativeTurboPatch = resourcePatch {
    dependsOn(promotionElementsPatch)
    execute {
        appendReactAdapter("TurboUpsellButton", setOf("useTurboUpsell", "useIntl"), 1)
        appendReactAdapter("TheatreSDAUpsell", setOf("useTurboUpsell", "onOpenTurboTray", "hasTurbo", "SDAUpsellOverlay"), 1)
        val bundle = HermesBundle(get("assets/index.android.bundle").readBytes())
        val exports = MetroExports(bundle)
        val highlight = exports.resolveDeferred("DropsHighlightRenderer", setOf("useDropsHighlightContext", "claimReward", "useTurboInfo"))
        MetroRegistrations(bundle).requireRenderer("DropsHighlightRenderer", "dropsHighlightRegistration")
        exports.requireNestedContract("DropsHighlightRenderer", setOf("highlight-drops-turbo", "highlight-drops-claim", "openTurboOrWeb"))
        appendPromotionAdapter(highlight, "drops-turbo.js", registration = "dropsHighlightRegistration")
        val card = exports.resolveMemo("DropProgressCard", "DropProgressCardImpl", setOf("tier", "onClaim", "onOpenTurbo", "hasTurbo", "-turbo"))
        appendPromotionAdapter(card, "drops-turbo.js", true)
    }
}

internal val reactNativeSubscriptionBannersPatch = resourcePatch {
    dependsOn(reactNativeAssetsPatch)
    execute {
        appendReactAdapter("TheatrePromoBanner", setOf("formatMessage"), 2)
        appendReactAdapter("PromotionalOfferBanner", setOf("promotionId", "offerId"), 2)
        val bundle = HermesBundle(get("assets/index.android.bundle").readBytes())
        val exports = MetroExports(bundle)
        val highlight = exports.resolveDeferred("PromotionHighlightRenderer", setOf("highlight", "expanded", "onDismiss"))
        MetroRegistrations(bundle).requireRenderer("PromotionHighlightRenderer", "promotionHighlightRegistration")
        appendPromotionAdapter(highlight, "hide-component.js", registration = "promotionHighlightRegistration")
        val subscribe = exports.resolve("SubscribeButtonWithPromo", setOf("suppressPromoLabel", "useTargetedPromo", "SubscribeButton"))
        appendPromotionAdapter(subscribe, "subscription-label.js")
        exports.requireFunctionContract("FeedCommerceIndicatorTagComponent", 2, setOf("indicator", "kind", "hypeTrain"))
        exports.requireFunctionContract("formatCommerceIndicatorLabel", 3, setOf("kind", "hypeTrain", "hypeTrainType", "hoursRemaining", "TREASURE"))
        val feed = exports.resolveDeferred("FeedCommerceIndicatorTag", setOf("indicator", "kind", "hypeTrain"), "FeedCommerceIndicatorTagComponent")
        val channel = exports.resolve("ChannelCommerceIndicatorTag", setOf("useCommerceIndicator", "channelID"))
        appendPromotionAdapter(feed, "commerce-promotion.js")
        appendPromotionAdapter(channel, "commerce-promotion.js")
    }
}

private fun ResourcePatchContext.appendPromotionAdapter(target: MetroExport, source: String, memo: Boolean = false,
    registration: String? = null) {
    get(RN_ASSET).appendText("\n" + assetSource(source)
        .replace("__TWITCH_TARGET_MODULE__", target.module.toString())
        .replace("__TWITCH_TARGET_EXPORT__", target.name)
        .replace("__TWITCH_MEMO_EXPORT__", memo.toString())
        .replace("__TWITCH_POLICY_INDEX__", "2")
        .replace("__TWITCH_TARGET_REGISTRATION__", registration?.let { "'$it'" } ?: "undefined"))
}
