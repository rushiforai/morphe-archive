package app.zdrgon.patches.callrecorder.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.callrecorder.shared.Constants.COMPATIBILITY_CALL_RECORDER

/**
 * Call Recorder — Enable Lifetime (3.6.9).
 *
 * The license verdict is computed natively (libcallrec_v2.so,
 * Native.q) from the account's entitlements on the developer's
 * server and posted back to Java, where exactly one method stores
 * it: App.e(state, sub) writes the state to the static App.v field,
 * and every check in the app reads App.v back (the "is licensed"
 * test Lo/cg0;.b() accepts exactly {3, 4}). The state values:
 * 0 = check pending, 1 = trial, 2 = trial expired,
 * 3 = license verified (permanent, no expiry),
 * 4 = subscription (carries an expiry timestamp).
 *
 * This patch rewrites the state argument at the single writer so
 * the stored state is always 3 — the same permanent verified state
 * the $49.99 Lifetime license produces. No server response, token
 * or entitlement is fabricated; the sync still runs and reports
 * what it reports, the app just never stores a lesser state. The
 * trial time gates consult the same state (through Lo/cg0;.b()),
 * so they pass at any date.
 *
 * Why 3.6.9 and not the current 3.7.8: in 3.7.8 the same native
 * library wraps the app's real code in an anti-tamper encrypted
 * payload (identity check + /proc/self/maps scan + page hashes
 * feeding the payload decryption key), which never initializes on
 * a re-signed build — the app hangs on a pulsing screen. The
 * 3.6.9 library predates that protector (Ghidra-verified
 * 2026-11-16): its JNI methods are plain exports, Native.q is a
 * plain state sync with no identity or integrity verification,
 * and nothing in the app depends on a payload loading. The pin
 * can therefore actually run on this build.
 *
 * Experimental, honestly: the verdict computation is native and
 * server-fed. If any native opcode independently re-checks the
 * entitlement instead of trusting the Java state, some feature
 * could stay gated — only an on-device test (record past the
 * trial limits) settles which way this build behaves.
 */
@Suppress("unused")
val enableLifetimePatch = bytecodePatch(
    name = "Enable Lifetime",
    description = "Pins the license state to the permanent verified state (the $49.99 " +
        "Lifetime tier) at its single writer, so the app always runs as a lifetime " +
        "license. Experimental: the license verdict is computed in the app's native " +
        "library, so whether every feature honors the Java-side state can only be " +
        "settled on a device. Call Recorder 3.6.9 only — 3.7.x wraps its native code " +
        "in an anti-tamper payload that cannot run re-signed. Get the exact 3.6.9 APK " +
        "from the developer's own release archive: " +
        "https://github.com/skvalex/callrecorder/releases/tag/3.6.9",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CALL_RECORDER)

    execute {
        // v2 is the first parameter (the state) — proven from the
        // method itself: sput v2 lands in App.v, sput v3 in App.x.
        // Overwriting it at entry makes every store a store of 3.
        AppSetStateFingerprint.method.addInstructions(
            0,
            """
                const/4 v2, 0x3
            """.trimIndent()
        )
    }
}
