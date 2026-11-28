package me.toidicakhia.patches.locket

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import me.toidicakhia.patches.shared.Constants.LOCKET_COMPATIBILITY

private const val ORIGINAL_CERT_SHA1 = "187A27D3D7364A044307F56E66230F973DCCD5B7"
private val SHA1_HEX = Regex("^[0-9A-Fa-f]{40}$")

/**
 * Morphe re-signs the APK, so Firebase sees a different X-Android-Cert and
 * rejects requests (notably firebaseinstallations.googleapis.com) with 403.
 *
 * All five Google SDK methods that derive that header from the APK signature
 * are replaced with a constant: the original Locket certificate SHA-1.
 */
@Suppress("unused")
val locketSpoofFirebaseCertPatch = bytecodePatch(
    name = "Spoof Firebase signing certificate",
    description = "Sends Locket's original signing-certificate SHA-1 to Firebase Installations, " +
        "Remote Config, App Check and Auth. Required after repackaging: Morphe re-signs the APK, " +
        "and Google otherwise rejects the requests with HTTP 403.",
    default = true
) {
    compatibleWith(LOCKET_COMPATIBILITY)

    val originalCert by stringOption(
        key = "originalCertSha1",
        default = ORIGINAL_CERT_SHA1,
        title = "Original Firebase SHA-1",
        description = "SHA-1 of Locket's original signing certificate, sent as X-Android-Cert.",
        required = true
    )

    execute {
        val sha1 = originalCert?.trim()?.uppercase()
            ?: throw PatchException("Enter the original Firebase SHA-1.")
        if (!SHA1_HEX.matches(sha1)) {
            throw PatchException("The certificate SHA-1 must be exactly 40 hex characters.")
        }

        locketCertProducerFingerprints.forEach { fingerprint ->
            fingerprint.match().method.addInstructions(
                0,
                """
                    const-string v0, "$sha1"
                    return-object v0
                """.trimIndent()
            )
        }
    }
}
