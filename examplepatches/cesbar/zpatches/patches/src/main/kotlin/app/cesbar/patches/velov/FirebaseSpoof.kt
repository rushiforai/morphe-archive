package app.cesbar.patches.velov

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.apk.ApkSignatureScheme
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import java.security.MessageDigest

object signatureBytesToStringFingerprint : Fingerprint(
    parameters = listOf("[B", "Z"),
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lcom/google/android/gms/common/util/"
)

object signatureFromPackageFingerprint : Fingerprint(
    parameters = listOf("Landroid/content/pm/PackageManager;", "Ljava/lang/String;"),
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)

val spoofSignatureFirebasePatch = bytecodePatch (
    name = "Spoof package signature",
    description = "Spoofs the package signature required for Firebase, fixes notifications"
){
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val certificate = packageMetadata.signingCertificates[ApkSignatureScheme.V2]?.first()
            ?: throw PatchException("Couldn't find the app original signature")
        
        val signature = MessageDigest.getInstance("SHA-1")
                            .digest(certificate.encoded)
                            .joinToString("") { "%02X".format(it) }
        println("Original signature found: $signature")
        signatureBytesToStringFingerprint.method.returnEarly(signature)
        signatureFromPackageFingerprint.method.returnEarly(signature)
    }
}