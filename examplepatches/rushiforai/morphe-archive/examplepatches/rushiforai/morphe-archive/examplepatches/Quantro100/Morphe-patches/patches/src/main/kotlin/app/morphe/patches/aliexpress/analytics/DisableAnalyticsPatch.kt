package app.morphe.patches.aliexpress.analytics

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.aliexpress.utils.Constants.COMPATIBILITY_ALIEXPRESS

internal object AnalyticsInitFingerprint : Fingerprint(
    strings = listOf("setGlobalProperty", "key is null or key is empty or value is null,please check it!"),
    returnType = "V",
)

val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Blocks analytics and tracking sent to AliExpress servers.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        AnalyticsInitFingerprint.method.apply {
            addInstructions(
                0,
                """
                return-void
                """.trimIndent(),
            )
        }
    }
}
