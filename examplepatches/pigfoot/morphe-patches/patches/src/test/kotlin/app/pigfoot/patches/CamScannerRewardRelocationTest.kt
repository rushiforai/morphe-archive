package app.pigfoot.patches

import app.pigfoot.patches.camscanner.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.*
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.instruction.*
import org.junit.Assert.*
import org.junit.Test

class CamScannerRewardRelocationTest {
    private fun method(site: RewardSkipSite): MutableMethod {
        val types = if (site == RewardSkipSite.MAIN) listOf("Landroid/app/Activity;", "Lcom/intsig/webview/WebViewFragment;", "Lcom/intsig/advertisement/adapters/positions/reward/video/RewardVideo;", "Lcom/intsig/camscanner/attention/CallAppData;")
            else listOf(WATCH_CONTROL, "Lcom/intsig/camscanner/attention/CallAppData;", "Lcom/intsig/advertisement/adapters/positions/reward/video/RewardVideo;", "Landroid/app/Activity;", "Lcom/intsig/webview/WebViewFragment;")
        val m = MutableMethod(ImmutableMethod(WATCH_CONTROL, site.methodName, types.map { ImmutableMethodParameter(it, emptySet(), null) }, "V",
            AccessFlags.PUBLIC.value or if (site == RewardSkipSite.POSTED) AccessFlags.STATIC.value else 0,
            emptySet(), emptySet(), ImmutableMethodImplementation(site.registers, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), emptyList(), emptyList())))
        if (site == RewardSkipSite.MAIN) m.addInstructions(0, List(37) { "nop" }.joinToString("\n") + "\nmove-object v3, p0")
        return m
    }
    @Test fun actualMainOffsetAndPostedEntryBranchOnlyToTheirOwnFallbackOrCancellation() {
        for (site in RewardSkipSite.entries) {
            val m = method(site); val at = rewardSkipIndex(m, site)
            installRewardSkip(m, site)
            val code = m.implementation!!.instructions.toList(); val addresses = mutableListOf<Int>(); var units = 0
            code.forEach { addresses += units; units += it.codeUnits }
            val end = code.size - 1 // original return; inserted fallback nop is immediately before it
            assertEquals(Opcode.NOP, code[end - 1].opcode)
            assertEquals(Opcode.RETURN_VOID, code[end - 2].opcode)
            assertEquals(if (site == RewardSkipSite.MAIN) 38 else 0, addresses[at])
            val branches = (at until end).mapNotNull { j -> (code[j] as? OffsetInstruction)?.let { addresses[j] + it.codeOffset } }
            assertEquals(13, branches.size)
            assertEquals(setOf(addresses[end - 2], addresses[end - 1]), branches.toSet())
            for (target in branches) {
                val index = addresses.indexOf(target); assertTrue(index >= 0)
                assertFalse("ART forbids branching into move-result", code[index].opcode in setOf(Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_RESULT_WIDE))
            }
        }
    }
    @Test fun unrelocatedNonzeroInsertionIsExplicitlyDetectedAsAnInvalidCounterexample() {
        val m = method(RewardSkipSite.MAIN); val at = rewardSkipIndex(m, RewardSkipSite.MAIN)
        m.addInstructions(at, rewardSkipPrefix(RewardSkipSite.MAIN))
        val code = m.implementation!!.instructions.toList(); val addresses = mutableListOf<Int>(); var units = 0
        code.forEach { addresses += units; units += it.codeUnits }
        val targets = (at until code.size - 1).mapNotNull { j -> (code[j] as? OffsetInstruction)?.let { addresses[j] + it.codeOffset } }.toSet()
        assertEquals(setOf(81,82), targets)
        assertEquals(Opcode.MOVE_RESULT, code[addresses.indexOf(81)].opcode)
        assertFalse(targets.contains(addresses[code.size - 2]))
    }
}
