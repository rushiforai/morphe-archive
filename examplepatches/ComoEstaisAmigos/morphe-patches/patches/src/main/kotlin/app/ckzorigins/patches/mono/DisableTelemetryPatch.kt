package app.ckzorigins.patches.mono

import app.ckzorigins.patches.shared.Constants.COMPATIBILITY
import app.ckzorigins.patches.shared.applyByteEdits
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly

/**
 * Kontagent and GameAnalytics stay with Unlimited currency: those method bodies
 * are reused for the clamp. Java Kontagent/Google Analytics wrappers are stubbed
 * here; the C# copies are a separate rewrite.
 *
 * The leftover SDK classes still carry their URL constants. After the wrappers
 * return, those classes are empty shells ([emptyTelemetrySdks]), same trick as
 * the expansion downloader.
 */
@Suppress("unused")
val disableTelemetryPatch = patch(
    name = "Disable telemetry",
    description = "Turns off Flurry, Tune, Tapjoy, PlayHaven, Chartboost, Glu wallet, NTP, " +
        "and the S3 content check.",
) {
    compatibleWith(COMPATIBILITY)
    dependsOn(gluBackupPatch)

    execute {
        val tapjoyGetter = TapjoyConnectInstanceFingerprint.method
        FlurryGluStartSessionFingerprint.method
        FlurryDeviceIdFingerprint.method
        MobileAppTrackerGluInitFingerprint.method
        TapjoyGluInitFingerprint.method
        PlayHavenGluInitFingerprint.method
        ChartBoostGluInitFingerprint.method
        FacebookGluInitFingerprint.method
        GluGoogleAnalyticsStartSessionFingerprint.method
        KontagentGluStartSessionFingerprint.method
        AmazonGluInitFingerprint.method
        GWalletInitialiseFingerprint.method.returnEarly()
        GWalletOutOfGameFingerprint.method.returnEarly()
        NotificationReadFromS3Fingerprint.method
        NotificationReadGWalletFrequencyFingerprint.method

        stubTelemetryWrappers()

        tapjoyGetter.addInstructions(
            0,
            """
                sget-object v0, $TAPJOY_CONNECT->tapjoyConnectInstance:$TAPJOY_CONNECT
                return-object v0
            """,
        )

        applyByteEdits(DllEdits.PATH, DllEdits.HOSTS + DllEdits.TAPJOY)
        applyByteEdits(DllEdits.FIRSTPASS_PATH, DllEdits.FIRSTPASS_HOSTS)
        emptyTelemetrySdks()
    }
}
