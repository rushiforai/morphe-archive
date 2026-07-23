package patches.simosa

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element

/*
 * One patch that removes every ad and every tracker in Simosa. Consolidates what used to be five
 * separate patches (interstitial / daily-reward / banner ads + analytics + ad-network) into a single
 * toggle. All stubs verified on-device: no ads render and the app phones home to nothing but its own
 * Jazz API (Mixpanel / Firebase / Facebook / AppsFlyer / Google-Ads / AppLovin / Prebid / ipify all 0).
 */

private const val AD_MANAGER_INTERSTITIAL = "Lcom/google/android/gms/ads/admanager/AdManagerInterstitialAd;"
private const val AD_MANAGER_AD_VIEW = "Lcom/google/android/gms/ads/admanager/AdManagerAdView;"
private const val BASE_AD_VIEW = "Lcom/google/android/gms/ads/BaseAdView;"
private const val MOBILE_ADS = "Lcom/google/android/gms/ads/MobileAds;"
private const val MIXPANEL = "Lcom/mixpanel/android/mpmetrics/MixpanelAPI;"
private const val MP_MESSAGES = "Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;"
private const val FB_LOGGER = "Lcom/facebook/appevents/AppEventsLogger;"
private const val FB_SDK = "Lcom/facebook/FacebookSdk;"
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private const val PREBID = "Lorg/prebid/mobile/PrebidMobile;"
private const val PREBID_SDK_INIT = "Lorg/prebid/mobile/rendering/sdk/SdkInitializer;"
private const val PREBID_LISTENER = "Lorg/prebid/mobile/rendering/listeners/SdkInitializationListener;"

// ---------------- ADS (show side) ----------------
// Interstitial holders b5.a / b5.b: the show sites null-check d(), so null it -> no interstitial.
internal val interstitialHolderAFingerprint = Fingerprint(
    returnType = AD_MANAGER_INTERSTITIAL,
    parameters = listOf(),
    custom = { m, c -> c.type == "Lb5/a;" && m.name == "d" },
)
internal val interstitialHolderBFingerprint = Fingerprint(
    returnType = AD_MANAGER_INTERSTITIAL,
    parameters = listOf(),
    custom = { m, c -> c.type == "Lb5/b;" && m.name == "d" },
)
// Daily-reward interstitial config gate.
internal val enableAdConfigFingerprint = Fingerprint(
    name = "isEnableAdTecConfiguration",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)
// Daily-reward banner factory (k1.j.o): return a bare, un-loaded AdManagerAdView (renders nothing).
internal val dailyRewardBannerFactoryFingerprint = Fingerprint(
    returnType = AD_MANAGER_AD_VIEW,
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Lkotlin/jvm/functions/Function0;",
        "Landroidx/compose/runtime/MutableState;",
        "Landroid/content/Context;",
    ),
)

// ---------------- AD NETWORK (load side) ----------------
internal val mobileAdsInitFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    custom = { m, c -> c.type == MOBILE_ADS && m.name == "initialize" },
)
internal val mobileAdsInitListenerFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/google/android/gms/ads/initialization/OnInitializationCompleteListener;",
    ),
    custom = { m, c -> c.type == MOBILE_ADS && m.name == "initialize" },
)
internal val interstitialLoadFingerprint = Fingerprint(
    returnType = "V",
    custom = { m, c -> c.type == AD_MANAGER_INTERSTITIAL && m.name == "load" },
)
internal val baseAdViewLoadFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/ads/AdRequest;"),
    custom = { m, c -> c.type == BASE_AD_VIEW && m.name == "loadAd" },
)
internal val adManagerAdViewLoadFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;"),
    custom = { m, c -> c.type == AD_MANAGER_AD_VIEW && m.name == "loadAd" },
)
internal val prebidInit4Fingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;", PREBID_LISTENER),
    custom = { _, c -> c.type == PREBID },
)
internal val prebidInit3Fingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", PREBID_LISTENER),
    custom = { _, c -> c.type == PREBID },
)
internal val prebidSdkInitializerFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", PREBID_LISTENER),
    custom = { _, c -> c.type == PREBID_SDK_INIT },
)
// app's own public-IP fetch (Omno) — suspend coroutine, anchored on the URL literal.
internal val ipifyFetchFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(string("https://api.ipify.org")),
)

