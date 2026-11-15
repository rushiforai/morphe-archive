/*
 * Copyright 2026 rushiranpise and hoo-dles
 * https://github.com/rushiranpise/morphe-patches
 * https://github.com/hoo-dles/morphe-patches
 *
 * Ported from the 8.8.8 Nova Launcher patch in rushiranpise/morphe-patches and the 8.8.6
 * patch in hoo-dles/morphe-patches (both GPLv3), re-resolved for 8.9.7.
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
 * Nova Launcher 8.9.7 keeps the Prime decision on the device, in two places that both have to
 * agree before the paid surfaces appear.
 *
 * ### The Prime state
 *
 * `b10.k2.h` is the Prime boolean. 41 classes read it directly, and the static `ix.i1.b()`
 * gate reads it too and ORs in two fallbacks: the separate Nova Prime unlocker APK (the
 * `ix.i1.b` field) and the time-limited grant in `xx.e0.a()`.
 *
 * `b10.k2.a(SharedPreferences)` derives the field on every startup from the persisted `"1"`
 * integer: `h = value != 0` and `c = value == 0x200`, where `0x200` is the value the app
 * itself writes when it accepts the unlocker APK. Forcing that one read to `0x200` therefore
 * reproduces the app's own "Prime" state, including the marker that says Prime came from a
 * direct licence rather than from a subscription.
 *
 * ### The revocation path
 *
 * `xx.b0.w(Context)` reports whether a fresh subscription is on record. Several pieces of the
 * 8.9.7 anti-tamper flow consult it:
 *
 *   - `ix.i1.c(Context)` returns immediately when it is true, so the Play licence (LVL)
 *     checker is never installed. A re-signed APK always fails LVL; the failure handler
 *     (`ci.j4.d(I)`) posts `ix.i1.g`, which re-enters `ix.i1.c()` and runs the reset that
 *     writes `"1"` back to 0 and drops `b10.k2.h` to false.
 *   - the billing sync uses it to decide whether to trust the cached subscription, and sets
 *     `b10.k2.h` back to true when it reports one.
 *
 * The patch only changes these client-side decisions. Anything the app asks Nova's backend
 * for still needs a real account.
 *
 * ### Why 8.9.7 and not 8.9.5
 *
 * 8.9.5 has a settings regression of its own: its custom switches write the preference but
 * never repaint, so every toggle looks dead until the screen is recreated. 8.9.6 fixed that
 * in the app and 8.9.7 keeps the fix, so 8.9.5 remains deliberately unsupported.
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
        // The static gate, so callers that use ix.i1.b() instead of reading the field agree
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

        // Report an active subscription. Besides unlocking the subscription-gated surfaces this
        // keeps the LVL-based Prime revocation from ever starting.
        IsSubscriptionActiveFingerprint.method.returnEarly(true)
    }
}
