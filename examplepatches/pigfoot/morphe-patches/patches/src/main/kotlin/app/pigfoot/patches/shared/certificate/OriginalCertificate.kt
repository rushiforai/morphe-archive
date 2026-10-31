package app.pigfoot.patches.shared.certificate

import java.security.MessageDigest
import java.security.cert.X509Certificate
import java.util.Locale

/** Per-input value only: never cache certificate identity in a patch singleton. */
internal data class OriginalCertificateIdentity(val sha1: String, val sha256: String)

/**
 * Consume Morphe's original-input metadata, not the installed/patched app identity.
 * Repeated copies across signing schemes are allowed; distinct certificates are
 * ambiguous and fail closed. This is identity pinning, not APK signature verification.
 */
internal fun requireOriginalCertificate(
    certificates: Collection<X509Certificate>,
    expectedSha1: String
): OriginalCertificateIdentity {
    require(expectedSha1.matches(Regex("[0-9a-fA-F]{40}"))) { "Invalid original certificate SHA-1 pin" }
    val encoded = certificates.map { it.encoded }.fold(mutableListOf<ByteArray>()) { unique, bytes ->
        if (unique.none { it.contentEquals(bytes) }) unique.add(bytes)
        unique
    }
    require(encoded.size == 1) { "Missing or ambiguous original input certificate" }
    fun digest(algorithm: String) = MessageDigest.getInstance(algorithm).digest(encoded.single())
        .joinToString("") { "%02x".format(Locale.ROOT, it.toInt() and 0xff) }
    val sha1 = digest("SHA-1")
    require(sha1 == expectedSha1.lowercase(Locale.ROOT)) { "Unsupported original input certificate" }
    return OriginalCertificateIdentity(sha1, digest("SHA-256"))
}
