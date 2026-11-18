package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.*
import org.junit.Test

class NavigationAudioFocusGateTest {
    private val track = "Lnl/johninnl/navigation/startup/ProviderAudio;->trackMapFocus(Ljava/lang/Object;)V"
    private val mute = "Lnl/johninnl/navigation/startup/ProviderAudio;->muted()Z"
    private val native = "Lprobe/Native;->focus()V"

    private fun requestFocus() = MutableMethod(ImmutableMethod(
        "Lorg/maplibre/navigation/android/navigation/ui/v5/voice/Api26AudioFocusDelegate;",
        "requestFocus", emptyList(), "V", 1, emptySet(), emptySet(),
        ImmutableMethodImplementation(2, listOf(
            ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
                ImmutableMethodReference("Lprobe/Native;", "focus", emptyList(), "V")),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        ), emptyList(), emptyList()),
    ))

    /** Interpret emitted BuilderInstructions and actual code-unit branch offsets. */
    private fun assertExecution(method: MutableMethod, muted: Boolean) {
        val code = method.implementation!!.instructions.toList()
        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        val byAddress = addresses.dropLast(1).withIndex().associate { it.value to it.index }
        val visited = mutableSetOf<Int>()
        val registers = mutableMapOf<Int, Int>()
        var result = -1
        var tracking = 0
        var muteChecks = 0
        var nativeCalls = 0
        var pc = 0
        while (true) {
            assertTrue("Gate escaped method at $pc", pc in code.indices)
            assertTrue("Gate loop at instruction $pc (muted=$muted)", visited.add(pc))
            val instruction = code[pc]
            when (instruction.opcode) {
                Opcode.NOP -> pc++
                Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE -> {
                    when ((instruction as ReferenceInstruction).reference.toString()) {
                        track -> tracking++
                        mute -> { muteChecks++; result = if (muted) 1 else 0 }
                        native -> nativeCalls++
                        else -> error("Unexpected call in emitted focus gate")
                    }
                    pc++
                }
                Opcode.MOVE_RESULT -> {
                    registers[(instruction as OneRegisterInstruction).registerA] = result
                    pc++
                }
                Opcode.IF_EQZ -> {
                    pc = if (registers.getValue((instruction as OneRegisterInstruction).registerA) == 0) {
                        byAddress.getValue(addresses[pc] + (instruction as OffsetInstruction).codeOffset)
                    } else pc + 1
                }
                Opcode.RETURN_VOID -> break
                else -> error("Unexpected emitted focus opcode: ${instruction.opcode}")
            }
        }
        assertEquals("Always track the focus owner", 1, tracking)
        assertEquals("Always evaluate the lease once", 1, muteChecks)
        assertEquals("Native audio focus follows the lease", if (muted) 0 else 1, nativeCalls)
    }

    @Test fun bothLeaseStatesReachTheirRealContinuationWithoutLooping() {
        val method = requestFocus()
        val nativeEntry = method.implementation!!.instructions.first()
        gateFlitsmeisterMapFocus(method)
        val code = method.implementation!!.instructions.toList()
        val branch = code[3] as BuilderInstruction21t
        assertEquals(Opcode.IF_EQZ, branch.opcode)
        assertEquals(Opcode.NOP, code[5].opcode)
        assertSame("Branch must own its actual method continuation", code[5], branch.target.location.instruction)
        assertSame("Native body stays immediately after the owned continuation", nativeEntry, code[6])
        for (muted in listOf(false, true)) assertExecution(method, muted)
    }

    @Test fun laterPrependingKeepsTheBranchOnTheOwnedContinuation() {
        val method = requestFocus()
        val nativeEntry = method.implementation!!.instructions.first()
        gateFlitsmeisterMapFocus(method)
        val ownedContinuation = method.implementation!!.instructions.toList()[5]
        method.addInstruction(0, "nop")
        val code = method.implementation!!.instructions.toList()
        val branch = code[4] as BuilderInstruction21t
        assertSame(ownedContinuation, code[6])
        assertSame("Later prepending must move the live label with its instruction",
            ownedContinuation, branch.target.location.instruction)
        assertSame(nativeEntry, code[7])
        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        assertEquals("Offset must reach the owned NOP rather than the branch itself",
            addresses[6], addresses[4] + branch.codeOffset)
        assertNotEquals("Regression: unmuted branch must never target itself", 0, branch.codeOffset)
        for (muted in listOf(false, true)) assertExecution(method, muted)
    }
}
