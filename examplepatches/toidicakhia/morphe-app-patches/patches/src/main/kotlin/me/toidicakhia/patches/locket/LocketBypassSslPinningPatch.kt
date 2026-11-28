package me.toidicakhia.patches.locket

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.returnEarly
import me.toidicakhia.patches.shared.Constants.LOCKET_COMPATIBILITY

private val trustUserCertificatesPatch = resourcePatch(
    description = "Trust user-added CA certificates"
) {
    execute {
        trustUserCertificates()
    }
}

/**
 * Locket 1.247.3 does not configure its own certificate pins; the practical
 * obstacle to TLS inspection is that user-installed CAs are not trusted.
 *
 * This patch adds that trust and additionally makes the bundled OkHttp pinner
 * and hostname verifier no-ops, so a debugging proxy with any certificate can
 * be used.
 */
@Suppress("unused")
val locketBypassSslPinningPatch = bytecodePatch(
    name = "Bypass SSL Pinning",
    description = "For TLS debugging: trusts user-installed CA certificates, skips OkHttp " +
        "certificate pinning and accepts any hostname, so a local proxy can inspect HTTPS " +
        "traffic. Not selected by default.",
    default = false
) {
    compatibleWith(LOCKET_COMPATIBILITY)
    dependsOn(trustUserCertificatesPatch)

    execute {
        LocketCertificatePinnerCheckFingerprint.match().method.returnEarly()
        LocketOkHostnameVerifierFingerprint.match().method.returnEarly(true)
    }
}
