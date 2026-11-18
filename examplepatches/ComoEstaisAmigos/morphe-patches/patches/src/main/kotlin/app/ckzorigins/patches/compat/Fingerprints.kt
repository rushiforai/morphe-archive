package app.ckzorigins.patches.compat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

internal object VerifySignatureFingerprint : Fingerprint(
    definingClass = "Lcom/glu/plugins/AJTUtil;",
    name = "VerifySignature",
    returnType = "V",
    parameters = listOf(),
    strings = listOf("VerifySignature()"),
)

/** Filter 1 is the `Intent(String)` constructor. The next instruction overwrites the string register. */
internal object BindMarketBillingServiceFingerprint : Fingerprint(
    definingClass = "Lcom/glu/plugins/google/BillingService;",
    name = "bindToMarketBillingService",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("com.android.vending.billing.MarketBillingService.BIND"),
        methodCall(definingClass = "Landroid/content/Intent;", name = "<init>", location = MatchAfterImmediately()),
        methodCall(name = "bindService"),
    ),
)

/** Filter 1 is the `Intent(String)` constructor. Same setPackage as the billing bind. */
internal object LicenseCheckAccessFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/vending/licensing/LicenseChecker;",
    name = "checkAccess",
    returnType = "V",
    parameters = listOf("Lcom/google/android/vending/licensing/LicenseCheckerCallback;"),
    filters = listOf(
        string("Y29tLmFuZHJvaWQudmVuZGluZy5saWNlbnNpbmcuSUxpY2Vuc2luZ1NlcnZpY2U="),
        methodCall(definingClass = "Landroid/content/Intent;", name = "<init>"),
        methodCall(definingClass = "Landroid/content/Context;", name = "bindService"),
    ),
)

/**
 * Tune/MobileAppTracker reads IMEI. On Android 10 and later TelephonyManager.getDeviceId
 * throws SecurityException and kills the process after the intro, even with targetSdk 25.
 */
internal object MobileAppTrackerDeviceIdFingerprint : Fingerprint(
    definingClass = "Lcom/mobileapptracker/MobileAppTracker;",
    name = "getDeviceId",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

internal object MobileAppTrackerDeviceIdFromContextFingerprint : Fingerprint(
    definingClass = "Lcom/mobileapptracker/MobileAppTracker;",
    name = "getDeviceId",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;"),
)

internal object UnityDeviceIdFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/player/UnityPlayer;",
    name = "getDeviceUniqueIdentifier",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

/**
 * PlayHaven writes SharedPreferences with MODE_WORLD_WRITEABLE. Android N and later throw
 * SecurityException. The hand-packaged APK turns that const/4 2 into 0 (MODE_PRIVATE).
 */
internal object PlayHavenApiRequestInitFingerprint : Fingerprint(
    definingClass = "Lcom/playhaven/src/common/PHAPIRequest;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        methodCall(definingClass = "Landroid/content/Context;", name = "getSharedPreferences"),
    ),
)

/**
 * The APK expansion helper also checks file size. The hand-packaged APK returns exists() only,
 * so a leftover OBB with the wrong length is not deleted.
 */
internal object ExpansionFileExistsFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/vending/expansion/downloader/Helpers;",
    name = "doesFileExist",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "J", "Z"),
    filters = listOf(
        methodCall(definingClass = "Ljava/io/File;", name = "exists"),
    ),
)
