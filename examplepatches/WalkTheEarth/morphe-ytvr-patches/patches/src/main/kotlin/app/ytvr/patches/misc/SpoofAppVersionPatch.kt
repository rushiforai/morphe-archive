package app.ytvr.patches.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.ytvr.patches.shared.Constants.COMPATIBILITY_YOUTUBE_VR

/**
 * Matches the method that returns the app version name.
 *
 * The class and method names are obfuscated and expected to change between
 * app versions, so only the signature and the preference override key are matched.
 */
private val appVersionFingerprint = Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("pref_override_build_version_name"),
)

@Suppress("unused")
val spoofAppVersionPatch = bytecodePatch(
    name = "Spoof app version",
    description = "Adds an option to trick the app into thinking you are running a different version.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_VR)

    val spoofedVersionName by stringOption(
        key = "spoofedVersionName",
        default = "1.61.48",
        title = "Spoofed version name",
    )

    execute {
        // Escape the configured version name for use in a smali string literal.
        val versionName = (spoofedVersionName ?: "1.61.48")
            .replace("\\", "\\\\")
            .replace("\"", "\\\"")

        // Always return the configured version name,
        // regardless of the actual version of the installed app.
        appVersionFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "$versionName"
                return-object v0
            """
        )
    }
}
