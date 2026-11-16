package app.morphe.patches.moovit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.ANDROID_XML_NAMESPACE
import app.morphe.patches.shared.Constants
import app.morphe.patches.shared.childrenNamed
import app.morphe.patches.shared.disableComponentsByName
import app.morphe.patches.shared.removeChildren
import app.morphe.patches.shared.replaceWithReturnBoolean
import app.morphe.patches.shared.replaceWithReturnVoid
import app.morphe.patches.shared.setApplicationMetaData
import app.morphe.patches.shared.stripPermissionsWhere
import org.w3c.dom.Element

private val moovitTelemetryResourcePatch = resourcePatch(
    name = "Moovit Telemetry Manifest Purge",
    description = "Strips advertising and tracking permissions, disables analytics services, providers, and receivers, and injects opt-out metadata in AndroidManifest.xml.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY_MOOVIT)

    execute {
        val manifestFile = get("AndroidManifest.xml")
        if (!manifestFile.exists()) {
            println("[Block Telemetry & Trackers] Skipped: AndroidManifest.xml not found.")
            return@execute
        }

        val blockedPermissions = setOf(
            "com.google.android.gms.permission.AD_ID",
            "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
            "android.permission.ACCESS_ADSERVICES_AD_ID",
            "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
            "android.permission.ACCESS_ADSERVICES_TOPICS",
            "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
        )

        val blockedComponents = setOf(
            // Activities
            "com.google.android.gms.ads.AdActivity",
            "com.google.android.libraries.ads.mobile.sdk.common.AdActivity",
            "com.facebook.ads.AudienceNetworkActivity",
            "com.vungle.ads.internal.ui.VungleActivity",
            "com.fyber.inneractive.sdk.activities.InneractiveInternalBrowserActivity",
            "com.fyber.inneractive.sdk.activities.InneractiveFullscreenAdActivity",
            "com.fyber.inneractive.sdk.activities.InneractiveRichMediaVideoPlayerActivityCore",
            "com.fyber.inneractive.sdk.activities.InternalStoreWebpageActivity",
            "com.fyber.inneractive.sdk.activities.FyberReportAdActivity",
            "com.moovit.ads.interstitial.html.HtmlInterstitialActivity",
            "com.moovit.app.ads.targerting.proximity.ProximityTagProxyActivity",
            "com.moovit.app.ads.reward.adfree.AdFreeRewardOfferActivity",
            "com.usebutton.sdk.internal.InstallCardActivity",
            "com.usebutton.sdk.internal.WebViewActivity",
            "com.usebutton.sdk.internal.widget.FullScreenWidgetActivity",
            "com.usebutton.sdk.internal.InstallSheetActivity",

            // Providers
            "com.facebook.FacebookContentProvider",
            "com.fairtiq.sdk.internal.telemetry.processTime.StartupTimeProvider",
            "com.facebook.ads.AudienceNetworkContentProvider",
            "com.facebook.internal.FacebookInitProvider",
            "com.vungle.ads.VungleProvider",

            // Services
            "com.fairtiq.sdk.internal.services.tracking.TrackingServiceImpl",
            "com.google.android.gms.measurement.AppMeasurementService",
            "com.google.android.gms.measurement.AppMeasurementJobService",
            "com.google.firebase.sessions.SessionLifecycleService",
            "com.google.android.datatransport.runtime.backends.TransportBackendDiscovery",
            "com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService",

            // Receivers
            "com.usebutton.sdk.internal.receivers.LocaleChangedReceiver",
            "com.usebutton.sdk.internal.receivers.InstallNotificationReceiver",
            "com.google.android.gms.measurement.AppMeasurementReceiver",
            "com.facebook.CurrentAccessTokenExpirationBroadcastReceiver",
            "com.facebook.AuthenticationTokenManager\$CurrentAuthenticationTokenChangedBroadcastReceiver",
            "com.braze.BrazeFlushPushDeliveryReceiver",
            "com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver",
            "com.moovit.app.ads.MobileAdsFenceReceiver",
        )

        val optOutMetadata = listOf(
            "firebase_analytics_collection_enabled" to "false",
            "firebase_analytics_collection_deactivated" to "true",
            "firebase_crashlytics_collection_enabled" to "false",
            "firebase_performance_collection_enabled" to "false",
            "firebase_performance_collection_deactivated" to "true",
            "firebase_sessions_enabled" to "false",
            "google_analytics_adid_collection_enabled" to "false",
            "google_analytics_default_allow_ad_personalization_signals" to "false",
        )

        var removedPermissions = 0
        var disabledComponents = 0
        var removedInitializers = 0
        var removedAppKeys = 0
        var injectedMetadata = 0

        document(manifestFile.absolutePath).use { doc ->
            val root = doc.documentElement
            val application = root.getElementsByTagName("application").item(0) as? Element

            // 1. Remove advertising and tracking permissions
            removedPermissions = root.stripPermissionsWhere { it in blockedPermissions }.size

            if (application != null) {
                // 2. Disable verified tracking components
                disabledComponents = application.disableComponentsByName(*blockedComponents.toTypedArray())

                // 3. Remove ButtonSDK startup initializer
                application.childrenNamed("provider")
                    .filter {
                        val name = it.getAttribute("android:name").ifBlank { it.getAttributeNS(ANDROID_XML_NAMESPACE, "name") }
                        name == "androidx.startup.InitializationProvider"
                    }
                    .forEach { provider ->
                        val toRemove = provider.childrenNamed("meta-data").filter {
                            val name = it.getAttribute("android:name").ifBlank { it.getAttributeNS(ANDROID_XML_NAMESPACE, "name") }
                            name.contains("ButtonSdkInitializer", ignoreCase = true)
                        }
                        provider.removeChildren(toRemove)
                        removedInitializers += toRemove.size
                    }

                // 4. Remove AppsFlyer AppKey
                val appsFlyerKeysToRemove = application.childrenNamed("meta-data").filter {
                    val name = it.getAttribute("android:name").ifBlank { it.getAttributeNS(ANDROID_XML_NAMESPACE, "name") }
                    name == "com.appsflyer.AppKey"
                }
                application.removeChildren(appsFlyerKeysToRemove)
                removedAppKeys += appsFlyerKeysToRemove.size

                // 5. Inject declarative SDK opt-out metadata flags
                optOutMetadata.forEach { (name, value) ->
                    application.setApplicationMetaData(name, value)
                    injectedMetadata++
                }
            }
        }

        println(
            "[Block Telemetry & Trackers] Stripped $removedPermissions permissions, " +
                "disabled $disabledComponents tracking components, " +
                "removed 0 discovery registrars (DI graph coupled; suppression via flags + disabled services), " +
                "removed $removedInitializers startup initializers, " +
                "removed $removedAppKeys hardcoded app keys, " +
                "and injected $injectedMetadata opt-out flags in AndroidManifest.xml."
        )
    }
}

