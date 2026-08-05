package app.template.patches.mav

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MAV_EMMAPP
import app.template.patches.shared.neutralizeExceptionThrows

/**
 * Verified against hu.mav.emmapp_merged.apk (originally JADX: Qa/u0.java,
 * method m(Object); confirmed still present but renamed to Ta/t0.java method
 * l(Object) as of app version 2.4.19-prod -- this fingerprint intentionally
 * does NOT pin a definingClass or method name, since R8 renames this app's
 * own obfuscated classes/methods independently on every build. The literal
 * verdict field-name strings below are part of Google's documented Play
 * Integrity verdict JSON schema, so they can't change without breaking the
 * API contract itself.
 *
 * This method decodes and self-verifies the Play Integrity "standard" verdict
 * JWE/JWS token (fields requestPackageName/nonce/timestampMillis,
 * appRecognitionVerdict, deviceRecognitionVerdict, appLicensingVerdict -- the
 * documented Play Integrity verdict schema) and throws a bare SecurityException
 * for any mismatch. A side-loaded, re-signed APK will always fail
 * appRecognitionVerdict != "PLAY_RECOGNIZED" and appLicensingVerdict != "LICENSED",
 * so these throws are hit even if the API call itself succeeds.
 *
 * This single method is shared (via a switch on a synthetic discriminator field)
 * with two unrelated features -- price-alternative and user-profile response
 * mapping -- so it cannot be blanked wholesale like a dedicated callback. Instead,
 * only the `throw` instructions whose exception object was constructed via
 * `new-instance ..., Ljava/lang/SecurityException;` are neutralized; everything
 * else (including unrelated switch cases and legitimate JWT/JWE parsing-error
 * throws of other exception types) is left untouched.
 *
 * A separate ClassCastException was also observed at this method's price-
 * alternative branch (`check-cast v2, LQa/S;`) -- a mismatched call arriving
 * with a Play Integrity verdict object instead. That looks like a pre-existing
 * bug in the app's own async task dispatch, unrelated to this patch. Rather
 * than edit this method further to guard it (an attempt at that corrupted this
 * method's packed-switch and caused a VerifyError instead), the fix is
 * upstream: see DisablePlayIntegrityRequestPatch.kt, which stops the Play
 * Integrity token request from ever being made, so this method's Play
 * Integrity branch -- and whatever is misrouting calls into its other
 * branches -- is never reached in the first place.
 */
object PlayIntegrityVerdictValidatorFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("appRecognitionVerdict", "deviceRecognitionVerdict", "appLicensingVerdict"),
)

@Suppress("unused")
val disablePlayIntegrityVerdictValidationPatch = bytecodePatch(
    name = "Disable Play Integrity verdict validation",
    description = "Removes client-side SecurityException throws that reject unlicensed/unattested/unrecognized Play Integrity verdicts, without touching unrelated code sharing the same method.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MAV_EMMAPP)

    execute {
        neutralizeExceptionThrows(PlayIntegrityVerdictValidatorFingerprint.method, "Ljava/lang/SecurityException;")
    }
}
