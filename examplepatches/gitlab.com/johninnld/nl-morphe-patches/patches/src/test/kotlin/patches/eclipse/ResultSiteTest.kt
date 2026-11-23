package patches.eclipse

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The page cut hooks the one place the app's children method wraps its answer. These build the
 * instruction shape of that place (read from the app's own bytecode) and check that exactly it is
 * found, that nothing else is, and that the rewritten call keeps the registers and the result.
 */
class ResultSiteTest {
    private fun method(owner: String, name: String, parameters: List<String>, returnType: String): MethodReference =
        ImmutableMethodReference(owner, name, parameters, returnType)

    private val resultFactory = method("Lx45;", "c", listOf("Ljava/util/List;", "Lu06;"), "Lx45;")
    private val immediate = method("Lj62;", "n0", listOf("Ljava/lang/Object;"), "Lm54;")
    private val otherStatic = method("Lz54;", "y", listOf("Ljava/lang/Object;"), "Lyn8;")
    private val check = method("Le16;", "<init>", listOf("Lj16;", "Lai5;", "Lo36;", "I", "I"), "V")

    private fun invoke(reference: MethodReference, vararg registers: Int): Instruction {
        val r = registers.toList() + List(5 - registers.size) { 0 }
        return ImmutableInstruction35c(Opcode.INVOKE_STATIC, registers.size, r[0], r[1], r[2], r[3], r[4], reference)
    }

    private fun moveResult(register: Int): Instruction = ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, register)
    private fun newValidator(register: Int): Instruction = ImmutableInstruction21c(Opcode.NEW_INSTANCE, register, ImmutableTypeReference("Le16;"))
    private fun construct(): Instruction = ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 0, 6, check)
    private fun returnObject(register: Int): Instruction = ImmutableInstruction11x(Opcode.RETURN_OBJECT, register)

    /** Build 155's two calls: the resumption single item (no check) and the answer that feeds the check. */
    private fun appShape(): List<Instruction> = listOf(
        invoke(otherStatic, 3), moveResult(0),
        invoke(resultFactory, 0, 2), moveResult(0), invoke(immediate, 0), moveResult(0), returnObject(0),
        ImmutableInstruction10x(Opcode.NOP),
        invoke(resultFactory, 9, 2), moveResult(0), invoke(immediate, 0), moveResult(2), newValidator(0),
        construct(), returnObject(2),
    )

    @Test fun findsTheCallThatFeedsTheCheckAndNotTheResumptionOne() {
        val site = findResultSite(appShape())
        assertEquals(8, site.index)
        assertEquals(9, site.listRegister)
        assertEquals(2, site.paramsRegister)
    }

    @Test fun theReplacementKeepsTheSameRegistersAndCallsTheExtension() {
        val site = findResultSite(appShape())
        assertEquals(
            "invoke-static {v9, v2}, Lnl/johninnl/eclipse/auto/tree/BrowseTree;->page(Ljava/util/List;Lu06;)Lx45;",
            site.replacement,
        )
        assertEquals("Lnl/johninnl/eclipse/auto/tree/BrowseTree;->page(Ljava/util/List;Lu06;)Lx45;", PAGE_CALL)
        assertEquals("Lx45;->c(Ljava/util/List;Lu06;)Lx45;", RESULT_CALL)
        assertTrue("the result type stays what move-result-object expects", site.replacement.endsWith(")Lx45;"))
    }

    @Test fun aMethodWithoutTheCheckTaskHasNoSite() {
        val shape = listOf(invoke(resultFactory, 0, 2), moveResult(0), invoke(immediate, 0), moveResult(0), returnObject(0))
        val failure = assertThrows(IllegalStateException::class.java) { findResultSite(shape) }
        assertTrue(failure.message!!, failure.message!!.contains("found 0"))
    }

    @Test fun twoCallsFeedingTheCheckAreAmbiguousAndFailPatching() {
        val twice = appShape() + appShape().takeLast(7)
        val failure = assertThrows(IllegalStateException::class.java) { findResultSite(twice) }
        assertTrue(failure.message!!, failure.message!!.contains("found 2"))
    }

    @Test fun aCheckTaskAfterTheBlockEndsDoesNotCount() {
        // The resumption call returns; a check task constructed further down belongs to another block.
        val shape = listOf(invoke(resultFactory, 0, 2), moveResult(0), returnObject(0), newValidator(0), construct(), returnObject(0))
        assertThrows(IllegalStateException::class.java) { findResultSite(shape) }
    }

    @Test fun aCheckTaskTooFarAwayDoesNotCount() {
        val padding = List(12) { ImmutableInstruction10x(Opcode.NOP) as Instruction }
        val shape = listOf(invoke(resultFactory, 0, 2)) + padding + listOf(newValidator(0), construct(), returnObject(0))
        assertThrows(IllegalStateException::class.java) { findResultSite(shape) }
    }

    @Test fun aCallInRangeFormCannotBeReissuedWithTheSameRegistersAndFailsPatching() {
        val range = appShape().toMutableList()
        range[8] = ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 9, 2, resultFactory)
        val failure = assertThrows(IllegalStateException::class.java) { findResultSite(range) }
        assertTrue(failure.message!!, failure.message!!.contains("exactly one"))
    }

    @Test fun aSameNamedMethodWithAnotherDescriptorIsNotTheResultFactory() {
        val other = method("Lx45;", "c", listOf("Ljava/util/List;"), "Lx45;")
        val shape = listOf(invoke(other, 9), moveResult(0), invoke(immediate, 0), moveResult(2), newValidator(0), construct(), returnObject(2))
        assertThrows(IllegalStateException::class.java) { findResultSite(shape) }
    }

    @Test fun onlyTheChildrenMethodGetsTheSiteRewriteAndThePrologueItselfIsUnchanged() {
        assertEquals("u", CHILDREN_HOOK.name)
        assertEquals(2, BROWSE_HOOKS.size)
        assertFalse(PLAY_HOOK.prologue.contains(PAGE_CALL))
        assertFalse(CHILDREN_HOOK.prologue.contains(PAGE_CALL))
    }
}
