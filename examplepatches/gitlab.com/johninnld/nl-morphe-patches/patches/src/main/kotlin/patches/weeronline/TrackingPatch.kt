package patches.weeronline

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"
private const val UNIT = "Lkotlin/Unit;->a:Lkotlin/Unit;"

private val trackingResources = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element
            fun elements(tag: String): List<Element> {
                val nodes = application.getElementsByTagName(tag)
                return (0 until nodes.length).map { nodes.item(it) as Element }
            }
            fun flag(name: String, value: Boolean) {
                val matches = elements("meta-data").filter { it.getAttribute("android:name") == name }
                check(matches.size <= 1) { "Duplicate manifest flag: $name" }
                val element = matches.singleOrNull() ?: doc.createElement("meta-data").also {
                    it.setAttributeNS(ANDROID, "android:name", name)
                    application.appendChild(it)
                }
                element.setAttributeNS(ANDROID, "android:value", value.toString())
            }

            // Hard deactivation takes precedence over consent-driven runtime enablement.
            flag("firebase_analytics_collection_deactivated", true)
            flag("firebase_performance_collection_deactivated", true)
            listOf(
                "firebase_analytics_collection_enabled", "google_analytics_automatic_screen_reporting_enabled",
                "google_analytics_adid_collection_enabled", "google_analytics_sgtm_upload_enabled",
                "google_analytics_default_allow_analytics_storage", "google_analytics_default_allow_ad_storage",
                "google_analytics_default_allow_ad_user_data", "google_analytics_default_allow_ad_personalization_signals",
                "firebase_crashlytics_collection_enabled", "firebase_sessions_enabled",
                "firebase_performance_collection_enabled", "firebase_performance_logcat_enabled",
                "firebase_inappmessaging_auto_data_collection_enabled", "delivery_metrics_exported_to_big_query_enabled",
                "com.facebook.sdk.AutoInitEnabled", "com.facebook.sdk.AutoLogAppEventsEnabled",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled",
            ).forEach { flag(it, false) }

            // Crashlytics, Sessions and Performance registrars stay: Crashlytics is reached from
            // App code, Sessions is its dependency and Performance wraps HTTP connections.
            // Their flags above disable collection and upload.
            val registrars = elements("meta-data").filter { element ->
                val name = element.getAttribute("android:name")
                name == "com.google.firebase.components:com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar" ||
                    name.startsWith("com.google.firebase.components:com.google.firebase.inappmessaging.")
            }
            check(registrars.size == 5) { "Expected analytics connector and four in-app messaging registrars, found ${registrars.size}" }
            registrars.forEach { it.parentNode.removeChild(it) }

            listOf(
                "provider" to "com.google.android.gms.ads.MobileAdsInitProvider",
                "provider" to "infoplaza.network.ads.ppid.PPIDContentProvider",
                "provider" to "com.facebook.internal.FacebookInitProvider",
                "provider" to "com.facebook.ads.AudienceNetworkContentProvider",
                "service" to "com.google.android.gms.ads.AdService",
                "receiver" to "com.google.android.gms.measurement.AppMeasurementReceiver",
                "service" to "com.google.android.gms.measurement.AppMeasurementService",
                "service" to "com.google.android.gms.measurement.AppMeasurementJobService",
                "service" to "com.google.android.gms.tagmanager.TagManagerService",
                "activity" to "com.google.android.gms.tagmanager.TagManagerPreviewActivity",
                "activity" to "com.google.firebase.analytics.GoogleAnalyticsServerPreviewActivity",
            ).forEach { (tag, name) ->
                elements(tag).single { it.getAttribute("android:name") == name }
                    .setAttributeNS(ANDROID, "android:enabled", "false")
            }
            // Amazon Privacy Pass is only used for PubMatic's OM SDK attestation.
            elements("uses-library").filter { it.getAttribute("android:name") == "com.amazon.privacypass" }
                .forEach { it.parentNode.removeChild(it) }

            val permissions = doc.getElementsByTagName("uses-permission")
            val removed = (0 until permissions.length).map { permissions.item(it) as Element }.filter {
                val name = it.getAttribute("android:name")
                name == "com.google.android.gms.permission.AD_ID" ||
                    name == "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE" ||
                    name == "com.amazon.privacypass.ATTEST" ||
                    name == "android.permission.AD_SERVICES_CONFIG" ||
                    name.startsWith("android.permission.ACCESS_ADSERVICES_") ||
                    name.startsWith("infoplaza.network.ads.ppid.")
            }
            check(removed.size == 14) { "Expected fourteen advertising/attribution/PPID permissions, found ${removed.size}" }
            removed.forEach { it.parentNode.removeChild(it) }
        }
        // Tag Manager container with Universal Analytics tags, the Audience Network payload
        // loaded at startup, and the unreferenced LiveRamp fallback configuration.
        val removedAssets = listOf(
            "assets/containers/GTM-N696CS.json",
            "assets/audience_network/classes.dex",
            "assets/audience_network/classes2.dex",
            "assets/gdpr-liveramp-fallback.json",
        )
        val entries = listApkEntries("assets/")
        check(removedAssets.all { it in entries }) { "Expected tracking/ad assets are missing" }
        removedAssets.forEach { delete(it) }
    }
}

