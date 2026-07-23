package patches.simosa

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Simosa's tamper/signature guard (obfuscated `U4.t.f()`).
 *
 * Name-agnostic: anchors on the two string literals the method returns, which don't change
 * across releases (unlike the obfuscated class/method names). Only one method in the app
 * returns both "GuardNotChanged" and "SignatureChanged".
 */
internal val signatureGuardFingerprint = Fingerprint(
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        string("GuardNotChanged"),
        string("SignatureChanged"),
    ),
)