// ---------------- TRACKERS ----------------
internal val mixpanelTrackJsonFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lorg/json/JSONObject;"),
    custom = { m, c -> c.type == MIXPANEL && m.name == "track" },
)
internal val mixpanelTrackMapFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/Map;"),
    custom = { m, c -> c.type == MIXPANEL && m.name == "trackMap" },
)
internal val mixpanelEventsMessageFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/mixpanel/android/mpmetrics/AnalyticsMessages\$EventDescription;"),
    custom = { m, c -> c.type == MP_MESSAGES && m.name == "eventsMessage" },
)
internal val mixpanelPeopleMessageFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/mixpanel/android/mpmetrics/AnalyticsMessages\$PeopleDescription;"),
    custom = { m, c -> c.type == MP_MESSAGES && m.name == "peopleMessage" },
)
internal val mixpanelPostToServerFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/mixpanel/android/mpmetrics/AnalyticsMessages\$MixpanelDescription;"),
    custom = { m, c -> c.type == MP_MESSAGES && m.name == "postToServer" },
)
internal val firebaseLogEventFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;"),
    custom = { m, c -> c.type == "Lcom/google/firebase/analytics/FirebaseAnalytics;" && m.name == "logEvent" },
)
internal val facebookLogEventBundleFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;"),
    custom = { m, c -> c.type == FB_LOGGER && m.name == "logEvent" },
)
internal val facebookLogEventFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    custom = { m, c -> c.type == FB_LOGGER && m.name == "logEvent" },
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
internal val facebookFullyInitializeFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(),
    custom = { m, c -> c.type == FB_SDK && m.name == "fullyInitialize" },
)
internal val appsflyerStartFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    custom = { m, c -> c.superclass == APPSFLYER_LIB && m.name == "start" },
)
internal val appsflyerStartListenerFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/appsflyer/attribution/AppsFlyerRequestListener;",
    ),
    custom = { m, c -> c.superclass == APPSFLYER_LIB && m.name == "start" },
)
internal val appsflyerLogEventFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/util/Map;"),
    custom = { m, c -> c.superclass == APPSFLYER_LIB && m.name == "logEvent" },
)

/**
 * Hidden dependency: disables Firebase (Analytics/Crashlytics/Performance) + GA auto-collection and
 * flips the Facebook SDK flags off via manifest meta-data (upsert: flip if present, else add).
 */
private val disableAutoCollectionResourcePatch = resourcePatch(
    description = "Disables Firebase/Crashlytics/Performance/GA auto-collection and Facebook flags via manifest.",
) {
    compatibleWith(COMPATIBILITY_SIMOSA)

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
            ).forEach { (name, value) -> setFlag(name, value) }
        }
    }
}

@Suppress("unused")
val removeAdsAndTrackingPatch = bytecodePatch(
    name = "Remove ads & tracking",
    description = "Removes every ad (interstitial, banner, daily-reward) and every tracker " +
        "(Mixpanel, Firebase, Facebook, AppsFlyer) — app events, network sends, ad-SDK requests " +
        "(Google Ads / AppLovin / AnyMind / Prebid), SDK auto-collection, and the ipify IP leak. " +
        "The app then phones home only to its own Jazz API.",
) {
    compatibleWith(COMPATIBILITY_SIMOSA)
    dependsOn(disableAutoCollectionResourcePatch)

    execute {
        val returnFalse = """
            const/4 v0, 0x0
            return v0
        """.trimIndent()
        val returnNull = """
            const/4 v0, 0x0
            return-object v0
        """.trimIndent()

        // Each stub is best-effort so a method absent in some build doesn't fail the whole patch.
        fun stub(fingerprint: Fingerprint, code: String) {
            try {
                fingerprint.method.addInstructions(0, code)
            } catch (_: Exception) {
                // fingerprint didn't resolve — skip
            }
        }

        // return-void: tracker send/init + ad-network load/init
        listOf(
            mixpanelTrackJsonFingerprint,
            mixpanelTrackMapFingerprint,
            mixpanelEventsMessageFingerprint,
            mixpanelPeopleMessageFingerprint,
            mixpanelPostToServerFingerprint,
            firebaseLogEventFingerprint,
            facebookLogEventBundleFingerprint,
            facebookLogEventFingerprint,
            facebookFullyInitializeFingerprint,
            appsflyerStartFingerprint,
            appsflyerStartListenerFingerprint,
            appsflyerLogEventFingerprint,
            mobileAdsInitFingerprint,
            mobileAdsInitListenerFingerprint,
            interstitialLoadFingerprint,
            baseAdViewLoadFingerprint,
            adManagerAdViewLoadFingerprint,
            prebidInit4Fingerprint,
            prebidInit3Fingerprint,
            prebidSdkInitializerFingerprint,
        ).forEach { stub(it, "return-void") }

        // return false: ad-config gate + Facebook auto-collection getters
        listOf(
            enableAdConfigFingerprint,
            facebookAutoLogGetterFingerprint,
            facebookAdIdGetterFingerprint,
        ).forEach { stub(it, returnFalse) }

        // return null: interstitial holders (show sites null-check these)
        listOf(
            interstitialHolderAFingerprint,
            interstitialHolderBFingerprint,
        ).forEach { stub(it, returnNull) }

        // daily-reward banner factory: return a bare AdManagerAdView (no size/ad-unit/load) -> renders nothing.
        // p4 = Context; moved to a low register first because invoke-direct can't encode a high param register.
        stub(
            dailyRewardBannerFactoryFingerprint,
            """
                move-object/from16 v0, p4
                new-instance v1, $AD_MANAGER_AD_VIEW
                invoke-direct { v1, v0 }, $AD_MANAGER_AD_VIEW-><init>(Landroid/content/Context;)V
                return-object v1
            """.trimIndent(),
        )

        // ipify coroutine: complete immediately with "" (no network request).
        stub(
            ipifyFetchFingerprint,
            """
                const-string v0, ""
                return-object v0
            """.trimIndent(),
        )
    }
}
