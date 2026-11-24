/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.myooredoo.misc.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.returnEarly
import app.morphe.patches.myooredoo.shared.Constants
import app.morphe.patches.shared.removeElements
import app.morphe.patches.shared.replyFlutterBool
import app.morphe.patches.shared.replyFlutterEmptyMap
import app.morphe.patches.shared.replyFlutterNull
import app.morphe.patches.shared.setMetaData

private val DISABLED_META_DATA = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_enabled" to "false",
)

private val REMOVED_COMPONENTS = setOf(
    "com.facebook.internal.FacebookInitProvider",
    "com.adjust.sdk.SystemLifecycleContentProvider",
    "com.huawei.agconnect.core.provider.AGConnectInitializeProvider",
    "com.huawei.agconnect.core.ServiceDiscovery",
    "com.qualtrics.digital.QualtricsSurveyActivity",
    "com.qualtrics.digital.QualtricsNotificationManager",
    "com.clevertap.android.pushtemplates.PTPushNotificationReceiver",
    "com.clevertap.android.pushtemplates.PushTemplateReceiver",
    "com.clevertap.android.sdk.CleverTapFileProvider",
    "com.clevertap.android.sdk.pushnotification.CTPushNotificationReceiver",
    "com.clevertap.android.sdk.pushnotification.fcm.CTFirebaseMessagingReceiver",
    "com.clevertap.android.sdk.pushnotification.fcm.FcmMessageListenerService",
    "com.google.firebase.sessions.SessionLifecycleService",
)

private val ADJUST_TRACK_METHODS = setOf(
    "initSdk", "trackEvent", "trackAdRevenue", "trackPlayStoreSubscription",
    "trackThirdPartySharing", "trackMeasurementConsent", "verifyAndTrackPlayStorePurchase",
)

private val QUALTRICS_MAP_HANDLERS = setOf(
    "handleInitializeProject", "handleInitializeProjectWithExtRefId",
    "handleEvaluateProject", "handleEvaluateIntercept",
)

private val QUALTRICS_BOOL_HANDLERS = setOf("handleDisplay", "handleDisplayIntercept")

private val QUALTRICS_VOID_HANDLERS = setOf(
    "handleDisplayTarget", "handleRegisterViewVisit", "handleSetDateTime",
    "handleSetLogLevel", "handleSetNumber", "handleSetString",
)

@Suppress("unused")
val disableTrackingAndAnalyticsPatch = patch(
    name = "Disable tracking and analytics",
    description = "Disables analytics, crash reporting, performance monitoring, surveys and " +
            "advertising attribution while keeping push notifications and Remote Config. " +
            "Stops CleverTap, Qualtrics, Adjust, Facebook App Events, VdoCipher telemetry, " +
            "Firebase Analytics/Crashlytics/Performance, and Huawei AppGallery Connect.",
    default = true,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY_MYOOREDOO)

    execute {
        // CleverTap Application.onCreate & MainActivity.onCreate
        mutableClassDefByOrNull("Lcom/clevertap/android/sdk/Application;")
            ?.methods?.firstOrNull { it.name == "onCreate" && it.parameters.isEmpty() }
            ?.addInstructions(
                0,
                """
                    invoke-super {p0}, Landroid/app/Application;->onCreate()V
                    return-void
                """,
            )

        runCatching {
            Fingerprint(
                definingClass = "Lcom/example/ooredoo_selfcare_algeria/MainActivity;",
                name = "onCreate",
                returnType = "V",
                parameters = listOf("Landroid/os/Bundle;"),
                strings = listOf("Identity,Phone"),
            ).method.addInstructions(
                0,
                """
                    invoke-super {p0, p1}, Lio/flutter/embedding/android/FlutterFragmentActivity;->onCreate(Landroid/os/Bundle;)V
                    invoke-virtual {p0}, Lcom/example/ooredoo_selfcare_algeria/MainActivity;->getIntent()Landroid/content/Intent;
                    move-result-object p1
                    invoke-direct {p0, p1}, Lcom/example/ooredoo_selfcare_algeria/MainActivity;->handleAdjustDeeplink(Landroid/content/Intent;)V
                    return-void
                """,
            )
        }

        // VdoCipher telemetry payload builder (survives obfuscated f/g renames).
        runCatching {
            Fingerprint(
                definingClass = "Lcom/vdocipher/aegis/analytics/internal/AppAnalytics;",
                returnType = "Ljava/lang/String;",
                parameters = listOf("Landroid/content/Context;"),
                isStatic = false,
            ).method.returnEarly("")
        }

        // Adjust: stop init + event tracking while keeping isEnabled()=false & deeplinks working.
        mutableClassDefByOrNull("Lcom/adjust/sdk/flutter/AdjustSdk;")?.methods
            ?.filter { it.name in ADJUST_TRACK_METHODS && it.parameters.size == 2 }
            ?.forEach { it.replyFlutterNull() }

        // Qualtrics: type-safe replies so Dart never throws TypeError.
        mutableClassDefByOrNull("Lcom/qualtrics/flutter/qualtrics_digital_flutter_plugin/QualtricsDigitalFlutterPlugin;")
            ?.methods?.filter { it.parameters.size == 2 }?.forEach { method ->
                when (method.name) {
                    in QUALTRICS_MAP_HANDLERS -> method.replyFlutterEmptyMap()
                    in QUALTRICS_BOOL_HANDLERS -> method.replyFlutterBool(false)
                    in QUALTRICS_VOID_HANDLERS -> method.replyFlutterNull()
                }
            }

        // Facebook / Meta SDK: return "" for getters and null for event logging.
        mutableClassDefByOrNull("Lcom/solusibejo/flutter_meta_sdk/FlutterMetaSdkPlugin;")
            ?.methods?.firstOrNull { it.name == "onMethodCall" }
            ?.addInstructions(
                0,
                """
                    iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;
                    if-eqz v0, :cond_null
                    const-string v1, "get"
                    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
                    move-result v1
                    if-eqz v1, :cond_null
                    const-string v0, ""
                    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel${'$'}Result;->success(Ljava/lang/Object;)V
                    return-void
                    :cond_null
                    const/4 v0, 0x0
                    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel${'$'}Result;->success(Ljava/lang/Object;)V
                    return-void
                """,
            )

        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.removeElements(listOf("provider", "service", "receiver", "activity")) {
                it.attribute("android:name") in REMOVED_COMPONENTS
            }
            manifest.setMetaData(DISABLED_META_DATA)
        }
    }
}
