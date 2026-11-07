package app.plyrs1.patches.com_moh_nusukapp

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.com_moh_nusukapp.AppProtectionGuardBlockFingerprint
import app.plyrs1.patches.com_moh_nusukapp.COMPATIBILITY_NUSUKAPP
import app.plyrs1.patches.com_moh_nusukapp.ContentBlankerFingerprint
import app.plyrs1.patches.com_moh_nusukapp.DebugConnectionScanFingerprint
import app.plyrs1.patches.com_moh_nusukapp.EnvironmentScanFingerprint
/**
 * Removes the "For security reasons, Nusuk can't run on this device." integrity
 * block enforced by AppProtectionGuard (r91) so the app runs normally on
 * rooted devices, devices with USB debugging active, and with Developer
 * Options enabled.
 *
 * What this patch does:
 * - Neutralizes r91.a(), the single block trigger, so
 *   com.moh.nusukapp.security.BlockedActivity is never launched and
 *   finishAndRemoveTask() no longer tears down running activities.
 * - Neutralizes r91.b(), the ADB / USB debugging / Developer Options scanner
 *   (Settings.Global adb_enabled, adb_wifi_enabled,
 *   development_settings_enabled, and the USB_STATE connected/adb broadcast
 *   extras combined with the remote DEBUG_CONNECTION_BLOCK switch).
 * - Neutralizes r91.d(), which blanks every activity's content view
 *   (android.R.id.content → INVISIBLE) before the block screen appears.
 * - Forces ta1.b() to return false, bypassing the environment scanner that
 *   flags Debug.isDebuggerConnected(), su/sudo binaries in /system, /vendor,
 *   /sbin and $PATH, APK signature certificate mismatches, test-keys in
 *   Build.TAGS, and hook framework detection (Xposed / Frida / Substrate).
 * - Prevents the OK button on the block screen from killing the process via
 *   Process.killProcess(Process.myPid()) by never showing the screen.
 *
 * Net effect: Nusuk starts and runs as if the device passed all integrity
 * checks; no functionality is removed and no other lifecycle callback is
 * affected.
 */
@Suppress("unused")
val bypassIntegrityCheckPatch = bytecodePatch(
    name = "Bypass Integrity Check",
    description = """
        Removes the device integrity block that shows "For security reasons,
        Nusuk can't run on this device." and kills the process. Neutralizes
        the AppProtectionGuard lifecycle callbacks and the environment
        scanner. The app will then run on rooted devices, with USB debugging
        active, and with Developer Options enabled.
    """.trimIndent(),
    default = true
) {
    compatibleWith(COMPATIBILITY_NUSUKAPP)

    execute {
        // 1. Block trigger: never start BlockedActivity and never call
        //    finishAndRemoveTask() on tracked activities.
        AppProtectionGuardBlockFingerprint.method.addInstructions(0, "return-void")

        // 2. ADB / Developer Options scan: skip the whole evaluation,
        //    including the remote DEBUG_CONNECTION_BLOCK feature switch.
        DebugConnectionScanFingerprint.method.addInstructions(0, "return-void")

        // 3. Content blanker: keep every activity's content view visible.
        ContentBlankerFingerprint.method.addInstructions(0, "return-void")

        // 4. Environment scanner: always report a clean device (false).
        EnvironmentScanFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
