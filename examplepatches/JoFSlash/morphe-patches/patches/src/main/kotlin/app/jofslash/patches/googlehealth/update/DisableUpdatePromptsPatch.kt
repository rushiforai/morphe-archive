package app.jofslash.patches.googlehealth.update

import app.jofslash.patches.googlehealth.shared.Constants.COMPATIBILITY_GOOGLE_HEALTH
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

// Play Core's AppUpdateInfo(updateAvailability, installStatus, immediateIntent, flexibleIntent),
// obfuscated. Its only constructor takes two ints and two PendingIntents.
internal object AppUpdateInfoConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf("I", "I", "Landroid/app/PendingIntent;", "Landroid/app/PendingIntent;"),
)

/** UpdateAvailability.UPDATE_NOT_AVAILABLE in Play Core. */
private const val UPDATE_NOT_AVAILABLE = 1

@Suppress("unused")
val disableUpdatePromptsPatch = bytecodePatch(
    name = "Disable update prompts",
    description = "Stops the app from asking you to update it from Google Play. A patched app can't be " +
            "updated from Google Play; patch the new version instead.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_GOOGLE_HEALTH)

    execute {
        // Whatever Google Play answers, the app reads "no update available".
        AppUpdateInfoConstructorFingerprint.method.addInstruction(
            0,
            "const/4 p1, $UPDATE_NOT_AVAILABLE"
        )
    }
}
