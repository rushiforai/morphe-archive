package app.non7043.patches.score365.misc

import app.non7043.patches.score365.utils.COMPATIBILITY_365SCORE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private object FirebaseAnalyticsLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "logEvent",
    returnType = "V",
)

/**
 * Removes analytics and tracking (Firebase Analytics, AppsFlyer) from 365Score.
 */
@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Removes analytics and tracking (Firebase Analytics) from 365Score.",
) {
    compatibleWith(*COMPATIBILITY_365SCORE)

    execute {
        val targets = listOf(
            FirebaseAnalyticsLogEventFingerprint,
        )

        for (target in targets) {
            val method = target.methodOrNull ?: continue
            if (method.implementation != null) {
                method.addInstructions(
                    0,
                    "return-void",
                )
            }
        }
    }
}
