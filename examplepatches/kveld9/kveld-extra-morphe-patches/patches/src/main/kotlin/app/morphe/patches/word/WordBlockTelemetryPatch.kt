package app.morphe.patches.word

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.Constants
import app.morphe.patches.shared.clearTryBlocks
import app.morphe.patches.shared.disableComponentsByName
import app.morphe.patches.shared.ensureRegisterCount
import app.morphe.patches.shared.removeComponentDiscoveryRegistrarsWhere
import app.morphe.patches.shared.setApplicationMetaData
import app.morphe.patches.shared.stripPermissionsWhere
import org.w3c.dom.Element

// Advertising and attribution permissions confirmed present in Word manifest (word_manifest_tree.txt L82-83).
// ACCESS_ADSERVICES_* permissions are a forward-guard: absent in this build but
// blocked pre-emptively to match the PowerPoint reference baseline.
private val blockedPermissions = setOf(
    "com.google.android.gms.permission.AD_ID",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
)

// Components confirmed in word_manifest_tree.txt.
// Delta vs PowerPoint:
//   - Added and manifest-verified (tag/presence confirmed via word_manifest_tree.txt grep):
//     OHubBroadcastReceiver (receiver, line 672), HockeyWebViewActivity (activity, line 550),
//     FeedbackActivity (activity, line 552), PackageStateReceiver (receiver, line 1571),
//     SelfReplacementReceiver (receiver, line 1587).
//   - WordCrossSellHandlerActivity is present in Word (self-cross-sell from within
//     the host app); PowerpointCrossSellHandlerActivity, ExcelCrossSellHandlerActivity,
//     PdfCrossSellHandlerActivity are also present in the Word manifest and included.
private val blockedComponents = setOf(
    // Google DataTransport (batching/scheduling layer)
    "com.google.android.datatransport.runtime.backends.TransportBackendDiscovery",
    "com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService",
    "com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver",

    // HockeyApp crash reporting and feedback (manifest: activity tags confirmed lines 550-552)
    "net.hockeyapp.android.UpdateActivity",
    "net.hockeyapp.android.FeedbackActivity",
    "com.microsoft.office.hockeyapp.activities.HockeyWebViewActivity",

    // Install and referrer tracking
    "com.microsoft.office.asyncdatapointreporting.InstallBroadcastReceiver",
    "com.microsoft.office.officehub.util.OHubBroadcastReceiver",

    // Microsoft Cross-Sell and campaign targeting
    "com.microsoft.android.crosssell.CrossSellAgentMarker",
    "com.microsoft.android.crosssell.CrossSellReceiver",
    "com.microsoft.android.crosssell.PackageStateReceiver",
    "com.microsoft.android.crosssell.SelfReplacementReceiver",
    "com.microsoft.android.crosssell.activities.ExcelCrossSellHandlerActivity",
    "com.microsoft.android.crosssell.activities.PdfCrossSellHandlerActivity",
    "com.microsoft.android.crosssell.activities.PowerpointCrossSellHandlerActivity",
    "com.microsoft.android.crosssell.activities.WordCrossSellHandlerActivity",
    "com.microsoft.office.floodgate.launcher.FloodgateDynamicUxActivity",
)

// firebase_analytics_collection_enabled and firebase_analytics_collection_deactivated
// keys confirmed present in Word manifest (word_manifest_tree.txt).
// Remaining keys mirror the PowerPoint baseline as forward-guard opt-outs.
private val optOutMetadata = listOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
)

