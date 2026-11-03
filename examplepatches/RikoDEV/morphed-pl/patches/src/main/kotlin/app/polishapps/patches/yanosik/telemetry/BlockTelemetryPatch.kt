package app.polishapps.patches.yanosik.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.shared.Constants.COMPATIBILITY_YANOSIK
import app.polishapps.patches.shared.methodFingerprint
import app.polishapps.patches.shared.prependReturn
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Background services (subclasses of `Lz5;`) whose only job is collecting and uploading telemetry.
 *
 * Each one is neutralised by skipping its `onCreateAsync` / `onDestroyAsync` work while still calling
 * `super`, so the service host sees a normal lifecycle. Timers, event subscriptions and upload jobs are
 * only ever started from `onCreateAsync`, so nothing is collected or queued afterwards. Events other
 * code posts to these services go to an event bus with no subscriber, which is harmless.
 */
private val telemetryServices = listOf(
    // Protobuf analytics events from native and Flutter screens.
    "Lpl/neptis/libraries/analyticsproto/AnalyticsManager;",
    // Legacy analytics batches ("BigDataAnalytics") and the settings-change recorder.
    "Lpl/neptis/yanosik/mobi/android/common/services/analytics/AnalyticsService;",
    // Periodic usage packages (activity, navigation state, GPS status).
    "Lpl/neptis/libraries/analitycs/usage/UsageAnalyticsService;",
    // Insurance kiosk funnel analytics.
    "Lpl/neptis/libraries/kioskanalytics/KioskAnalyticsService;",
    // Advert impression statistics.
    "Lpl/neptis/features/adsbanners/advertstatistics/AdvertStatisticsManager;",
    // Wi-Fi scan results, connected networks and app uninstall reports.
    "Lpl/neptis/yanosik/mobi/android/common/services/statisticscan/StatisticScanService;",
    // Cell tower, Wi-Fi and app usage samples. Nothing in the app reads them back.
    "Lpl/neptis/features/robbery/newbts/BtsService;",
)

/**
 * Blocks telemetry at each collector and deliberately not at the network layer.
 *
 * Do not block `kafka-in.server.yanosik.pl` or the `Lc9a;` transport to achieve this. That channel also
 * carries `LocationUploadRequestMessage` (`Lpza;`, sent by `GpsSamplesManager`) and `RoadMessage`
 * (`Lgwh;`), which feed the live traffic and POI system. Those classes are not touched here, and neither
 * are the location provider, POI service, navigation, map, authentication, Firebase Cloud Messaging or
 * Firebase Remote Config. Remote Config supplies feature flags, and FCM depends on Firebase Installations.
 *
 * These targets are pinned to Yanosik 26.9.0; obfuscated names change per release.
 */
