package app.morphed.patches.twitch.settings

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

/** The register check follows every path after the injection point, jumps included. */
class RegistersTest {
    private fun method(vararg instructions: Instruction): Method = ImmutableMethod(
        "Lexample/Sheet;", "rows", emptyList(), "V", AccessFlags.STATIC.value, null, null,
        ImmutableMethodImplementation(4, instructions.toList(), null, null),
    )

    // Each 1 code unit except if-eqz (2): addresses 0,1,2,... as listed in each test.
    private fun const(register: Int) = ImmutableInstruction11n(Opcode.CONST_4, register, 0)
    private fun move(to: Int, from: Int) = ImmutableInstruction12x(Opcode.MOVE, to, from)
    private fun ifZero(register: Int, offset: Int) = ImmutableInstruction21t(Opcode.IF_EQZ, register, offset)
    private fun goto(offset: Int) = ImmutableInstruction10t(Opcode.GOTO, offset)
    private fun returnValue(register: Int) = ImmutableInstruction11x(Opcode.RETURN, register)
    private val returnVoid = ImmutableInstruction10x(Opcode.RETURN_VOID)

    @Test
    fun aRegisterWrittenBeforeItsReadIsFree() {
        // 0: injection point, 1: v1 = 0, 2: return v1
        checkRegistersFree(method(const(0), const(1), returnValue(1)), 0, setOf(1), "the row")
    }

    @Test
    fun aReadBehindAJumpIsFound() {
        // 0: injection point, 1: if v0 == 0 jump to 4 (addr 1 + 3), 3: v1 = 0, 4: return v1
        // The jump skips the write: on that path v1 is read as it was.
        val error = assertThrows(IllegalStateException::class.java) {
            checkRegistersFree(method(const(0), ifZero(0, 3), const(1), returnValue(1)), 0, setOf(1), "the row")
        }
        assert(error.message!!.contains("still reads v1 after the row")) { error.message!! }
    }

    @Test
    fun aMoveCountsAsAWrite() {
        // 0: injection point, 1: v1 = v2, 2: return v1
        checkRegistersFree(method(const(0), move(1, 2), returnValue(1)), 0, setOf(1), "the row")
    }

    @Test
    fun jumpsAreFollowedToTheirTargets() {
        // 0: goto 2 (addr 0 + 2), 1: return-void, 2: return v0
        val instructions = listOf(goto(2), returnVoid, returnValue(0))
        assertEquals(listOf(2), successors(instructions, addresses(instructions), 0))
    }

    @Test
    fun aJumpToTheInjectionPointIsRefused() {
        // 0: if v0 == 0 jump to 3 (addr 0 + 3), 2: v1 = 0, 3: return-void (index 2 at address 3)
        val sheet = method(ifZero(0, 3), const(1), returnVoid)
        checkNoJumpTo(sheet, 1, "the row")
        assertThrows(IllegalStateException::class.java) { checkNoJumpTo(sheet, 2, "the row") }
    }

    @Test
    fun aTwoAddrOperationReadsItsFirstRegister() {
        // add-int/2addr v1, v2 reads v1 before writing it
        val add = ImmutableInstruction12x(Opcode.ADD_INT_2ADDR, 1, 2)
        assertEquals(listOf(2, 1), reads(add))
        assertThrows(IllegalStateException::class.java) {
            checkRegistersFree(method(const(0), add, returnValue(1)), 0, setOf(1), "the row")
        }
    }
}
