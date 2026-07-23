package patches.myzong

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/*
 * Removes every ad and every tracker in MyZong (com.zong.customercare 5.19.19.112). Mirrors the
 * Simosa patch. Baseline was captured on-device via SDK debug logs (logcat before/after): Firebase
 * Analytics is the loudest (events carry MSISDN/networkType), plus AdMob interstitials, TikTok,
 * AppsFlyer, Crashlytics. Each SDK's send/init path is no-op'd; auto-collection is killed via
 * manifest flags. Pushwoosh is intentionally left alone — it's the push-notification feature, not
 * an analytics-only SDK; disable it separately if you want.
 *
 * Verify: enable logcat SDK debug (adb shell setprop log.tag.FA VERBOSE) and confirm the FA-SVC
 * "Logging event" lines, TikTok, AppsFlyer and Ads chatter all drop to zero after patching.
 */

private const val FIREBASE_ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"
private const val MOBILE_ADS = "Lcom/google/android/gms/ads/MobileAds;"
private const val INIT_LISTENER = "Lcom/google/android/gms/ads/initialization/OnInitializationCompleteListener;"
private const val INTERSTITIAL_AD = "Lcom/google/android/gms/ads/interstitial/InterstitialAd;"
private const val AD_MANAGER_INTERSTITIAL = "Lcom/google/android/gms/ads/admanager/AdManagerInterstitialAd;"
private const val BASE_AD_VIEW = "Lcom/google/android/gms/ads/BaseAdView;"
private const val AD_MANAGER_AD_VIEW = "Lcom/google/android/gms/ads/admanager/AdManagerAdView;"
private const val AD_LOADER = "Lcom/google/android/gms/ads/AdLoader;"
private const val REWARDED_AD = "Lcom/google/android/gms/ads/rewarded/RewardedAd;"
private const val APP_OPEN_AD = "Lcom/google/android/gms/ads/appopen/AppOpenAd;"
private const val APP_OPEN_CALLBACK = "Lcom/google/android/gms/ads/appopen/AppOpenAd\$AppOpenAdLoadCallback;"
private const val AD_REQUEST = "Lcom/google/android/gms/ads/AdRequest;"
private const val ADM_AD_REQUEST = "Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;"
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private const val AF_LISTENER = "Lcom/appsflyer/attribution/AppsFlyerRequestListener;"
private const val AF_CONVERSION_LISTENER = "Lcom/appsflyer/AppsFlyerConversionListener;"
private const val TTCONFIG = "Lcom/tiktok/TikTokBusinessSdk\$TTConfig;"
private const val FB_SDK = "Lcom/facebook/FacebookSdk;"
private const val TIKTOK = "Lcom/tiktok/TikTokBusinessSdk;"
private const val VERIDIUM_GA = "Lcom/veridiumid/sdk/analytics/AnalyticsGoogle;"

// ---------------- TRACKERS ----------------
internal val firebaseLogEventFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;"),
    custom = { m, c -> c.type == FIREBASE_ANALYTICS && m.name == "logEvent" },
)
// init sets the dev key + conversion listener; no-op it (return the receiver — init returns `this`)
// so the whole AppsFlyer SDK never starts, not just its send path.
internal val appsflyerInitFingerprint = Fingerprint(
    returnType = APPSFLYER_LIB,
    parameters = listOf("Ljava/lang/String;", AF_CONVERSION_LISTENER, "Landroid/content/Context;"),
    custom = { m, c -> c.superclass == APPSFLYER_LIB && m.name == "init" },
)
internal val appsflyerStartCtxFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    custom = { m, c -> c.superclass == APPSFLYER_LIB && m.name == "start" },
)
internal val appsflyerStartFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    custom = { m, c -> c.superclass == APPSFLYER_LIB && m.name == "start" },
)
internal val appsflyerStartListenerFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", AF_LISTENER),
    custom = { m, c -> c.superclass == APPSFLYER_LIB && m.name == "start" },
)
internal val appsflyerLogEventFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/util/Map;"),
    custom = { m, c -> c.superclass == APPSFLYER_LIB && m.name == "logEvent" },
)
internal val appsflyerLogEventListenerFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/util/Map;", AF_LISTENER),
    custom = { m, c -> c.superclass == APPSFLYER_LIB && m.name == "logEvent" },
)
internal val facebookFullyInitializeFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(),
    custom = { m, c -> c.type == FB_SDK && m.name == "fullyInitialize" },
)
internal val facebookAutoLogGetterFingerprint = Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { m, c -> c.type == FB_SDK && m.name == "getAutoLogAppEventsEnabled" },
)
internal val facebookAdIdGetterFingerprint = Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { m, c -> c.type == FB_SDK && m.name == "getAdvertiserIDCollectionEnabled" },
)
internal val tiktokTrackEventFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    custom = { m, c -> c.type == TIKTOK && m.name == "trackEvent" },
)
internal val tiktokTrackEventPropsFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lorg/json/JSONObject;"),
    custom = { m, c -> c.type == TIKTOK && m.name == "trackEvent" },
)
internal val tiktokIdentifyFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
    custom = { m, c -> c.type == TIKTOK && m.name == "identify" },
)
// no-op TikTok SDK init + its track-flush loop so the SDK never starts, not just per-event track.
internal val tiktokInitializeSdkFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(TTCONFIG),
    custom = { m, c -> c.type == TIKTOK && m.name == "initializeSdk" },
)
internal val tiktokStartTrackFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(),
    custom = { m, c -> c.type == TIKTOK && m.name == "startTrack" },
)
// Veridium biometric SDK ships its OWN Google Analytics tracker and exfils via these.
internal val veridiumGaSendFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
    custom = { m, c -> c.type == VERIDIUM_GA && m.name == "send" },
)
internal val veridiumGaLogDataFingerprint = Fingerprint(
    returnType = "V",
    custom = { m, c -> c.type == VERIDIUM_GA && m.name == "log_data" },
)
internal val veridiumGaLogStringFingerprint = Fingerprint(
    returnType = "V",
    custom = { m, c -> c.type == VERIDIUM_GA && m.name == "log_string" },
)

