package io.github.henr1klmb.patches.sbb

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val HELPER = "Lio/github/henr1klmb/patches/shared/WebViewHelper;"

@Suppress("unused")
val disableTrackingPatch = patch(
    name = "Disable tracking",
    description = "Disables Tracking and Analytics.",
) {
    compatibleWith(SBB_COMPATIBILITY)

    execute {
        // Disable Piano Analytics / AT Internet screen tracking
        TrackingScreenFingerprint.method.addInstructions(
            0,
            "return-void",
        )

        // Disable Piano Analytics / AT Internet click tracking
        TrackingClickFingerprint.method.addInstructions(
            0,
            "return-void",
        )

        // Disable Piano Analytics / AT Internet ticket variant tracking
        TrackingTicketVariantFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void",
        )

        // Disable Firebase Crashlytics logging via Logback appender
        CrashlyticsAppenderFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void",
        )

        // Disable Firebase Crashlytics direct logging
        CrashlyticsLogFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void",
        )

        // Disable Firebase Crashlytics exception reporting
        CrashlyticsRecordExceptionFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void",
        )

        // Disable Firebase Crashlytics sending unsent reports
        CrashlyticsSendUnsentReportsFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void",
        )

        // Inject web tracker blocking into SBB WebViews
        SbbWebViewClientFingerprint.methodOrNull?.addInstructions(
            0,
            """
                invoke-static {p1}, $HELPER->injectTrackerBlock(Ljava/lang/Object;)V
            """.trimIndent(),
        )
    }
}
