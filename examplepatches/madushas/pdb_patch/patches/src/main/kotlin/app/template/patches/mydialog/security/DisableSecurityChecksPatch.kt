package app.template.patches.mydialog.security

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.mydialog.CertificatePinCheck
import app.template.patches.mydialog.ComprehensiveSecurityCheck
import app.template.patches.mydialog.IsSslPinningBypassed
import app.template.patches.mydialog.MainActivityContinuousMonitorC2
import app.template.patches.mydialog.MainActivityKillA1
import app.template.patches.mydialog.MainActivityKillB1
import app.template.patches.mydialog.MainActivitySecurityThreadA2
import app.template.patches.mydialog.MainActivitySecurityThreadZ1
import app.template.patches.mydialog.SecurityValidatorIsSecure
import app.template.patches.mydialog.VerifyAppSignature
import app.template.patches.shared.Constants.MYDIALOG_COMPATIBILITY
import app.template.patches.shared.returnEarly

/**
 * MyDialog self-defends on every launch: a background thread runs root / Magisk /
 * Frida-file / debugger / QEmu / taint checks (`MainActivity.Z1`, re-run from
 * `onResume` via `a2`, plus a 3s continuous monitor `c2`), and on any hit shows a
 * toast and calls `finish()` — the app closes. Even a normal developer device
 * trips it (`adb_enabled`, `development_settings_enabled` are checked), and an
 * emulator trips the QEmu probes, so nothing can be evaluated without this patch.
 *
 * Play Integrity failures funnel through the same `A1(int)` kill, so neutering it
 * also stops integrity-failure exits on devices without Play certification. The
 * integrity token request itself is left intact (server-side; not fakeable).
 *
 *  - `A1` / `B1`: the two `finish()` paths — neutralized.
 *  - `Z1` / `a2` / `c2`: the check threads — never started (they only toast/kill).
 *  - `SecurityManager.performComprehensiveSecurityCheck` → `true` (clean) for any
 *    JS- or library-side callers.
 *  - `SecurityManager.verifyAppSignature` → `true` so patched builds pass the
 *    baked-in signature check.
 *  - `SecurityValidator.isSecure` → `true`.
 *  - `SecurityManager.isSSLPinningBypassed` → `false` (a *negative*; it is a
 *    heuristic that flags hooking frameworks, and false is the honest answer).
 *
 * `SecurityManagerAdvance` (native Frida checks) is dead code in 18.6.5 — it
 * loads `libsecurity.so`, which is not shipped, and nothing references the class.
 */
@Suppress("unused")
val myDialogDisableSecurityChecksPatch = bytecodePatch(
    name = "Disable security checks",
    description = "Stops MyDialog from exiting itself on root/debug/emulator/adb " +
        "detection and on Play Integrity failure. Signature verification is " +
        "reported clean so patched builds pass.",
    default = true,
) {
    compatibleWith(MYDIALOG_COMPATIBILITY)

    execute {
        // The two finish() paths (security hits + integrity failure).
        MainActivityKillA1.method.returnEarly()
        MainActivityKillB1.method.returnEarly()

        // The check threads never start.
        MainActivitySecurityThreadZ1.method.returnEarly()
        MainActivitySecurityThreadA2.method.returnEarly()
        MainActivityContinuousMonitorC2.method.returnEarly()

        // Aggregate checks read from elsewhere (JS/SDK) answer "clean".
        ComprehensiveSecurityCheck.method.returnEarly(true)
        VerifyAppSignature.method.returnEarly(true)
        SecurityValidatorIsSecure.method.returnEarly(true)
        IsSslPinningBypassed.method.returnEarly(false)
    }
}
