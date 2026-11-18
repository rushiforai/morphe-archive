package app.fluffy.patches.scene

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * La/c3;-equivalent: parses the stored license state ("success@<millis>",
 * "expired", ...) into an ActivatedStateModel. Located by signature, not name:
 * the class is obfuscated and its helpers get renamed by R8 on every build, but
 * the parser is the only method turning a String into an ActivatedStateModel
 * while mentioning "success@" and formatting an expiry date.
 *
 * String filters with CONTAINS keep the pre-2.0.0 "strings =" semantics
 * (substring match); the const-string order below (success@ before
 * yyyy-MM-dd) is verified on Alpha13 and 2026.11 PR2.
 */
object LicenseStateParserFingerprint : Fingerprint(
    returnType = "Lcom/omarea/model/ActivatedStateModel;",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        string("success@", StringComparisonType.CONTAINS),
        string("yyyy-MM-dd", StringComparisonType.CONTAINS),
    ),
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
    filters = listOf(
        // A kr-script cache helper shares the signature and the "MD5" string (it
        // hashes script text for a cache filename); only the license-bound getter
        // also asks the PackageManager for the APK signatures. Instruction
        // order: signatures are fetched before they are digested.
        methodCall(definingClass = "Landroid/content/pm/PackageManager;", name = "getPackageInfo"),
        string("MD5", StringComparisonType.CONTAINS),
    ),
)

/**
 * Device-ID collector (mh1.f / r81.f / l91.f across builds): queries the root
 * scene-daemon over the local socket for "device-id" (serial_id / serial_no /
 * cpu_id / gid - first non-empty wins). Its return value is the SN shown on
 * the user page and the key the app sends to omarea's API for cloud sync.
 *
 * Const-string order (device-id, then serial_id/serial_no/cpu_id/gid) is
 * verified on Alpha13 and 2026.11 PR2.
 */
object DeviceIdCollectorFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    filters = listOf(
        string("device-id", StringComparisonType.CONTAINS),
        string("serial_id", StringComparisonType.CONTAINS),
        string("serial_no", StringComparisonType.CONTAINS),
        string("cpu_id", StringComparisonType.CONTAINS),
        string("gid", StringComparisonType.CONTAINS),
    ),
)

/**
 * Activation request builder (e20.g / g30.g / h30 across builds): builds and
 * sends the license activation request. "activate" appears as a substring of
 * the request-op string (e.g. "self-activate" on 2026.11 PR2), so CONTAINS is
 * required to stay stable across builds.
 */
object ActivationRequestFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        string("activate", StringComparisonType.CONTAINS),
    ),
)
