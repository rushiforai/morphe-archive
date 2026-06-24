package app.morphe.patches.aliexpress.splash

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.aliexpress.utils.Constants.COMPATIBILITY_ALIEXPRESS

internal object SplashShowFingerprint : Fingerprint(
    strings = listOf("/splash_img.jpg", "splash_img_url"),
    returnType = "V",
)

val disableSplashScreenPatch = bytecodePatch(
    name = "Disable splash screen",
    description = "Skips the splash screen on app launch.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        SplashShowFingerprint.method.apply {
            addInstructions(
                0,
                """
                return-void
                """.trimIndent(),
            )
        }
    }
}
