package app.polishapps.patches.lidl.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.polishapps.patches.inpost.shared.findClasses
import app.polishapps.patches.inpost.shared.methodsOf
import app.polishapps.patches.inpost.shared.parameterTypeNames
import app.polishapps.patches.inpost.shared.singleMethod
import app.polishapps.patches.inpost.shared.strings
import app.polishapps.patches.shared.Constants.COMPATIBILITY_LIDL_PLUS
import app.polishapps.patches.shared.prependReturn
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element

private val manifestFlags = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_ssaid_collection_enabled" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
    "firebase_sessions_enabled" to "false",
)

private const val CCT_BACKEND = "backend:com.google.android.datatransport.cct.CctBackendFactory"

private val manifestPatch = resourcePatch(
    description = "Turns off Firebase Analytics, Crashlytics, Performance and Sessions and unregisters the datatransport upload backend.",
) {
    compatibleWith(COMPATIBILITY_LIDL_PLUS)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("AndroidManifest.xml has no <application>")

            val metaData = manifest.getElementsByTagName("meta-data")
            val all = (0 until metaData.length).map { metaData.item(it) as Element }

            manifestFlags.forEach { (name, value) ->
                val element = all.firstOrNull { it.getAttribute("android:name") == name }
                    ?: manifest.createElement("meta-data").also { created ->
                        created.setAttribute("android:name", name)
                        application.appendChild(created)
                    }
                element.setAttribute("android:value", value)
            }

            val backend = all.firstOrNull { it.getAttribute("android:name") == CCT_BACKEND }
                ?: throw PatchException("$CCT_BACKEND not found in AndroidManifest.xml")
            backend.parentNode.removeChild(backend)
        }
    }
}

private fun BytecodePatchContext.method(classType: String, name: String, vararg parameters: String): MutableMethod =
    methodsOf(classDefBy(classType)) { method ->
        method.name == name && method.parameterTypeNames() == parameters.toList()
    }.singleOrNull() ?: throw PatchException("$classType->$name(${parameters.joinToString("")}) not found")

/** Strings of the app's own event funnel, which feeds every `tap_item` / `view_item` style event to Firebase. */
private val EVENT_FUNNEL_STRINGS = setOf("Timestamp", "CountryID", "deviceID", "clientID", "StoreID", "trackingConsent")

private const val LEAFLET_ACTIVITY_MODEL =
    "Les/lidlplus/feature/digitalleaflet/data/api/model/DigitalLeafletRequestPostUserActivityModel;"

private const val ADJUST = "Lcom/adjust/sdk/Adjust;"
private const val MARKETING_CLOUD_BUILDER = "Lcom/salesforce/marketingcloud/MarketingCloudConfig\$Builder;"

