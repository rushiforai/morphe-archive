package app.finance.patches.sezzle.ads

import app.finance.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val removeAdsAndTrackingPatch = bytecodePatch(
    name = "Remove Ads and Tracking",
    description = "Removes all ads (AppLovin MAX, Google Mobile Ads, Rokt, Playtime, InBrain Surveys) and disables analytics and tracking SDKs (AppsFlyer, FullStory, Braze, Firebase Analytics, mParticle, Facebook SDK, AppCenter).",
    default = true
) {
    compatibleWith(COMPATIBILITY_SEZZLE)

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
        disableVoidMethods("Lcom/mparticle/react/rokt/RoktLayoutViewManager;", "setPlaceholderName")
        disableVoidMethods(
            "Lcom/rokt/roktsdk/RoktInternalImplementation;",
            "execute",
            "execute\$roktsdk_devRelease",
            "execute2Step"
        )
        disableVoidMethods("Lcom/rokt/roktsdk/Rokt;", "execute", "init")

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
