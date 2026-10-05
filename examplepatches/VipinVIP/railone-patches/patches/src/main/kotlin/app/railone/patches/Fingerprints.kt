package app.railone.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Fingerprints for RailOne (org.cris.aikyam).
 *
 * Every release re-obfuscates the class and method names (v2.1.58 `FUOfuro$J4Wu0l` ->
 * v2.1.62 `Qr79t$OXTLsup` -> v2.1.66 `TKhyfW$Xn1IRSv`), so nothing here may reference an
 * obfuscated name. Match on the string constants and the framework APIs the checks call
 * instead - those are stable.
 *
 * Each fingerprint below was verified to match exactly one method in v2.1.66
 * (116,418 methods across 21,574 smali files scanned).
 */

/**
 * `com.example.aikyam.AikyamApplication.onCreate()` - the only place `libnative-lib.so`
 * is loaded. That native SDK performs the anti-tamper check and calls
 * `clearApplicationUserData()` from C++ when it dislikes the build.
 *
 * The application class name itself is *not* obfuscated, so it is safe to pin exactly.
 */
object ApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/example/aikyam/AikyamApplication;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("native-lib"),
        methodCall(smali = "Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V")
    )
)

/**
 * `adb_enabled` check - read from Settings.Global and returned as a boolean.
 * Flutter calls this over the MethodChannel, independently of the native SDK.
 */
object AdbEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("adb_enabled"),
        methodCall(
            smali = "Landroid/provider/Settings\$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I"
        )
    )
)

/** `adb_wifi_enabled` - wireless debugging check. */
object AdbWifiEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("adb_wifi_enabled"),
        methodCall(
            smali = "Landroid/provider/Settings\$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I"
        )
    )
)

/**
 * `development_settings_enabled` - read with the two-argument `getInt` overload
 * (no default value), which is why it needs its own filter shape.
 */
object DevelopmentSettingsEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("development_settings_enabled"),
        methodCall(
            smali = "Landroid/provider/Settings\$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I"
        )
    )
)

/**
 * APK signature verification: hashes the signing certificate with SHA-256, Base64-encodes it
 * and compares it against an expected value supplied by Flutter (`"mySign"` parameter).
 * Returns the comparison result as a boolean.
 */
object SignatureVerificationFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    filters = listOf(
        string("mySign"),
        methodCall(smali = "Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;"),
        string("SHA-256")
    )
)

/**
 * rjsniffer's own `adb_enabled` check inside its Flutter plugin handler. It runs in a separate
 * isolated process (`:com.emrys.rjsniffer.rjsniffer.Sniffer`), so patching the main app is not
 * enough on its own.
 *
 * The library package `com/emrys/rjsniffer/rjsniffer/` is stable even though the class name is
 * not (TEEjfELP -> BoRK2H -> WiYOP6), so the fingerprint is scoped to that package.
 *
 * NOTE: `definingClass` must be a real dex type descriptor. A *leading colon* declaration like
 * ":com/emrys/rjsniffer/rjsniffer/" (which the patcher docs suggest for packages) resolves to a
 * StringComparisonType.CONTAINS match against the descriptor "Lcom/emrys/rjsniffer/rjsniffer/X;",
 * so it can never match. "Lcom/emrys/rjsniffer/rjsniffer/" (no trailing semicolon) gives a
 * STARTS_WITH match, which is what a package prefix needs.
 */
object RjsnifferAdbCheckFingerprint : Fingerprint(
    definingClass = "Lcom/emrys/rjsniffer/rjsniffer/",
    name = "onMethodCall",
    returnType = "V",
    filters = listOf(
        string("adb_enabled"),
        methodCall(
            smali = "Landroid/provider/Settings\$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I"
        ),
        // The value the check reads; the next instruction compares it against 1.
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately())
    )
)
