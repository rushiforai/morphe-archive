package app.plyrs1.patches.com_gajihub_app

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_GAJIHUB
import org.w3c.dom.Element

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable Telemetry",
    description = "Disables third-party telemetry, crash reporting, and tracking services in GajiHub. " +
            "Suppresses Sentry native SDK initialization, OneSignal analytics and device tracking, " +
            "neutralizes root detection telemetry, and disables Sentry/Firebase background providers.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GAJIHUB)

    execute {
        // 1. RNSentryModule.initNativeSdk(ReadableMap, Promise) -> immediately resolve true and return
        RNSentryInitNativeSdkFingerprint.methodOrNull?.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-interface {p2, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """
        )

        // 2. OneSignal.isRooted() -> return false (0x0) (v2.0.4)
        OneSignalIsRootedFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // 3. RNSentryModule.captureEnvelope(String, ReadableMap, Promise) -> immediately resolve true and return
        RNSentryCaptureEnvelopeFingerprint.methodOrNull?.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-interface {p3, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """
        )

        // 4. RNSentryModule.captureScreenshot(Promise) -> immediately resolve null and return
        RNSentryCaptureScreenshotFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """
        )

        // 5. RNSentryModule.fetchViewHierarchy(Promise) -> immediately resolve null and return
        RNSentryFetchViewHierarchyFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """
        )
        //

        // 6. OneSignal location sharing -> force isShared() to false (v2.0.4)
        OneSignalLocationIsSharedFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // 7. OneSignal location tracker -> neutralize start() and setShared() (v2.0.4)
        OneSignalLocationStartFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void"
        )
        OneSignalLocationSetSharedFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void"
        )

        // 8. RNOneSignal outcomes -> neutralize addOutcome, addOutcomeWithValue, addUniqueOutcome (v2.0.4)
        RNOneSignalAddOutcomeFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void"
        )
        RNOneSignalAddOutcomeWithValueFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void"
        )
        RNOneSignalAddUniqueOutcomeFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void"
        )
        //
        // 9. CodePush deployment & rollback telemetry -> neutralize recordStatusReported, saveStatusReportForRetry
        CodePushRecordStatusReportedFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void"
        )
        CodePushSaveStatusReportForRetryFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void"
        )

        // 10. Sentry cold-start ContentProviders -> neutralize onCreate()Z without touching AndroidManifest.xml
        SentryInitProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
        SentryPerformanceProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
        //
    }
}
