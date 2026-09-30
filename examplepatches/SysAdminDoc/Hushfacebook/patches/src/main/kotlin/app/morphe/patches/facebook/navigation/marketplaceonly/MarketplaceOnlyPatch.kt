/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.marketplaceonly

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.facebook.menu.hushfacebookInTheMenuPatch
import app.morphe.patches.facebook.notifications.blockPromotionalNotificationsPatch
import app.morphe.patches.facebook.navigation.starttab.openOnChosenTabPatch
import app.morphe.patches.facebook.navigation.tabbar.tabBarFilterPatch
import app.morphe.patches.shared.compat.AppCompatibilities

internal const val PATCH = "Marketplace only"

/**
 * Leaves Marketplace, Notifications and the profile or Menu tab in Facebook's tab bar, and opens
 * Facebook on Marketplace. The tab bar filter (TabBarAnchors.kt) asks the extension about each tab
 * as Facebook builds the bar, and the extension's MarketplaceOnly says which tabs go and when it
 * leaves the bar alone.
 *
 * It brings Open on a chosen tab with it: the start from the launcher icon goes to Marketplace
 * through that patch's route, which also gets Facebook's own start-up to use the tab.
 *
 * Included in the default selection, with its runtime switch off until the person opts in.
 */
@Suppress("unused")
val marketplaceOnlyPatch = bytecodePatch(
    name = "Marketplace only",
    description = "Leaves only Marketplace, Notifications and your profile or Menu in the tab bar, and opens " +
        "Facebook on Marketplace. Home with the news feed, Video, Friends, Feeds, Groups, Gaming and Events " +
        "go. Notifications and links still open where they lead. Its switch starts off, so turn it on " +
        "under Opening Facebook in Hushfacebook's settings.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, openOnChosenTabPatch, hushfacebookInTheMenuPatch,
        blockPromotionalNotificationsPatch, marketplaceFeedPrefetchPatch, tabBarFilterPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        enableStatus("marketplaceOnly")
    }
}
