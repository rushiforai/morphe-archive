package arpit.morphe.patches.macrofactor.signature

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.byteArrayOf
import app.morphe.util.getEndEntityCertificate
import arpit.morphe.patches.macrofactor.diet.premium.GetSignatureHashShapeFingerprint
import java.security.MessageDigest

// SHA-1 of the original signing certificate (see analysis notes/recon.md), used as a
// fallback only when the certificate cannot be read from the input APK.
private const val FALLBACK_CERT_HASH = "44 40 CF FB DA 84 8C 6C 8B 9E 02 84 79 50 74 58 79 9D 51 2C"

/**
 * Internal helper patch (not user-visible).
 *
 * Spoofs the signing-certificate hash read by GMS/Firebase by making
 * [GetSignatureHashFingerprint] return the SHA-1 of the ORIGINAL signing certificate.
 *
 * This is what keeps Firebase App Check / Installations / Auth working when the
 * patched build is mounted over the genuine Play-signed install.
 */
val signatureHashSpoofPatch = bytecodePatch(
    default = false
) {
    execute {
        GetSignatureHashFingerprint.method.injectCertHashSpoof(inputCertSha1())
    }
}

/**
 * Resolves GMS's certificate-hash method for any build: by shape first (works when R8 renamed
 * GMS, as in MacroFactor 5.8.13), then by the `AndroidUtilsLight` name (5.8.11 and older).
 */
internal fun BytecodePatchContext.gmsCertHashMethod(): MutableMethod =
    GetSignatureHashShapeFingerprint.matchOrNull()?.method
        ?: GetSignatureHashFingerprint.matchOrNull()?.method
        ?: throw PatchException("GMS certificate hash method not found")

/**
 * @return the SHA-1 of the input APK's signing certificate, or the known genuine Play
 * certificate hash when the certificate cannot be read.
 */
internal fun BytecodePatchContext.inputCertSha1(): ByteArray =
    runCatching { getEndEntityCertificate(packageMetadata.signingCertificates) }
        .getOrNull()
        ?.let { MessageDigest.getInstance("SHA-1").digest(it.encoded) }
        ?: byteArrayOf(FALLBACK_CERT_HASH)

/**
 * Returns [certHash] before any original instruction runs. The target methods take two
 * parameters, so `p0`/`p1` are the parameters and `v0` is a free local register.
 */
internal fun MutableMethod.injectCertHashSpoof(certHash: ByteArray) {
    val bytes = certHash.joinToString(separator = "\n") { "0x%02Xt".format(it.toInt() and 0xFF) }

    addInstructions(
        0,
        """
            const/16 v0, 0x14
            new-array v0, v0, [B
            fill-array-data v0, :original_cert_hash
            return-object v0

            :original_cert_hash
            .array-data 1
$bytes
            .end array-data
        """
    )
}
