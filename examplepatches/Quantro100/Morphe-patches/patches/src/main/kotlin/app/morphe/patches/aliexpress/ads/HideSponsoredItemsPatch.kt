package app.morphe.patches.aliexpress.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.aliexpress.utils.Constants.COMPATIBILITY_ALIEXPRESS

internal object AdcReportFingerprint : Fingerprint(
    strings = listOf("url", "message", "invalid url"),
    returnType = "V",
)

val hideSponsoredItemsPatch = bytecodePatch(
    name = "Remove sponsored items from search",
    description = "Filters out sponsored and promoted products from search results.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        AdcReportFingerprint.method.apply {
            addInstructions(
                0,
                """
                return-void
                """.trimIndent(),
            )
        }
    }
}
