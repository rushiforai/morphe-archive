package arpit.morphe.patches.macrofactor.signature

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Matches `com.google.android.gms.common.util.AndroidUtilsLight.getPackageCertificateHashBytes(Context, String)`.
 *
 * Returns the SHA-1 (20 bytes) of `PackageInfo.signatures[0]` for a package. Used by
 * Firebase App Check, Firebase Installations and Firebase Auth to bind requests to the
 * signing certificate; on a re-signed install it makes "App attestation failed" happen.
 *
 * Verified against `smali/classes6/com/google/android/gms/common/util/AndroidUtilsLight.smali`
 * (method at line 37, `.registers 3`, `public static`). Instruction order of the filters
 * (smali lines): `Wrappers.packageManager` 49, `const/16 0x40` 53,
 * `PackageManagerWrapper.getPackageInfo` 55, `PackageInfo.signatures` iget-object 60,
 * `"SHA1"` 72, `MessageDigest.digest` 95.
 */
object GetSignatureHashFingerprint : Fingerprint(
    // Class match by suffix.
    definingClass = "/AndroidUtilsLight;",
    name = "getPackageCertificateHashBytes",
    // Exact smali bitmask: `public static` (no final).
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "[B",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/android/gms/common/wrappers/Wrappers;",
            name = "packageManager",
        ),
        literal(0x40),
        methodCall(
            definingClass = "Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;",
            name = "getPackageInfo",
        ),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "Landroid/content/pm/PackageInfo;",
            name = "signatures",
        ),
        string("SHA1"),
        methodCall(definingClass = "Ljava/security/MessageDigest;", name = "digest"),
    ),
)
