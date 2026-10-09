package app.aidan.patches.sezzle.ads

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.sezzle.shared.HermesBundleEditor
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch


private val CAN_SHOW_AD_SELECTOR_SUFFIX_BYTES = byteArrayOf(
    0x02, 0x01, 0x00, 0x3b,
    0x01, 0x01, 0x01, 0x5e, 0x01, 0x01, 0x0b, 0x93.toByte(),
    0x00, 0x6e, 0x01, 0x02, 0x00, 0x01, 0x45, 0x01,
    0x01, 0x00, 0x74, 0x66, 0x76, 0x01
)

private val SHOULD_SHOW_ROKT_SELECTOR_SUFFIX_BYTES = byteArrayOf(
    0x02, 0x01, 0x00, 0x3b,
    0x01, 0x01, 0x01, 0x5e, 0x01, 0x01, 0x0c, 0x93.toByte(),
    0x00, 0x6e, 0x01, 0x02, 0x00, 0x01, 0x45, 0x01,
    0x01, 0x00, 0x74, 0x63, 0x76, 0x01
)

private val SHOULD_SHOW_THANKS_SELECTOR_SUFFIX_BYTES = byteArrayOf(
    0x02, 0x01, 0x00, 0x3b,
    0x01, 0x01, 0x01, 0x5e, 0x01, 0x01, 0x0c, 0x93.toByte(),
    0x00, 0x6e, 0x01, 0x02, 0x00, 0x01, 0x45, 0x01,
    0x01, 0x00, 0x8f.toByte(), 0x68, 0x76, 0x01
)

private val IS_AD_ENABLED_FOR_TRIGGER_SELECTOR_SUFFIX_BYTES = byteArrayOf(
    0x02, 0x01, 0x00, 0x3b,
    0x01, 0x01, 0x01, 0x5e, 0x01, 0x01, 0x0e, 0x93.toByte(),
    0x00, 0x6e, 0x01, 0x02, 0x00, 0x01, 0x45, 0x01,
    0x01, 0x00, 0x3e, 0xd2.toByte(), 0x76, 0x01
)

private val IS_REGISTERED_TRIGGER_SELECTOR_SUFFIX_BYTES = byteArrayOf(
    0x02, 0x01, 0x00, 0x3b,
    0x01, 0x01, 0x01, 0x5e, 0x01, 0x01, 0x08, 0x93.toByte(),
    0x00, 0x6e, 0x01, 0x02, 0x00, 0x01, 0x45, 0x01,
    0x01, 0x00, 0x16, 0xdb.toByte(), 0x76, 0x01
)

private val IS_PLACEMENT_IN_CATALOG_SELECTOR_SUFFIX_BYTES = byteArrayOf(
    0x02, 0x01, 0x00, 0x3b,
    0x01, 0x01, 0x01, 0x5e, 0x01, 0x01, 0x0f, 0x93.toByte(),
    0x00, 0x6e, 0x01, 0x02, 0x00, 0x01, 0x45, 0x01,
    0x01, 0x00, 0x17, 0x63, 0x76, 0x01
)

private val ENABLE_THANKS_SUFFIX_BYTES = byteArrayOf(
    0x00, 0x00, 0x07, 0x44, 0x01, 0x00, 0x00, 0x70, 0x44,
    0x00, 0x01, 0x01, 0x9b.toByte(), 0x6c, 0x00, 0x00, 0x01,
    0x45, 0x00, 0x00, 0x02, 0xc4.toByte(), 0xe6.toByte(), 0x45, 0x00,
    0x00, 0x03, 0x6f, 0x37, 0x76, 0x00
)

private val THANKS_BASE_URL_BYTES = byteArrayOf(
    0x91.toByte(), 0x00, 0x4c, 0x60, 0x01, 0x00, 0x76, 0x00
)

private val THANKS_MODAL_RENDER_PREFIX_BYTES = byteArrayOf(
    0x40, 0x01, 0x04, 0x89.toByte(), 0x05, 0x02, 0x37, 0x01,
    0x00, 0x05, 0x89.toByte(), 0x02, 0x06, 0x89.toByte(), 0x04, 0x07,
    0x37, 0x01, 0x01, 0x04, 0x84.toByte(), 0x03, 0x01, 0x7c,
    0x45, 0x37, 0x01, 0x03, 0x03, 0x3d, 0x06, 0x48,
    0x09, 0x06, 0x00, 0x1d, 0x00, 0x44, 0x08, 0x09
)