// ---------------- AD NETWORK ----------------
// No-op MobileAds.initialize -> the whole GMA + mediation stack never starts, so nothing loads.
internal val mobileAdsInitFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    custom = { m, c -> c.type == MOBILE_ADS && m.name == "initialize" },
)
internal val mobileAdsInitListenerFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", INIT_LISTENER),
    custom = { m, c -> c.type == MOBILE_ADS && m.name == "initialize" },
)
// GMA auto-inits via MobileAdsInitProvider (manifest ContentProvider), bypassing the initialize()
// stub, so we also stub every ad-load entry point — no ad content ever fetches.
internal val interstitialLoadFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", AD_REQUEST, "Lcom/google/android/gms/ads/interstitial/InterstitialAdLoadCallback;"),
    custom = { m, c -> c.type == INTERSTITIAL_AD && m.name == "load" },
)
internal val adManagerInterstitialLoadFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", ADM_AD_REQUEST, "Lcom/google/android/gms/ads/admanager/AdManagerInterstitialAdLoadCallback;"),
    custom = { m, c -> c.type == AD_MANAGER_INTERSTITIAL && m.name == "load" },
)
internal val baseAdViewLoadFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(AD_REQUEST),
    custom = { m, c -> c.type == BASE_AD_VIEW && m.name == "loadAd" },
)
internal val adManagerAdViewLoadFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(ADM_AD_REQUEST),
    custom = { m, c -> c.type == AD_MANAGER_AD_VIEW && m.name == "loadAd" },
)
internal val adLoaderLoadAdFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(AD_REQUEST),
    custom = { m, c -> c.type == AD_LOADER && m.name == "loadAd" },
)
internal val adLoaderLoadAdmFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(ADM_AD_REQUEST),
    custom = { m, c -> c.type == AD_LOADER && m.name == "loadAd" },
)
internal val adLoaderLoadAdsFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(AD_REQUEST, "I"),
    custom = { m, c -> c.type == AD_LOADER && m.name == "loadAds" },
)
internal val rewardedLoadFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", AD_REQUEST, "Lcom/google/android/gms/ads/rewarded/RewardedAdLoadCallback;"),
    custom = { m, c -> c.type == REWARDED_AD && m.name == "load" },
)
internal val rewardedLoadAdmFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", ADM_AD_REQUEST, "Lcom/google/android/gms/ads/rewarded/RewardedAdLoadCallback;"),
    custom = { m, c -> c.type == REWARDED_AD && m.name == "load" },
)
// App Open ad (shown at launch) — 3 load overloads, all unstubbed until now.
internal val appOpenLoadDeprFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", AD_REQUEST, "I", APP_OPEN_CALLBACK),
    custom = { m, c -> c.type == APP_OPEN_AD && m.name == "load" },
)
internal val appOpenLoadFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", AD_REQUEST, APP_OPEN_CALLBACK),
    custom = { m, c -> c.type == APP_OPEN_AD && m.name == "load" },
)
internal val appOpenLoadAdmFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", ADM_AD_REQUEST, "I", APP_OPEN_CALLBACK),
    custom = { m, c -> c.type == APP_OPEN_AD && m.name == "load" },
)

/**
 * Kills auto-collection (which no code stub can reach) via manifest meta-data: Firebase
 * Analytics/Crashlytics/Performance + Google-Analytics ad-id/ssaid + the four MyZong consent
 * defaults that ship as "true", and flips the Facebook SDK flags off. Upsert: flip if present, add if not.
 */