@Suppress("unused")
val blockTelemetryPatch = bytecodePatch(
    name = "Block telemetry",
    description = "Blocks Firebase Analytics, Crashlytics and Performance, AppsFlyer, Adjust, Marketing Cloud analytics, " +
        "the app's own event tracker (including the one used by the React Native screens) and the digital leaflet " +
        "activity reports.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LIDL_PLUS)

    dependsOn(manifestPatch)

    execute {
        // The native event funnel: builds the common event fields (device, client, store, consent)
        // and hands the event to Firebase Analytics.
        singleMethod("app event tracker") { _, method ->
            method.returnType == "V" && method.strings().toSet().containsAll(EVENT_FUNNEL_STRINGS)
        }.prependReturn("return-void")

        // Events emitted by the React Native screens arrive here and are replayed into the same pipeline.
        listOf(
            "Laxion/core/nitro/HybridAxionEventTrackerModuleDependenciesImpl;" to
                arrayOf("track", "Laxion/js/core/HybridAxionEventTrackerEvent;"),
            "Laxion/core/nitro/HybridAxionLegacyEventTrackerModuleDependenciesImpl;" to
                arrayOf("legacyTrackEvent", "Ljava/lang/String;", "Ljava/util/Map;"),
        ).forEach { (type, signature) ->
            method(type, signature[0], *signature.copyOfRange(1, signature.size)).prependReturn("return-void")
        }

        // Digital leaflet "user activity" reports (what was viewed, tapped, for how long).
        val activityMapper = singleMethod("leaflet activity mapper") { _, method ->
            AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == LEAFLET_ACTIVITY_MODEL &&
                method.parameterTypes.size == 1
        }
        val activityEvent = activityMapper.parameterTypes.single().toString()
        methodsOf(classDefBy(activityMapper.definingClass)) { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "V" &&
                method.parameterTypeNames() == listOf(activityEvent)
        }.singleOrNull()?.prependReturn("return-void")
            ?: throw PatchException("Leaflet activity sender taking $activityEvent not found")

        val appsFlyer = findClasses { it.superclass == "Lcom/appsflyer/AppsFlyerLib;" }.singleOrNull()?.type
            ?: throw PatchException("AppsFlyerLib implementation not found")
        listOf(
            arrayOf("start"),
            arrayOf("start", "Lcom/appsflyer/share/attribution/AppsFlyerRequestListener;"),
            arrayOf("logEvent", "Landroid/content/Context;", "Ljava/lang/String;", "Ljava/util/Map;"),
            arrayOf(
                "logEvent",
                "Landroid/content/Context;",
                "Ljava/lang/String;",
                "Ljava/util/Map;",
                "Lcom/appsflyer/share/attribution/AppsFlyerRequestListener;",
            ),
            arrayOf("logSession", "Landroid/content/Context;"),
            arrayOf("logLocation", "Landroid/content/Context;", "D", "D"),
            arrayOf("logAdRevenue", "Lcom/appsflyer/share/AFAdRevenueData;", "Ljava/util/Map;"),
            arrayOf("collectDataFromLauncherActivity", "Landroid/app/Activity;"),
            arrayOf("sendPushNotificationData", "Landroid/app/Activity;"),
            arrayOf("sendPushNotificationData", "Lcom/appsflyer/share/AFPushData;"),
            arrayOf("updateServerUninstallToken", "Landroid/content/Context;", "Ljava/lang/String;"),
        ).forEach { signature ->
            method(appsFlyer, signature[0], *signature.copyOfRange(1, signature.size)).prependReturn("return-void")
        }

        // Adjust: nothing is initialised, so no install, session or event is reported. The two calls the app
        // waits on are answered directly so a coroutine does not hang on a callback that never comes.
        method(ADJUST, "initSdk", "Lcom/adjust/sdk/AdjustConfig;").prependReturn("return-void")
        method(ADJUST, "trackEvent", "Lcom/adjust/sdk/AdjustEvent;").prependReturn("return-void")
        method(ADJUST, "trackAdRevenue", "Lcom/adjust/sdk/AdjustAdRevenue;").prependReturn("return-void")
        method(ADJUST, "trackThirdPartySharing", "Lcom/adjust/sdk/AdjustThirdPartySharing;").prependReturn("return-void")
        method(ADJUST, "trackMeasurementConsent", "Z").prependReturn("return-void")
        method(ADJUST, "trackPlayStoreSubscription", "Lcom/adjust/sdk/AdjustPlayStoreSubscription;")
            .prependReturn("return-void")
        method(ADJUST, "setPushToken", "Ljava/lang/String;", "Landroid/content/Context;").prependReturn("return-void")
        method(ADJUST, "setReferrer", "Ljava/lang/String;", "Landroid/content/Context;").prependReturn("return-void")
        method(ADJUST, "onResume").prependReturn("return-void")
        method(ADJUST, "onPause").prependReturn("return-void")
        method(ADJUST, "isEnabled", "Landroid/content/Context;", "Lcom/adjust/sdk/OnIsEnabledListener;").prependReturn(
            """
                const/4 p0, 0x0
                invoke-interface {p1, p0}, Lcom/adjust/sdk/OnIsEnabledListener;->onIsEnabledRead(Z)V
                return-void
            """,
        )
        method(
            ADJUST,
            "processAndResolveDeeplink",
            "Lcom/adjust/sdk/AdjustDeeplink;",
            "Landroid/content/Context;",
            "Lcom/adjust/sdk/OnDeeplinkResolvedListener;",
        ).prependReturn(
            """
                invoke-virtual {p0}, Lcom/adjust/sdk/AdjustDeeplink;->getUrl()Landroid/net/Uri;
                move-result-object p0
                invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;
                move-result-object p0
                invoke-interface {p2, p0}, Lcom/adjust/sdk/OnDeeplinkResolvedListener;->onDeeplinkResolved(Ljava/lang/String;)V
                return-void
            """,
        )

        // Marketing Cloud stays for push delivery, but its analytics are switched off at the config builder
        // by forcing the flag that the app passes in to false.
        listOf("setAnalyticsEnabled", "setPiAnalyticsEnabled").forEach { setter ->
            method(MARKETING_CLOUD_BUILDER, setter, "Z").addInstructions(0, "const/4 p1, 0x0")
        }
    }
}
