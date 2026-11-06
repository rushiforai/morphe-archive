package id.ikuradachi.patches.bstation.ads

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.bstation.player.applyOverlayAds
import id.ikuradachi.patches.bstation.shared.Constants.COMPATIBILITY_BSTATION

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Hides selected feed, splash, floating, push, overlay and under-player advertisements.",
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_BSTATION)

    val hideQuestionCards = booleanOption(
        key = "hideQuestionCards",
        default = false,
        title = "Hide question cards",
        description = "Also hides feed interest and rating questionnaires.",
    )

    val hideFeedAds = booleanOption(
        key = "hideFeedAds",
        default = false,
        title = "Hide feed ads",
        description = "Hides feed advertisement cards and optionally interest and rating questions.",
    )

    val disableFloatingAds = booleanOption(
        key = "disableFloatingAds",
        default = true,
        title = "Disable floating ads",
        description = "Disables bottom-right promotional floating advertisement overlay.",
    )

    val disableInnerPush = booleanOption(
        key = "disableInnerPush",
        default = true,
        title = "Disable inner push banner",
        description = "Disables top slide-down promotional toast and inner-push banner notifications.",
    )

    val disableSplashAds = booleanOption(
        key = "disableSplashAds",
        default = true,
        title = "Disable splash ads",
        description = "Disables cold-start splash advertisement loading and countdown timer.",
    )

    val disablePlayerOverlayAds = booleanOption(
        key = "disablePlayerOverlayAds",
        default = true,
        title = "Disable player overlay ads",
        description = "Disables video player in-stream bottom-right overlay ad banners.",
    )

    val disableUnderPlayerAds = booleanOption(
        key = "disableUnderPlayerAds",
        default = false,
        title = "Disable under-player ads",
        description = "Disables direct and SDK advertisements below the player while preserving access prompts.",
    )

    execute {
        if (hideFeedAds.value == true) applyFeedAds(hideQuestionCards.value == true)
        if (disableFloatingAds.value == true) applyFloatingAds()
        if (disableInnerPush.value == true) applyInnerPush()
        if (disableSplashAds.value == true) applySplashAds()
        if (disablePlayerOverlayAds.value == true) applyOverlayAds()
        if (disableUnderPlayerAds.value == true) applyUnderPlayerAds()
    }
}
