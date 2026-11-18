package io.github.henr1klmb.patches.oebb

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val HELPER = "Lio/github/henr1klmb/patches/shared/WebViewHelper;"

@Suppress("unused")
val disableTrackingPatch = patch(
    name = "Disable tracking",
    description = "Disables Tracking and Analytics.",
) {
    compatibleWith(OEBB_COMPATIBILITY)

    execute {
        // Disable HAFAS Webbug telemetry dispatcher
        WebbugTryEnableTrackingFingerprint.method.addInstructions(
            0,
            "return-void",
        )

        // Force global HAFAS tracking consent to false
        HafasTrackingConsentFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )

        // Neutralize Matomo (Piwik) event and screen tracking
        PiwikTrackEventFingerprint.method.addInstructions(
            0,
            "return-void",
        )

        PiwikTrackScreenFingerprint.method.addInstructions(
            0,
            "return-void",
        )

        // Neutralize Matomo install referrer receiver
        MatomoInstallReferrerFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void",
        )

        // Inject web tracker blocking into HAFAS WebViews
        HafasWebViewClientFingerprint.methodOrNull?.addInstructions(
            0,
            """
                invoke-static {p1}, $HELPER->injectTrackerBlock(Ljava/lang/Object;)V
            """.trimIndent(),
        )
    }
}
