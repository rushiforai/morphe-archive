package patches.simosa

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Forces Simosa's signature guard (`U4.t.f()`) to always report untampered.
 *
 * The guard returns "GuardNotChanged" (untampered) or "SignatureChanged" (re-signed). The splash
 * only navigates forward on "GuardNotChanged"; otherwise it shows the "version is not correct"
 * dialog and stalls. Any patch re-signs the APK, so we force the untampered value.
 *
 * Emitted:
 *   const-string v0, "GuardNotChanged"
 *   return-object v0
 */
@Suppress("unused")
val bypassSignatureVerificationPatch = bytecodePatch(
    name = "Bypass signature verification",
    description = "Disables Simosa's anti-tamper signature check so a re-signed APK launches " +
        "normally instead of stalling on the splash / \"version is not correct\" dialog.",
) {
    compatibleWith(COMPATIBILITY_SIMOSA)

    execute {
        signatureGuardFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "GuardNotChanged"
                return-object v0
            """.trimIndent(),
        )
    }
}