private val EXPECTED_SELECTOR_PREFIX_BYTES = byteArrayOf(0x34, 0x01, 0x00, 0x3b)
private val EXPECTED_ENABLE_THANKS_PREFIX_BYTES = byteArrayOf(0x34, 0x00, 0x00, 0x3b)
private val EXPECTED_MODAL_RENDER_PREFIX_BYTES = byteArrayOf(0x40, 0x01, 0x04, 0x89.toByte())
private val LOAD_CONST_FALSE_RET_R1 = byteArrayOf(0x96.toByte(), 0x01, 0x76.toByte(), 0x01)
private val LOAD_CONST_FALSE_RET_R0 = byteArrayOf(0x96.toByte(), 0x00, 0x76.toByte(), 0x00)
private val LOAD_CONST_NULL_RET_R0 = byteArrayOf(0x92.toByte(), 0x00, 0x76.toByte(), 0x00)
private fun HermesBundleEditor.patchSelectorIfMatches(
    bundleBytes: ByteArray,
    suffix: ByteArray,
    description: String
) {
    val suffixOffset = findUniqueSequence(bundleBytes, suffix, description)
    val selectorOffset = suffixOffset - 4
    if (matchesBytes(selectorOffset, EXPECTED_SELECTOR_PREFIX_BYTES)) {
        patchBytes(selectorOffset, LOAD_CONST_FALSE_RET_R1)
    } else if (!matchesBytes(selectorOffset, LOAD_CONST_FALSE_RET_R1)) {
        throw PatchException("Unexpected bytes at $description")
    }
}
private fun findUniqueSequence(bytes: ByteArray, sequence: ByteArray, description: String): Int {
    require(sequence.isNotEmpty()) { "Sequence must not be empty" }
    var matchOffset = -1
    var count = 0
    var i = 0
    while (i <= bytes.size - sequence.size) {
        if (bytes[i] == sequence[0]) {
            var matched = true
            for (j in 1 until sequence.size) {
                if (bytes[i + j] != sequence[j]) {
                    matched = false
                    break
                }
            }
            if (matched) {
                matchOffset = i
                count++
            }
        }
        i++
    }
    return when (count) {
        0 -> throw PatchException("Failed to find $description in Hermes bundle")
        1 -> matchOffset
        else -> throw PatchException("Found $count matches for $description in Hermes bundle; expected exactly 1")
    }
}

/**
 * Cross-Layer Companion Asset Patch:
 *
 * In Morphe, bytecode patches exclusively mutate Dalvik DEX ASTs and run in STRIP_FAST mode,
 * which does not decode or repackage APK assets (such as assets/index.android.bundle).
 * To ensure post-payment offers (Thanks network and Rokt placements) in Hermes bytecode
 * are stripped whenever "Remove Ads and Tracking" is enabled, this companion rawResourcePatch
 * is linked via `dependsOn`. Morphe's patcher graph automatically resolves the dependency,
 * stages the bundle, applies the 10 bytecode edits, and repackages it into the output APK.
 */
