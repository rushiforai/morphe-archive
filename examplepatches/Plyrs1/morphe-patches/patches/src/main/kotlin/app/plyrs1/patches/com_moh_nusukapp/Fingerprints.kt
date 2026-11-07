package app.plyrs1.patches.com_moh_nusukapp

import app.morphe.patcher.Fingerprint

// ─── r91 (AppProtectionGuard) ────────────────────────────────────────────────

/**
 * r91.a()V — block trigger and process killer.
 *
 * The single convergence point for both integrity trigger paths:
 *   - onActivityPreCreated → ta1.b() == true (root / debugger / environment)
 *   - onActivityStarted / USB_STATE receiver → r91.b() (ADB / Developer Options)
 *
 * Sets the permanent blocked flag (c=true), blanks all activity views via d(),
 * starts com.moh.nusukapp.security.BlockedActivity with
 * FLAG_ACTIVITY_NEW_TASK | FLAG_ACTIVITY_CLEAR_TASK (0x10008000), and calls
 * finishAndRemoveTask() on every tracked activity.
 * Returning early prevents the "For security reasons, Nusuk can't run on
 * this device." screen from ever appearing and stops task teardown.
 */
object AppProtectionGuardBlockFingerprint : Fingerprint(
    definingClass = "Lcom/moh/nusukapp/r91;",
    name = "a",
    returnType = "V",
    parameters = emptyList()
)

/**
 * r91.b()V — ADB / USB debugging / Developer Options scanner.
 *
 * Evaluates system state via oh0.h(ContentResolver, Intent):
 *   - Settings.Global "development_settings_enabled" == 1
 *   - Settings.Global "adb_enabled" == 1
 *   - Settings.Global "adb_wifi_enabled" == 1
 *   - USB_STATE broadcast extras (connected == true && adb == true)
 * and combines it with a remote DEBUG_CONNECTION_BLOCK feature switch
 * (DebugConnectionSwitch ON / OFF / NOT_KNOWN_YET). When the switch is not
 * explicitly OFF and any ADB/developer condition holds, calls a() to block.
 * Returning early disables the entire scan.
 */
object DebugConnectionScanFingerprint : Fingerprint(
    definingClass = "Lcom/moh/nusukapp/r91;",
    name = "b",
    returnType = "V",
    parameters = emptyList()
)

/**
 * r91.d()V — activity content blanker.
 *
 * Walks all tracked activities, looks up android.R.id.content (0x1020002)
 * and sets visibility to INVISIBLE (4), adding them to the hidden list f.
 * Called from a() right before BlockedActivity is started, which makes the
 * screen go blank instead of showing a graceful block.
 * Returning early keeps all activity content visible and functional.
 */
object ContentBlankerFingerprint : Fingerprint(
    definingClass = "Lcom/moh/nusukapp/r91;",
    name = "d",
    returnType = "V",
    parameters = emptyList()
)

// ─── ta1 (Root / Debugger / Environment Scanner) ─────────────────────────────

/**
 * ta1.b()Z — environment integrity verdict.
 *
 * Runs ~2800 lines of reflective, string-obfuscated checks and ORs three flags:
 *   - b: android.os.Debug.isDebuggerConnected() (or check threw)
 *   - c: File.exists() on /system/bin/su, /system/xbin/su, /system/sbin/su,
 *         /vendor/bin/su, /sbin/su, /sudo variants, and every $PATH entry
 *   - d: APK signature certificate mismatch, test-keys in Build.TAGS,
 *         hook frameworks (Xposed / Frida / Substrate), cloner detection
 * Returns true (untrusted) when any flag is set. r91.onActivityPreCreated
 * invokes a() on a true result.
 * Forcing a constant false return makes the environment scan always pass.
 */
object EnvironmentScanFingerprint : Fingerprint(
    definingClass = "Lcom/moh/nusukapp/ta1;",
    name = "b",
    returnType = "Z",
    parameters = emptyList()
)