private val wordTelemetryResourcePatch = resourcePatch(
    name = "Word Telemetry Manifest Purge",
    description = "Strips tracking/advertising permissions, disables HockeyApp, DataTransport, and cross-sell components, and injects Firebase opt-out metadata in AndroidManifest.xml.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY_WORD)

    execute {
        val manifestFile = get("AndroidManifest.xml")
        if (!manifestFile.exists()) {
            println("[Word Telemetry] Skipped: AndroidManifest.xml not found.")
            return@execute
        }

        var removedPermissions = 0
        var disabledComponents = 0
        var removedRegistrars = 0
        var injectedMetadata = 0

        document(manifestFile.absolutePath).use { doc ->
            val root = doc.documentElement
            val application = root.getElementsByTagName("application").item(0) as? Element

            removedPermissions = root.stripPermissionsWhere { it in blockedPermissions }.size

            if (application != null) {
                disabledComponents = application.disableComponentsByName(*blockedComponents.toTypedArray())

                removedRegistrars = application.removeComponentDiscoveryRegistrarsWhere { name ->
                    (name.contains("TransportRegistrar", ignoreCase = true) ||
                        name.contains("datatransport", ignoreCase = true) ||
                        name.contains("analytics", ignoreCase = true) ||
                        name.contains("measurement", ignoreCase = true) ||
                        name.contains("crashlytics", ignoreCase = true)) &&
                        !name.contains("mlkit", ignoreCase = true)
                }

                optOutMetadata.forEach { (name, value) ->
                    application.setApplicationMetaData(name, value)
                    injectedMetadata++
                }
            }
        }

        println("[Word Telemetry] Stripped $removedPermissions permissions, disabled $disabledComponents tracking components, removed $removedRegistrars discovery registrars, and injected $injectedMetadata opt-out flags in AndroidManifest.xml.")
    }
}

context(_: BytecodePatchContext)
private fun hookVoidMethod(
    definingClass: String,
    name: String,
    parameters: List<String>,
    hookedMethods: MutableList<String>,
    label: String,
) {
    Fingerprint(
        definingClass = definingClass,
        name = name,
        parameters = parameters,
        returnType = "V",
    ).method.apply {
        addInstructions(0, "return-void")
        hookedMethods.add(label)
    }
}

// OneDS/Aria lifecycle callbacks -- same class present in Word DEX
// (surface_sweep_word.tsv: privacy-controls/battery rows confirm
//  Lcom/microsoft/applications/telemetry/pal/hardware/a in classes3.dex).
context(_: BytecodePatchContext)
private fun hookLifecycleCallbacks(hookedMethods: MutableList<String>) {
    val lifecycleClass = "Lcom/microsoft/applications/telemetry/core/LifecycleHandler;"
    val activityParam = listOf("Landroid/app/Activity;")
    val activityBundleParams = listOf("Landroid/app/Activity;", "Landroid/os/Bundle;")

    hookVoidMethod(lifecycleClass, "onActivityCreated", activityBundleParams, hookedMethods, "LifecycleHandler.onActivityCreated")
    hookVoidMethod(lifecycleClass, "onActivityStarted", activityParam, hookedMethods, "LifecycleHandler.onActivityStarted")
    hookVoidMethod(lifecycleClass, "onActivityResumed", activityParam, hookedMethods, "LifecycleHandler.onActivityResumed")
    hookVoidMethod(lifecycleClass, "onActivityPaused", activityParam, hookedMethods, "LifecycleHandler.onActivityPaused")
    hookVoidMethod(lifecycleClass, "onActivityStopped", activityParam, hookedMethods, "LifecycleHandler.onActivityStopped")
    hookVoidMethod(lifecycleClass, "onActivitySaveInstanceState", activityBundleParams, hookedMethods, "LifecycleHandler.onActivitySaveInstanceState")
    hookVoidMethod(lifecycleClass, "onActivityDestroyed", activityParam, hookedMethods, "LifecycleHandler.onActivityDestroyed")
}