@Suppress("unused")
val removeAdsAndTrackingFromJsBundlePatch = rawResourcePatch(
    name = "Remove Ads and Tracking from JS Bundle",
    description = "Neutralizes post-payment reward and offer modals (Thanks network and Rokt placements) in the embedded Hermes JavaScript bundle.",
    default = true
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_SEZZLE)
    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())
        val bundleBytes = editor.toByteArray()
        // 1. Force canShowAd selector to return false
        editor.patchSelectorIfMatches(bundleBytes, CAN_SHOW_AD_SELECTOR_SUFFIX_BYTES, "canShowAd selector")

        // 2. Force shouldShowRokt selector to return false
        editor.patchSelectorIfMatches(bundleBytes, SHOULD_SHOW_ROKT_SELECTOR_SUFFIX_BYTES, "shouldShowRokt selector")

        // 3. Force shouldShowThanks selector to return false
        editor.patchSelectorIfMatches(bundleBytes, SHOULD_SHOW_THANKS_SELECTOR_SUFFIX_BYTES, "shouldShowThanks selector")

        // 4. Force isAdEnabledForTrigger selector to return false
        editor.patchSelectorIfMatches(bundleBytes, IS_AD_ENABLED_FOR_TRIGGER_SELECTOR_SUFFIX_BYTES, "isAdEnabledForTrigger selector")

        // 5. Force isRegisteredTrigger selector to return false
        editor.patchSelectorIfMatches(bundleBytes, IS_REGISTERED_TRIGGER_SELECTOR_SUFFIX_BYTES, "isRegisteredTrigger selector")

        // 6. Force isPlacementInCatalog selector to return false
        editor.patchSelectorIfMatches(bundleBytes, IS_PLACEMENT_IN_CATALOG_SELECTOR_SUFFIX_BYTES, "isPlacementInCatalog selector")

        // 7. Force enableThanks to return false
        val enableThanksSuffixOffset = findUniqueSequence(bundleBytes, ENABLE_THANKS_SUFFIX_BYTES, "enableThanks getter")
        val enableThanksOffset = enableThanksSuffixOffset - 4
        if (editor.matchesBytes(enableThanksOffset, EXPECTED_ENABLE_THANKS_PREFIX_BYTES)) {
            editor.patchBytes(enableThanksOffset, LOAD_CONST_FALSE_RET_R0)
        } else if (!editor.matchesBytes(enableThanksOffset, LOAD_CONST_FALSE_RET_R0)) {
            throw PatchException("Unexpected bytes at enableThanks getter")
        }

        // 8. Force getThanksBaseUrl to return null (prevents loading https://thanks.is/)
        val thanksUrlOffset = findUniqueSequence(bundleBytes, THANKS_BASE_URL_BYTES, "getThanksBaseUrl")
        if (editor.matchesBytes(thanksUrlOffset, THANKS_BASE_URL_BYTES)) {
            editor.patchBytes(thanksUrlOffset, LOAD_CONST_NULL_RET_R0)
        } else if (!editor.matchesBytes(thanksUrlOffset, LOAD_CONST_NULL_RET_R0)) {
            throw PatchException("Unexpected bytes at getThanksBaseUrl")
        }

        // 9. Neutralize ThanksModal.render() method to return null (prevents ReactNativeModal from mounting)
        val thanksModalRenderOffset = findUniqueSequence(bundleBytes, THANKS_MODAL_RENDER_PREFIX_BYTES, "ThanksModal render()")
        if (editor.matchesBytes(thanksModalRenderOffset, EXPECTED_MODAL_RENDER_PREFIX_BYTES)) {
            editor.patchBytes(thanksModalRenderOffset, LOAD_CONST_NULL_RET_R0)
        } else if (!editor.matchesBytes(thanksModalRenderOffset, LOAD_CONST_NULL_RET_R0)) {
            throw PatchException("Unexpected bytes at ThanksModal render()")
        }

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
@Suppress("unused")
val removeAdsAndTrackingPatch = bytecodePatch(
    name = "Remove Ads and Tracking",
    description = "Removes all ads (AppLovin MAX, Google Mobile Ads, Rokt, Thanks network, Playtime, InBrain Surveys) and disables analytics and tracking SDKs (AppsFlyer, FullStory, Braze, Firebase Analytics, mParticle, Facebook SDK, AppCenter).",
    default = true
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_SEZZLE)
    dependsOn(removeAdsAndTrackingFromJsBundlePatch)

    execute {
        // --- ADS ---

        // 1. AppLovin MAX
        disableVoidMethods(
            "Lcom/applovin/reactnative/AppLovinMAXAdView;",
            "maybeAttachAdView"
        )
        disableVoidMethods(
            "Lcom/applovin/reactnative/AppLovinMAXModuleImpl;",
            "createBanner",
            "createBannerWithOffsets",
            "loadInterstitial",
            "loadRewardedAd",
            "loadAppOpenAd",
            "showMediationDebugger",
            "createAdView",
            "showAdView",
            "startAutoRefresh"
        )
        returnBoolean("Lcom/applovin/sdk/AppLovinInitProvider;", "onCreate", false)
        disableVoidMethods("Lcom/applovin/sdk/AppLovinSdk;", "initialize")

        // 2. Google Mobile Ads (AdMob / GAM)
        disableVoidMethods(
            "Lio/invertase/googlemobileads/ReactNativeGoogleMobileAdsBannerAdViewManager;",
            "requestAd"
        )
        disableVoidMethods(
            "Lio/invertase/googlemobileads/ReactNativeGoogleMobileAdsFullScreenAdModule;",
            "load",
            "show"
        )
        disableVoidMethods("Lcom/google/android/gms/ads/MobileAdsInitProvider;", "attachInfo")
        disableVoidMethods("Lcom/google/android/gms/ads/MobileAds;", "initialize")
        disableVoidMethods(
            "Lio/invertase/googlemobileads/ReactNativeGoogleMobileAdsModule;",
            "openAdInspector",
            "openDebugMenu"
        )

        // 3. Rokt (Embedded / Modal Offers & Placements)
        disableVoidMethods(
            "Lcom/mparticle/react/rokt/MPRoktModule;",
            "selectPlacements",
            "selectShoppableAds",
            "purchaseFinalized"
        )
        disableVoidMethods(
            "Lcom/mparticle/react/rokt/MPRoktModuleImpl;",
            "selectPlacements",
            "selectShoppableAds",
            "purchaseFinalized"
        )
        disableVoidMethods("Lcom/mparticle/react/rokt/RoktLayoutViewManager;", "setPlaceholderName")
        disableVoidMethods("Lcom/mparticle/react/rokt/RoktLayoutViewManagerImpl;", "setPlaceholderName")
        disableVoidMethods(
            "Lcom/rokt/roktsdk/RoktInternalImplementation;",
            "execute",
            "execute\$roktsdk_devRelease",
            "execute2Step"
        )
        disableVoidMethods("Lcom/rokt/roktsdk/Rokt;", "execute", "init")
        disableVoidMethods("Lcom/rokt/roktsdk/ui/overlay/RoktModalActivity;", "onCreate")
        disableVoidMethods("Lcom/rokt/roktsdk/internal/overlay/bottomsheet/BottomSheetActivity;", "onCreate")
        disableVoidMethods("Lcom/rokt/roktux/RoktLayoutView;", "show", "setVisibility")
        // 4. Adjoe (Playtime Rewards / Ads)
        disableVoidMethods("Lio/adjoe/sdk/Playtime;", "init")
        disableVoidMethods(
            "Lio/adjoe/sdk/reactnative/RNPlaytimeSdkModule;",
            "showCatalog",
            "showCatalogWithOptions",
            "requestPartnerApps",
            "requestPartnerAppsWithOptions",
            "executePartnerAppClick",
            "executePartnerAppView",
            "executeShowCampaignDetailClick",
            "launchPartnerApp",
            "sendEvent"
        )

        // 5. InBrain Surveys (Reward Surveys / Ads)
        disableVoidMethods(
            "Lcom/inbrain/rn/InBrainSurveysModule;",
            "setInBrain",
            "openWall",
            "showNativeSurvey",
            "openOfferWith"
        )

        // --- TRACKING & ANALYTICS ---

        // 6. AppsFlyer (Attribution & Analytics)
        disableVoidMethods(
            "Lcom/appsflyer/AppsFlyerLib;",
            "start",
            "logEvent",
            "logSession",
            "sendPushNotificationData"
        )
        disableVoidMethods(
            "Lcom/appsflyer/reactnative/RNAppsFlyerModule;",
            "startSdk",
            "logEvent",
            "logEventWithPromise",
            "logAdRevenue",
            "logCrossPromotionImpression",
            "logCrossPromotionAndOpenStore",
            "logLocation",
            "sendPushNotificationData"
        )
        disableVoidMethods(
            "Lcom/appsflyer/reactnative/PCAppsFlyerModule;",
            "start",
            "logEvent"
        )

        // 7. FullStory (Session Recording & User Tracking)
        disableVoidMethods(
            "Lcom/fullstory/FS;",
            "init",
            "event",
            "identify",
            "consent",
            "restart"
        )
        disableVoidMethods(
            "Lcom/fullstory/reactnative/FullStoryModule;",
            "event",
            "identify",
            "consent",
            "restart"
        )

        // 8. Braze (Marketing / User Tracking / Banners)
        disableVoidMethods(
            "Lcom/braze/Braze;",
            "logCustomEvent",
            "logPurchase",
            "logPushNotificationOpened",
            "requestImmediateDataFlush",
            "requestContentCardsRefresh",
            "requestGeofences"
        )
        disableVoidMethods(
            "Lcom/braze/reactbridge/BrazeReactBridgeImpl;",
            "logCustomEvent",
            "logPurchase",
            "setAdTrackingEnabled",
            "requestBannersRefresh",
            "requestContentCardsRefresh",
            "logContentCardDismissed",
            "logContentCardClicked",
            "logContentCardImpression",
            "logInAppMessageClicked",
            "logInAppMessageButtonClicked",
            "logInAppMessageImpression",
            "setAttributionData",
            "setLastKnownLocation",
            "requestLocationInitialization"
        )
        disableVoidMethods(
            "Lcom/braze/ui/inappmessage/BrazeInAppMessageManager;",
            "registerInAppMessageManager"
        )
        disableVoidMethods("Lcom/braze/reactbridge/BrazeBannerManager;", "setPlacementID")

        // 9. mParticle (Customer Data Platform & Event Tracking)
        disableVoidMethods(
            "Lcom/mparticle/MParticle;",
            "start",
            "logEvent",
            "logPushRegistration",
            "upload"
        )
        disableVoidMethods(
            "Lcom/mparticle/react/MParticleModule;",
            "upload",
            "logEvent",
            "logMPEvent",
            "logCommerceEvent",
            "logScreenEvent",
            "logPushRegistration"
        )

        // 10. Firebase Analytics & Performance
        disableVoidMethods(
            "Lcom/google/firebase/analytics/FirebaseAnalytics;",
            "logEvent",
            "setAnalyticsCollectionEnabled",
            "setUserProperty",
            "setDefaultEventParameters"
        )
        disableVoidMethods(
            "Lio/invertase/firebase/analytics/ReactNativeFirebaseAnalyticsModule;",
            "logEvent"
        )
        disableVoidMethods(
            "Lcom/google/firebase/perf/FirebasePerformance;",
            "setPerformanceCollectionEnabled"
        )

        // 11. Facebook SDK / App Events (Tracking)
        disableVoidMethods(
            "Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;",
            "logEvent",
            "logPurchase",
            "logPushNotificationOpen",
            "logProductItem",
            "flush",
            "setUserData",
            "setUserID",
            "setPushNotificationsRegistrationId"
        )

        // 12. AppCenter Analytics
        disableVoidMethods("Lcom/microsoft/appcenter/analytics/Analytics;", "trackEvent")
        disableVoidMethods(
            "Lcom/microsoft/appcenter/reactnative/analytics/AppCenterReactNativeAnalyticsModule;",
            "trackEvent"
        )

        // 13. Advertising ID (AAID Zeroing & Opt-out)
        returnConstString(
            "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;",
            "getId",
            "00000000-0000-0000-0000-000000000000"
        )
        returnBoolean(
            "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;",
            "isLimitAdTrackingEnabled",
            true
        )
    }
}
private fun BytecodePatchContext.disableVoidMethods(classDescriptor: String, vararg methodNames: String) {
    try {
        val classDef = classDefByOrNull(classDescriptor) ?: return
        val mutableClass = mutableClassDefBy(classDef)
        val names = methodNames.toSet()
        for (method in mutableClass.methods) {
            if (method.name in names && method.returnType == "V" && method.implementation != null) {
                method.addInstructions(0, "return-void")
            }
        }
    } catch (_: Exception) {
    }
}

private fun BytecodePatchContext.returnBoolean(classDescriptor: String, methodName: String, value: Boolean) {
    try {
        val classDef = classDefByOrNull(classDescriptor) ?: return
        val mutableClass = mutableClassDefBy(classDef)
        for (method in mutableClass.methods) {
            if (method.name == methodName && method.returnType == "Z" && method.implementation != null) {
                val smaliVal = if (value) "0x1" else "0x0"
                method.addInstructions(0, "const/4 v0, $smaliVal\nreturn v0")
            }
        }
    } catch (_: Exception) {
    }
}

private fun BytecodePatchContext.returnConstString(classDescriptor: String, methodName: String, value: String) {
    try {
        val classDef = classDefByOrNull(classDescriptor) ?: return
        val mutableClass = mutableClassDefBy(classDef)
        for (method in mutableClass.methods) {
            if (method.name == methodName && method.returnType == "Ljava/lang/String;" && method.implementation != null) {
                method.addInstructions(0, "const-string v0, \"$value\"\nreturn-object v0")
            }
        }
    } catch (_: Exception) {
    }
}
