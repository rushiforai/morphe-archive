package app.fluffy.patches.scene

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/**
 * La/c3;-equivalent: parses the stored license state ("success@<millis>",
 * "expired", ...) into an ActivatedStateModel. Located by signature, not name:
 * the class is obfuscated and its helpers get renamed by R8 on every build, but
 * the parser is the only method turning a String into an ActivatedStateModel
 * while mentioning "success@" and formatting an expiry date.
 */
object LicenseStateParserFingerprint : Fingerprint(
    returnType = "Lcom/omarea/model/ActivatedStateModel;",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("success@", "yyyy-MM-dd"),
)

/**
 * Signature-MD5 getter (at1.C / rv1.B / mw1.B across builds): the only method
 * taking (Context, String) and returning a String that mentions "MD5" - it
 * digests the APK signing certificate that omarea's activation server binds
 * to.
 */
object SignatureMd5Fingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    strings = listOf("MD5"),
    // A kr-script cache helper shares the signature and the "MD5" string (it
    // hashes script text for a cache filename); only the license-bound getter
    // also asks the PackageManager for the APK signatures.
    filters = listOf(
        methodCall(definingClass = "Landroid/content/pm/PackageManager;", name = "getPackageInfo"),
    ),
)

/**
 * Device-ID collector (mh1.f / r81.f / l91.f across builds): queries the root
 * scene-daemon over the local socket for "device-id" (serial_id / serial_no /
 * cpu_id / gid - first non-empty wins). Its return value is the SN shown on
 * the user page and the key the app sends to omarea's API for cloud sync.
 */
object ActivationRequestFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("activate"),
)

object DeviceIdCollectorFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    strings = listOf("device-id", "serial_id", "serial_no", "cpu_id", "gid"),
)
