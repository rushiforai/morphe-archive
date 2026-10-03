package app.aidan.patches.sezzle.navigation

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.sezzle.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch

// Base Giveaways
private val EXPECTED_ROKT_GIVEAWAYS_BYTES = byteArrayOf(0x34, 0x03, 0x00, 0x3b)
private val HIDDEN_ROKT_GIVEAWAYS_BYTES = byteArrayOf(0x96.toByte(), 0x01, 0x76.toByte(), 0x01)

private val EXPECTED_GIVEAWAY_SHOP_ROUTING_BYTES = byteArrayOf(0x34, 0x03, 0x00, 0x3b)
private val HIDDEN_GIVEAWAY_SHOP_ROUTING_BYTES = byteArrayOf(0x96.toByte(), 0x01, 0x76.toByte(), 0x01)

private val EXPECTED_MARKETING_GIVEAWAY_BYTES = byteArrayOf(0x34, 0x04, 0x00, 0x40)
private val HIDDEN_MARKETING_GIVEAWAY_BYTES = byteArrayOf(0x94.toByte(), 0x01, 0x76.toByte(), 0x01)

private val EXPECTED_GIVEAWAY_SCREEN_STATUS_BYTES = byteArrayOf(0x40, 0x01, 0x04, 0x89.toByte())
private val HIDDEN_GIVEAWAY_SCREEN_STATUS_BYTES = byteArrayOf(0x94.toByte(), 0x01, 0x76.toByte(), 0x01)

// 1. Merchant Deal Popovers
private val EXPECTED_SELECT_POPUP_OFFERS_BYTES = byteArrayOf(0x34, 0x05, 0x00, 0x40)
private val HIDDEN_SELECT_POPUP_OFFERS_BYTES = byteArrayOf(0x92.toByte(), 0x00, 0x76.toByte(), 0x00)

private val EXPECTED_STORE_OFFER_MODAL_CONFIG_BYTES = byteArrayOf(0x34, 0x02, 0x00, 0x40)
private val HIDDEN_STORE_OFFER_MODAL_CONFIG_BYTES = byteArrayOf(0x92.toByte(), 0x00, 0x76.toByte(), 0x00)

private val EXPECTED_WEBVIEW_DEALS_POPOVER_CONFIG_BYTES = byteArrayOf(0x34, 0x04, 0x00, 0x40)
private val HIDDEN_WEBVIEW_DEALS_POPOVER_CONFIG_BYTES = byteArrayOf(0x92.toByte(), 0x00, 0x76.toByte(), 0x00)

private val EXPECTED_IS_NEW_OFFER_MODAL_ENABLED_BYTES = byteArrayOf(0x34, 0x00, 0x00, 0x3b)
private val HIDDEN_IS_NEW_OFFER_MODAL_ENABLED_BYTES = byteArrayOf(0x96.toByte(), 0x00, 0x76.toByte(), 0x00)

private val EXPECTED_SINGLE_MERCHANT_DEAL_BYTES = byteArrayOf(0x40, 0x01, 0x01, 0x89.toByte())
private val HIDDEN_SINGLE_MERCHANT_DEAL_BYTES = byteArrayOf(0x92.toByte(), 0x00, 0x76.toByte(), 0x00)

private val EXPECTED_OFFERS_V2_BYTES = byteArrayOf(0x34, 0x01, 0x00, 0x3b)
private val HIDDEN_OFFERS_V2_BYTES = byteArrayOf(0x96.toByte(), 0x01, 0x76.toByte(), 0x01)

private val EXPECTED_OFFER_SURFACE_BYTES = byteArrayOf(0x34, 0x03, 0x00, 0x3b)
private val HIDDEN_OFFER_SURFACE_BYTES = byteArrayOf(0x96.toByte(), 0x01, 0x76.toByte(), 0x01)

