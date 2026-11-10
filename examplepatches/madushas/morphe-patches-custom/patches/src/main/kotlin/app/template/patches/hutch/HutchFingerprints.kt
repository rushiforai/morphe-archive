package app.template.patches.hutch

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for Hutch App v4.4.1 (versionCode 400426001), package
 * `com.omobio.etisalatone`.
 *
 * Hutch is a React Native app built by Omobio (the same vendor as MyDialog), but
 * unlike MyDialog its app classes are R8-shrunk, so ONLY library classes and a
 * few framework entry points keep real names. Everything below is a **library**
 * class, so the names survive as long as the vendored dependency version does —
 * still, re-verify on every app update.
 *
 * IMPORTANT: jadx deobfuscates the R8-shortened survivors (e.g. `Lj4/c;` renders
 * as `AbstractC2621c`). The fingerprints below use the **real on-disk dex names**
 * (verified with dexdump) — do not copy jadx's names.
 */

// --- jail-monkey (com.gantix.JailMonkey) — the device-integrity engine ---------
// Its `getConstants()` folds the synchronous probes into the RN module's constant
// map; the JS gate (`checkDeviceSecurityStatus`) reads them as plain properties.

/** j4.c.c()Z — `isJailBroken`: RootBeer native + su/Magisk binary/path probes. */
val JailMonkeyIsJailBroken = Fingerprint(
    definingClass = "Lj4/c;",
    name = "c",
    returnType = "Z",
    parameters = emptyList(),
)

/** j4.c.b()Ljava/util/Map; — `rootedDetectionMethods`: per-probe result map. */
val JailMonkeyRootedDetectionMethods = Fingerprint(
    definingClass = "Lj4/c;",
    name = "b",
    returnType = "Ljava/util/Map;",
    parameters = emptyList(),
)

/** h4.a.c(Context)Z — `hookDetected`: Frida / Xposed / Cydia / substrate probes. */
val JailMonkeyHookDetected = Fingerprint(
    definingClass = "Lh4/a;",
    name = "c",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

/** i4.a.a(Context)Z — `canMockLocation`: mock-location provider probe. */
val JailMonkeyCanMockLocation = Fingerprint(
    definingClass = "Li4/a;",
    name = "a",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

/** g4.a.a(Context)Z — `isOnExternalStorage`: app dir on removable storage. */
val JailMonkeyOnExternalStorage = Fingerprint(
    definingClass = "Lg4/a;",
    name = "a",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

/** f4.a.a(Context)Z — `AdbEnabled`: USB-debugging / development-settings probe. */
val JailMonkeyAdbEnabled = Fingerprint(
    definingClass = "Lf4/a;",
    name = "a",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * JailMonkeyModule.isDebuggedMode(Promise)V — async debugger probe. Must RESOLVE
 * the promise (returning void without resolving would hang the JS `await`).
 */
val JailMonkeyIsDebuggedMode = Fingerprint(
    definingClass = "Lcom/gantix/JailMonkey/JailMonkeyModule;",
    name = "isDebuggedMode",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/Promise;"),
)

/** JailMonkeyModule.isDevelopmentSettingsMode(Promise)V — async dev-options probe. */
val JailMonkeyIsDevelopmentSettingsMode = Fingerprint(
    definingClass = "Lcom/gantix/JailMonkey/JailMonkeyModule;",
    name = "isDevelopmentSettingsMode",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/Promise;"),
)

// --- react-native-device-info — the emulator probe used by the same JS gate ----

/** RNDeviceModule.isEmulatorSync()Z — Build.FINGERPRINT/MODEL/… emulator heuristic. */
val DeviceInfoIsEmulatorSync = Fingerprint(
    definingClass = "Lcom/learnium/RNDeviceInfo/RNDeviceModule;",
    name = "isEmulatorSync",
    returnType = "Z",
    parameters = emptyList(),
)

// --- react-native-ssl-pinning — the pinned OkHttp client builder --------------

/**
 * B7.a.e(n, String, ReadableArray, ReadableMap)z — builds the *pinned* OkHttp
 * client (public-key pinning or a cert-bundle trust manager) for
 * `RNSslPinning.fetch` when pinning is requested.
 *
 * The signature is static; the matching no-pinning builder is
 * `B7.a.c(n, String, ReadableMap)z` (the `disableAllSecurity` path).
 */
val SslPinningClientBuilder = Fingerprint(
    definingClass = "LB7/a;",
    name = "e",
    returnType = "Lokhttp3/z;",
    parameters = listOf(
        "Lokhttp3/n;",
        "Ljava/lang/String;",
        "Lcom/facebook/react/bridge/ReadableArray;",
        "Lcom/facebook/react/bridge/ReadableMap;",
    ),
)
