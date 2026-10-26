package app.pigfoot.patches

import app.pigfoot.patches.camscanner.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.OptionException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.*
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.instruction.*
import org.junit.Assert.*
import org.junit.Test

class CamScannerRewardSkipTest {
    // The pinned original JSON parser owns parsing. Tokens model its return at the call boundary.
    enum class ParsedData { ACTIVE, PRELOAD, MALFORMED, EMPTY }
    data class Request(val action: String?, val id: String?, val data: ParsedData? = ParsedData.ACTIVE)
    data class Life(val finishing: Boolean = false, val destroyed: Boolean = false)
    data class Manager(val left: Boolean)
    data class ViewLife(val detached: Boolean = false, val removing: Boolean = false)
    private fun method(site: RewardSkipSite, registers: Int = site.registers): MutableMethod {
        val activity = "Landroid/app/Activity;"
        val fragment = "Lcom/intsig/webview/WebViewFragment;"
        val manager = "Lcom/intsig/advertisement/adapters/positions/reward/video/RewardVideo;"
        val data = "Lcom/intsig/camscanner/attention/CallAppData;"
        val types = if (site == RewardSkipSite.MAIN) listOf(activity, fragment, manager, data)
            else listOf(WATCH_CONTROL, data, manager, activity, fragment)
        return MutableMethod(ImmutableMethod(WATCH_CONTROL, site.methodName,
            types.map { ImmutableMethodParameter(it, emptySet(), null) }, "V",
            AccessFlags.PUBLIC.value or if (site == RewardSkipSite.POSTED) AccessFlags.STATIC.value else 0,
            emptySet(), emptySet(), ImmutableMethodImplementation(registers,
                listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), emptyList(), emptyList())))
    }
    /** Execute the assembled prefix only. The original network/callback implementations are not mocked as successful grants. */
    private class Vm(val site: RewardSkipSite, request: Request?, life: Life?, manager: Manager?, fragment: Any?) {
        val m: MutableMethod
        val registers = arrayOfNulls<Any>(site.registers)
        var original = 0; var completed = 0; var closed = 0; var constructed = 0
        val expected: List<Any?>
        init {
            val test = CamScannerRewardSkipTest(); m = test.method(site)
            m.addInstructions(0, "invoke-static {}, Ltest/Marker;->original()V")
            if (site == RewardSkipSite.MAIN) m.addInstructions(0, List(37) { "nop" }.joinToString("\n") + "\nmove-object v3, p0")
            installRewardSkip(m, site)
            val control = Any()
            expected = listOf(control, life, manager, fragment, request)
            val args = if (site == RewardSkipSite.MAIN) listOf(control, life, fragment, manager, request)
                else listOf(control, request, manager, life, fragment)
            args.forEachIndexed { n, value -> registers[site.registers - 5 + n] = value }
        }
        fun execute(): Vm {
            val code = m.implementation!!.instructions.toList()
            val addresses = mutableMapOf<Int, Int>(); var size = 0
            code.forEachIndexed { index, i -> addresses[size] = index; size += i.codeUnits }
            var at = 0; var index = 0; var result: Any? = null; var steps = 0
            fun truth(v: Any?) = v != null && v != 0 && v != false
            while (index < code.size) {
                check(++steps < 150)
                val i = code[index]; var next = index + 1
                val one = (i as? OneRegisterInstruction)?.registerA
                val two = i as? TwoRegisterInstruction
                when (i.opcode) {
                    Opcode.NOP -> Unit
                    Opcode.IF_EQZ, Opcode.IF_NEZ -> {
                        val condition = truth(registers[one!!])
                        if (condition == (i.opcode == Opcode.IF_NEZ)) next = addresses.getValue(at + (i as OffsetInstruction).codeOffset)
                    }
                    Opcode.CONST_STRING -> registers[one!!] = ((i as ReferenceInstruction).reference as StringReference).string
                    Opcode.CONST_4 -> registers[one!!] = (i as WideLiteralInstruction).wideLiteral.toInt()
                    Opcode.IGET_OBJECT -> {
                        val req = registers[two!!.registerB] as Request
                        val name = (i as ReferenceInstruction).reference.toString()
                        registers[two.registerA] = when {
                            "->action:" in name -> req.action
                            "->data:" in name -> req.data
                            else -> req.id
                        }
                    }
                    Opcode.INSTANCE_OF -> registers[two!!.registerA] = (registers[two.registerB] as? Manager)?.left == true
                    Opcode.MOVE_RESULT -> registers[one!!] = result
                    Opcode.MOVE_OBJECT -> registers[two!!.registerA] = registers[two.registerB]
                    Opcode.NEW_INSTANCE -> registers[one!!] = "new-listener"
                    Opcode.INVOKE_DIRECT -> {
                        val call = i as FiveRegisterInstruction
                        val ref = (i as ReferenceInstruction).reference.toString()
                        assertEquals("$WATCH_CONTROL->〇O888o0o(Ljava/lang/String;)Z", ref)
                        assertSame(expected[0], registers[call.registerC])
                        result = registers[call.registerD] != ParsedData.ACTIVE
                    }
                    Opcode.INVOKE_DIRECT_RANGE -> {
                        val call = i as RegisterRangeInstruction
                        val args = (call.startRegister until call.startRegister + call.registerCount).map { registers[it] }
                        assertEquals("new-listener", args[0]); assertEquals(expected, args.drop(1)); constructed++
                    }
                    Opcode.INVOKE_STATIC -> { assertTrue((i as ReferenceInstruction).reference.toString().contains("Ltest/Marker;")); original++ }
                    Opcode.INVOKE_VIRTUAL -> {
                        val call = i as FiveRegisterInstruction
                        val ref = (i as ReferenceInstruction).reference.toString()
                        val a = registers[call.registerC]; val b = registers[call.registerD]
                        when {
                            "->equals(" in ref -> result = a == b
                            "->isEmpty()" in ref -> result = (a as String).isEmpty()
                            "->isDetached()" in ref -> result = (a as? ViewLife)?.detached ?: false
                            "->isRemoving()" in ref -> result = (a as? ViewLife)?.removing ?: false
                            "->isFinishing()" in ref -> result = (a as Life).finishing
                            "->isDestroyed()" in ref -> result = (a as Life).destroyed
                            "->〇〇888(" in ref -> { assertTrue("Dalvik null callback argument", b == null || b == 0); completed++ }
                            "->〇O8o08O(" in ref -> { assertTrue("Dalvik null callback argument", b == null || b == 0); closed++ }
                            else -> error("Unexpected call $ref")
                        }
                    }
                    Opcode.RETURN_VOID -> return this
                    else -> error("Unexpected opcode ${i.opcode}")
                }
                index = next
                at = if (index < code.size) addresses.entries.single { it.value == index }.key else size
            }
            error("Missing return")
        }
    }
    @Test fun bothDispatchesConstructBoundRequestAndForwardExactlyOneCompletionAndClose() {
        for (site in RewardSkipSite.entries) {
            val vm = Vm(site, Request("watchad_lottery", "request-1"), Life(), Manager(true), Any()).execute()
            assertEquals(0, vm.original); assertEquals(1, vm.constructed)
            assertEquals(1, vm.completed); assertEquals(1, vm.closed)
        }
    }
    @Test fun pageEntryPreloadAndCanceledDataNeverConstructOrCompleteAReward() {
        for (site in RewardSkipSite.entries) for (data in listOf(ParsedData.PRELOAD,
                ParsedData.MALFORMED, ParsedData.EMPTY, null)) {
            // Include a valid id: a bridge-generated id must not turn preload into a gesture.
            val vm = Vm(site, Request("watchad_lottery", "page-entry-id", data),
                Life(), Manager(true), ViewLife()).execute()
            assertEquals(0, vm.original + vm.constructed + vm.completed + vm.closed)
        }
    }
    @Test fun malformedUnrelatedAndNonLotteryRequestsRetainOriginalPath() {
        for (site in RewardSkipSite.entries) {
            for (request in listOf(null, Request("watch_option_ad", "1"), Request(null, "1"),
                    Request("watchad_lottery", null), Request("watchad_lottery", ""))) {
                val vm = Vm(site, request, Life(), Manager(true), Any()).execute()
                assertEquals(1, vm.original); assertEquals(0, vm.closed)
            }
            for (manager in listOf(null, Manager(false))) {
                val vm = Vm(site, Request("watchad_lottery", "1"), Life(), manager, Any()).execute()
                assertEquals(1, vm.original); assertEquals(0, vm.completed)
            }
        }
    }
    @Test fun canceledLifecycleDoesNotRequestOrSignalReward() {
        for (site in RewardSkipSite.entries) for (life in listOf(null, Life(finishing = true), Life(destroyed = true))) {
            val vm = Vm(site, Request("watchad_lottery", "1"), life, Manager(true), Any()).execute()
            assertEquals(0, vm.original + vm.completed + vm.closed)
        }
        for (site in RewardSkipSite.entries) for (view in listOf(null, ViewLife(detached = true), ViewLife(removing = true))) {
            val vm = Vm(site, Request("watchad_lottery", "1"), Life(), Manager(true), view).execute()
            assertEquals(0, vm.original + vm.completed + vm.closed)
        }
    }
    @Test fun versionAndShapeFailClosedAndOptionDefaultsRemainBlocked() {
        requireRewardSkipVersion("7.27.0.2609220000", "72701")
        for ((name, code) in listOf("7.26.5.2609160000" to "72651", "7.27.0.2609220000" to "72751"))
            assertThrows(IllegalArgumentException::class.java) { requireRewardSkipVersion(name, code) }
        for (site in RewardSkipSite.entries)
            assertThrows(IllegalArgumentException::class.java) { rewardSkipIndex(method(site, site.registers + 1), site) }
        val option = camscannerAdsPatch.options["rewardedVideos"]
        try {
            assertEquals("block", option.value)
            camscannerAdsPatch.options["rewardedVideos"] = "skip-lottery"
            for (retired in listOf("unlimited", "inspect-lottery"))
                assertThrows(OptionException.ValueValidationException::class.java) { camscannerAdsPatch.options["rewardedVideos"] = retired }
        } finally { option.reset() }
    }
}
