package app.morphe.patches.aliexpress.updates

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.aliexpress.utils.Constants.COMPATIBILITY_ALIEXPRESS

internal object UpdateCheckFingerprint : Fingerprint(
    strings = listOf("checkUpdate"),
    returnType = "V",
)

val disableForcedUpdatesPatch = bytecodePatch(
    name = "Disable forced updates",
    description = "Disables the forced update popup that prevents using older versions of the app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        UpdateCheckFingerprint.method.apply {
            addInstructions(
                0,
                """
                return-void
                """.trimIndent(),
            )
        }
    }
}
