package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28

/**
 * Request-signing bypass: force `SignatureUtils.getAppSignature` to return the
 * stock-signed value so `X-ANGH-APP-RGSIG` verifies server-side after repacking.
 *
 * Why a reimplementation instead of a constant return: the method's result is
 * per-request, `SHA-256_hex(base64(SHA-1(stockCert)) + salt || body)`. A single
 * hardcoded string would fail every request whose salt/body differs. This patch
 * hardcodes only the cert-derived prefix and keeps the salt/body hashing
 * byte-identical to stock.
 *
 * Stock prefix derivation (verified locally, see REPORT.md §3):
 * - Cert: META-INF/BNDLTOOL.RSA in base.apk, O=Anghami serial 507febae,
 *   SHA-1 fingerprint 85:EF:41:4D:83:39:5A:9A:41:82:D3:B9:AE:52:CB:B7:20:23:FA:4C
 * - `base64(SHA-1(DER cert))` = `he9BTYM5WppBgtO5rlLLtyAj+kw=`
 * - The trailing `\n` is load-bearing: the app calls
 *   `Base64.encode(sha1, 0)` with flags=DEFAULT, which appends a newline, and
 *   `new String(...)` keeps it. The on-device stock intermediate is therefore
 *   29 chars ending in `\n`; omitting it yields a wrong hash.
 *
 * Same prepend-return pattern as the other patches here: inserted at index 0
 * with `return-object`, the original PackageManager lookup becomes dead code.
 * Uses only v0-v4 (original `.locals 5`), so no register expansion is needed.
 */
@Suppress("unused")
val stockSignaturePatch = bytecodePatch(
    name = "Spoof stock app signature",
    description = "Forces SignatureUtils.getAppSignature to hash with the stock cert prefix (he9B...kw=), so X-ANGH-APP-RGSIG matches a stock install. Salt/body hashing unchanged.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)

    execute {
        GetAppSignatureFingerprint.method.addInstructions(
            0,
            """
                const-string v2, "he9BTYM5WppBgtO5rlLLtyAj+kw=\n"
                new-instance v3, Ljava/lang/StringBuilder;
                invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
                invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                move-result-object v3
                invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                move-result-object v3
                invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v3
                const-string v2, "SHA-256"
                invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
                move-result-object v2
                const-string v4, "iso-8859-1"
                invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
                move-result-object v4
                invoke-virtual {v3}, Ljava/lang/String;->length()I
                move-result v3
                const/4 v0, 0x0
                invoke-virtual {v2, v4, v0, v3}, Ljava/security/MessageDigest;->update([BII)V
                invoke-virtual {v2, p1}, Ljava/security/MessageDigest;->update([B)V
                invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B
                move-result-object v2
                invoke-static {v2}, Lcom/anghami/ghost/utils/SignatureUtils;->convertToHex([B)Ljava/lang/String;
                move-result-object v2
                return-object v2
            """
        )
    }
}
