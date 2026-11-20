package app.modprod.patches.signals.autotrading

import app.modprod.patches.signals.shared.Constants.COMPATIBILITY_SIGNALS
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val LAUNCHPAD = "Lak/c;"
private const val AUTO_TRADING =
    "Lapp/modprod/extension/autotrading/AutoTradingFragment;"

/**
 * Replaces the 5th ViewPager page (LaunchPadFragment / Lak/c) with
 * [app.modprod.extension.autotrading.AutoTradingFragment].
 *
 * Same pattern as InjectAdblockerUserscriptPatch: resource/UI side in a sibling
 * patch, bytecode seam here, runtime class via extendWith(extension.mpe).
 */
@Suppress("unused")
val wireAutoTradingFragmentPatch = bytecodePatch(
    name = "Wire Auto Trading fragment",
    description = "Replaces LaunchPad (5th ViewPager page) with AutoTradingFragment WebView.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SIGNALS)

    dependsOn(enableAutoTradingTabPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Resolve the no-arg void method on MainActivity that touches Lak/c.
        val method = try {
            MainActivitySetupPagerFingerprint.method
        } catch (_: Exception) {
            null
        }?.takeIf { m ->
            m.implementation?.instructions?.any { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference
                when (ref) {
                    is FieldReference -> ref.type == LAUNCHPAD
                    is TypeReference -> ref.type == LAUNCHPAD
                    else -> false
                }
            } == true
        } ?: throw PatchException(
            "MainActivity ViewPager setup (Lak/c) not found. Expected Signals 14.3.1.",
        )

        val instructions = method.implementation!!.instructions

        val igetIndex = instructions.indexOfFirst { insn ->
            if (insn.opcode != Opcode.IGET_OBJECT) return@indexOfFirst false
            val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
            ref?.type == LAUNCHPAD
        }

        if (igetIndex < 0) {
            throw PatchException("iget-object of type Lak/c not found in ViewPager setup")
        }

        val destReg = (method.getInstruction(igetIndex) as OneRegisterInstruction).registerA

        // Replace field read of LaunchPad with new AutoTradingFragment()
        method.removeInstruction(igetIndex)
        method.addInstructions(
            igetIndex,
            """
                new-instance v$destReg, $AUTO_TRADING
                invoke-direct {v$destReg}, $AUTO_TRADING-><init>()V
            """,
        )
    }
}
