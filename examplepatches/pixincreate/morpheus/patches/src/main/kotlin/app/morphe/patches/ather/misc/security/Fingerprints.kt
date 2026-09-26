/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.misc.security

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches [com.ather.common.utils.coreUtils.SecurityCheck.performSecurityCheck].
 *
 * ```
 * public final CheckResult performSecurityCheck(boolean developerOptionsEnabled)
 * ```
 *
 * The method returns `CheckResult.DeveloperOptionsEnabled` when Developer Options
 * are on and `CheckResult.Compromised` when root/Frida indicators are found.
 * MainActivity feeds the result into a Compose state that gates the app behind a
 * blocking warning screen.
 *
 * The class name is stable (not obfuscated) across 13.x builds. The fingerprint
 * pins the defining class plus the exact signature so it survives method
 * reordering.
 */
internal object PerformSecurityCheckFingerprint : Fingerprint(
    definingClass = "Lcom/ather/common/utils/coreUtils/SecurityCheck;",
    name = "performSecurityCheck",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/ather/common/utils/coreUtils/SecurityCheck\$CheckResult;",
    parameters = listOf("Z"),
)

/**
 * Matches `AndroidUtilsLight.getPackageCertificateHashBytes`.
 *
 * ```
 * public static byte[] getPackageCertificateHashBytes(Context context, String packageName)
 * ```
 *
 * Firebase Installations, Firebase Auth and Remote Config all funnel their
 * `X-Android-Cert` header through this helper, and Ather's Google API key is
 * restricted to Ather's own signing certificate. Both the class and the method name
 * are obfuscated in 13.5.0, so the fingerprint pins the defining class and the exact
 * signature rather than readable names.
 */
internal object PackageCertificateHashFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/common/util/c;",
    name = "e",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "[B",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
)

/**
 * Matches PairIP's `Application.attachBaseContext`.
 *
 * ```
 * protected void attachBaseContext(Context context)
 * ```
 *
 * PairIP injects this class as the app's real `Application`, and its
 * `attachBaseContext` is the single place where the Play licence check starts. The
 * class name survives obfuscation because PairIP must reference it from the manifest.
 */
internal object PairIpAttachBaseContextFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/application/Application;",
    name = "attachBaseContext",
    accessFlags = listOf(AccessFlags.PROTECTED),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)
