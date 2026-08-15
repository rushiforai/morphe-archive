package app.aapam.patches.zee5.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.aapam.patches.zee5.shared.AnalyticsTrackEventFingerprint
import app.aapam.patches.zee5.shared.Constants

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Disables all third-party analytics (CleverTap, Firebase, " +
        "Mixpanel, videoanalytics) by short-circuiting the central analytics " +
        "dispatch method. No tracking data is sent.",
) {
    compatibleWith(Constants.COMPATIBILITY_ZEE5_TV)

    execute {
        AnalyticsTrackEventFingerprint.method.addInstructions(
            0,
            "return-void",
        )
    }
}
