package app.cesbar.patches.velov

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

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
        signatureBytesToStringFingerprint.method.returnEarly(Constants.SIGNATURE)
        signatureFromPackageFingerprint.method.returnEarly(Constants.SIGNATURE)
    }
}