// 2. Knot Account Linking
private val EXPECTED_KNOT_ACTIVATION_MODAL_ENABLED_BYTES = byteArrayOf(0x34, 0x03, 0x00, 0x3b)
private val HIDDEN_KNOT_ACTIVATION_MODAL_ENABLED_BYTES = byteArrayOf(0x96.toByte(), 0x01, 0x76.toByte(), 0x01)

private val EXPECTED_KNOT_ACTIVATION_MODAL_GATE_BYTES = byteArrayOf(0x34, 0x06, 0x00, 0x3b)
private val HIDDEN_KNOT_ACTIVATION_MODAL_GATE_BYTES = byteArrayOf(0x96.toByte(), 0x01, 0x76.toByte(), 0x01)

private val EXPECTED_KNOT_BANNER_VISIBILITY_BYTES = byteArrayOf(0x34, 0x01, 0x00, 0x3b)
private val HIDDEN_KNOT_BANNER_VISIBILITY_BYTES = byteArrayOf(0x96.toByte(), 0x01, 0x76.toByte(), 0x01)

// 3. Wallet Marketing
private val EXPECTED_WALLET_MARKETING_MERCHANTS_BYTES = byteArrayOf(0x34, 0x02, 0x00, 0x40)
private val HIDDEN_WALLET_MARKETING_MERCHANTS_BYTES = byteArrayOf(0x92.toByte(), 0x00, 0x76.toByte(), 0x00)

private val EXPECTED_WALLET_EMPTY_STATE_MARKETING_BYTES = byteArrayOf(0x34, 0x02, 0x00, 0x41)
private val HIDDEN_WALLET_EMPTY_STATE_MARKETING_BYTES = byteArrayOf(0x92.toByte(), 0x00, 0x76.toByte(), 0x00)

private val EXPECTED_OFFER_BOOST_BANNER_BYTES = byteArrayOf(0x34, 0x07, 0x00, 0x40)
private val HIDDEN_OFFER_BOOST_BANNER_BYTES = byteArrayOf(0x92.toByte(), 0x00, 0x76.toByte(), 0x00)

private val EXPECTED_CONVERT_POINTS_TO_SPEND_BANNER_BYTES = byteArrayOf(0x34, 0x02, 0x00, 0x40)
private val HIDDEN_CONVERT_POINTS_TO_SPEND_BANNER_BYTES = byteArrayOf(0x92.toByte(), 0x00, 0x76.toByte(), 0x00)

// 4. Playtime Marketing
private val EXPECTED_PLAYTIME_CAMPAIGNS_BYTES = byteArrayOf(0x40, 0x03, 0x0a, 0x89.toByte())
private val HIDDEN_PLAYTIME_CAMPAIGNS_BYTES = byteArrayOf(0x92.toByte(), 0x00, 0x76.toByte(), 0x00)

// 5. Referrals & Social
private val EXPECTED_REFERRAL_UNAVAILABLE_BYTES = byteArrayOf(0x34, 0x02, 0x00, 0x3b)
private val HIDDEN_REFERRAL_UNAVAILABLE_BYTES = byteArrayOf(0x95.toByte(), 0x01, 0x76.toByte(), 0x01)


// 6. Trivia
private val EXPECTED_TRIVIA_GIVEAWAY_BANNER_BYTES = byteArrayOf(0x34, 0x07, 0x00, 0x40)
private val HIDDEN_TRIVIA_GIVEAWAY_BANNER_BYTES = byteArrayOf(0x92.toByte(), 0x00, 0x76.toByte(), 0x00)

private val EXPECTED_TRIVIA_LIVE_ACTIVITY_PUSH_TO_START_BYTES = byteArrayOf(0x34, 0x02, 0x00, 0x40)
private val HIDDEN_TRIVIA_LIVE_ACTIVITY_PUSH_TO_START_BYTES = byteArrayOf(0x96.toByte(), 0x00, 0x76.toByte(), 0x00)

// 7. Notification Prompts
private val EXPECTED_NOTIFICATION_PERMISSION_MODAL_V2_BYTES = byteArrayOf(0x34, 0x1c, 0x00, 0x40)
private val HIDDEN_NOTIFICATION_PERMISSION_MODAL_V2_BYTES = byteArrayOf(0x92.toByte(), 0x00, 0x76.toByte(), 0x00)

