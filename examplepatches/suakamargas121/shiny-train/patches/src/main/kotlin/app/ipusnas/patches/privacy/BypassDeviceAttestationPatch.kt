package app.ipusnas.patches.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ipusnas.patches.shared.Constants.COMPATIBILITY_IPUSNAS
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Server-side device attestation bypass.
 *
 * iPusnas 2.1.6 performs Play-Integrity-backed device attestation at the
 * splash screen and before opening any book. The SERVER decides whether the
 * attestation token is valid; a patched build's token request fails (its
 * signature no longer matches the Play-signed original), the backend answers
 * "attestation_failed", the app shows an error dialog and revokes the login
 * token (REVOKETOKEN → GlobalApp.a()).
 *
 * The app itself already supports running WITHOUT attestation in DLS mode
 * (network_mode == 2 logs "DLS mode active, skipping attestation"), so the
 * content APIs work without an attestation token.
 *
 * This patch forces `isAttestationRequired()` to always return false, which
 * is exactly the state the app enters in DLS mode:
 *  - SplashScreenAct never submits attestation, never shows the
 *    "attestation_failed" dialog, never triggers REVOKETOKEN
 *  - BookLoadingAct / BookDetailAct skip the attestation gate before reading
 */
object DeviceAttestationRequiredFingerprint : Fingerprint(
    definingClass = "Lmam/reader/ilibrary/attestation/DeviceAttestationViewModel;",
    name = "isAttestationRequired",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
)

@Suppress("unused")
@Deprecated("Disables attestation entirely; the server rejects that. Use BypassPlayIntegrityTokenPatch instead.")
val bypassDeviceAttestationPatch = bytecodePatch(
    name = "Bypass device attestation",
    description = "Skips device attestation entirely. The server rejects sessions without attestation — use 'Bypass Play Integrity token' instead.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_IPUSNAS)

    execute {
        DeviceAttestationRequiredFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
