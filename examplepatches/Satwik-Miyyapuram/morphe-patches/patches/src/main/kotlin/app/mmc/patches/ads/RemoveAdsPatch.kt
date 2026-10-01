package app.mmc.patches.ads

import app.mmc.patches.shared.Constants.COMPATIBILITY_MMC
import app.mmc.patches.util.mmcLogger
import app.mmc.patches.util.stubFingerprint
import app.mmc.patches.util.stubMethodsInClass
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch

/** Methods that request / display a banner or interstitial. Return type V (or Z -> false). */
private val AD_DISPLAY_METHODS = setOf(
    "showBannerAd",
    "doShowBannerAd",
    "showAppLovinBannerAd",
    "showAdMobBannerAd",
    "initializeInterstitialAd",
    "prepareInterstitialAd",
    "showInterstitialAd",
)

/** Deferred-component init hooks that start the ad SDKs (AppLovinSdk.initialize / MobileAds.initialize). */
private val AD_SDK_INIT_METHODS = setOf("onInitializingComponent")

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Fully removes banner and interstitial ads (AppLovin MAX and AdMob) and disables " +
        "rewarded video prompts. Optionally stops the ad SDKs and the ad-consent form from loading.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MMC)

    dependsOn(removeAdInitProvidersPatch)

    val disableAdSdkInit by booleanOption(
        key = "disableAdSdkInit",
        default = true,
        title = "Disable ad SDK initialization",
        description = "Prevents AppLovin MAX and Google Mobile Ads from initializing at all. " +
            "Saves data and battery; no ad requests are ever made.",
    )

    val skipConsentForm by booleanOption(
        key = "skipConsentForm",
        default = true,
        title = "Skip ad consent form",
        description = "Skips the Google UMP ad-consent popup, which only exists to ask permission " +
            "for personalized ads.",
    )

    execute {
        var patched = 0

        // 1. Native -> Java JNI bridges. These are the entry points the C++ game calls, so
        //    stubbing them alone already stops every ad from being requested or shown.
        if (stubFingerprint(ShowAdBannerBridgeFingerprint)) patched++
        if (stubFingerprint(PrepareInterstitialBridgeFingerprint)) patched++
        if (stubFingerprint(ShowInterstitialBridgeFingerprint)) patched++
        if (stubFingerprint(ShowRewardedAdBridgeFingerprint)) patched++
        if (stubFingerprint(PrepareRewardedAdBridgeFingerprint)) patched++
        // Never report a rewarded video as available, so the game never offers one.
        if (stubFingerprint(IsRewardedAdReadyBridgeFingerprint, booleanValue = false)) patched++

        // 2. Defense in depth: every layer below the bridges also refuses to show ads, in case
        //    another code path (lifecycle callbacks, retries in onAdHidden/onAdDisplayFailed, ...)
        //    reaches them.
        val appLovinAdapter = AppLovinShowInterstitialFingerprint.originalClassDefOrNull?.type
            ?: APPLOVIN_ADAPTER
        val adMobAdapter = AdMobInitializingComponentFingerprint.originalClassDefOrNull?.type
            ?: ADMOB_ADAPTER

        listOf(PIT_BOSS, ADS_IMPERATOR, AD_NETWORK_ADAPTER_BASE, appLovinAdapter, adMobAdapter)
            .distinct()
            .forEach { classType ->
                patched += stubMethodsInClass(classType, AD_DISPLAY_METHODS, booleanValue = false)
            }

        // 3. Stop the ad SDKs from ever initializing.
        if (disableAdSdkInit == true) {
            listOf(appLovinAdapter, adMobAdapter).distinct().forEach { classType ->
                patched += stubMethodsInClass(classType, AD_SDK_INIT_METHODS)
            }
            patched += stubMethodsInClass(ADS_IMPERATOR, setOf("initialize"))
        }

        // 4. Skip the UMP consent flow. PitBoss.lambda$onCreate$0 only runs
        //    ComplianceManager.initialize -> canRequestAds -> AdsImperator.initialize,
        //    so it is safe to skip entirely.
        if (skipConsentForm == true) {
            patched += stubMethodsInClass(
                PIT_BOSS,
                setOf("lambda\$onCreate\$0", "showPrivacyConsentForm", "canShowPrivacyConsentForm"),
                booleanValue = false,
            )
            patched += stubMethodsInClass(COMPLIANCE_MANAGER, AD_SDK_INIT_METHODS)
        }

        if (patched == 0) {
            throw PatchException(
                "Remove ads: no ad methods were found. This app version is not supported.",
            )
        }
        mmcLogger.info("Remove ads: patched $patched methods")
    }
}
