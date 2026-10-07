package app.anghami.patches.integrity

import app.anghami.patches.core.AnghamiTarget
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Rewrites the request-signing header so that it still matches the certificate the
 * stock application was published with.
 *
 * Anghami authorises API calls with an `X-ANGH-APP-RGSIG` header built by
 * `SignatureUtils.getAppSignature`. The value is a certificate-derived prefix
 * concatenated with a hash of the per-request salt and body. A repacked binary is
 * signed with a different key, so the header produced on device no longer passes
 * the server-side check. This patch substitutes the stock certificate prefix while
 * leaving the salt and body hashing byte-identical to stock, which keeps each
 * individual request valid.
 *
 * Returning a single fixed string is therefore not an option: the result varies per
 * request, so only the certificate-derived part can be pinned. That prefix is the
 * base64 form of the SHA-1 digest of the DER certificate; its trailing newline is
 * significant, because the encoder used at runtime appends one and the value is
 * consumed without trimming, so removing it would change the resulting hash.
 *
 * The replacement is prepended with `return-object` at index 0, following the same
 * pattern as the other guards in this bundle: the original certificate lookup stays
 * in place but becomes unreachable. The stub keeps within the registers the stock
 * method already declares, so no register expansion is required.
 */
@Suppress("unused")
val signatureSpoofPatch = bytecodePatch(
    name = "Spoof App Signature",
    description = "Emulates official application signature headers to preserve API authorization compatibility.",
    default = true,
) {
    compatibleWith(AnghamiTarget.COMPATIBILITY)

    execute {
        GetAppSignatureSignature.method.addInstructions(
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

/** Matches the helper that renders the signed request header from a salt and body. */
object GetAppSignatureSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/utils/SignatureUtils;",
    name = "getAppSignature",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;", "[B"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/pm/PackageManager;",
            name = "getPackageInfo",
        ),
        string("SHA-256"),
        methodCall(
            definingClass = "Lcom/anghami/ghost/utils/SignatureUtils;",
            name = "convertToHex",
        ),
    )
)
