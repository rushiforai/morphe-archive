package app.railone.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.railone.patches.shared.Constants.COMPATIBILITY_RAILONE
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * RailOne / Aikyam (org.cris.aikyam) - bypass the app's anti-tamper checks.
 *
 * What the app does when it does not like the running build:
 *  - the native `libnative-lib.so` SDK (loaded from `AikyamApplication.onCreate`) detects USB
 *    debugging / a re-signed APK and calls `clearApplicationUserData()` from C++, i.e. it wipes
 *    the app's own data and kills the process. No Java-side patch can stop that once the SDK
 *    is running, which is why patch #1 has to disarm it before anything else matters.
 *  - the Flutter layer independently asks Java for `adb_enabled` / `adb_wifi_enabled` /
 *    `development_settings_enabled` and for APK signature verification, over a MethodChannel.
 *
 * All patches are idempotent rewrites of method entry points: they insert a return at
 * instruction 0 rather than deleting the original body.
 */

@Suppress("unused")
val disableNativeSecuritySdkPatch = bytecodePatch(
    name = "Disable native security SDK",
    description = "Stops AikyamApplication.onCreate() from loading libnative-lib.so, disarming the " +
        "native anti-tamper SDK that force-stops the app and wipes its data. Root cause fix: " +
        "the other patches only matter once this one is applied.",
    default = true
) {
    compatibleWith(COMPATIBILITY_RAILONE)

    execute {
        ApplicationOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-super {p0}, Landroid/app/Application;->onCreate()V
                return-void
            """
        )
    }
}

@Suppress("unused")
val bypassDebuggingDetectionPatch = bytecodePatch(
    name = "Bypass USB-debugging detection",
    description = "Forces the adb_enabled, adb_wifi_enabled and development_settings_enabled checks " +
        "to return false, so the app runs normally while USB debugging / developer options are on.",
    default = true
) {
    compatibleWith(COMPATIBILITY_RAILONE)

    execute {
        listOf(
            AdbEnabledFingerprint,
            AdbWifiEnabledFingerprint,
            DevelopmentSettingsEnabledFingerprint
        ).forEach { fingerprint ->
            fingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }
    }
}

@Suppress("unused")
val bypassSignatureVerificationPatch = bytecodePatch(
    name = "Bypass signature verification",
    description = "Forces the app's own signing-certificate check (SHA-256 of the APK signature) to " +
        "return true, so a re-signed build is accepted by the Flutter layer.",
    default = true
) {
    compatibleWith(COMPATIBILITY_RAILONE)

    execute {
        SignatureVerificationFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}

@Suppress("unused")
val bypassRjsnifferAdbCheckPatch = bytecodePatch(
    name = "Bypass rjsniffer ADB check",
    description = "Neutralises the rjsniffer library's own adb_enabled check. It runs in the app's " +
        "isolated :com.emrys.rjsniffer.rjsniffer.Sniffer process, independently of the main app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_RAILONE)

    execute {
        // Zero the register holding the adb_enabled value right after it is read, so the
        // following comparison always takes the "debugging is off" path.
        val match = RjsnifferAdbCheckFingerprint.instructionMatches.last()
        val register = match.getInstruction<OneRegisterInstruction>().registerA
        RjsnifferAdbCheckFingerprint.method.addInstructions(match.index + 1, "const/4 v$register, 0x0")
    }
}
