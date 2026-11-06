package app.ipusnas.patches.privacy

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Fingerprints used by the privacy patches.
 *
 * The fingerprints are intentionally minimal and prefer stable identifiers
 * (package names, method names) over obfuscated helper classes. All targets
 * were verified against iPusnas 2.1.4 (versionCode 210000020).
 */
object SecurityReporterBreachFingerprint : Fingerprint(
    definingClass = "Lmam/reader/ilibrary/security/SecurityReporter;",
    name = "reportBreach",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

object SecurityReporterIntegrityFingerprint : Fingerprint(
    definingClass = "Lmam/reader/ilibrary/security/SecurityReporter;",
    name = "reportIntegrityFailure",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

object SecurityNativeIsRootedFingerprint : Fingerprint(
    definingClass = "Lcom/aksaramaya/ilibrarycore/security/SecurityNative;",
    name = "isRooted",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
)

object SecurityNativeIsDebuggedFingerprint : Fingerprint(
    definingClass = "Lcom/aksaramaya/ilibrarycore/security/SecurityNative;",
    name = "isDebugged",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
)

object SecurityNativeVerifyApkIntegrityFingerprint : Fingerprint(
    definingClass = "Lcom/aksaramaya/ilibrarycore/security/SecurityNative;",
    name = "verifyApkIntegrity",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

object LicenseClientPerformLocalInstallerCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "performLocalInstallerCheck",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "Z",
)

/**
 * LandingPageAct.B() registers the device for FCM push notifications.
 * Neutering it stops token registration (which is meaningless once the
 * FCM components are removed from the manifest).
 */
object LandingPageFcmTokenFingerprint : Fingerprint(
    definingClass = "Lmam/reader/ilibrary/landing/LandingPageAct;",
    name = "B",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
)
