/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.patches.universal

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import org.w3c.dom.Element

/*
 * Works on any app and never fails because something is missing: every target is looked up first and skipped when the
 * app does not have it, so an app without ads, without Firebase or without a manifest entry still patches cleanly.
 */

/** The user's choices, read when the patches run (the options themselves belong to the public patch below). */
private object Choices {
    var ads: () -> Boolean = { true }
    var analytics: () -> Boolean = { true }
    var advertisingId: () -> Boolean = { true }
}

// ---- Ad SDK (Google AdMob) ----------------------------------------------------------------------------------------

private const val ADS = "Lcom/google/android/gms/ads"

/** Public AdMob entry points, matched by class, name and exact parameters. They keep their names under R8. */
private fun adEntry(cls: String, name: String, vararg params: String) =
    Fingerprint(definingClass = "$ADS/$cls;", name = name, returnType = "V", parameters = params.toList())

private val adRequests = listOf(
    adEntry("MobileAds", "initialize", "Landroid/content/Context;"),
    adEntry("MobileAds", "initialize", "Landroid/content/Context;", "$ADS/initialization/OnInitializationCompleteListener;"),
    adEntry("BaseAdView", "loadAd", "$ADS/AdRequest;"),
    adEntry(
        "interstitial/InterstitialAd", "load", "Landroid/content/Context;", "Ljava/lang/String;", "$ADS/AdRequest;",
        "$ADS/interstitial/InterstitialAdLoadCallback;",
    ),
    adEntry(
        "appopen/AppOpenAd", "load", "Landroid/content/Context;", "Ljava/lang/String;", "$ADS/AdRequest;",
        "$ADS/appopen/AppOpenAd\$AppOpenAdLoadCallback;",
    ),
    adEntry(
        "rewarded/RewardedAd", "load", "Landroid/content/Context;", "Ljava/lang/String;", "$ADS/AdRequest;",
        "$ADS/rewarded/RewardedAdLoadCallback;",
    ),
    adEntry("AdLoader", "loadAd", "$ADS/AdRequest;"),
)

/** The provider that starts AdMob before the app's own code runs. */
private val adsInitProvider = Fingerprint(
    definingClass = "$ADS/MobileAdsInitProvider;", name = "onCreate", returnType = "Z", parameters = listOf(),
)

// ---- Other ad networks ----------------------------------------------------------------------------------------------

/**
 * Public entry points of the other ad SDKs, read from the SDKs' own libraries: each network's start-up call and the calls
 * that request an ad. A network is listed by its classes and method names; every overload that returns nothing is
 * stubbed, so a new SDK version that adds one is still covered. Networks the app does not contain are skipped.
 * The classes are the ones the SDKs keep unobfuscated for their integrators.
 */