@Suppress("unused")
val blockTelemetryPatch = bytecodePatch(
    name = "Block Yanosik telemetry",
    description = "Blocks analytics, crash reporting, usage statistics, the notiOne SDK and Wi-Fi/cell " +
        "tower data collection. Location reporting for POI alerts and traffic keeps working.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YANOSIK)

    execute {
        telemetryServices.forEach { service ->
            methodFingerprint(service, "onCreateAsync", returnType = "V").method.prependReturn(
                """
                    invoke-super {p0}, Lz5;->onCreateAsync()V
                    return-void
                """,
            )
            methodFingerprint(service, "onDestroyAsync", returnType = "V").method.prependReturn(
                """
                    invoke-super {p0}, Lz5;->onDestroyAsync()V
                    return-void
                """,
            )
        }

        // Firebase Analytics client (`Lfnn;`): take the SDK's own "Disabling data collection" path. With
        // the `e` flag set, queued calls run their `b()` fallback, which releases anything waiting for a
        // result. Setting it before the `nln` init task also stops the measurement module being loaded
        // from Google Play services, which reads the manifest and would ignore a bytecode-only flag.
        val analyticsClient = methodFingerprint(
            "Lfnn;",
            "<init>",
            parameters = listOf("Landroid/content/Context;", "Landroid/os/Bundle;"),
            returnType = "V",
        ).method
        val listAssignment = analyticsClient.instructions.toList().indexOfFirst { instruction ->
            instruction.opcode == Opcode.IPUT_OBJECT &&
                ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.let { field ->
                    field.definingClass == "Lfnn;" && field.name == "c"
                } == true
        }
        if (listAssignment < 0) {
            throw PatchException("fnn.<init>: field assignment anchor not found")
        }
        analyticsClient.addInstructions(
            listAssignment + 1,
            """
                const/4 v2, 0x1
                iput-boolean v2, p0, Lfnn;->e:Z
                return-void
            """,
        )

        // Bundled measurement engine: report `firebase_analytics_collection_deactivated` as true, in case
        // it is started by its manifest receiver or service rather than by the client above.
        methodFingerprint("Lyen;", "i0", returnType = "Z").method.prependReturn(
            """
                const/4 p0, 0x1
                return p0
            """,
        )

        // Crashlytics data collection arbiter: automatic collection is off, so reports are not uploaded.
        // Its only other readers are Firebase Sessions, which also stops sending events.
        methodFingerprint("Low4;", "i", returnType = "Z").method.prependReturn(
            """
                const/4 p0, 0x0
                return p0
            """,
        )

        // App-side Crashlytics wrapper: no logs, exceptions, custom keys or user ID.
        val crashlytics = "Lpl/neptis/yanosik/mobi/android/FirebaseCrashlytics;"
        listOf(
            "log" to listOf("Ljava/lang/String;"),
            "logException" to listOf("Ljava/lang/Throwable;"),
            "setCustomKey" to listOf("Ljava/lang/String;", "Ljava/lang/Object;"),
            "setUserId" to listOf("Ljava/lang/String;"),
        ).forEach { (name, parameters) ->
            methodFingerprint(crashlytics, name, parameters, "V").method.prependReturn("return-void")
        }

        // Firebase Sessions: local `firebase_sessions_enabled` override is false.
        methodFingerprint("Lbva;", "a", returnType = "Ljava/lang/Boolean;").method.prependReturn(
            """
                sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object p0
            """,
        )

        // proxi.cloud marketing SDK (geofencing, beacons, Wi-Fi location, analytics upload). The
        // controller calls `setEnabled(false)` and `setGdprConsent(false)` when this returns false.
        methodFingerprint(
            "Lpl/neptis/features/proxicloud/ProxiCloudController;",
            "canProxiCloudEnabled",
            returnType = "Z",
        ).method.prependReturn(
            """
                const/4 p0, 0x0
                return p0
            """,
        )

        // notiOne SDK (Bluetooth tag scanning, location samples, its own sync and upload jobs).
        //
        // Do not patch `BeaconSDKHelper.a()` or `GlobalBluetoothReceiver` to achieve this. That receiver
        // forwards Bluetooth events to Yanosik's `GlobalActionReceiver`, which handles car autostart, and
        // `a()` gates the forwarding. Koin module setup also stays, because `setUserId` still resolves
        // SDK objects through it.
        val notinoteStarter = "Lme/notinote/sdk/NotinoteStarter;"
        methodFingerprint(notinoteStarter, "init", returnType = "V").method.prependReturn("return-void")
        // Every start, stop, restart and logout command reaches the SDK service through this method.
        methodFingerprint(
            notinoteStarter,
            "start",
            listOf("Landroid/content/Intent;"),
            "V",
        ).method.prependReturn("return-void")
        // Boot and package-update receiver: its only job is restarting the SDK.
        methodFingerprint(
            "Lme/notinote/sdk/receivers/RestartServiceReceiver;",
            "onReceive",
            listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
            "V",
        ).method.prependReturn("return-void")
        // Jobs scheduled by an earlier install survive an in-place update, so finish them immediately
        // using the result `SynchronizeWorker` already returns when it is not allowed to start.
        listOf(
            "SynchronizeWorker" to "g",
            "BeaconSampleDozeSendingWorker" to "e",
        ).forEach { (worker, resultField) ->
            val workerClass = "Lme/notinote/sdk/service/synchronize/workers/$worker;"
            methodFingerprint(workerClass, "c", returnType = "Lgsa;").method.prependReturn(
                """
                    iget-object v1, p0, $workerClass->$resultField:Lb2i;
                    new-instance v0, Lksa;
                    invoke-direct {v0}, Lksa;-><init>()V
                    invoke-virtual {v1, v0}, Lb2i;->g(Ljava/lang/Object;)Z
                    const/4 v2, 0x1
                    invoke-virtual {p0, v2}, Lmsa;->d(I)V
                    return-object v1
                """,
            )
        }

        // RevenueCat paywall and feature events. Purchases and entitlements use other endpoints.
        val revenueCatEvents = "Lcom/revenuecat/purchases/common/events/EventsManager;"
        methodFingerprint(
            revenueCatEvents,
            "track",
            listOf("Lcom/revenuecat/purchases/common/events/FeatureEvent;"),
            "V",
        ).method.prependReturn("return-void")
        methodFingerprint(
            revenueCatEvents,
            "flushEvents",
            listOf("Lcom/revenuecat/purchases/common/Delay;"),
            "V",
        ).method.prependReturn("return-void")
    }
}
