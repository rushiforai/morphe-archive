package app.adebisi.patches.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.resourceFile
import java.security.cert.CertificateFactory
import java.security.cert.X509Certificate

private val V1_CERT_ENTRY = Regex("""META-INF/[^/]+\.(RSA|DSA|EC)$""", RegexOption.IGNORE_CASE)

/** Signer #1 certificate SHA-256 digest of Glu's v1 key (CN=Glu Mobile, San Mateo). */
internal const val GLU_MOBILE_CERT_SHA256 =
    "5926ff8c3a17d163d2942d4abeb553c249638c71f8ad7fa62e85841db04b2c9f"

/** Signer #1 certificate SHA-256 digest of Feelingtouch's v1 key (CN=Feelingtouch, Hangzhou). */
internal const val FEELINGTOUCH_CERT_SHA256 =
    "02a90ad1600a0607ca1580dc0205ab246d80f2bf5819b9361b842e92bcfc3e88"

/**
 * Orig Glu and Feelingtouch APKs are v1-only, so [packageMetadata.signingCertificates] is empty
 * (that map is the v2/v3 signing block). The cert is the v1 PKCS7 under META-INF.
 * Native lib SHA is a separate check; a re-sign of the stock APK keeps those hashes.
 */
internal fun requireGluMobileSigner(original: String) {
    requireSigner(signerCertSha256(), GLU_MOBILE_CERT_SHA256, "Glu Mobile", original)
}

internal fun requireFeelingtouchSigner(original: String) {
    requireSigner(signerCertSha256(), FEELINGTOUCH_CERT_SHA256, "Feelingtouch", original)
}

internal fun requireSigner(
    hashes: Set<String>,
    expected: String,
    publisher: String,
    original: String,
) {
    if (hashes == setOf(expected)) return
    val seen = hashes.singleOrNull()?.take(12) ?: "${hashes.size} certs"
    throw PatchException(
        "This APK is not signed by $publisher (cert sha256 $seen). " +
            "Patch the original $original, not a repack or a patched build.",
    )
}

internal fun certificatesFromPkcs7(bytes: ByteArray): List<X509Certificate> {
    val factory = CertificateFactory.getInstance("X.509")
    return factory.generateCertificates(bytes.inputStream()).filterIsInstance<X509Certificate>()
}

internal fun certSha256(cert: X509Certificate): String = cert.encoded.sha256()

internal fun signerCertSha256(): Set<String> {
    val hashes = HashSet<String>()
    for (cert in packageMetadata.signingCertificates.values.flatten()) {
        hashes.add(certSha256(cert))
    }
    for (name in listApkEntries("META-INF/")) {
        if (!V1_CERT_ENTRY.matches(name)) continue
        val file = resourceFile(name, copy = true)
        if (!file.exists()) continue
        for (cert in certificatesFromPkcs7(file.readBytes())) {
            hashes.add(certSha256(cert))
        }
    }
    return hashes
}
