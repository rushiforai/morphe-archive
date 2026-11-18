package io.github.henr1klmb.patches.hellofitpro

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val RETURN_VOID = "return-void"

private const val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

@Suppress("unused")
val disableTrackingPatch = patch(
    name = "Disable tracking",
    description = "Disables Tracking and Analytics.",
) {
    compatibleWith(HELLOFITPRO_COMPATIBILITY)

    execute {
        // Prevent AppMetrica retail preload ContentProvider initialization
        PreloadInfoContentProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        // Disable Umeng SDK initialization
        UmConfigureInitFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        UmConfigurePreInitFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Disable Umeng event reporting
        MobclickAgentOnEventStringFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        MobclickAgentOnEventStringStringFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        MobclickAgentOnEventMapFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        MobclickAgentOnEventObjectFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        MobclickAgentOnPageStartFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        MobclickAgentOnPageEndFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Disable AppMetrica activation, reporter, and error/event logging
        AppMetricaActivateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        AppMetricaActivateReporterFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        AppMetricaReportEventStringFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        AppMetricaReportEventStringStringFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        AppMetricaReportEventStringMapFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        AppMetricaReportErrorStringThrowableFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        AppMetricaReportErrorStringStringFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )
    }
}
