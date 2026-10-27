package app.template.patches.tasker.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// Tasker validates its paid licence through Google Play LVL (com.google.android.vending.licensing)
// and caches the result as com.joaomgcd.taskerm.licensing.LicenseStatus. The licensing classes
// around it are R8-obfuscated (rf.a0 / rf.w / rf.w$a in 6.6.18 and 6.6.20), so these anchors use
// the kept LicenseStatus enum, LVL response strings, log text and method shape instead.

internal const val LICENSE_STATUS = "Lcom/joaomgcd/taskerm/licensing/LicenseStatus;"

// Maps an LVL response code (0x100 / 0x123 / 0x231) to a LicenseStatus plus a label. Only its
// constructor carries the "Licensed" / "Retrying" / "Unlicensed" labels; the status getter
// (no parameters, returns LicenseStatus) sits in the same class.
internal object LicenseResponseFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf("I"),
    strings = listOf(
        string("Licensed", StringComparisonType.CONTAINS),
        string("Retrying", StringComparisonType.CONTAINS),
        string("Unlicensed", StringComparisonType.CONTAINS),
    ),
)

// Licence manager companion: "is licensed" from the cached status, or kicks off a check.
internal object CachedLicenseFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "J"),
    filters = listOf(string("Checking cached only", StringComparisonType.STARTS_WITH)),
)

// Same class: the (Context) overload, which delegates to the cached check with a 20 s timeout.
internal object FreshLicenseFingerprint : Fingerprint(
    classFingerprint = CachedLicenseFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

// Same class: decides "licensed" from a LicenseStatus result (retry falls back to the cached
// status). Both the startup check's result and its "not licensed" notification go through it,
// including the error path that resolves to Unlicensed when Play cannot be reached.
internal object LicenseResultFingerprint : Fingerprint(
    classFingerprint = CachedLicenseFingerprint,
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("L", "Z", "Landroid/content/Context;"),
    filters = listOf(
        fieldAccess(definingClass = LICENSE_STATUS, name = "Retry"),
        fieldAccess(definingClass = LICENSE_STATUS, name = "Licensed"),
    ),
)
