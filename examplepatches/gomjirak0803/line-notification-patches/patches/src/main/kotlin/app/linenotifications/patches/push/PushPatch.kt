// Adapted from Andrew Liang, GPL-3.0; see THIRD_PARTY_NOTICES.md.
package app.linenotifications.patches.push

import app.linenotifications.patches.shared.Constants.COMPATIBILITY_LINE
import app.linenotifications.patches.shared.verifiedLineVersionPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

/**
 * LINE's ORIGINAL signing-certificate SHA-1 (uppercase hex, no separators) — the value the
 * unpatched app reports in `X-Android-Cert` and which LINE's Firebase API key is allow-listed
 * against.
 *
 * The inspected `base.apk` (26.16.0) uses APK signing-key rotation, so it carries two
 * certificates: the lineage-ROOT / original key (Android SDK 24–32) and a rotated key (SDK
 * 33+). `rl.a.a` reads the cert via the deprecated `GET_SIGNATURES`. For a rotated app, it
 * returns the ORIGINAL (lineage-root) certificate for backward compatibility, so this is the
 * SDK 24–32 signer.
 *
 * Registration and background delivery still require device verification.
 */
private const val LINE_ORIGINAL_CERT_SHA1 = "89396DC419292473972813922867E6973D6F5C50"

@Suppress("unused")
val fixPushNotificationsPatch = bytecodePatch(
    name = "Restore push registration",
    description = "Restores Firebase installation registration after re-signing. Changes the reported certificate for FIS requests only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LINE)
    dependsOn(verifiedLineVersionPatch)

    // Each site loads `const-string "X-Android-Cert"` then calls `addRequestProperty` or
    // `setRequestProperty(key, value)`, where `value` holds the cert hash computed at run time.
    // Overwrite that value register with the original LINE cert hash right before the call, so a
    // re-signed build reports the allow-listed SHA-1. Only these call sites change. The shared
    // `rl.a`/`rl.h` helpers stay intact.
    execute {
        listOf(
            FisRequestBuilderFingerprint,
        ).forEach { fingerprint ->
            // instructionMatches[1] is the invoke that sends X-Android-Cert. Its value argument
            // is registerE ({connection, key, value}). Reading it avoids hardcoding the register,
            // which can drift between versions.
            val sendCert = fingerprint.instructionMatches[1]
            val valueReg = (sendCert.instruction as FiveRegisterInstruction).registerE

            fingerprint.method.addInstructions(
                sendCert.index,
                "const-string v$valueReg, \"$LINE_ORIGINAL_CERT_SHA1\"",
            )
        }
    }
}
