/*
 * Prime patch ported from hyzor/hyzor-morphe-patches (GPLv3),
 * originally from rushiranpise/morphe-patches and hoo-dles/morphe-patches.
 */

package dev.novaoffline.patches.nova.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.novaoffline.patches.nova.shared.Constants.NOVA_LAUNCHER
import dev.novaoffline.patches.util.returnEarly

/** The persisted `"1"` value Nova writes when it accepts a direct Prime licence. */
private const val PRIME_DIRECT_LICENSE = "0x200"

@Suppress("unused")
val enablePrimePatch = bytecodePatch(
    name = "Enable Prime",
    description = "Unlocks Nova Launcher Prime by starting the app in the prime state and " +
        "reporting an active subscription, so the settings and features gated on Prime are " +
        "available. Also stops the Play-licence revocation that would otherwise strip Prime " +
        "from a re-signed (patched) install.",
    default = true,
) {
    compatibleWith(NOVA_LAUNCHER)

    execute {
        // The static gate, so callers that use ix.i1.b() agree with the field forced below.
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
