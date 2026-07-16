package app.jouss.patches.plusmessenger.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.jouss.patches.plusmessenger.shared.Constants.COMPATIBILITY_PLUS_MESSENGER

object AnalyticsStartFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/plus/helpers/AnalyticsHelper;",
    name = "start",
    returnType = "V",
)

object AnalyticsTrackEventFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/plus/helpers/AnalyticsHelper;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

object AnalyticsTrackEventMapFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/plus/helpers/AnalyticsHelper;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/HashMap;"),
)

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Blocks all analytics and tracking."
) {
    compatibleWith(COMPATIBILITY_PLUS_MESSENGER)

    execute {
        AnalyticsStartFingerprint.method.addInstructions(0, "return-void")
        AnalyticsTrackEventFingerprint.method.addInstructions(0, "return-void")
        AnalyticsTrackEventMapFingerprint.method.addInstructions(0, "return-void")
    }
}
