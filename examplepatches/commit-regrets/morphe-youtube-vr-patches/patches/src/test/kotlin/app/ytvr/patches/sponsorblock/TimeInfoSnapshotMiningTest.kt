package app.ytvr.patches.sponsorblock

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Assertions.assertNull
import org.junit.jupiter.api.Test

/**
 * The window walk behind the SponsorBlock bridge mining, on synthetic instruction lists -- the
 * shapes measured on the supported versions, and the drift shapes that must fail loudly rather
 * than mine a wrong accessor. No APK, no device: [TimeInfoSnapshotMining.mine] is pure logic
 * over instructions, which is exactly the shape this repo's tests are for (a fake `Context` is
 * not possible, so decision logic lives in pure functions and is tested there).
 */
class TimeInfoSnapshotMiningTest {

    /** The backend interface the accessors sit on (obfuscated name irrelevant; the walk never reads it). */
    private val backendType = "Lqlo;"

    private fun field(type: String, name: String) = ImmutableFieldReference(type, name, type)

    /** The wrapper's backend field: its TYPE must be the accessors' interface (the walk checks that). */
    private fun backendField() = ImmutableFieldReference("Lqal;", "a", backendType)

    /** A decoy field read inside the snapshot's cache layer (1.91.10's state object). */
    private fun cacheField() = ImmutableFieldReference("Lqal;", "b", "Lqqm;")

    private fun accessorCall(name: String, returnType: String = "J"): MethodReference = ImmutableMethodReference(backendType, name, emptyList(), returnType)

    private fun noiseCall(): MethodReference = ImmutableMethodReference("Ljava/util/concurrent/ConcurrentMap;", "put", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;")

    private fun invokeInterface(reference: MethodReference) = ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 1, 0, 0, 0, 0, 0, reference)

    // The 3rc form a register-heavy method uses when the receiver is above v15: the same call in
    // a different encoding, and the walk has to accept both.
    private fun invokeInterfaceRange(reference: MethodReference) = ImmutableInstruction3rc(Opcode.INVOKE_INTERFACE_RANGE, 16, 1, reference)

    // A synthetic 35c: the walk reads only the opcode and the reference prototype, never the
    // registers, so a small register count is fine where a real dex would use the range format.
    private fun invokeStaticFactory() = ImmutableInstruction35c(
        Opcode.INVOKE_STATIC,
        1,
        0,
        0,
        0,
        0,
        0,
        ImmutableMethodReference("Lqov;", "a", TimeInfoSnapshotMining.FACTORY_PARAMETERS, "Lqov;"),
    )

