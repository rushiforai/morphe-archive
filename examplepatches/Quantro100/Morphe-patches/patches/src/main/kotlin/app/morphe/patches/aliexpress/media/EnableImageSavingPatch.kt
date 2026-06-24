package app.morphe.patches.aliexpress.media

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.aliexpress.utils.Constants.COMPATIBILITY_ALIEXPRESS

internal object MediaSaveFingerprint : Fingerprint(
    strings = listOf("FileServerUploadResult"),
    returnType = "V",
)

val enableImageSavingPatch = bytecodePatch(
    name = "Enable image saving",
    description = "Enables saving product images directly to the device gallery.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        MediaSaveFingerprint.method.apply {
            addInstructions(
                0,
                """
                return-void
                """.trimIndent(),
            )
        }
    }
}
