package app.template.patches.hutch.security

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.hutch.DeviceInfoIsEmulatorSync
import app.template.patches.hutch.JailMonkeyAdbEnabled
import app.template.patches.hutch.JailMonkeyCanMockLocation
import app.template.patches.hutch.JailMonkeyHookDetected
import app.template.patches.hutch.JailMonkeyIsDevelopmentSettingsMode
import app.template.patches.hutch.JailMonkeyIsDebuggedMode
import app.template.patches.hutch.JailMonkeyIsJailBroken
import app.template.patches.hutch.JailMonkeyOnExternalStorage
import app.template.patches.hutch.JailMonkeyRootedDetectionMethods
import app.template.patches.shared.Constants.HUTCH_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.returnEarly

/**
 * Hutch refuses to run on a device it considers unsafe. The gate is entirely
 * client-side, driven from JS (`checkDeviceSecurityStatus`, a Hermes function that
 * the RN startup/login flow awaits) via the **jail-monkey** and
 * **react-native-device-info** native modules:
 *
 *  1. `JailMonkey.isDebuggedMode()`            → "Developer options…"
 *  2. `JailMonkey.isDevelopmentSettingsMode()` → "Developer options…"
 *  3. `JailMonkey.AdbEnabled` (constant)       → "USB debugging is turned on…"
 *  4. `JailMonkey.isJailBroken` (constant)     → "This device has been modified…"
 *  5. `JailMonkey.hookDetected` (constant)     → "Suspicious tools were detected…"
 *  6. `DeviceInfo.isEmulator()`                → "Emulators are not supported…"
 *
 * Steps 1–2 are async (`Promise`-returning) natives: they are rewritten to
 * **resolve false** — a plain `returnEarly` would leave the JS `await` hanging.
 * Steps 3–5 are synchronous probes folded into the module's constant map by
 * `getConstants()`; every one is forced to `false`, so the constants the JS reads
 * come back clean. Step 6 is the synchronous `isEmulatorSync()` that backs the
 * async `isEmulator()`.
 *
 * Note on honesty: Hutch performs **no Play Integrity / SafetyNet token request**
 * and no client-side APK-signature verification, so there is nothing to "spoof"
 * here — the whole decision lives in these probes.
 */
@Suppress("unused")
val hutchDisableSecurityChecksPatch = bytecodePatch(
    name = "Disable security checks",
    description = "Stops Hutch from refusing to run on rooted, adb-enabled, " +
        "developer-options or emulator devices. The device-integrity probes " +
        "(jail-monkey + react-native-device-info) all answer \"clean\".",
    default = true,
) {
    compatibleWith(HUTCH_COMPATIBILITY)

    execute {
        // Synchronous probes folded into JailMonkey's constant map.
        JailMonkeyIsJailBroken.method.returnEarly(false)
        JailMonkeyHookDetected.method.returnEarly(false)
        JailMonkeyAdbEnabled.method.returnEarly(false)
        JailMonkeyCanMockLocation.method.returnEarly(false)
        JailMonkeyOnExternalStorage.method.returnEarly(false)

        // Per-probe map: hand back an empty (nothing-detected) map.
        JailMonkeyRootedDetectionMethods.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                    new-instance v0, Ljava/util/HashMap;
                    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V
                    return-object v0
                """.trimIndent(),
            )
        }

        // Async probes: resolve(false) so the awaiting JS keeps moving.
        for (fingerprint in listOf(JailMonkeyIsDebuggedMode, JailMonkeyIsDevelopmentSettingsMode)) {
            fingerprint.method.apply {
                clearBody()
                addInstructions(
                    0,
                    """
                        sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                        invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                        return-void
                    """.trimIndent(),
                )
            }
        }

        // Emulator heuristic (react-native-device-info).
        DeviceInfoIsEmulatorSync.method.returnEarly(false)
    }
}
