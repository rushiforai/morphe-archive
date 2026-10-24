package app.morphe.patches.tiktok.interaction.live

import app.morphe.Fixtures
import app.morphe.takes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * #37: a LIVE room's Share sheet provider leaves the newer Video quality entry out of LIVE Studio
 * rooms and low-latency rooms. Each declared build has one provider, and both blocks are a boolean
 * move-result nothing branches onto the instruction after.
 */
class LiveSheetQualityAnchorsTest {
    @Test
    fun `each declared build has one sheet provider with both quality blocks to lift`() {
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val classes = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }.toList()
            val taken = classes.flatMap { cls ->
                cls.methods.filter { LiveSheetActionsFingerprint.takes(it, cls) }.map { cls to it }
            }
            assertEquals("${apk.name}: ${taken.map { "${it.first.type}->${it.second.name}" }}", 1, taken.size)
            val method = taken.single().second

            val blocks = qualityEntryBlocks(method)
            val instructions = method.implementation!!.instructions.toList()
            assertTrue("${apk.name}: two different sites", blocks.studioResult != blocks.lowLatencyResult)
            for (result in listOf(blocks.studioResult, blocks.lowLatencyResult)) {
                assertEquals(Opcode.MOVE_RESULT, instructions[result].opcode)
                assertTrue(
                    "${apk.name}: the register at $result holds a hook-sized register",
                    (instructions[result] as OneRegisterInstruction).registerA <= 15,
                )
            }
            val lowLatency = (instructions[blocks.lowLatencyResult - 1] as ReferenceInstruction).reference as MethodReference
            assertEquals("isSupportLowLatency", lowLatency.name)

            // Nothing jumps onto the instruction after either result, so an insert there always runs.
            val offsets = HashMap<Int, Int>()
            var address = 0
            instructions.forEachIndexed { index, instruction ->
                offsets[address] = index
                address += instruction.codeUnits
            }
            address = 0
            val targets = HashSet<Int>()
            instructions.forEach { instruction ->
                if (instruction is OffsetInstruction && instruction.opcode != Opcode.PACKED_SWITCH_PAYLOAD) {
                    offsets[address + instruction.codeOffset]?.let { targets += it }
                }
                address += instruction.codeUnits
            }
            for (result in listOf(blocks.studioResult, blocks.lowLatencyResult)) {
                assertTrue("${apk.name}: a branch lands on ${result + 1}", (result + 1) !in targets)
            }
        }
    }
}
