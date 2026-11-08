package app.polishapps.patches.orange.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.polishapps.patches.shared.Constants.COMPATIBILITY_MOJ_ORANGE
import app.polishapps.patches.shared.prependReturn
import org.w3c.dom.Element

private const val EXTENSION_CLASS = "Lapp/polishapps/extension/orange/TelemetryPatch;"

private val manifestFlags = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_ssaid_collection_enabled" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_sessions_enabled" to "false",
)

private val firebaseManifestPatch = resourcePatch(
    description = "Turns off Firebase Analytics, Crashlytics and Sessions in the manifest.",
) {
    compatibleWith(COMPATIBILITY_MOJ_ORANGE)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("AndroidManifest.xml has no <application>")

            val metaData = application.getElementsByTagName("meta-data")
            manifestFlags.forEach { (name, value) ->
                val existing = (0 until metaData.length)
                    .map { metaData.item(it) as Element }
                    .firstOrNull { it.getAttribute("android:name") == name }
                val element = existing ?: manifest.createElement("meta-data").also { created ->
                    created.setAttribute("android:name", name)
                    application.appendChild(created)
                }
                element.setAttribute("android:value", value)
            }
        }
    }
}

private fun BytecodePatchContext.method(
    classType: String,
    name: String,
    vararg parameters: String,
): MutableMethod = mutableClassDefBy(classType).methods.singleOrNull { method ->
    method.name == name && method.parameterTypes.map { it.toString() } == parameters.toList()
} ?: throw PatchException("$classType->$name(${parameters.joinToString("")}) not found")

@Suppress("unused")
val blockTelemetryPatch = bytecodePatch(
    name = "Block telemetry",
    description = "Blocks Firebase Analytics and Crashlytics, Quantum Metric session replay, AppsFlyer, " +
        "Synerise event tracking and sponsored offer reporting.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOJ_ORANGE)

    dependsOn(firebaseManifestPatch)

    extendWith("extensions/extension.mpe")

    execute {
        val analytics = "Lcom/google/firebase/analytics/FirebaseAnalytics;"
        listOf(
            arrayOf("logEvent", "Ljava/lang/String;", "Landroid/os/Bundle;"),
            arrayOf("setUserId", "Ljava/lang/String;"),
            arrayOf("setUserProperty", "Ljava/lang/String;", "Ljava/lang/String;"),
            arrayOf("setDefaultEventParameters", "Landroid/os/Bundle;"),
        ).forEach { signature ->
            method(analytics, signature[0], *signature.copyOfRange(1, signature.size)).prependReturn("return-void")
        }
        method(analytics, "setAnalyticsCollectionEnabled", "Z").addInstructions(0, "const/4 p1, 0x0")

        val crashlytics = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"
        listOf(
            arrayOf("log", "Ljava/lang/String;"),
            arrayOf("recordException", "Ljava/lang/Throwable;"),
            arrayOf("recordException", "Ljava/lang/Throwable;", "Lcom/google/firebase/crashlytics/CustomKeysAndValues;"),
            arrayOf("setCustomKey", "Ljava/lang/String;", "D"),
            arrayOf("setCustomKey", "Ljava/lang/String;", "F"),
            arrayOf("setCustomKey", "Ljava/lang/String;", "I"),
            arrayOf("setCustomKey", "Ljava/lang/String;", "J"),
            arrayOf("setCustomKey", "Ljava/lang/String;", "Ljava/lang/String;"),
            arrayOf("setCustomKey", "Ljava/lang/String;", "Z"),
            arrayOf("setCustomKeys", "Lcom/google/firebase/crashlytics/CustomKeysAndValues;"),
            arrayOf("setUserId", "Ljava/lang/String;"),
            arrayOf("sendUnsentReports"),
        ).forEach { signature ->
            method(crashlytics, signature[0], *signature.copyOfRange(1, signature.size)).prependReturn("return-void")
        }
        method(crashlytics, "setCrashlyticsCollectionEnabled", "Z").addInstructions(0, "const/4 p1, 0x0")
        method(crashlytics, "setCrashlyticsCollectionEnabled", "Ljava/lang/Boolean;").addInstructions(
            0,
            "sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;",
        )

        method("Lcom/quantummetric/instrument/QuantumMetric\$Builder;", "start").prependReturn("return-void")

        val appsFlyer = classDefBy { it.superclass == "Lcom/appsflyer/AppsFlyerLib;" }.type
        listOf(
            arrayOf("start", "Landroid/content/Context;"),
            arrayOf("start", "Landroid/content/Context;", "Ljava/lang/String;"),
            arrayOf(
                "start",
                "Landroid/content/Context;",
                "Ljava/lang/String;",
                "Lcom/appsflyer/attribution/AppsFlyerRequestListener;",
            ),
            arrayOf("logEvent", "Landroid/content/Context;", "Ljava/lang/String;", "Ljava/util/Map;"),
            arrayOf(
                "logEvent",
                "Landroid/content/Context;",
                "Ljava/lang/String;",
                "Ljava/util/Map;",
                "Lcom/appsflyer/attribution/AppsFlyerRequestListener;",
            ),
            arrayOf("logSession", "Landroid/content/Context;"),
            arrayOf("logLocation", "Landroid/content/Context;", "D", "D"),
            arrayOf("logAdRevenue", "Lcom/appsflyer/AFAdRevenueData;", "Ljava/util/Map;"),
            arrayOf("sendPushNotificationData", "Landroid/app/Activity;"),
        ).forEach { signature ->
            method(appsFlyer, signature[0], *signature.copyOfRange(1, signature.size)).prependReturn("return-void")
        }

        val tracker = "Lcom/synerise/sdk/event/Tracker;"
        method(tracker, "send", "Lcom/synerise/sdk/event/Event;").prependReturn("return-void")
        method(tracker, "flush").prependReturn("return-void")

        method("Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;", "getBoolean", "Ljava/lang/String;")
            .prependReturn(
                """
                    iget-object v0, p0, Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;->getHandler:Lcom/google/firebase/remoteconfig/internal/ConfigGetParameterHandler;
                    invoke-virtual {v0, p1}, Lcom/google/firebase/remoteconfig/internal/ConfigGetParameterHandler;->getBoolean(Ljava/lang/String;)Z
                    move-result v0
                    invoke-static {p1, v0}, $EXTENSION_CLASS->overrideBoolean(Ljava/lang/String;Z)Z
                    move-result p1
                    return p1
                """,
            )
    }
}
