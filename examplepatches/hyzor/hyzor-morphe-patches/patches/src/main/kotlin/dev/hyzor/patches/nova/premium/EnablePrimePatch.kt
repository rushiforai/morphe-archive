/*
 * Copyright 2026 rushiranpise and hoo-dles
 * https://github.com/rushiranpise/morphe-patches
 * https://github.com/hoo-dles/morphe-patches
 *
 * Ported from the 8.8.8 Nova Launcher patch in rushiranpise/morphe-patches and the 8.8.6
 * patch in hoo-dles/morphe-patches (both GPLv3), re-resolved for 9.0.1.
 */

package dev.hyzor.patches.nova.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.hyzor.patches.nova.shared.Constants.NOVA_LAUNCHER
import dev.hyzor.patches.util.returnEarly

/** The persisted `"1"` value Nova writes when it accepts a direct Prime licence. */
private const val PRIME_DIRECT_LICENSE = "0x200"

/**
 * Nova Launcher 9.0.1 keeps the Prime decision on the device, in two places that both have to
 * agree before the paid surfaces appear.
 *
 * ### The Prime state
 *
 * `p00.i2.h` is the Prime boolean. The settings screens read it directly for the version row
 * and the Prime badges, and the static `rw.e1.b()` gate reads it too and ORs in two fallbacks:
 * the separate Nova Prime unlocker APK (the `rw.e1.b` field) and the time-limited grant in
 * `lx.y0.a()`.
 *
 * `p00.i2.a(SharedPreferences)` derives the field on every startup from the persisted `"1"`
 * integer: `h = value != 0` and `c = value == 0x200`, where `0x200` is the value the app
 * itself writes when it accepts the unlocker APK. Forcing that one read to `0x200` therefore
 * reproduces the app's own "Prime" state, including the marker that says Prime came from a
 * direct licence rather than from a subscription.
 *
 * ### The revocation path
 *
 * `lx.v0.v(Context)` reports whether a fresh subscription is on record. `rw.e1.c(Context)`
 * returns immediately when it does, so the licence/revocation setup is never installed; the
 * delayed re-check that `rw.c0` and `rw.d1` post after seeing a Prime field re-enters through
 * `c()` as well, so it becomes a no-op too. Without this leg a re-signed build starts the
 * licence path, which writes `"1"` back to 0 and drops `p00.i2.h`.
 *
 * 9.0.1 split the old `xx.b0.w(Context)` in two: `lx.v0.v()` is the subscription-on-record
 * check, while `lx.v0.w()` additionally requires `plus_active`, the newer Nova Plus tier.
 * Only `v()` is forced here, so Prime is unlocked and Plus is deliberately left gated.
 *
 * ### Why 9.0.1 and not 8.9.5
 *
 * 8.9.5 has a settings regression of its own: its custom switches write the preference but
 * never repaint, so every toggle looks dead until the screen is recreated. 8.9.6 fixed that
 * in the app and every later release keeps the fix, so 8.9.5 remains deliberately
 * unsupported.
 */
@Suppress("unused")
val enablePrimePatch = bytecodePatch(
    name = "Enable Prime",
    description = "Unlocks Nova Launcher Prime by starting the app in the prime state and " +
        "reporting an active subscription, so the settings and features gated on Prime are " +
        "available.",
    default = true,
) {
    compatibleWith(NOVA_LAUNCHER)

    execute {
        // The static gate, so callers that use rw.e1.b() instead of reading the field agree
        // with the field value forced below.
        IsPrimeFingerprint.method.returnEarly(true)

        // The startup read of the persisted Prime value. Overwriting the getInt() result with
        // 0x200 makes both the field and the "direct licence" marker come out as the app's own
        // Prime state; it is re-applied on every startup.
        val primeStateInit = PrimeStateInitFingerprint.method
        val persistedPrimeRead = PrimeStateInitFingerprint.instructionMatches.lastOrNull {
            it.instruction.opcode == Opcode.MOVE_RESULT
        } ?: throw PatchException(
            "Nova Launcher: PrimeStateInitFingerprint matched no getInt() move-result",
        )
        val valueRegister = persistedPrimeRead.getInstruction<OneRegisterInstruction>().registerA

        primeStateInit.addInstructions(
            persistedPrimeRead.index + 1,
            "const/16 v$valueRegister, $PRIME_DIRECT_LICENSE",
        )

        // Report an active subscription on record. Besides unlocking the subscription-gated
        // surfaces this keeps the licence revocation setup from ever starting.
        IsSubscriptionActiveFingerprint.method.returnEarly(true)
    }
}
