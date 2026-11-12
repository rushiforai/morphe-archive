package lab.hutch.patches.security

import app.morphe.patcher.Fingerprint

/**
 * Hutch 4.4.1 ships JailMonkey (com.gantix.JailMonkey) and RootBeer
 * (com.scottyab.rootbeer) as a React Native native module and gates app startup
 * on their answers. R8 renamed the helper classes into two-letter packages, so
 * the descriptors below are pinned to this exact build (versionCode 400426001)
 * and each fingerprint asserts the number of methods it matches. A mismatched
 * build therefore fails loudly during patching instead of silently changing an
 * unrelated method.
 *
 * Names in the comments are the jadx --deobf names; descriptors are the real
 * apktool smali names. The mapping was confirmed by cross-referencing unique
 * string literals (e.g. "AdbEnabled", "fridaserver", "test-keys", "jailMonkey").
 */

/** Lq7/b; (RootBeer). All ten no-argument boolean checks, a/c/d/e/f/g/h/i/k/m. */
internal object RootBeerCheckFingerprint : Fingerprint(
    definingClass = "Lq7/b;",
    returnType = "Z",
    parameters = emptyList(),
)

/** Lj4/b; (JailMonkey su/which-su checker). a()Z plus its two private helpers. */
internal object SuBinaryCheckFingerprint : Fingerprint(
    definingClass = "Lj4/b;",
    returnType = "Z",
    parameters = emptyList(),
)

/** Lj4/c; (isJailBroken aggregate). a()Z (static su check) and c()Z (OR result). */
internal object JailMonkeyAggregateFingerprint : Fingerprint(
    definingClass = "Lj4/c;",
    returnType = "Z",
    parameters = emptyList(),
)

/** Lj4/c$a; (nine-field RootBeer result holder). Its a()Z ORs all nine fields. */
internal object RootBeerAggregateFingerprint : Fingerprint(
    definingClass = "Lj4/c\$a;",
    returnType = "Z",
    parameters = emptyList(),
)

/** Lf4/a; — Settings.Global/Secure "adb_enabled" (USB debugging). */
internal object AdbEnabledFingerprint : Fingerprint(
    definingClass = "Lf4/a;",
    name = "a",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

/** Lh4/a; — Xposed/Substrate stack scan, frida-server services, app blacklist. */
internal object HookCheckFingerprint : Fingerprint(
    definingClass = "Lh4/a;",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

/** Li4/a; — apps holding android.permission.ACCESS_MOCK_LOCATION. */
internal object MockLocationFingerprint : Fingerprint(
    definingClass = "Li4/a;",
    name = "a",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

/** Lg4/a; — FLAG_EXTERNAL_STORAGE / /mnt/ /sdcard/ install location. */
internal object ExternalStorageFingerprint : Fingerprint(
    definingClass = "Lg4/a;",
    name = "a",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

/** The two JailMonkey @ReactMethod promises: isDebuggedMode / isDevelopmentSettingsMode. */
internal object JailMonkeyPromiseFingerprint : Fingerprint(
    definingClass = "Lcom/gantix/JailMonkey/JailMonkeyModule;",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/Promise;"),
)

/** react-native-device-info emulator predicate (goldfish/ranchu/generic/...). */
internal object DeviceInfoEmulatorSyncFingerprint : Fingerprint(
    definingClass = "Lcom/learnium/RNDeviceInfo/RNDeviceModule;",
    name = "isEmulatorSync",
    returnType = "Z",
    parameters = emptyList(),
)

/** react-native-device-info isEmulator(Promise)V. */
internal object DeviceInfoEmulatorFingerprint : Fingerprint(
    definingClass = "Lcom/learnium/RNDeviceInfo/RNDeviceModule;",
    name = "isEmulator",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/Promise;"),
)

/** RNExitApp.exitApp()V — the force-quit behind the refusal dialog. */
internal object RnExitAppFingerprint : Fingerprint(
    definingClass = "Lcom/github/wumke/RNExitApp/RNExitApp;",
    name = "exitApp",
    returnType = "V",
    parameters = emptyList(),
)

/** RNExitApp delegate: Process.killProcess(Process.myPid()). */
internal object ExitAppDelegateFingerprint : Fingerprint(
    definingClass = "Lcom/github/wumke/RNExitApp/a;",
    name = "a",
    returnType = "V",
    parameters = emptyList(),
)
