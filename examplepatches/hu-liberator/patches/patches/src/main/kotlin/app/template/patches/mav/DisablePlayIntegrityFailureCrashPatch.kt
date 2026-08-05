package app.template.patches.mav

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MAV_EMMAPP
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Verified against hu.mav.emmapp_merged.apk (originally JADX: A4/f.java,
 * method g(Exception); confirmed still present but renamed to method C(...)
 * as of app version 2.4.19-prod -- R8 renames this app's own obfuscated
 * classes/methods independently on every build, which is why this fingerprint
 * intentionally does NOT pin a definingClass or method name).
 *
 * This is the Play Integrity onFailure callback (log tag "PlayIntegrityValidator",
 * message "Failed to retrieve integrity token" -- both literal strings, so
 * stable across obfuscation regardless of what the surrounding class/method
 * gets renamed to). When the underlying Play Integrity API call itself fails
 * with error code -5 (APP_NOT_INSTALLED) or -7 (APP_UID_MISMATCH) -- exactly
 * what happens for a side-loaded, re-signed APK -- it does
 * `throw new SecurityException()`. This is the dedicated implementation for
 * that one callback (its body does not branch on the class's synthetic
 * call-site discriminator field), so fully short-circuiting it only affects
 * this failure path.
 */
object PlayIntegrityFailureCallbackFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/Exception;"),
    strings = listOf("PlayIntegrityValidator", "Failed to retrieve integrity token"),
)

@Suppress("unused")
val disablePlayIntegrityFailureCrashPatch = bytecodePatch(
    name = "Disable Play Integrity failure crash",
    description = "Prevents SecurityException when the Play Integrity API call itself fails (APP_NOT_INSTALLED / APP_UID_MISMATCH), as happens for side-loaded APKs.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MAV_EMMAPP)

    execute {
        PlayIntegrityFailureCallbackFingerprint.method.addInstructions(0, "return-void")
    }
}
