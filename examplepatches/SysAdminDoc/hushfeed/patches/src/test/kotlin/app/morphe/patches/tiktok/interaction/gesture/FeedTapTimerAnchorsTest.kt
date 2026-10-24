package app.morphe.patches.tiktok.interaction.gesture

import app.morphe.Fixtures
import app.morphe.takes
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Where a single tap on a feed video waits for a possible second one (#239), held to every
 * fixture: one touch listener, reading the double tap timeout once as the tap lifts (the delay of
 * the pause-or-play message) and once as the next touch lands (whether it is a double tap).
 */
class FeedTapTimerAnchorsTest {
    @Test
    fun `the feed's tap timer is one listener that reads the double tap timeout as a tap lifts and as the next lands`() {
        for (apk in Fixtures.apks()) {
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val taken = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
                .flatMap { classDef -> classDef.methods.asSequence().map { classDef to it } }
                .filter { (classDef, method) -> FeedTapTimerFingerprint.takes(method, classDef) }
                .toList()
            assertEquals("${apk.name}: ${taken.map { it.first.type }}", 1, taken.size)
            val method = taken.single().second
            val instructions = method.implementation!!.instructions.toList()
            val reads = method.doubleTapTimeoutReads()
            assertEquals("${apk.name}: double tap timeout reads", 2, reads.size)
            for (read in reads) {
                // Each answer is widened to a long straight away: the lift's delay and the next
                // touch's gap are both counted in milliseconds as longs.
                val register = (instructions[read] as OneRegisterInstruction).registerA
                val next = instructions[read + 1]
                assertEquals("${apk.name}: the read at $read isn't widened", Opcode.INT_TO_LONG, next.opcode)
                assertEquals(register, (next as TwoRegisterInstruction).registerB)
            }
            // The lift posts the pause-or-play message through a sendMessageDelayed wrapper.
            assertTrue("${apk.name}: no delayed post of the tap", instructions.any { instruction ->
                instruction.getReference<MethodReference>()?.let {
                    it.parameterTypes.map(CharSequence::toString) ==
                        listOf("Landroid/os/Handler;", "Landroid/os/Message;", "J")
                } == true
            })
        }
    }
}