private val NETWORKS: Map<String, List<Pair<String, List<String>>>> = linkedMapOf(
    "AppLovin MAX" to listOf(
        "Lcom/applovin/sdk/AppLovinSdk;" to listOf("initialize", "initializeSdk"),
        "Lcom/applovin/mediation/ads/MaxInterstitialAd;" to listOf("loadAd"),
        "Lcom/applovin/mediation/ads/MaxRewardedAd;" to listOf("loadAd"),
        "Lcom/applovin/mediation/ads/MaxRewardedInterstitialAd;" to listOf("loadAd"),
        "Lcom/applovin/mediation/ads/MaxAppOpenAd;" to listOf("loadAd"),
        "Lcom/applovin/mediation/ads/MaxAdView;" to listOf("loadAd"),
        "Lcom/applovin/mediation/nativeAds/MaxNativeAdLoader;" to listOf("loadAd"),
    ),
    "Unity Ads" to listOf(
        "Lcom/unity3d/ads/UnityAds;" to listOf("initialize", "load"),
        "Lcom/unity3d/services/banners/BannerView;" to listOf("load"),
    ),
    "Pangle" to listOf(
        "Lcom/bytedance/sdk/openadsdk/api/init/PAGSdk;" to listOf("init"),
        "Lcom/bytedance/sdk/openadsdk/api/interstitial/PAGInterstitialAd;" to listOf("loadAd"),
        "Lcom/bytedance/sdk/openadsdk/api/banner/PAGBannerAd;" to listOf("loadAd"),
        "Lcom/bytedance/sdk/openadsdk/api/reward/PAGRewardedAd;" to listOf("loadAd"),
        "Lcom/bytedance/sdk/openadsdk/api/open/PAGAppOpenAd;" to listOf("loadAd"),
        "Lcom/bytedance/sdk/openadsdk/api/nativeAd/PAGNativeAd;" to listOf("loadAd"),
    ),
    "Meta Audience Network" to listOf(
        "Lcom/facebook/ads/AudienceNetworkAds;" to listOf("initialize"),
        "Lcom/facebook/ads/InterstitialAd;" to listOf("loadAd"),
        "Lcom/facebook/ads/RewardedVideoAd;" to listOf("loadAd"),
        "Lcom/facebook/ads/AdView;" to listOf("loadAd"),
        "Lcom/facebook/ads/NativeAdBase;" to listOf("loadAd"),
    ),
    "InMobi" to listOf(
        "Lcom/inmobi/sdk/InMobiSdk;" to listOf("init"),
        "Lcom/inmobi/ads/InMobiInterstitial;" to listOf("load"),
        "Lcom/inmobi/ads/InMobiBanner;" to listOf("load"),
        "Lcom/inmobi/ads/InMobiNative;" to listOf("load"),
    ),
    "ironSource / LevelPlay" to listOf(
        "Lcom/unity3d/mediation/LevelPlay;" to listOf("init"),
        // The older API, still shipped inside apps next to LevelPlay.
        "Lcom/ironsource/mediationsdk/IronSource;" to listOf(
            "init", "initISDemandOnly", "loadInterstitial", "loadRewardedVideo", "loadBanner",
            "loadISDemandOnlyInterstitial", "loadISDemandOnlyInterstitialWithAdm", "loadISDemandOnlyRewardedVideo",
            "loadISDemandOnlyRewardedVideoWithAdm", "loadISDemandOnlyBanner", "loadISDemandOnlyBannerWithAdm",
        ),
        "Lcom/unity3d/mediation/interstitial/LevelPlayInterstitialAd;" to listOf("loadAd"),
        "Lcom/unity3d/mediation/rewarded/LevelPlayRewardedAd;" to listOf("loadAd"),
        "Lcom/unity3d/mediation/banner/LevelPlayBannerAdView;" to listOf("loadAd"),
    ),
    "Vungle / Liftoff" to listOf(
        "Lcom/vungle/ads/VungleAds;" to listOf("init"),
        "Lcom/vungle/ads/BaseAd;" to listOf("load"),
        "Lcom/vungle/ads/BaseFullscreenAd;" to listOf("load"),
    ),
    "myTarget" to listOf(
        "Lcom/my/target/common/MyTargetManager;" to listOf("initSdk"),
        "Lcom/my/target/ads/MyTargetView;" to listOf("load", "loadFromBid"),
        "Lcom/my/target/ads/BaseInterstitialAd;" to listOf("load", "loadFromBid"),
    ),
    // Read from an app that ships it; the start-up call sits behind an interface and is left alone.
    "Mintegral" to listOf(
        "Lcom/mbridge/msdk/out/MBBannerView;" to listOf("load", "loadFromBid"),
        "Lcom/mbridge/msdk/out/MBNativeAdvancedHandler;" to listOf("load", "loadByToken"),
        "Lcom/mbridge/msdk/out/MBSplashHandler;" to listOf("loadAndShow", "loadAndShowByToken"),
        "Lcom/mbridge/msdk/out/MBInterstitialHandler;" to listOf("preload"),
        "Lcom/mbridge/msdk/out/strategy/base/NonBidAdHandler;" to listOf("load", "loadFormSelfFilling"),
        "Lcom/mbridge/msdk/out/strategy/base/BidAdHandler;" to listOf("loadFromBid"),
    ),
    "BIGO Ads" to listOf(
        "Lsg/bigo/ads/BigoAdSdk;" to listOf("initialize"),
    ),
)