    private fun igetObject(field: ImmutableFieldReference) = ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 1, field)
    private fun moveResultWide() = ImmutableInstruction11x(Opcode.MOVE_RESULT_WIDE, 0)
    private fun moveResultObject() = ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0)

    /** The snapshot core: backend read, then eight accessor/move-result pairs, then the factory. */
    private fun core(accessorNames: List<String>): List<Instruction> {
        val instructions = mutableListOf<Instruction>(igetObject(backendField()))
        for (name in accessorNames) {
            val returnType = if (name == "c") {
                "I"
            } else if (name == "r") {
                "Ljava/lang/String;"
            } else {
                "J"
            }
            instructions += invokeInterface(accessorCall(name, returnType))
            instructions += if (returnType == "J") moveResultWide() else moveResultObject()
        }
        instructions += invokeStaticFactory()
        return instructions
    }

    @Test
    fun `legacy shape - one field read then eight accessors then the factory`() {
        val mined = TimeInfoSnapshotMining.mine(
            core(listOf("e", "f", "g", "d", "c", "i", "h", "r")),
        )
        assertNotNull(mined)
        assertEquals("a", mined!!.backendField.name)
        // Factory-argument order, not the reverse walk order: #0 position, #2 duration.
        assertEquals("e", mined.accessors[0].name)
        assertEquals("g", mined.accessors[2].name)
        assertEquals(8, mined.accessors.size)
    }

    @Test
    fun `range-encoded accessor - 3rc is the same call as 35c`() {
        // A register-heavy method whose receiver sits above v15 cannot encode the call as 35c;
        // dex emits 3rc instead. Reading only 35c would report the shape as broken.
        val instructions = core(listOf("e", "f", "g", "d", "c", "i", "h", "r")).toMutableList()
        instructions[1] = invokeInterfaceRange(accessorCall("e"))
        val mined = TimeInfoSnapshotMining.mine(instructions)
        assertNotNull(mined)
        assertEquals("e", mined!!.accessors[0].name)
        assertEquals(8, mined.accessors.size)
    }

    @Test
    fun `1_91_10 cache shape - noise before the window is ignored, the window still mines`() {
        // The 1.91.10 snapshot: a state-object read, a lookup call and a cache put ahead of
        // the real window. The whole-method scan this replaced counted 12 interface calls and
        // took the wrong field; the walk must start at the factory and collect only the eight.
        val instructions = mutableListOf<Instruction>(
            igetObject(cacheField()),
            invokeInterface(accessorCall("p", "Lqov;")),
            moveResultObject(),
            invokeInterface(noiseCall()),
            moveResultObject(),
        )
        instructions += core(listOf("e", "f", "g", "d", "c", "i", "h", "r"))
        val mined = TimeInfoSnapshotMining.mine(instructions)
        assertNotNull(mined)
        // The backend field, not the cache's state object: the walk's IGET_OBJECT terminal is
        // the one feeding accessor #0, and its type is checked against the accessors' interface.
        assertEquals("a", mined!!.backendField.name)
        assertEquals(backendType, mined.backendField.type)
        assertEquals("e", mined.accessors[0].name)
        assertEquals("g", mined.accessors[2].name)
    }

    @Test
    fun `noise between the last accessor and the factory fails loudly`() {
        val instructions = core(listOf("e", "f", "g", "d", "c", "i", "h", "r")).toMutableList()
        // Insert the noise directly before the factory (last element).
        instructions.add(instructions.size - 1, invokeInterface(noiseCall()))
        instructions.add(instructions.size - 1, moveResultObject())
        assertNull(TimeInfoSnapshotMining.mine(instructions))
    }

    @Test
    fun `a ninth accessor call fails loudly`() {
        val instructions = core(listOf("e", "f", "g", "d", "c", "i", "h", "r")).toMutableList()
        instructions.add(instructions.size - 1, invokeInterface(accessorCall("x")))
        instructions.add(instructions.size - 1, moveResultWide())
        assertNull(TimeInfoSnapshotMining.mine(instructions))
    }

    @Test
    fun `a field read parked before the factory fails loudly`() {
        // The wrong-answer direction: an unrelated iget-object directly before the factory
        // would otherwise be taken as the backend field. The field-type check closes it.
        val instructions = core(listOf("e", "f", "g", "d", "c", "i", "h", "r")).toMutableList()
        instructions.add(instructions.size - 1, igetObject(cacheField()))
        assertNull(TimeInfoSnapshotMining.mine(instructions))
    }

    @Test
    fun `a backend field whose type is not the accessors interface fails loudly`() {
        val instructions = core(listOf("e", "f", "g", "d", "c", "i", "h", "r")).toMutableList()
        instructions[0] = igetObject(field("Lqqm;", "b"))
        assertNull(TimeInfoSnapshotMining.mine(instructions))
    }

    @Test
    fun `no factory call fails loudly`() {
        val instructions = core(listOf("e", "f", "g", "d", "c", "i", "h", "r")).dropLast(1)
        assertNull(TimeInfoSnapshotMining.mine(instructions))
    }

    @Test
    fun `a factory at instruction zero leaves nothing to mine`() {
        assertNull(TimeInfoSnapshotMining.mine(listOf(invokeStaticFactory())))
    }

    @Test
    fun `seven accessors fail loudly`() {
        val instructions = core(listOf("e", "f", "g", "d", "c", "i", "h"))
        assertNull(TimeInfoSnapshotMining.mine(instructions))
    }
}