private val disableAutoCollectionResourcePatch = resourcePatch(
    description = "Disables Firebase/Crashlytics/Performance/GA auto-collection, consent defaults, and Facebook flags via manifest.",
) {
    compatibleWith(COMPATIBILITY_MYZONG)

    finalize {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0)

            fun setFlag(name: String, value: String) {
                val existing = doc.getElementsByTagName("meta-data")
                for (i in 0 until existing.length) {
                    val el = existing.item(i) as Element
                    if (el.getAttribute("android:name") == name) {
                        el.setAttribute("android:value", value)
                        return
                    }
                }
                val el = doc.createElement("meta-data")
                el.setAttribute("android:name", name)
                el.setAttribute("android:value", value)
                application.appendChild(el)
            }

            listOf(
                "com.facebook.sdk.AutoInitEnabled" to "false",
                "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
                "firebase_analytics_collection_enabled" to "false",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_enabled" to "false",
                "firebase_performance_collection_deactivated" to "true",
                "google_analytics_adid_collection_enabled" to "false",
                "google_analytics_ssaid_collection_enabled" to "false",
                // MyZong ships these four consent defaults as "true" — flip them.
                "google_analytics_default_allow_analytics_storage" to "false",
                "google_analytics_default_allow_ad_storage" to "false",
                "google_analytics_default_allow_ad_user_data" to "false",
                "google_analytics_default_allow_ad_personalization_signals" to "false",
            ).forEach { (name, value) -> setFlag(name, value) }

            // GMA auto-inits via this ContentProvider regardless of the MobileAds.initialize stub —
            // disable it so the SDK never eagerly starts (no sdk-core/doubleclick fetch on launch).
            val providers = doc.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val el = providers.item(i) as Element
                if (el.getAttribute("android:name") == "com.google.android.gms.ads.MobileAdsInitProvider") {
                    el.setAttribute("android:enabled", "false")
                }
            }
        }
    }
}

@Suppress("unused")
val removeAdsAndTrackingPatch = bytecodePatch(
    name = "Remove ads & tracking",
    description = "Removes every ad (AdMob) and every tracker (Firebase Analytics, AppsFlyer, " +
        "Facebook, TikTok, and the Veridium SDK's own Google Analytics) — event sends, full SDK init " +
        "(AppsFlyer init, TikTok initializeSdk/startTrack, MobileAds.initialize), and auto-collection. " +
        "Pushwoosh push is left intact. The app then phones home only to its own Zong API.",
) {
    compatibleWith(COMPATIBILITY_MYZONG)
    dependsOn(disableAutoCollectionResourcePatch)

    execute {
        // Each stub is best-effort so a method absent in some build doesn't fail the whole patch.
        fun stub(fingerprint: Fingerprint, code: String) {
            try {
                fingerprint.method.addInstructions(0, code)
            } catch (_: Exception) {
                // fingerprint didn't resolve — skip
            }
        }

        val returnFalse = """
            const/4 v0, 0x0
            return v0
        """.trimIndent()

        // return-void: every tracker send/init + ad-network init
        listOf(
            firebaseLogEventFingerprint,
            appsflyerStartCtxFingerprint,
            appsflyerStartFingerprint,
            appsflyerStartListenerFingerprint,
            appsflyerLogEventFingerprint,
            appsflyerLogEventListenerFingerprint,
            facebookFullyInitializeFingerprint,
            tiktokTrackEventFingerprint,
            tiktokTrackEventPropsFingerprint,
            tiktokIdentifyFingerprint,
            tiktokInitializeSdkFingerprint,
            tiktokStartTrackFingerprint,
            veridiumGaSendFingerprint,
            veridiumGaLogDataFingerprint,
            veridiumGaLogStringFingerprint,
            mobileAdsInitFingerprint,
            mobileAdsInitListenerFingerprint,
            interstitialLoadFingerprint,
            adManagerInterstitialLoadFingerprint,
            baseAdViewLoadFingerprint,
            adManagerAdViewLoadFingerprint,
            adLoaderLoadAdFingerprint,
            adLoaderLoadAdmFingerprint,
            adLoaderLoadAdsFingerprint,
            rewardedLoadFingerprint,
            rewardedLoadAdmFingerprint,
            appOpenLoadDeprFingerprint,
            appOpenLoadFingerprint,
            appOpenLoadAdmFingerprint,
        ).forEach { stub(it, "return-void") }

        // return false: Facebook auto-collection getters
        listOf(
            facebookAutoLogGetterFingerprint,
            facebookAdIdGetterFingerprint,
        ).forEach { stub(it, returnFalse) }

        // AppsFlyer init returns the receiver (`this`) — return it untouched so the SDK never initializes.
        stub(appsflyerInitFingerprint, "return-object p0")
    }
}
