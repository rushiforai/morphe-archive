package app.ckzorigins.patches.mono

import app.ckzorigins.patches.shared.Constants.COMPATIBILITY
import app.ckzorigins.patches.shared.applyByteEdits
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly

/**
 * Kontagent and GameAnalytics stay with Unlimited currency: those method bodies
 * are reused for the clamp.
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

        FlurryGluStartSessionFingerprint.method.returnEarly()
        FlurryDeviceIdFingerprint.method.returnEarly(null)
        MobileAppTrackerGluInitFingerprint.method.returnEarly()
        TapjoyGluInitFingerprint.method.returnEarly()
        PlayHavenGluInitFingerprint.method.returnEarly()
        ChartBoostGluInitFingerprint.method.returnEarly()
        GWalletInitialiseFingerprint.method.returnEarly()
        GWalletOutOfGameFingerprint.method.returnEarly()
        skipToFinishOnCreate(ExpansionCheckPropertiesFingerprint.method)
        skipToFinishOnCreate(ExpansionCheckUpgradeFingerprint.method)
        NotificationReadFromS3Fingerprint.method.returnEarly()
        NotificationReadGWalletFrequencyFingerprint.method.returnEarly()

        tapjoyGetter.addInstructions(
            0,
            """
                sget-object v0, $TAPJOY_CONNECT->tapjoyConnectInstance:$TAPJOY_CONNECT
                return-object v0
            """,
        )

        applyByteEdits(DllEdits.PATH, DllEdits.HOSTS + DllEdits.TAPJOY)
        applyByteEdits(DllEdits.FIRSTPASS_PATH, DllEdits.FIRSTPASS_HOSTS)
    }
}

private fun skipToFinishOnCreate(method: MutableMethod) {
    method.addInstructions(
        0,
        """
            invoke-direct {p0}, $DOWNLOADER_ACTIVITY->finishOnCreate()V
            return-void
        """,
    )
}
