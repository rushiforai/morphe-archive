package id.ikuradachi.patches.bstation.ui

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.bstation.ads.applyRatingPrompts
import id.ikuradachi.patches.bstation.shared.Constants.COMPATIBILITY_BSTATION

@Suppress("unused")
val cleanInterfacePatch = bytecodePatch(
    name = "Clean interface",
    description = "Customizes Home, navigation, account and search surfaces, and optional rating prompts.",
) {
    category("Layout")
    compatibleWith(COMPATIBILITY_BSTATION)

    val hideHomeSearchBar = booleanOption(
        key = "hideHomeSearchBar",
        default = true,
        title = "Hide home search bar",
        description = "Hides Home search unless single-page simplification keeps native search visible.",
    )

    val hideFeaturedTab = booleanOption(
        key = "hideFeaturedTab",
        default = false,
        title = "Hide Featured tab",
        description = "Hides the Featured / For You tab from the home tab bar.",
    )

    val hidePlazaTab = booleanOption(
        key = "hidePlazaTab",
        default = false,
        title = "Hide Plaza tab",
        description = "Hides the Plaza / Channel tab from the home tab bar.",
    )

    val hideCampaignTabs = booleanOption(
        key = "hideCampaignTabs",
        default = false,
        title = "Hide Campaign and Activity tabs",
        description = "Hides promotional, event, and activity tabs (e.g. Dapatkan Itabag, Gratis Sementara, limited-time events).",
    )

    val hideSubscriptionsTab = booleanOption(
        key = "hideSubscriptionsTab",
        default = false,
        title = "Hide Subscriptions tab",
        description = "Hides the Subscriptions tab from the home tab bar.",
    )

    val hideAnimeTab = booleanOption(
        key = "hideAnimeTab",
        default = false,
        title = "Hide Anime tab",
        description = "Hides the Anime tab from the home tab bar.",
    )

    val hideHomeShortsTab = booleanOption(
        key = "hideHomeShortsTab",
        default = false,
        title = "Hide Home Shorts tab",
        description = "Hides the Shorts tab from the home tab bar.",
    )

    val hideOpusTab = booleanOption(
        key = "hideOpusTab",
        default = false,
        title = "Hide Community (Opus) tab",
        description = "Hides the Community (Opus) tab from the home tab bar.",
    )

    val simplifySinglePageHome = booleanOption(
        key = "simplifySinglePageHome",
        default = true,
        title = "Simplify single-page Home",
        description = "Shows native search and hides the tab row when Home has exactly one installed page.",
    )

    val hideDiscoverTab = booleanOption(
        key = "hideDiscoverTab",
        default = false,
        title = "Hide Discover tab",
        description = "Hides the Discover tab from the bottom navigation bar.",
    )

    val hideCreateButton = booleanOption(
        key = "hideCreateButton",
        default = false,
        title = "Hide Create button (+)",
        description = "Hides the center Create (+) button from the bottom navigation bar.",
    )

    val hideChatsTab = booleanOption(
        key = "hideChatsTab",
        default = false,
        title = "Hide Chats tab",
        description = "Hides the Chats (Messages) tab from the bottom navigation bar.",
    )

    val hideMeTab = booleanOption(
        key = "hideMeTab",
        default = false,
        title = "Hide Me tab",
        description = "Hides the Me (Profile) tab from the bottom navigation bar.",
    )

    val hideBottomShortsTab = booleanOption(
        key = "hideBottomShortsTab",
        default = false,
        title = "Hide bottom Shorts tab",
        description = "Hides the Shorts tab from the bottom navigation bar if present.",
    )

    val hideCreatorCenter = booleanOption(
        key = "hideCreatorCenter",
        default = false,
        title = "Hide Creator Center",
        description = "Hides the Creator Center dashboard card and banner buttons.",
    )

    val hideCampaignMenu = booleanOption(
        key = "hideCampaignMenu",
        default = false,
        title = "Hide Campaign menu",
        description = "Hides promotional/campaign menus.",
    )

    val hideFaqMenu = booleanOption(
        key = "hideFaqMenu",
        default = false,
        title = "Hide FAQs menu",
        description = "Hides Help & FAQs menus.",
    )

    val hideFeedbackMenu = booleanOption(
        key = "hideFeedbackMenu",
        default = false,
        title = "Hide Feedback menu",
        description = "Hides Feedback and report menus.",
    )

    val hideSearchTrending = booleanOption(
        key = "hideSearchTrending",
        default = true,
        title = "Hide search trending searches",
        description = "Hides trending search hot words and suppresses the network request.",
    )

    val hideDiscoveryModules = booleanOption(
        key = "hideDiscoveryModules",
        default = true,
        title = "Hide discovery modules",
        description = "Hides discovery section modules, tabs, and dividers on the search landing page.",
    )

    val cleanSearchBarHint = booleanOption(
        key = "cleanSearchBarHint",
        default = true,
        title = "Clean search bar hint",
        description = "Neutralizes promotional default keywords and forces the default 'Search' hint.",
    )

    val hideDiscoverTabs = booleanOption(
        key = "hideDiscoverTabs",
        default = true,
        title = "Hide discover tabs",
        description = "Hides the sliding tab strip and ViewPager2 content on the Discover page.",
    )

    val hideDiscoverTrending = booleanOption(
        key = "hideDiscoverTrending",
        default = true,
        title = "Hide Discover trending searches",
        description = "Hides trending searches and suppresses loading spinner on the Discover page.",
    )

    val disableRatingPrompts = booleanOption(
        key = "disableRatingPrompts",
        default = false,
        title = "Disable rating prompts",
        description = "Disables unsolicited app rating dialogs.",
    )

    execute {
        // Apply initial search hiding before the final single-page reconciliation.
        applyHomeSearch(hideHomeSearchBar.value == true)
        applyHomeTabs(hideFeaturedTab.value == true, hidePlazaTab.value == true, hideCampaignTabs.value == true, hideSubscriptionsTab.value == true, hideAnimeTab.value == true, hideHomeShortsTab.value == true, hideOpusTab.value == true, simplifySinglePageHome.value == true, hideHomeSearchBar.value == true)
        applyBottomNav(hideDiscoverTab.value == true, hideCreateButton.value == true, hideChatsTab.value == true, hideMeTab.value == true, hideBottomShortsTab.value == true)
        applyMePage(hideCreatorCenter.value == true, hideCampaignMenu.value == true, hideFaqMenu.value == true, hideFeedbackMenu.value == true)
        applySearchPage(hideSearchTrending.value == true, hideDiscoveryModules.value == true, cleanSearchBarHint.value == true)
        applyDiscoverSearch(hideDiscoverTabs.value == true, hideDiscoverTrending.value == true)
        if (disableRatingPrompts.value == true) applyRatingPrompts()
    }
}
