package app.ipusnas.patches.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ipusnas.patches.shared.Constants.COMPATIBILITY_IPUSNAS
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Feeds the server-side attestation an empty Play Integrity token instead of
 * disabling attestation entirely.
 *
 * The attestation flow (DeviceAttestationViewModel.performAttestation):
 *   1. GET /trust/api/nonce
 *   2. build canonical body (platform/nonce/environment/device_info)
 *   3. requestHash = SHA256("POST\n/trust/api/attest\n" + canonicalHash + "\n" + nonce)
 *   4. Lbs2;.b(requestHash) -> Play StandardIntegrityManager token   <-- PATCHED
 *   5. submitAttestation(token, canonicalBody) -> POST /trust/api/attest
 *      (DevicePoPInterceptor signs /attest with the device P-256 key)
 *
 * A patched APK has a different signing certificate, so Google's verdict for
 * the real integrity token flags the build and the server answers
 * "attestation failed" (revoking the login token). The reference downloader
 * (kuchingneko28/ipusnas-downloader) proves the server accepts an attestation
 * with an EMPTY integrity_token while still requiring valid PoP headers — so
 * instead of disabling the flow, this patch makes step 4 return a successful
 * empty token. Everything downstream (PoP registration, signed requests,
 * token refresh) keeps running exactly like the stock app.
 *
 * Note: "Bypass device attestation" (isAttestationRequired=false) must NOT be
 * enabled together with this patch — that one skips the flow entirely, which
 * the server rejects.
 */

/**
 * Lbs2;.b(requestHash, continuation): suspend fun that asks Google's
 * StandardIntegrityManager for a token and wraps the result in
 * Lss3;(token) on success / Lrs3;(message, code, cause) on failure.
 */
private val standardIntegrityHelperFingerprint = Fingerprint(
    definingClass = "Lbs2;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lv90;",
    ),
)

@Suppress("unused")
val bypassPlayIntegrityTokenPatch = bytecodePatch(
    name = "Bypass Play Integrity token (keep attestation)",
    description = "Replaces the Play Integrity token with an empty one during device attestation. The attestation, PoP signing and token refresh keep working; the server accepts an empty integrity token.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IPUSNAS)

    execute {
        standardIntegrityHelperFingerprint.method.addInstructions(
            0,
            """
                const-string v0, ""
                new-instance v1, Lss3;
                invoke-direct {v0, v1}, Lss3;-><init>(Ljava/lang/String;)V
                return-object v1
            """
        )
    }
}
