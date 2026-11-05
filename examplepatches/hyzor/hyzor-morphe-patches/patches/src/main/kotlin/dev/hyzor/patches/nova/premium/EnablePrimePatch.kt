/*
 * Copyright 2026 rushiranpise and hoo-dles
 * https://github.com/rushiranpise/morphe-patches
 * https://github.com/hoo-dles/morphe-patches
 *
 * Ported from the 8.8.8 Nova Launcher patch in rushiranpise/morphe-patches and the 8.8.6
 * patch in hoo-dles/morphe-patches (both GPLv3), re-resolved for 8.9.6.
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
 * Nova Launcher 8.9.6 keeps the Prime decision on the device, in two places that both have to
 * agree before the paid surfaces appear.
 *
 * ### The Prime state
 *
 * `j10.h2.h` is the Prime boolean. More than forty classes read it directly, and the static
 * `qx.b1.b()` gate reads it too and ORs in two fallbacks: the separate Nova Prime unlocker
 * APK (the `qx.b1.b` field) and the time-limited grant in `gy.g0.a()`.
 *
 * `j10.h2.a(SharedPreferences)` derives the field on every startup from the persisted `"1"`
 * integer: `h = value != 0` and `c = value == 0x200`, where `0x200` is the value the app
 * itself writes when it accepts the unlocker APK. Forcing that one read to `0x200` therefore
 * reproduces the app's own "Prime" state, including the marker that says Prime came from a
 * direct licence rather than from a subscription.
 *
 * ### The revocation path
 *
 * `gy.d0.w(Context)` reports whether a fresh subscription is on record. Three pieces of the
 * 8.9.6 anti-tamper flow consult it:
 *
 *   - `qx.b1.c(Context)` returns immediately when it is true, so the Play licence (LVL)
 *     checker is never installed. A re-signed APK always fails LVL; the failure handler
 *     (`ci.j4.d()`) clears `"1"` and posts `qx.b1.g`, which re-enters `qx.b1.c()` and can
 *     drop `j10.h2.h` back to false.
 *   - the billing sync takes it as "trust the cache" when Play returns no purchases.
 *   - `gy.d0.o()` reports the subscription as active.
 *
 * The patch only changes these client-side decisions. Anything the app asks Nova's backend
 * for still needs a real account.
 *
 * ### Why 8.9.6 and not 8.9.5
 *
 * 8.9.5 has a settings regression of its own: its custom switches write the preference but
 * never repaint, so every toggle looks dead until the screen is recreated. 8.9.6 fixes that
 * in the app. Targeting 8.9.6 avoids shipping a patch on top of a build whose settings are
 * already broken.
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
        // The static gate, so callers that use qx.b1.b() instead of reading the field agree
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