private val EXPECTED_ENABLE_NOTIFICATIONS_MODAL_BYTES = byteArrayOf(0x34, 0x08, 0x00, 0x89.toByte())
private val HIDDEN_ENABLE_NOTIFICATIONS_MODAL_BYTES = byteArrayOf(0x92.toByte(), 0x00, 0x76.toByte(), 0x00)

private val EXPECTED_SYNC_PUSH_PERMISSION_WITH_BRAZE_BYTES = byteArrayOf(0x34, 0x02, 0x00, 0x40)
private val HIDDEN_SYNC_PUSH_PERMISSION_WITH_BRAZE_BYTES = byteArrayOf(0x96.toByte(), 0x01, 0x76.toByte(), 0x01)

val removePromosAndGiveawaysPatch = rawResourcePatch(
    name = "Remove Promos & Giveaways",
    description = "Blocks in-app deal popups, giveaway screens, Knot card-linking dialogs, and marketing banners across the app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SEZZLE)

    val blockMerchantDealPopovers = booleanOption(
        key = "blockMerchantDealPopovers",
        default = true,
        title = "Block Merchant Deal Popovers",
        description = "Suppresses in-session merchant deal popovers, store offer modals, and webview deal overlays."
    )

    val blockKnotAccountLinking = booleanOption(
        key = "blockKnotAccountLinking",
        default = true,
        title = "Block Knot Account Linking Promos",
        description = "Suppresses Knot card auto-sync onboarding dialogs, activation gates, and account linking banners."
    )

    val blockWalletMarketing = booleanOption(
        key = "blockWalletMarketing",
        default = true,
        title = "Block Wallet Marketing",
        description = "Removes promotional merchant cards, empty state marketing, and boost banners from wallet screens."
    )

    val blockPlaytimeMarketing = booleanOption(
        key = "blockPlaytimeMarketing",
        default = true,
        title = "Block Playtime Marketing",
        description = "Neutralizes Playtime campaign listings and rewards promo carousels in Hermes UI."
    )

    val blockReferralsAndSocial = booleanOption(
        key = "blockReferralsAndSocial",
        default = true,
        title = "Block Referrals & Social",
        description = "Hides referral invite banners (\"Give and Get\"), contact permission prompts, and social share modals."
    )

    val blockTrivia = booleanOption(
        key = "blockTrivia",
        default = false,
        title = "Block Trivia",
        description = "Hides live trivia giveaway banners and push-to-start game prompts."
    )

    val blockNotificationPrompts = booleanOption(
        key = "blockNotificationPrompts",
        default = false,
        title = "Block Notification Prompts",
        description = "Suppresses the pre-permission \"Don't Miss Out!\" marketing dialog (NotificationPermissionModalV2 / EnableNotificationsModal) and bypasses soft push-opt-in gates."
    )

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())

        // 1. Disable Rokt Giveaways
        val roktGiveawaysOffset = editor.findFunctionOffsetByName("useRoktGiveawaysEnabled")
            ?: throw PatchException("useRoktGiveawaysEnabled function not found")
        if (editor.matchesBytes(roktGiveawaysOffset, EXPECTED_ROKT_GIVEAWAYS_BYTES)) {
            editor.patchBytes(roktGiveawaysOffset, HIDDEN_ROKT_GIVEAWAYS_BYTES)
        } else if (!editor.matchesBytes(roktGiveawaysOffset, HIDDEN_ROKT_GIVEAWAYS_BYTES)) {
            throw PatchException("Unexpected bytecode at useRoktGiveawaysEnabled")
        }

        // 2. Disable Giveaway Shop Routing
        val giveawayShopRoutingOffset = editor.findFunctionOffsetByName("useGiveawayShopRoutingEnabled")
            ?: throw PatchException("useGiveawayShopRoutingEnabled function not found")
        if (editor.matchesBytes(giveawayShopRoutingOffset, EXPECTED_GIVEAWAY_SHOP_ROUTING_BYTES)) {
            editor.patchBytes(giveawayShopRoutingOffset, HIDDEN_GIVEAWAY_SHOP_ROUTING_BYTES)
        } else if (!editor.matchesBytes(giveawayShopRoutingOffset, HIDDEN_GIVEAWAY_SHOP_ROUTING_BYTES)) {
            throw PatchException("Unexpected bytecode at useGiveawayShopRoutingEnabled")
        }

        // 3. Disable Marketing Giveaway
        val marketingGiveawayOffset = editor.findFunctionOffsetByName("useMarketingGiveaway")
            ?: throw PatchException("useMarketingGiveaway function not found")
        if (editor.matchesBytes(marketingGiveawayOffset, EXPECTED_MARKETING_GIVEAWAY_BYTES)) {
            editor.patchBytes(marketingGiveawayOffset, HIDDEN_MARKETING_GIVEAWAY_BYTES)
        } else if (!editor.matchesBytes(marketingGiveawayOffset, HIDDEN_MARKETING_GIVEAWAY_BYTES)) {
            throw PatchException("Unexpected bytecode at useMarketingGiveaway")
        }

        // 4. Disable Giveaway Screen Status
        val giveawayScreenStatusOffset = editor.findFunctionOffsetByName("useGiveawayScreenStatus")
            ?: throw PatchException("useGiveawayScreenStatus function not found")
        if (editor.matchesBytes(giveawayScreenStatusOffset, EXPECTED_GIVEAWAY_SCREEN_STATUS_BYTES)) {
            editor.patchBytes(giveawayScreenStatusOffset, HIDDEN_GIVEAWAY_SCREEN_STATUS_BYTES)
        } else if (!editor.matchesBytes(giveawayScreenStatusOffset, HIDDEN_GIVEAWAY_SCREEN_STATUS_BYTES)) {
            throw PatchException("Unexpected bytecode at useGiveawayScreenStatus")
        }

        // 5. Merchant Deal Popovers
        if (blockMerchantDealPopovers.value == true) {
            val selectPopupOffersOffset = editor.findFunctionOffsetByName("useSelectPopupOffers")
                ?: throw PatchException("useSelectPopupOffers function not found")
            editor.patchBytesIfMatches(
                selectPopupOffersOffset,
                EXPECTED_SELECT_POPUP_OFFERS_BYTES,
                HIDDEN_SELECT_POPUP_OFFERS_BYTES
            )

            val storeOfferModalConfigOffset = editor.findFunctionOffsetByName("useStoreOfferModalConfig")
                ?: throw PatchException("useStoreOfferModalConfig function not found")
            editor.patchBytesIfMatches(
                storeOfferModalConfigOffset,
                EXPECTED_STORE_OFFER_MODAL_CONFIG_BYTES,
                HIDDEN_STORE_OFFER_MODAL_CONFIG_BYTES
            )

            val webviewDealsPopoverConfigOffset = editor.findFunctionOffsetByName("useWebviewDealsPopoverConfig")
                ?: throw PatchException("useWebviewDealsPopoverConfig function not found")
            editor.patchBytesIfMatches(
                webviewDealsPopoverConfigOffset,
                EXPECTED_WEBVIEW_DEALS_POPOVER_CONFIG_BYTES,
                HIDDEN_WEBVIEW_DEALS_POPOVER_CONFIG_BYTES
            )

            val isNewOfferModalEnabledOffset = editor.findFunctionOffsetByName("useIsNewOfferModalEnabled")
                ?: throw PatchException("useIsNewOfferModalEnabled function not found")
            editor.patchBytesIfMatches(
                isNewOfferModalEnabledOffset,
                EXPECTED_IS_NEW_OFFER_MODAL_ENABLED_BYTES,
                HIDDEN_IS_NEW_OFFER_MODAL_ENABLED_BYTES
            )

            val singleMerchantDealOffset = editor.findFunctionOffsetByName("useSingleMerchantDeal")
                ?: throw PatchException("useSingleMerchantDeal function not found")
            editor.patchBytesIfMatches(
                singleMerchantDealOffset,
                EXPECTED_SINGLE_MERCHANT_DEAL_BYTES,
                HIDDEN_SINGLE_MERCHANT_DEAL_BYTES
            )

            val offersV2Offset = editor.findFunctionOffsetByName("useIsOffersV2Enabled")
                ?: throw PatchException("useIsOffersV2Enabled function not found")
            editor.patchBytesIfMatches(offersV2Offset, EXPECTED_OFFERS_V2_BYTES, HIDDEN_OFFERS_V2_BYTES)

            val offerSurfaceOffset = editor.findFunctionOffsetByName("useIsOfferSurfaceEnabled")
                ?: throw PatchException("useIsOfferSurfaceEnabled function not found")
            editor.patchBytesIfMatches(offerSurfaceOffset, EXPECTED_OFFER_SURFACE_BYTES, HIDDEN_OFFER_SURFACE_BYTES)
        }

        // 6. Knot Account Linking Promos
        if (blockKnotAccountLinking.value == true) {
            val knotActivationModalEnabledOffset = editor.findFunctionOffsetByName("useKnotActivationModalEnabled")
                ?: throw PatchException("useKnotActivationModalEnabled function not found")
            editor.patchBytesIfMatches(
                knotActivationModalEnabledOffset,
                EXPECTED_KNOT_ACTIVATION_MODAL_ENABLED_BYTES,
                HIDDEN_KNOT_ACTIVATION_MODAL_ENABLED_BYTES
            )

            val knotActivationModalGateOffset = editor.findFunctionOffsetByName("useKnotActivationModalGate")
                ?: throw PatchException("useKnotActivationModalGate function not found")
            editor.patchBytesIfMatches(
                knotActivationModalGateOffset,
                EXPECTED_KNOT_ACTIVATION_MODAL_GATE_BYTES,
                HIDDEN_KNOT_ACTIVATION_MODAL_GATE_BYTES
            )

            val knotBannerVisibilityOffset = editor.findFunctionOffsetByName("useKnotBannerVisibility")
                ?: throw PatchException("useKnotBannerVisibility function not found")
            editor.patchBytesIfMatches(
                knotBannerVisibilityOffset,
                EXPECTED_KNOT_BANNER_VISIBILITY_BYTES,
                HIDDEN_KNOT_BANNER_VISIBILITY_BYTES
            )
        }

        // 7. Wallet Marketing
        if (blockWalletMarketing.value == true) {
            val walletMarketingMerchantsOffset = editor.findFunctionOffsetByName("useWalletMarketingMerchants")
                ?: throw PatchException("useWalletMarketingMerchants function not found")
            editor.patchBytesIfMatches(
                walletMarketingMerchantsOffset,
                EXPECTED_WALLET_MARKETING_MERCHANTS_BYTES,
                HIDDEN_WALLET_MARKETING_MERCHANTS_BYTES
            )

            val walletEmptyStateMarketingOffset = editor.findFunctionOffsetByName("useWalletEmptyStateMarketing")
                ?: throw PatchException("useWalletEmptyStateMarketing function not found")
            editor.patchBytesIfMatches(
                walletEmptyStateMarketingOffset,
                EXPECTED_WALLET_EMPTY_STATE_MARKETING_BYTES,
                HIDDEN_WALLET_EMPTY_STATE_MARKETING_BYTES
            )

            val offerBoostBannerOffset = editor.findFunctionOffsetByName("useOfferBoostBanner")
                ?: throw PatchException("useOfferBoostBanner function not found")
            editor.patchBytesIfMatches(
                offerBoostBannerOffset,
                EXPECTED_OFFER_BOOST_BANNER_BYTES,
                HIDDEN_OFFER_BOOST_BANNER_BYTES
            )

            val convertPointsToSpendBannerOffset = editor.findFunctionOffsetByName("useConvertPointsToSpendBanner")
                ?: throw PatchException("useConvertPointsToSpendBanner function not found")
            editor.patchBytesIfMatches(
                convertPointsToSpendBannerOffset,
                EXPECTED_CONVERT_POINTS_TO_SPEND_BANNER_BYTES,
                HIDDEN_CONVERT_POINTS_TO_SPEND_BANNER_BYTES
            )
        }

        // 8. Playtime Marketing
        if (blockPlaytimeMarketing.value == true) {
            val playtimeCampaignsOffset = editor.findFunctionOffsetByName("usePlaytimeCampaigns")
                ?: throw PatchException("usePlaytimeCampaigns function not found")
            editor.patchBytesIfMatches(
                playtimeCampaignsOffset,
                EXPECTED_PLAYTIME_CAMPAIGNS_BYTES,
                HIDDEN_PLAYTIME_CAMPAIGNS_BYTES
            )
        }

        // 9. Referrals & Social
        if (blockReferralsAndSocial.value == true) {
            val referralUnavailableOffset = editor.findFunctionOffsetByName("useIsReferralUnavailable")
                ?: throw PatchException("useIsReferralUnavailable function not found")
            editor.patchBytesIfMatches(
                referralUnavailableOffset,
                EXPECTED_REFERRAL_UNAVAILABLE_BYTES,
                HIDDEN_REFERRAL_UNAVAILABLE_BYTES
            )

        }

        // 10. Trivia
        if (blockTrivia.value == true) {
            val triviaGiveawayBannerOffset = editor.findFunctionOffsetByName("useTriviaGiveawayBanner")
                ?: throw PatchException("useTriviaGiveawayBanner function not found")
            editor.patchBytesIfMatches(
                triviaGiveawayBannerOffset,
                EXPECTED_TRIVIA_GIVEAWAY_BANNER_BYTES,
                HIDDEN_TRIVIA_GIVEAWAY_BANNER_BYTES
            )

            val triviaLiveActivityOffset = editor.findFunctionOffsetByName("useTriviaLiveActivityPushToStart")
                ?: throw PatchException("useTriviaLiveActivityPushToStart function not found")
            editor.patchBytesIfMatches(
                triviaLiveActivityOffset,
                EXPECTED_TRIVIA_LIVE_ACTIVITY_PUSH_TO_START_BYTES,
                HIDDEN_TRIVIA_LIVE_ACTIVITY_PUSH_TO_START_BYTES
            )
        }

        // 11. Notification Prompts
        if (blockNotificationPrompts.value == true) {
            val notificationPermissionModalV2Offset = editor.findFunctionOffsetByName("NotificationPermissionModalV2")
                ?: throw PatchException("NotificationPermissionModalV2 function not found")
            editor.patchBytesIfMatches(
                notificationPermissionModalV2Offset,
                EXPECTED_NOTIFICATION_PERMISSION_MODAL_V2_BYTES,
                HIDDEN_NOTIFICATION_PERMISSION_MODAL_V2_BYTES
            )

            val enableNotificationsModalOffset = editor.findFunctionOffsetByName("EnableNotificationsModal")
                ?: throw PatchException("EnableNotificationsModal function not found")
            editor.patchBytesIfMatches(
                enableNotificationsModalOffset,
                EXPECTED_ENABLE_NOTIFICATIONS_MODAL_BYTES,
                HIDDEN_ENABLE_NOTIFICATIONS_MODAL_BYTES
            )

            val syncPushPermissionOffset = editor.findFunctionOffsetByName("useSyncPushPermissionWithBraze")
                ?: throw PatchException("useSyncPushPermissionWithBraze function not found")
            editor.patchBytesIfMatches(
                syncPushPermissionOffset,
                EXPECTED_SYNC_PUSH_PERMISSION_WITH_BRAZE_BYTES,
                HIDDEN_SYNC_PUSH_PERMISSION_WITH_BRAZE_BYTES
            )
        }

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
