package app.akkay.patches.adguard

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches PlusState.PaidLicense.toString() in AdGuard (LN0/i$n; in 4.17.0).
 *
 * Used to dynamically resolve the PaidLicense class descriptor, constructor signature,
 * LicenseType enum descriptor, LicenseDuration interface descriptor, and PlusState interface
 * without relying on obfuscated identifiers.
 */
object PaidLicenseToStringFingerprint : Fingerprint(
    name = "toString",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("PaidLicense(licenseKey=")
)

/**
 * Matches PlusState.LicenseDuration.Lifetime.toString() in AdGuard (LN0/i$l$a; in 4.17.0).
 *
 * Used to dynamically resolve the Lifetime singleton class and its static INSTANCE field.
 */
object LifetimeDurationFingerprint : Fingerprint(
    name = "toString",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("Lifetime"),
    custom = { _, classDef ->
        classDef.staticFields.any { it.type == classDef.type }
    }
)

/**
 * Matches PlusManagerBackendSupporterImpl.fetchState(String): PlusState (LN0/f;->a(Ljava/lang/String;)LN0/i; in 4.17.0).
 *
 * Smali anchor:
 *   const-string v1, "The Backend response is null, let's provide the Unknown Plus state"
 *   .registers 11 (9 locals v0..v8, 2 params p0..p1)
 */
object BackendSupporterFetchStateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("The Backend response is null, let's provide the Unknown Plus state")
)

/**
 * Matches PlusManagerImpl.<init>(...) (LK0/b;-><init> in 4.17.0).
 *
 * Smali anchor:
 *   Parameter validation strings "storage", "backendSupporter", "notificationAssistant",
 *   "eventsManager", and single-thread name "plus-manager".
 *   .registers 14 (7 locals v0..v6, 7 params p0..p6)
 */
object PlusManagerInitFingerprint : Fingerprint(
    name = "<init>",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    strings = listOf(
        "storage",
        "backendSupporter",
        "notificationAssistant",
        "eventsManager",
        "plus-manager"
    )
)
