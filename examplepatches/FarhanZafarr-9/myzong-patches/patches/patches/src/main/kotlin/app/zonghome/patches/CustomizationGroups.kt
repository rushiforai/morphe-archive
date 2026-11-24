package app.zonghome.patches

import app.morphe.patcher.patch.bytecodePatch

val homeSectionsPatch = bytecodePatch(
    name = "Home sections", description = "Choose which Home sections remain visible and adjust section spacing.", default = true
) {
    category("Home")
    compatibleWith(myZongCompatibility)
    dependsOn(hideMatchCardPatch, hidePrayerCardPatch, hideFamilySectionPatch, hideStreakCardsPatch,
        hidePromotionsPatch, hide5gShortcutsPatch, hideWalletPatch, hideStepCounterPatch,
        hideWeatherStripPatch, hideRegionalOffersPatch, homeSpacingPatch)
    setting("hideMatch", "Show match information", false, true)
    setting("hidePrayers", "Show prayer times", false, true)
    setting("hideFamily", "Show family sharing", false, true)
    setting("hideStreaks", "Show streak cards", false, true)
    setting("hidePromotions", "Show banners and entertainment row", false, true)
    setting("hide5g", "Show 5G shortcuts", false, true)
    setting("hideWallet", "Show Z Wallet", false, true)
    setting("hideSteps", "Show step counter", false, true)
    setting("hideWeather", "Show location and weather", false, true)
    setting("hideCityOffers", "Show regional and city offers", false, true)
    setting("spaceHomeSections", "Increase section spacing", true)
}

val homeAccountCardsPatch = bytecodePatch(
    name = "Home account cards", description = "Configure allowance labels, SMS, tariff, recharge and loan controls.", default = true
) {
    category("Home")
    compatibleWith(myZongCompatibility)
    dependsOn(hideOfferCountPatch, hideHomeSmsCardPatch, hideHomeTariffPatch, hideHomeRechargePatch, hideHomeLoanButtonPatch)
    setting("hideOfferCounts", "Show active-offer counts", false, true)
    setting("hideSmsCard", "Show SMS allowance card", false, true,
        "When hidden, Home data and minutes cards share the row. Usage SMS is unaffected.")
    setting("hideTariff", "Show package name below expiry", true, true)
    setting("hideHomeRecharge", "Show recharge button", false, true)
    setting("hideLoanButton", "Show loan button", true, true)
}

val headerSettingsPatch = bytecodePatch(
    name = "Header", description = "Choose visible header items, titles and replacement shortcuts.", default = true
) {
    category("Header & navigation")
    compatibleWith(myZongCompatibility)
    dependsOn(customizeHeaderPatch, leftHeaderTitlesPatch, homeHeaderTitlePatch,
        homeBundlesShortcutPatch, homeFreeMbsShortcutPatch, homeLoanShortcutPatch)
    setting("hideNotifications", "Show notification bell", false, true)
    setting("hideMenu", "Show side-menu button", false, true)
    setting("hideRefresh", "Show refresh button", false, true)
    setting("hideSearch", "Show search outside Bundles", false, true,
        "Bundles keeps search access regardless of this option.")
    setting("hideGreeting", "Show greeting", false, true)
    setting("leftTitles", "Left-align titles", false)
    setting("homeTitle", "Show Home title when greeting is hidden", true)
    setting("bundlesShortcut", "Show Home Bundles shortcut", true, description =
        "Appears on Home only when the Bundles tab or entire bottom bar is hidden.")
    setting("freeMbsShortcut", "Show Home Free MBs shortcut", false)
    setting("loanShortcut", "Show Home take/pay loan shortcut", true)
}

val bottomNavigationSettingsPatch = bytecodePatch(
    name = "Bottom navigation", description = "Configure the bottom bar, tab labels and individual tabs.", default = true
) {
    category("Header & navigation")
    compatibleWith(myZongCompatibility)
    dependsOn(iconOnlyBottomNavigationPatch, hideMoreTabPatch, hideZPlayTabPatch,
        hideUsageTabPatch, hideBundlesTabPatch, hideBottomNavigationPatch)
    setting("hideNavigation", "Show bottom navigation", true, true,
        "Turning this off hides the whole bar. Individual tab and label choices are retained.")
    setting("iconOnly", "Show tab labels", false, true)
    setting("hideMore", "Show More tab", false, true)
    setting("hideZPlay", "Show Z Play tab", false, true)
    setting("hideUsage", "Show Usage tab", true, true)
    setting("hideBundles", "Show Bundles tab", true, true)
}

val bundlesUsageSettingsPatch = bytecodePatch(
    name = "Bundles and Usage", description = "Configure the Bundles controls button and promotional sections.", default = true
) {
    category("Bundles & Usage")
    compatibleWith(myZongCompatibility)
    dependsOn(bundleControlsTogglePatch, hideBundlePromotionsPatch, hideUsageTopBannerPatch, hideUsagePromotionalSectionPatch)
    setting("bundleControlsToggle", "Show Bundles controls button", true,
        description = "Adds the button beside Search that remembers whether categories, validity and filters are hidden.")
    setting("hideBundlePromotions", "Show bundle browsing promotions", false, true)
    setting("hideUsageBanner", "Show Usage top banner", false, true)
    setting("hideUsagePromotions", "Show Usage promotions", false, true)
}

val rechargeSettingsPatch = bytecodePatch(
    name = "Recharge", description = "Choose recharge sections and promotional content.", default = true
) {
    category("Recharge & dialogs")
    compatibleWith(myZongCompatibility)
    dependsOn(hideOnlineRechargeSectionPatch, hideScratchCardSectionPatch, hideOnlineRechargePromotionsPatch)
    setting("hideOnline", "Show Online Recharge", false, true)
    setting("hideScratch", "Show Scratch Card", false, true)
    setting("hideOnlinePromotions", "Show Online Recharge promotions", false, true)
}

val dialogSettingsPatch = bytecodePatch(
    name = "Dialogs and drawer", description = "Configure the chatbot, WhatsApp notice and grouped drawer links.", default = true
) {
    category("Recharge & dialogs")
    compatibleWith(myZongCompatibility)
    dependsOn(hideChatbotPatch, hideWhatsAppChannelPatch, hideDrawerExtrasPatch)
    setting("hideChatbot", "Show chatbot launcher and dialog", false, true)
    setting("hideWhatsAppChannel", "Show WhatsApp channel notice", false, true)
    setting("hideDrawerExtras", "Show support and promotional drawer links", false, true,
        "Controls Press Release, Find Us, Contact Us, Video Tutorials, FAQs and Feedback together.")
}

val startupSettingsPatch = bytecodePatch(
    name = "Startup", description = "Configure the intro, initial Home cover and starting screen.", default = true
) {
    category("Startup & rewards")
    compatibleWith(myZongCompatibility)
    dependsOn(skipAnimatedSplashPatch, holdStartupCoverPatch, startOnUsagePatch, otpPasteHookPatch, skipPersonalDetailsPatch)
    setting("skipPersonalDetails", "Skip personal details after OTP", false)
    setting("otpPaste", "Split pasted PIN/OTP digits across boxes", true)
    setting("skipIntro", "Use static logo instead of animated intro", true)
    setting("holdStartup", "Hold cover until Home settles", true)
    setting("startOnUsage", "Start on Usage", false,
        description = "Fresh launches after sign-in open Usage; restored state and deep links are respected.")
}