@Suppress("unused")
val moovitBlockTelemetryPatch = bytecodePatch(
    name = "Block Telemetry & Trackers",
    description = "Neutralizes AppsFlyer, Braze, and Inneractive DEX dispatchers, disables analytics services/providers, and strips advertising permissions.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_MOOVIT)
    dependsOn(moovitTelemetryResourcePatch)

    execute {
        val hookedMethods = mutableListOf<String>()

        Fingerprint(
            definingClass = "Lcom/appsflyer/internal/AFa1tSDK;",
            name = "start",
            parameters = listOf("Landroid/content/Context;"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("AFa1tSDK.start(1)")
        }

        Fingerprint(
            definingClass = "Lcom/appsflyer/internal/AFa1tSDK;",
            name = "start",
            parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("AFa1tSDK.start(2)")
        }

        Fingerprint(
            definingClass = "Lcom/appsflyer/internal/AFa1tSDK;",
            name = "start",
            parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Lcom/appsflyer/attribution/AppsFlyerRequestListener;"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("AFa1tSDK.start(3)")
        }

        Fingerprint(
            definingClass = "Lcom/appsflyer/internal/AFa1tSDK;",
            name = "logEvent",
            parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/util/Map;"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("AFa1tSDK.logEvent(1)")
        }

        Fingerprint(
            definingClass = "Lcom/appsflyer/internal/AFa1tSDK;",
            name = "logEvent",
            parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/util/Map;", "Lcom/appsflyer/attribution/AppsFlyerRequestListener;"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("AFa1tSDK.logEvent(2)")
        }

        Fingerprint(
            definingClass = "Lcom/braze/Braze;",
            name = "requestImmediateDataFlush",
            parameters = emptyList(),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("Braze.requestImmediateDataFlush")
        }

        Fingerprint(
            definingClass = "Lcom/braze/Braze;",
            name = "openSession",
            parameters = listOf("Landroid/app/Activity;"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("Braze.openSession")
        }

        Fingerprint(
            definingClass = "Lcom/braze/Braze;",
            name = "logCustomEvent",
            parameters = listOf("Ljava/lang/String;", "Lcom/braze/models/outgoing/BrazeProperties;"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("Braze.logCustomEvent")
        }

        Fingerprint(
            definingClass = "Lcom/fyber/inneractive/sdk/external/InneractiveAdManager;",
            name = "initialize",
            parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("InneractiveAdManager.initialize")
        }

        Fingerprint(
            definingClass = "Lcom/fyber/inneractive/sdk/external/InneractiveAdManager;",
            name = "wasInitialized",
            parameters = emptyList(),
            returnType = "Z",
        ).method.apply {
            replaceWithReturnBoolean(false)
            hookedMethods.add("InneractiveAdManager.wasInitialized")
        }

        println("[Block Telemetry & Trackers] Neutralized ${hookedMethods.size} telemetry dispatch methods: ${hookedMethods.joinToString(", ")}.")
    }
}
