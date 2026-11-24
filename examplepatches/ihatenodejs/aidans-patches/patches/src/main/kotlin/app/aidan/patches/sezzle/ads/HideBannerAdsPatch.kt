package app.aidan.patches.sezzle.ads

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.shared.HermesBundleEditor
import app.aidan.patches.shared.compositeFeaturePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException

private const val SELECTOR_PROPERTY_OFFSET = 0x16
private const val SELECTOR_SCAN_LIMIT = 4096

private val EXPECTED_SELECTOR_PREFIX_BYTES = byteArrayOf(0x34, 0x01, 0x00, 0x3b)
private val LOAD_CONST_FALSE_RET_R1 = byteArrayOf(0x96.toByte(), 0x01, 0x76.toByte(), 0x01)
private val LOAD_CONST_FALSE_RET_R0 = byteArrayOf(0x96.toByte(), 0x00, 0x76.toByte(), 0x00)
private val LOAD_CONST_NULL_RET_R0 = byteArrayOf(0x92.toByte(), 0x00, 0x76.toByte(), 0x00)

/**
 * Finds the memoized selector wrapper that returns [propertyName] and forces it to
 * return `false`.
 *
 * The wrapper shape is `GetParentEnvironment; ...; GetById r1, r1, ..., property;
 * Ret r1`, so the property lookup uniquely identifies the 30-byte function.
 */
private fun HermesBundleEditor.forceSelectorFalse(propertyName: String) {
    val propertyId = findStringId(propertyName)
        ?: throw PatchException("String '$propertyName' not found")
    require(propertyId <= 0xFFFF) { "String '$propertyName' id does not fit GetById" }

    val needle = byteArrayOf(
        0x45, 0x01, 0x01, 0x00,
        (propertyId and 0xFF).toByte(),
        ((propertyId ushr 8) and 0xFF).toByte(),
        0x76.toByte(), 0x01
    )
    val bytes = toByteArray()
    var matchOffset = -1
    var matchCount = 0
    for (offset in 0..(bytes.size - needle.size)) {
        if (bytes.copyOfRange(offset, offset + needle.size).contentEquals(needle)) {
            matchOffset = offset
            matchCount++
        }
    }
    if (matchCount != 1) {
        throw PatchException("Expected one selector for '$propertyName', found $matchCount")
    }

    val selectorOffset = matchOffset - SELECTOR_PROPERTY_OFFSET
    if (selectorOffset < 0 || !matchesBytes(selectorOffset, EXPECTED_SELECTOR_PREFIX_BYTES)) {
        throw PatchException("Unexpected selector prologue for '$propertyName'")
    }
    patchBytes(selectorOffset, LOAD_CONST_FALSE_RET_R1)
}

/** Forces the `useShowThanks` hook to return `false`. */
private fun HermesBundleEditor.disableUseShowThanks() {
    val offset = findFunctionOffsetByName("useShowThanks")
        ?: throw PatchException("useShowThanks function not found")
    patchBytes(offset, LOAD_CONST_FALSE_RET_R0)
}

/**
 * Makes the Braze banner component render nothing. The native Braze SDK is
 * stubbed below; leaving the JS banner mounted makes it consume a patched module.
 */
private fun HermesBundleEditor.disableBrazeBanner() {
    val offset = findFunctionOffsetByName("BrazeBannerWithPadding")
        ?: throw PatchException("BrazeBannerWithPadding function not found")
    if (matchesBytes(offset, LOAD_CONST_NULL_RET_R0)) return
    // CreateFunctionEnvironment prologue; fail fast if the bundle layout changes.
    if (!matchesBytes(offset, byteArrayOf(0x40, 0x04, 0x0d))) {
        throw PatchException("Unexpected BrazeBannerWithPadding prologue")
    }
    patchBytes(offset, LOAD_CONST_NULL_RET_R0)
}

/** Replaces the Thanks base URL constant with `null`. */
private fun HermesBundleEditor.disableThanksBaseUrl() {
    val url = "https://thanks.is/"
    val urlId = findStringId(url)
        ?: throw PatchException("String '$url' not found")
    val needle = byteArrayOf(
        0x91.toByte(), 0x00,
        (urlId and 0xFF).toByte(),
        ((urlId ushr 8) and 0xFF).toByte(),
        ((urlId ushr 16) and 0xFF).toByte(),
        ((urlId ushr 24) and 0xFF).toByte(),
        0x76.toByte(), 0x00
    )
    val bytes = toByteArray()
    var matchOffset = -1
    var matchCount = 0
    for (offset in 0..(bytes.size - needle.size)) {
        if (bytes.copyOfRange(offset, offset + needle.size).contentEquals(needle)) {
            matchOffset = offset
            matchCount++
        }
    }
    if (matchCount != 1) {
        throw PatchException("Expected one Thanks base URL loader, found $matchCount")
    }
    patchBytes(matchOffset, LOAD_CONST_NULL_RET_R0)
}

/**
 * Unified Composite Feature Patch:
 *
 * Combines Dalvik DEX bytecode neutralization of native ad and tracking SDKs
 * with Hermes bytecode substitutions in assets/index.android.bundle (stripping
 * Thanks network and Rokt post-payment reward modals). Applies nine Hermes bytecode
 * edits, followed by an automatic footer SHA-1 rehash.
 */
@Suppress("unused")
val removeAdsAndTrackingPatch = compositeFeaturePatch(
    name = "Remove Ads and Tracking",
    description = "Removes all ads (AppLovin MAX, Google Mobile Ads, Rokt, Thanks network, Playtime, InBrain Surveys) and disables analytics and tracking SDKs (AppsFlyer, FullStory, Braze, Firebase Analytics, mParticle, Facebook SDK, AppCenter).",
    default = true
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_SEZZLE)

    rawResources {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())
        for (selector in listOf(
            "canShowAd",
            "shouldShowRokt",
            "shouldShowThanks",
            "isAdEnabledForTrigger",
            "isRegisteredTrigger",
            "isPlacementInCatalog"
        )) {
            editor.forceSelectorFalse(selector)
        }
        editor.disableUseShowThanks()
        editor.disableBrazeBanner()
        editor.disableThanksBaseUrl()

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }

    bytecode {
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
