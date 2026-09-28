/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.misc.security

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches the security-check factory the app runs on start-up.
 *
 * ```
 * public static CheckResult b(boolean developerOptionsEnabled)
 * ```
 *
 * The method returns `DeveloperOptionsEnabled` when Developer Options are on,
 * `Compromised` when root, LSPosed or Frida indicators are found and `Secure`
 * otherwise. MainActivity stores the result in the Compose state that gates the app
 * behind a blocking warning screen.
 *
 * The names are obfuscated, and the 13.5.1 build renamed every one of them:
 * `SecurityCheck` -> `w`, `CheckResult` -> `v`, `Secure` -> `u`,
 * `Compromised` -> `s` and `DeveloperOptionsEnabled` -> `t`. The fingerprint pins
 * the defining class, the method name and the signature the 13.5.1 build ships.
 */
internal object SecurityCheckFingerprint : Fingerprint(
    definingClass = "Lcom/ather/common/utils/coreUtils/w;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lcom/ather/common/utils/coreUtils/v;",
    parameters = listOf("Z"),
)

/**
 * Matches the native signature guard that closes the app when the APK is not signed
 * by Ather.
 *
 * ```
 * public final boolean a(c callback)
 * ```
 *
 * `MainActivity.onCreate` calls the guard before it does anything else and returns
 * when the guard returns false. The class loads the native `atherkeys` library and
 * asks it to verify the APK's signing certificate, then runs the callback when the
 * check fails. A re-signed build therefore never reaches the UI.
 */
internal object SignatureGuardFingerprint : Fingerprint(
    definingClass = "Lcom/ather/common/utils/coreUtils/SignatureGuard;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lcom/athermobileapp/navigation/c;"),
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
 *
 * The 13.5.1 build no longer bundles PairIP, so this fingerprint matches nothing
 * there and the patch that uses it leaves the app untouched.
 */
internal object PairIpAttachBaseContextFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/application/Application;",
    name = "attachBaseContext",
    accessFlags = listOf(AccessFlags.PROTECTED),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)