private val networkFingerprints = NETWORKS.values.flatten().flatMap { (cls, names) ->
    names.map { Fingerprint(definingClass = cls, name = it, returnType = "V") }
}

// ---- Crash reporting (Firebase Crashlytics) ------------------------------------------------------------------------

private const val CRASHLYTICS = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"

private fun crashlytics(name: String, vararg params: String) =
    Fingerprint(definingClass = CRASHLYTICS, name = name, returnType = "V", parameters = params.toList())

private val crashlyticsCalls = listOf(
    crashlytics("setUserId", "Ljava/lang/String;"),
    crashlytics("log", "Ljava/lang/String;"),
    crashlytics("recordException", "Ljava/lang/Throwable;"),
    crashlytics("sendUnsentReports"),
)

// ---- Manifest -----------------------------------------------------------------------------------------------------

/** The SDKs' own opt-out flags, read from the manifest at start-up. Each group is added only if the app has the SDK. */
private val FIREBASE_FLAGS = linkedMapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_analytics_collection_enabled" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
)
private val FACEBOOK_FLAGS = linkedMapOf(
    "com.facebook.sdk.AutoInitEnabled" to "false",
    "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
    "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
)
private val AD_ID_FLAGS = linkedMapOf("google_analytics_adid_collection_enabled" to "false")

private val ATTRIBUTION = listOf(
    "Lio/appmetrica/analytics/AppMetrica;",
    "Lcom/yandex/metrica/YandexMetrica;",
).flatMap { cls ->
    listOf("activate", "reportEvent", "reportError", "reportUnhandledException", "sendEventsBuffer").map {
        Fingerprint(definingClass = cls, name = it, returnType = "V")
    }
} + listOf(
    "startConnection", "endConnection",
).map { Fingerprint(definingClass = "Lcom/android/installreferrer/api/InstallReferrerClientImpl;", name = it, returnType = "V") }

private val WEBVIEW_FLAGS = linkedMapOf(
    "android.webkit.WebView.EnableSafeBrowsing" to "false",
    "android.webkit.WebView.MetricsOptOut" to "true",
)

private val AD_ID_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
)

private val manifestPart = resourcePatch {
    execute {
        val manifest = get("AndroidManifest.xml")
        if (!manifest.exists()) return@execute
        val text = manifest.readText()
        val hasFirebase = text.contains("com.google.firebase")
        val hasFacebook = text.contains("com.facebook")

        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element ?: return@use
            val present = (0 until application.getElementsByTagName("meta-data").length)
                .map { (application.getElementsByTagName("meta-data").item(it) as Element).getAttribute("android:name") }
                .toSet()

            fun add(flags: Map<String, String>) = flags.forEach { (name, value) ->
                if (name in present) return@forEach
                application.appendChild(document.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    it.setAttribute("android:value", value)
                })
            }

            if (Choices.analytics()) {
                if (hasFirebase) add(FIREBASE_FLAGS)
                if (hasFacebook) add(FACEBOOK_FLAGS)
                add(WEBVIEW_FLAGS)
            }
            add(linkedMapOf(
                "app.loki.menu.ads" to Choices.ads().toString(),
                "app.loki.menu.analytics" to Choices.analytics().toString(),
                "app.loki.menu.adid" to Choices.advertisingId().toString(),
            ))
            if (Choices.advertisingId()) {
                if (hasFirebase) add(AD_ID_FLAGS)
                val permissions = document.getElementsByTagName("uses-permission")
                (0 until permissions.length).map { permissions.item(it) as Element }
                    .filter { it.getAttribute("android:name") in AD_ID_PERMISSIONS }
                    .forEach { it.parentNode.removeChild(it) }
            }
        }
    }
}

