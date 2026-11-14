/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ads

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.flags.featureSwitchHookPatch
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.patches.tumblr.timeline.timelineListHookPatch
import app.morphe.patches.tumblr.timeline.paidPostBridgePatch

/**
 * Turns on the extension's ad rule. The timeline hook takes each ad item, and each post the server
 * serves as sponsored (a paid "Sponsored with Blaze" post among them), out of a page before Tumblr
 * shows it, and the feature switch hook answers false for the
 * flags that make Tumblr ask its ad networks for ads (the rule's flag list is in `FeatureSwitches`).
 * The launch guards ([AD_SDK_STARTUP_GUARDS]) keep the ad SDKs' own manifest entries from starting
 * them before any of that runs. A sponsor's banner in a feed goes the way of an ad item, and the
 * Explore header hook ([hideSponsoredExploreHeader]) leaves a sponsored Explore header undrawn.
 */
@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Takes ad cards and paid Blaze posts out of your dashboard and other feeds. Sponsored banners go too," +
        " along with the one-line app promos (Made with WordPress and its Install button) on tag pages and in search." +
        " A sponsored header at the top of Explore stays empty. Tumblr stops asking its" +
        " ad networks for more and stops showing a full-screen ad when you open a blog, and the ad networks" +
        " don't start when Tumblr launches. Its Keep Blaze posts option leaves the Blaze posts in. On by default." +
        " Turn it off in Tumblr settings > HushTumblr > Feed.",
    default = true,
) {
    category("Ads")
    dependsOn(settingsPatch, tumblrExtensionPatch, timelineListHookPatch, featureSwitchHookPatch, paidPostBridgePatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideAds")
        requireStatusMethod("timelineAds")
        requireStatusMethod("paidPostHeader")
        requireStatusMethod("adSdkStartup")
        requireStatusMethod("exploreHeaderAd")
        enableCapability("timelineAds")
        enableCapability("paidPostHeader")
        if (guardStartups("Hide ads", AD_SDK_STARTUP_GUARDS)) enableCapability("adSdkStartup")
        if (hideSponsoredExploreHeader("Hide ads")) enableCapability("exploreHeaderAd")
        enableStatus("hideAds")
    }
}
