package app.anghami.patches.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Request-signing target (Anghami 8.0.28, verified in base.apk smali
 * `smali_classes3/com/anghami/ghost/utils/SignatureUtils.smali:437`).
 *
 * Reads the live signing cert via PackageManager.getPackageInfo(...).
 * signatures[0], base64(SHA-1(cert)) + salt -> SHA-256 hex over that +
 * body, emitted per-request as `X-ANGH-APP-RGSIG`. Used by the "Spoof
 * stock app signature" patch.
 */
object GetAppSignatureFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/utils/SignatureUtils;",
    name = "getAppSignature",
    accessFlags = listOf(com.android.tools.smali.dexlib2.AccessFlags.PUBLIC, com.android.tools.smali.dexlib2.AccessFlags.STATIC),
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
