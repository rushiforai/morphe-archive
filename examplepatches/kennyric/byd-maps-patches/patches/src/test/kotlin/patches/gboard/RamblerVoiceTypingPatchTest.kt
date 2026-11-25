package patches.gboard

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

/** Mirrors Gboard 18.6.3's AgenticDictationExtension.onCreateExtension first-run default. */
class RamblerVoiceTypingPatchTest {
    private val contains = ImmutableMethodReference("Lprefs;", "ak", listOf("I"), "Z")
    private val put = ImmutableMethodReference("Lbase;", "q", listOf("I", "Z"), "V")

    private fun invoke(ref: ImmutableMethodReference, vararg registers: Int) = ImmutableInstruction35c(
        Opcode.INVOKE_VIRTUAL, registers.size,
        registers.getOrElse(0) { 0 }, registers.getOrElse(1) { 0 }, registers.getOrElse(2) { 0 }, 0, 0, ref,
    )

    private fun stock(putValue: Int = 1, putKeyRegister: Int = 3): List<Instruction> = listOf(
        invoke(contains, 2, 3),
        ImmutableInstruction11x(Opcode.MOVE_RESULT, 4),
        ImmutableInstruction21t(Opcode.IF_NEZ, 4, 6),
        ImmutableInstruction11n(Opcode.CONST_4, 4, putValue),
        invoke(put, 2, putKeyRegister, 4),
    )

    @Test
    fun findsTheTrueLiteralFedToTheFirstRunPut() {
        assertEquals(3, firstRunRamblerDefaultIndex(stock()))
    }

    @Test
    fun rejectsAPutThatAlreadyStoresFalse() {
        assertThrows(PatchException::class.java) { firstRunRamblerDefaultIndex(stock(putValue = 0)) }
    }

    @Test
    fun rejectsAPutOnADifferentKeyThanTheContainsCheck() {
        assertThrows(PatchException::class.java) { firstRunRamblerDefaultIndex(stock(putKeyRegister = 5)) }
    }

    @Test
    fun rejectsAPutWithoutAPrecedingContainsCheck() {
        assertThrows(PatchException::class.java) { firstRunRamblerDefaultIndex(stock().drop(1)) }
    }

    @Test
    fun rejectsTwoCandidateDefaults() {
        assertThrows(PatchException::class.java) { firstRunRamblerDefaultIndex(stock() + stock()) }
    }
}