/** AppsFlyer keeps these names on the class that extends AppsFlyerLib; the class itself is renamed per SDK version. */
private fun BytecodePatchContext.stubAppsFlyer() {
    val voidNames = setOf("start", "logEvent", "logSession", "setCustomerUserId")
    classDefForEach { def ->
        if (!def.type.startsWith("Lcom/appsflyer/") || !extendsAppsFlyerLib(def)) return@classDefForEach
        val cls = mutableClassDefBy(def)
        cls.methods.filter { it.implementation != null }.forEach { method ->
            when {
                method.name in voidNames && method.returnType == "V" -> method.addInstructions(0, "return-void")
                method.name == "init" && method.returnType == "Lcom/appsflyer/AppsFlyerLib;" &&
                    !AccessFlags.STATIC.isSet(method.accessFlags) -> method.addInstructions(0, "return-object p0")
            }
        }
    }
}

private fun BytecodePatchContext.extendsAppsFlyerLib(def: ClassDef): Boolean {
    if (def.type == "Lcom/appsflyer/AppsFlyerLib;") return true
    var superName = def.superclass ?: return false
    var guard = 0
    while (guard++ < 6 && superName != "Ljava/lang/Object;") {
        if (superName == "Lcom/appsflyer/AppsFlyerLib;") return true
        superName = classDefByOrNull(superName)?.superclass ?: return false
    }
    return false
}

/**
 * Stops every ad SDK the app contains from starting and from loading ads (AdMob and the networks above). Shared by
 * this universal patch and by each app's own "Hide ads (<App>)" patch, which call it on their own: the per-app
 * patches never depend on this one. Stubbing a method twice is harmless, so both may run on one app.
 */
internal fun BytecodePatchContext.stopAdSdks() {
    adRequests.forEach { fingerprint ->
        fingerprint.matchOrNull()?.method?.takeIf { it.implementation != null }?.addInstructions(0, "return-void")
    }
    // Every overload that returns nothing; each method is stubbed once even if it is reached twice.
    networkFingerprints.flatMap { it.matchAllOrNull() ?: emptyList() }
        .map { it.method }.distinct()
        .filter { it.implementation != null } // abstract and interface methods have no body to replace
        .forEach { it.addInstructions(0, "return-void") }
    adsInitProvider.matchOrNull()?.method?.addInstructions(
        0,
        """
            const/4 v0, 0x0
            return v0
        """
    )
}

// ---- The patch ----------------------------------------------------------------------------------------------------

@Suppress("unused")
val removeAdsAndTrackersPatch = bytecodePatch(
    name = "Remove ads and trackers",
    description = "Removes ads, analytics and crash reporting, and the advertising ID.",
    default = false,
) {
    dependsOn(manifestPart)
    dependsOn(menuPatch)

    val ads by booleanOption(
        key = "ads", default = true, title = "Ads",
        description = "Stops the ad SDKs from starting and from loading ads: Google AdMob, AppLovin MAX, Unity Ads, Pangle, Meta Audience Network, InMobi, ironSource, Vungle, Mintegral, myTarget and BIGO.",
    )
    val analytics by booleanOption(
        key = "analytics", default = true, title = "Analytics and crash reporting",
        description = "Turns off Firebase Analytics and Crashlytics, the Facebook SDK, AppMetrica, AppsFlyer and the Play install referrer, when the app has them.",
    )
    val advertisingId by booleanOption(
        key = "advertisingId", default = true, title = "Advertising ID",
        description = "Removes the advertising ID permissions so no SDK can read the device's advertising ID.",
    )
    Choices.ads = { ads ?: true }
    Choices.analytics = { analytics ?: true }
    Choices.advertisingId = { advertisingId ?: true }

    execute {
        if (ads ?: true) stopAdSdks()
        if (analytics ?: true) {
            crashlyticsCalls.forEach { fingerprint ->
                fingerprint.matchOrNull()?.method?.takeIf { it.implementation != null }?.addInstructions(0, "return-void")
            }
            ATTRIBUTION.flatMap { it.matchAllOrNull() ?: emptyList() }
                .map { it.method }.distinct()
                .filter { it.implementation != null }
                .forEach { it.addInstructions(0, "return-void") }
            stubAppsFlyer()
        }
    }
}