// Telemetry dispatchers confirmed in Word DEX via surface_sweep_word.tsv:
//   - AggregatedMetric$SendAggregationTimerTask: shared OneDS aggregation timer (event emitter).
//   - e0.logFailure: schema emitter with extra-package XREFs (TSV batching rows confirm
//     Lcom/microsoft/applications/telemetry/core/o in classes3.dex).
//   - HardwareInformationReceiver: privacy-controls/identifier row confirms
//     Lcom/microsoft/applications/telemetry/pal/hardware/a in classes3.dex.
//   - PowerInfoReceiver: privacy-controls/battery row confirms
//     Lcom/microsoft/unified/telemetry/mutsdk/HttpClient in classes6.dex (same SDK).
// All targets return V with no Callback/Listener/Task params -- safe to return-void.
context(_: BytecodePatchContext)
private fun hookTelemetryDispatchers(hookedMethods: MutableList<String>) {
    hookVoidMethod(
        definingClass = "Lcom/microsoft/applications/telemetry/AggregatedMetric\$SendAggregationTimerTask;",
        name = "run",
        parameters = emptyList(),
        hookedMethods = hookedMethods,
        label = "SendAggregationTimerTask.run",
    )
    hookVoidMethod(
        definingClass = "Lcom/microsoft/applications/telemetry/core/e0;",
        name = "logFailure",
        parameters = listOf(
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/microsoft/applications/telemetry/EventProperties;",
        ),
        hookedMethods = hookedMethods,
        label = "e0.logFailure5",
    )
    hookVoidMethod(
        definingClass = "Lcom/microsoft/applications/telemetry/core/e0;",
        name = "logFailure",
        parameters = listOf(
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/microsoft/applications/telemetry/EventProperties;",
        ),
        hookedMethods = hookedMethods,
        label = "e0.logFailure3",
    )
    hookVoidMethod(
        definingClass = "Lcom/microsoft/applications/telemetry/pal/hardware/HardwareInformationReceiver;",
        name = "onMAMReceive",
        parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
        hookedMethods = hookedMethods,
        label = "HardwareInformationReceiver.onMAMReceive",
    )
    hookVoidMethod(
        definingClass = "Lcom/microsoft/unified/telemetry/mutsdk/PowerInfoReceiver;",
        name = "onMAMReceive",
        parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
        hookedMethods = hookedMethods,
        label = "PowerInfoReceiver.onMAMReceive",
    )
}

// Ad-measurement identifiers -- AdMeasurementPlatformData confirmed in Word DEX:
// surface_sweep_word.tsv compat-bypass/installer-check row:
//   classes5.dex Lcom/microsoft/office/adsmobile_admeasurementpartner/admeasurement/AdMeasurementPlatformData;->getInstallSource()
// getAIFA and getAppSetId are on the same class; fingerprints defined in Fingerprints.kt.
// Returns Ljava/lang/String; -- replace body with empty-string literal (not return-void).
context(_: BytecodePatchContext)
private fun hookAdMeasurementPlatformData(hookedMethods: MutableList<String>) {
    listOf(wordGetAIFAFingerprint, wordGetAppSetIdFingerprint).forEach { fp ->
        fp.method.apply {
            clearTryBlocks()
            ensureRegisterCount(1)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(
                0,
                """
                const-string v0, ""
                return-object v0
                """,
            )
        }
    }
    hookedMethods.add("AdMeasurementPlatformData.getAIFA")
    hookedMethods.add("AdMeasurementPlatformData.getAppSetId")
}

@Suppress("unused")
val wordBlockTelemetryPatch = bytecodePatch(
    name = "Block Telemetry & Trackers",
    description = "Neutralizes Microsoft OneDS/Aria lifecycle, aggregated-metric and failure-logging dispatch methods, nullifies ad measurement platform identifiers (AIFA, AppSetId), disables HockeyApp and DataTransport components, and strips advertising permissions.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_WORD)
    dependsOn(wordTelemetryResourcePatch)

    execute {
        val hookedMethods = mutableListOf<String>()

        hookLifecycleCallbacks(hookedMethods)
        hookTelemetryDispatchers(hookedMethods)
        hookAdMeasurementPlatformData(hookedMethods)

        println("[Word Telemetry] Neutralized ${hookedMethods.size} telemetry dispatch methods: ${hookedMethods.joinToString(", ")}.")
    }
}
