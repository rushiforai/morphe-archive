package app.olaelectric.patches.security

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.olaelectric.patches.shared.AndroidCertificateChainCleanerFingerprint
import app.olaelectric.patches.shared.BasicCertificateChainCleanerFingerprint
import app.olaelectric.patches.shared.CertificatePinnerAFingerprint
import app.olaelectric.patches.shared.CertificatePinnerBFingerprint
import app.olaelectric.patches.shared.Constants.COMPATIBILITY_OLA
import app.olaelectric.patches.shared.OkHostnameVerifierFingerprint

@Suppress("unused")
val disableSslPinningPatch = bytecodePatch(
    name = "Disable SSL Pinning",
    description = "Disables SSL certificate pinning to allow intercepting and inspecting network traffic.",
    default = true
) {
    compatibleWith(COMPATIBILITY_OLA)

    execute {
        // 1. Bypass CertificatePinner.check(String, List)
        runCatching {
            CertificatePinnerAFingerprint.method.addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // 2. Bypass CertificatePinner.check$okhttp(String, Function0)
        runCatching {
            CertificatePinnerBFingerprint.method.addInstructions(
                0,
                """
                    return-void
                """
            )
        }
    }
}

@Suppress("unused")
val disableTlsValidationPatch = bytecodePatch(
    name = "Disable TLS Validation",
    description = "Disables hostname verification and certificate chain validation for self-signed or invalid certificates.",
    default = false
) {
    compatibleWith(COMPATIBILITY_OLA)

    execute {
        // 1. Bypass OkHostnameVerifier.verify(String, SSLSession) -> always return true
        runCatching {
            OkHostnameVerifierFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        // 2. Bypass AndroidCertificateChainCleaner.clean(...) -> return chain as-is
        runCatching {
            AndroidCertificateChainCleanerFingerprint.method.addInstructions(
                0,
                """
                    return-object p2
                """
            )
        }

        // 3. Bypass BasicCertificateChainCleaner.clean(...) -> return chain as-is
        runCatching {
            BasicCertificateChainCleanerFingerprint.method.addInstructions(
                0,
                """
                    return-object p2
                """
            )
        }
    }
}
