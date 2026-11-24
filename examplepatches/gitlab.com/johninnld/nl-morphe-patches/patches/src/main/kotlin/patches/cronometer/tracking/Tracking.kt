package patches.cronometer.tracking

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import patches.cronometer.cronometer
import patches.cronometer.originalInput
import patches.shared.uniqueMatch

private object AdjustInit : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "initSdk",
    returnType = "V",
    parameters = listOf("Lcom/adjust/sdk/AdjustConfig;"),
)

private object AdjustTrackEvent : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Lcom/adjust/sdk/AdjustEvent;"),
)

private object AmplitudePlugin : Fingerprint(
    definingClass = "Lc8/b;",
    name = "onMethodCall",
    returnType = "V",
    parameters = listOf("Lio/flutter/plugin/common/MethodCall;", "Lio/flutter/plugin/common/MethodChannel\$Result;"),
)

private object BrazeAttach : Fingerprint(
    definingClass = "Lcom/braze/brazeplugin/BrazePlugin;",
    name = "onAttachedToEngine",
    returnType = "V",
    parameters = listOf("Lio/flutter/embedding/engine/plugins/FlutterPlugin\$FlutterPluginBinding;"),
)

private object BrazeIntegration : Fingerprint(
    definingClass = "Lcom/braze/brazeplugin/IntegrationInitializer;",
    name = "initializePlugin\$braze_plugin_release",
    returnType = "V",
    parameters = listOf("Landroid/app/Application;", "Lcom/braze/brazeplugin/FlutterConfiguration;"),
)

private object DatadogInitialize : Fingerprint(
    definingClass = "Lcom/datadoghq/flutter/DatadogSdkPlugin;",
    name = "initialize",
    returnType = "V",
    parameters = listOf("Ljava/util/Map;", "Lye/a;"),
)

private object DatadogRumCall : Fingerprint(
    definingClass = "Lcom/datadoghq/flutter/DatadogRumPlugin;",
    name = "onMethodCall",
    returnType = "V",
    parameters = listOf("Lio/flutter/plugin/common/MethodCall;", "Lio/flutter/plugin/common/MethodChannel\$Result;"),
)

private object FirebaseLogEvent : Fingerprint(
    definingClass = "Lio/flutter/plugins/firebase/analytics/FlutterFirebaseAnalyticsPlugin;",
    name = "logEvent",
    returnType = "V",
    // Parameter types are R8-renamed per release; match on class+name+return.
)



private object FirebaseSetUserId : Fingerprint(
    definingClass = "Lio/flutter/plugins/firebase/analytics/FlutterFirebaseAnalyticsPlugin;",
    name = "setUserId",
    returnType = "V",
)

private object FirebaseSetUserProperty : Fingerprint(
    definingClass = "Lio/flutter/plugins/firebase/analytics/FlutterFirebaseAnalyticsPlugin;",
    name = "setUserProperty",
    returnType = "V",
)

@Suppress("unused")
val disableAdjust = bytecodePatch(
    name = "Disable Adjust tracking",
    description = "Stops Adjust SDK initialisation and event tracking.",
) {
    compatibleWith(cronometer)
    dependsOn(originalInput)
    execute {
        AdjustInit.uniqueMatch().method.addInstruction(0, "return-void")
        AdjustTrackEvent.uniqueMatch().method.addInstruction(0, "return-void")
    }
}

@Suppress("unused")
val disableAmplitude = bytecodePatch(
    name = "Disable Amplitude tracking",
    description = "Stops the Amplitude Flutter plugin's method channel before it records events or flags.",
) {
    compatibleWith(cronometer)
    dependsOn(originalInput)
    execute {
        // Leave the channel handler intact: Dart awaits its Result, so
        // swallowing the call would hang startup. Only the SDK init is stubbed.
    }
}

@Suppress("unused")
val disableBraze = bytecodePatch(
    name = "Disable Braze tracking",
    description = "Stops Braze plugin attachment and automatic content-card, banner, feature-flag and push subscriptions.",
) {
    compatibleWith(cronometer)
    dependsOn(originalInput)
    execute {
        // Keep onAttachedToEngine: it registers the Flutter channel, and
        // removing it makes Dart throw MissingPluginException at startup.
        BrazeIntegration.uniqueMatch().method.addInstruction(0, "return-void")
    }
}

@Suppress("unused")
val disableDatadog = bytecodePatch(
    name = "Disable Datadog telemetry",
    description = "Stops Datadog SDK initialisation (RUM, logs and native crash reports) while preserving Flutter channel replies.",
) {
    compatibleWith(cronometer)
    dependsOn(originalInput)
    execute {
        DatadogInitialize.uniqueMatch().method.addInstruction(0, "return-void")
        // Dart still sends RUM view metadata after SDK initialization is
        // disabled. Complete those channel calls without SDK dispatch, rather
        // than throwing RUM-not-enabled errors or leaving Futures unanswered.
        // RUM commands return void; the nullable session-ID query returns null.
        DatadogRumCall.uniqueMatch().method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel${'$'}Result;->success(Ljava/lang/Object;)V
                return-void
            """.trimIndent(),
        )
    }
}

@Suppress("unused")
val disableFirebaseAnalytics = bytecodePatch(
    name = "Disable Firebase Analytics",
    description = "Stops Firebase Analytics event, user-id and user-property writes from the Flutter plugin.",
) {
    compatibleWith(cronometer)
    dependsOn(originalInput)
    execute {
        FirebaseLogEvent.uniqueMatch().method.addInstruction(0, "return-void")
        FirebaseSetUserId.uniqueMatch().method.addInstruction(0, "return-void")
        FirebaseSetUserProperty.uniqueMatch().method.addInstruction(0, "return-void")
    }
}

/** Provider-level defaults for the Firebase/Google analytics and ads inventory. */
@Suppress("unused")
val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val all = doc.getElementsByTagName("*")
            val nodes = (0 until all.length).map { all.item(it) as Element }
            val app = nodes.single { it.tagName == "application" }
            val namespace = "http://schemas.android.com/apk/res/android"
            val flags = mapOf(
                "firebase_analytics_collection_deactivated" to true,
                "firebase_analytics_collection_enabled" to false,
                "google_analytics_adid_collection_enabled" to false,
                "firebase_crashlytics_collection_enabled" to false,
                "firebase_sessions_enabled" to false,
                "firebase_performance_collection_deactivated" to true,
                "firebase_performance_collection_enabled" to false,
                "google_analytics_default_allow_analytics_storage" to false,
                "google_analytics_default_allow_ad_storage" to false,
                "google_analytics_default_allow_ad_user_data" to false,
                "google_analytics_default_allow_ad_personalization_signals" to false,
            )
            for ((name, value) in flags) {
                val matches = nodes.filter { it.tagName == "meta-data" && it.getAttribute("android:name") == name }
                check(matches.size <= 1) { "Duplicate Cronometer meta-data: $name" }
                val node = matches.singleOrNull() ?: doc.createElement("meta-data").also {
                    it.setAttributeNS(namespace, "android:name", name)
                    app.appendChild(it)
                }
                node.setAttributeNS(namespace, "android:value", value.toString())
            }
            val permissions = setOf(
                "com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_TOPICS",
                "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
            )
            nodes.filter { it.tagName == "uses-permission" && it.getAttribute("android:name") in permissions }
                .forEach { it.parentNode.removeChild(it) }
        }
    }
}