@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Disables Firebase Analytics, Crashlytics, Performance, Sessions and In-App Messaging, the " +
        "Facebook SDK and app events, Audience Network, the cross-app PPID, advertising IDs, Blue Billywig video " +
        "statistics, Tag Manager, Didomi metrics and optional RevenueCat telemetry, while retaining weather, " +
        "consent and subscription services.",
) {
    compatibleWith(weeronline)
    dependsOn(trackingResources)
    execute {
        fun stop(fingerprint: Fingerprint) = fingerprint.method.addInstructions(0, "return-void")
        fun method(definingClass: String, name: String, parameters: List<String>, returnType: String = "V") =
            Fingerprint(definingClass = definingClass, name = name, returnType = returnType, parameters = parameters)

        // Shared Infoplaza analytics manager: every app and KMP event and user property
        // goes through this Firebase Analytics implementation.
        val analytics = { _: com.android.tools.smali.dexlib2.iface.Method, classDef: com.android.tools.smali.dexlib2.iface.ClassDef ->
            "Linfoplaza/network/analytics/AnalyticsManager;" in classDef.interfaces
        }
        stop(Fingerprint(returnType = "V", parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"), custom = analytics))
        stop(Fingerprint(returnType = "V", parameters = listOf("Lkotlin/jvm/functions/Function1;", "Ljava/lang/String;"),
            custom = analytics))

        // Crashlytics: App.onCreate re-enables collection at runtime through the arbiter, which
        // is overridden below, and a Timber tree forwards logs.
        stop(method("$APP/App\$CrashlyticsTree;", "log",
            listOf("I", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Throwable;")))
        // Also ignore a persisted opt-in, which overrides the manifest flag.
        val arbiter = Fingerprint(strings = listOf("Could not read data collection permission from manifest"))
            .originalClassDef.type
        Fingerprint(definingClass = arbiter, returnType = "Z", parameters = emptyList(),
            custom = { method, _ -> AccessFlags.DECLARED_SYNCHRONIZED.isSet(method.accessFlags) }).method
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // Facebook: the consent listener would enable auto-init, app events and the advertiser ID.
        val facebook = "$APP/facebook/"
        stop(method("${facebook}FacebookConsentController;", "onConsentUpdated",
            listOf("Linfoplaza/network/consent/ConsentData;")))
        method("${facebook}FacebookTrackingConsentEvaluator;", "isTrackingEnabled",
            listOf("$APP/consent/TrackingConsentData;"), "Z").method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        method("${facebook}FacebookPurchaseLogger;", "logPurchase",
            listOf("$APP/paywall/model/PurchaseEventData;", "Lkotlin/coroutines/Continuation;"), "Ljava/lang/Object;")
            .method.addInstructions(0, "sget-object v0, $UNIT\nreturn-object v0")
        // Dagger still constructs the logger with the SDK provider disabled; keep an inert,
        // non-null instance instead of the SDK's initialization check.
        method("Lcom/facebook/appevents/AppEventsLogger;", "<init>", listOf("Landroid/content/Context;")).method
            .addInstructions(0, "invoke-direct {p0}, Ljava/lang/Object;-><init>()V\nreturn-void")

        // Didomi performance and usage metrics; consent API events stay as in Buienalarm.
        method("Lio/didomi/sdk/e9;", "a", listOf("Ljava/lang/String;", "Ljava/lang/String;"), "Z").method
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // FCM delivery metrics export; a persisted preference overrides the manifest flag.
        Fingerprint(returnType = "Z", parameters = emptyList(),
            strings = listOf("export_to_big_query", "delivery_metrics_exported_to_big_query_enabled")).method
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // Infoplaza PPID shared with the sister apps; consumers accept an empty ID.
        Fingerprint(returnType = "Ljava/lang/String;", parameters = emptyList(),
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL), strings = listOf("infoplaza.network.ads.ppid"),
            custom = { _, classDef -> "Linfoplaza/network/ads/ppid/PPIDGenerator;" in classDef.interfaces }).method
            .addInstructions(0, "const-string v0, \"\"\nreturn-object v0")

        // Advertising ID for every SDK: the value Android reports after an opt-out.
        method("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;", "getAdvertisingIdInfo",
            listOf("Landroid/content/Context;"), "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;")
            .method.addInstructions(0, """
                new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
                const-string v1, "00000000-0000-0000-0000-000000000000"
                const/4 v2, 0x1
                invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;-><init>(Ljava/lang/String;Z)V
                return-object v0
            """.trimIndent())

        // Blue Billywig session, view and ad-schedule beacons share this single sender.
        stop(Fingerprint(returnType = "V", parameters = listOf("Ljava/util/Map;"),
            strings = listOf("%7E%7E00%7E%7E", "~~00~~")))

        // Optional RevenueCat telemetry, separate from purchases and entitlements: diagnostics
        // (local or remote setting) and the Firebase instance ID subscriber attribute.
        Fingerprint(returnType = "V", parameters = listOf("Ljava/lang/Boolean;"),
            strings = listOf(" (remote setting: ", ", SDK configuration: ")).method
            .addInstructions(0, "sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;")
        stop(Fingerprint(returnType = "V", parameters = listOf("Ljava/lang/String;"),
            custom = { _, classDef -> "Linfoplaza/network/billing/IAPClient;" in classDef.interfaces }))
    }
}
