package app.morphe.util

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * A skip hook's jump is checked against what each read on its way needs, the way ART's verifier
 * checks the whole method when its class loads. Each refusal has a near twin that must go in, so
 * a check that refuses everything fails here too.
 */
class JumpRegisterCheckTest {
    @Test
    fun `a jump past the only write of a register it reads is refused`() {
        assertRefused(method("I", 3, "add-int/lit8 v0, p0, 0x1\nreturn v0"), anchor = 0, target = 1,
            "would bring v0 to instruction 1 holding nothing usable, where the method's own paths bring int")
        assertHooked(method("I", 3, "add-int/lit8 v0, p0, 0x1\nreturn p0"), anchor = 0, target = 1)
        assertRefused(method("I", 3, "add-int/lit8 v0, p0, 0x1\nif-eqz v0, :done\n:done\nreturn p0"), anchor = 0, target = 1,
            "would bring v0 to instruction 1 holding nothing usable, where the method's own paths bring int")
    }

    @Test
    fun `a jump that splits a long pair is refused`() {
        assertRefused(method("J", 4, "const/4 v1, 0x1\nint-to-long v0, p0\nreturn-wide v0"), anchor = 1, target = 2,
            "would bring v0 to instruction 2 holding nothing usable, where the method's own paths bring long low")
        assertHooked(method("J", 4, "const-wide/16 v0, 0x1\nint-to-long v0, p0\nreturn-wide v0"), anchor = 1, target = 2)
    }

    @Test
    fun `a jump that brings an int where a float is read is refused`() {
        assertRefused(method("F", 3, "add-int/lit8 v0, p0, 0x1\nint-to-float v0, v0\nreturn v0"), anchor = 1, target = 2,
            "would bring v0 to instruction 2 holding nothing usable, where the method's own paths bring float")
        assertHooked(method("F", 3, "const/high16 v0, 0x3f800000\nint-to-float v0, p0\nreturn v0"), anchor = 1, target = 2)
    }

    @Test
    fun `a jump past a constructor call is refused`() {
        val code = "new-instance v0, Ljava/lang/Object;\ninvoke-direct {v0}, Ljava/lang/Object;-><init>()V\nreturn-object v0"
        assertRefused(method("Ljava/lang/Object;", 3, code), anchor = 1, target = 2,
            "would bring v0 to instruction 2 holding nothing usable, where the method's own paths bring Ljava/lang/Object;")
    }

    @Test
    fun `a zero the method brings takes what its reads accept`() {
        // Where the method's own paths bring a literal zero, the verifier types the register by
        // what arrives, so an int is fine for an int read, a null check or a move, and not for a
        // read that needs a reference.
        for (read in listOf("if-eqz v0, :done", "add-int/lit8 v1, v0, 0x1", "move v1, v0\nadd-int/lit8 v1, v1, 0x1")) {
            assertHooked(method("V", 4, "add-int/lit8 v0, p0, 0x3\nconst/4 v0, 0x0\n$read\n:done\nreturn-void"), anchor = 1, target = 2)
        }
        val asReference = "add-int/lit8 v0, p0, 0x3\nconst/4 v0, 0x0\ninvoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;\nreturn-void"
        assertRefused(method("V", 4, asReference), anchor = 1, target = 2,
            "would bring v0 to instruction 2 holding int, where the method's own paths bring zero")
        val moved = "add-int/lit8 v0, p0, 0x3\nconst/4 v0, 0x0\nmove-object v1, v0\nmonitor-enter v1\nreturn-void"
        assertRefused(method("V", 4, moved), anchor = 1, target = 2, "would bring v0 to instruction 2 holding int, where the method's own paths bring zero")
    }

    @Test
    fun `a jump onto a result or an exception move is refused`() {
        val result = "invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;\nmove-result-object v0\nreturn-object v0"
        assertRefused(method("Ljava/lang/Object;", 3, result), anchor = 0, target = 1,
            "would jump to the ${Opcode.MOVE_RESULT_OBJECT} at instruction 1, which only a throw or a call may reach")
        val handled = method("V", 3, "invoke-static {}, Lcom/example/Probe;->hit()V\nreturn-void\nmove-exception v0\nreturn-void").apply {
            catchAll(protected = 0, handler = 2)
        }
        assertRefused(handled, anchor = 1, target = 2,
            "would jump to the ${Opcode.MOVE_EXCEPTION} at instruction 2, which only a throw or a call may reach")
    }

    @Test
    fun `a handler the jump reaches is checked too`() {
        // Only the handler reads v0, and the call the jump lands on is what leads there.
        fun handled(handlerReads: String) = method("I", 4,
            "const/4 v0, 0x1\ninvoke-static {}, Lcom/example/Probe;->hit()V\nreturn p0\nmove-exception v1\nreturn $handlerReads",
        ).apply { catchAll(protected = 1, handler = 3) }
        assertRefused(handled("v0"), anchor = 0, target = 1,
            "would bring v0 to instruction 4 holding nothing usable, where the method's own paths bring const")
        assertHooked(handled("p0"), anchor = 0, target = 1)
    }

    @Test
    fun `a hook that moves a switch table's padding is matched instruction for instruction`() {
        // A payload starts on an even code unit, with a nop in front when it would not, so a hook of
        // an odd length drops that nop or adds one. The check used to count the hook as one
        // instruction shorter or longer, read every later instruction against its neighbor and
        // refuse a sound jump. A bad jump in the same method is still named by its own index.
        for (padded in listOf(true, false)) {
            val case = if (padded) "const/4 v0, 0x2" else "const/4 v1, 0x2\nconst/4 v0, 0x2"
            fun switching() = method("I", 3, "packed-switch p0, :table\nconst/4 v0, 0x1\nreturn v0\n:case\n$case\nreturn v0\n" +
                ":table\n.packed-switch 0x0\n:case\n.end packed-switch")
            val hooked = switching()
            assertEquals(if (padded) 1 else 0, hooked.padding())
            hooked.oddSkip(anchor = 1, target = 3)
            assertEquals("padded $padded", if (padded) 0 else 1, hooked.padding())
            val refused = switching()
            val before = refused.shape()
            val refusal = assertThrows(PatchException::class.java) { refused.oddSkip(anchor = 1, target = 2) }
            assertTrue(refusal.message, refusal.message!!.endsWith("the code at instruction 1 would bring v0 to instruction 2 " +
                "holding nothing usable, where the method's own paths bring const"))
            assertEquals(before, refused.shape())
        }
    }

    @Test
    fun `a real nop in front of a table's padding is told apart from the padding`() {
        // With two nops in front of a table, an odd hook drops the second. Telling padding by the
        // instruction after it took the first for padding in the copy only and refused this sound jump.
        val code = "packed-switch p0, :table\nconst/4 v0, 0x1\nreturn v0\n:case\nconst/4 v1, 0x2\nconst/4 v0, 0x2\nreturn v0\nnop\nnop\n" +
            ":table\n.packed-switch 0x0\n:case\n.end packed-switch"
        val hooked = method("I", 3, code)
        assertEquals(listOf(Opcode.NOP, Opcode.NOP), hooked.implementation!!.instructions.map { it.opcode }.takeLast(3).take(2))
        hooked.oddSkip(anchor = 1, target = 3)
        assertEquals(1, hooked.implementation!!.instructions.count { it.opcode == Opcode.NOP })
    }

    @Test
    fun `code in front of a result or an exception move is refused even without a jump`() {
        val result = method("I", 3, "invoke-static {p0}, Lcom/example/Probe;->id(I)I\nmove-result v0\nreturn p0")
        val before = result.shape()
        val refusal = assertThrows(PatchException::class.java) {
            result.addInstructionsAtControlFlowLabel(1, "invoke-static {}, Lcom/example/Probe;->hit()V")
        }
        assertTrue(refusal.message, refusal.message!!.endsWith("code can't go in front of the ${Opcode.MOVE_RESULT} at instruction 1, " +
            "which only a throw or a call may reach"))
        assertEquals(before, result.shape())
        val handled = method("V", 3, "invoke-static {}, Lcom/example/Probe;->hit()V\nreturn-void\nmove-exception v0\nreturn-void").apply {
            catchAll(protected = 0, handler = 2)
        }
        assertThrows(PatchException::class.java) { handled.addInstructionsAtControlFlowLabel(2, "nop") }
        // The instruction after the move takes code as before.
        result.addInstructionsAtControlFlowLabel(2, "invoke-static {}, Lcom/example/Probe;->hit()V")
    }

    @Test
    fun `a hook with a switch table of its own is refused before the method changes`() {
        val host = method("I", 3, "const/4 v0, 0x1\nreturn v0")
        val before = host.shape()
        val refusal = assertThrows(PatchException::class.java) {
            host.addInstructionsAtControlFlowLabel(0, "packed-switch p0, :table\n:case\nnop\n:table\n.packed-switch 0x0\n:case\n.end packed-switch")
        }
        assertTrue(refusal.message, refusal.message!!.endsWith("has a ${Opcode.PACKED_SWITCH} of its own, which can't be checked"))
        assertEquals(before, host.shape())
    }

    @Test
    fun `kinds merge the way the verifier merges them`() {
        val zero = RegisterKind.ZERO
        assertEquals(RegisterKind.INT, RegisterKind.merge(zero, RegisterKind.INT))
        assertEquals(RegisterKind.ref("Ljava/lang/String;"), RegisterKind.merge(RegisterKind.ref("Ljava/lang/String;"), zero))
        assertEquals(RegisterKind.UNUSABLE, RegisterKind.merge(RegisterKind.CONST, RegisterKind.ref(null)))
        assertEquals(RegisterKind.FLOAT, RegisterKind.merge(RegisterKind.CONST, RegisterKind.FLOAT))
        assertEquals(RegisterKind.UNUSABLE, RegisterKind.merge(RegisterKind.INT, RegisterKind.FLOAT))
        assertEquals(RegisterKind.ref(null), RegisterKind.merge(RegisterKind.ref("Ljava/lang/String;"), RegisterKind.ref("Ljava/lang/Integer;")))
        val long = RegisterKind(RegisterKind.Tag.LONG_LOW)
        assertEquals(RegisterKind.UNUSABLE, RegisterKind.merge(long, RegisterKind(RegisterKind.Tag.DOUBLE_LOW)))
        assertEquals(long, RegisterKind.merge(RegisterKind(RegisterKind.Tag.WIDE_CONST_LOW), long))
        assertEquals(RegisterKind.UNUSABLE, RegisterKind.merge(zero, RegisterKind(RegisterKind.Tag.UNINIT, "Ljava/lang/Object;", 0)))
    }

    @Test
    fun `a constructor call turns every copy of the new object into a reference`() {
        val made = method("V", 3, "new-instance v0, Ljava/lang/Object;\nmove-object v1, v0\ninvoke-direct {v0}, Ljava/lang/Object;-><init>()V\nreturn-void")
        val kinds = RegisterKinds.of(made)
        assertEquals(RegisterKind.Tag.UNINIT, kinds.at(2)!![1].tag)
        assertEquals(listOf(RegisterKind.ref("Ljava/lang/Object;"), RegisterKind.ref("Ljava/lang/Object;")), kinds.at(3)!!.take(2))
    }

    private fun method(returnType: String, registers: Int, code: String) = MutableMethod(
        ImmutableMethod(
            "Lcom/example/Host;", "run", listOf(ImmutableMethodParameter("I", null, null)), returnType,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, code) }

    private fun MutableMethod.catchAll(protected: Int, handler: Int) {
        val implementation = implementation!!
        implementation.addCatch(implementation.newLabelForIndex(protected), implementation.newLabelForIndex(protected + 1),
            implementation.newLabelForIndex(handler))
    }

    /** The register just below the parameter, which none of these methods read. */
    private fun MutableMethod.borrowed() = implementation!!.registerCount - 2

    private fun MutableMethod.skip(anchor: Int, target: Int) = addInstructionsAtControlFlowLabel(
        anchor,
        "invoke-static {}, Lcom/example/Probe;->guard()Z\nmove-result v${borrowed()}\nif-nez v${borrowed()}, :skip",
        ExternalLabel("skip", getInstruction(target)),
    )

    /** [skip] with a leading const, seven code units in all, so the code after it shifts by an odd amount. */
    private fun MutableMethod.oddSkip(anchor: Int, target: Int) = addInstructionsAtControlFlowLabel(
        anchor,
        "const/4 v${borrowed()}, 0x0\ninvoke-static {}, Lcom/example/Probe;->guard()Z\nmove-result v${borrowed()}\n" +
            "if-nez v${borrowed()}, :skip",
        ExternalLabel("skip", getInstruction(target)),
    )

    private fun MutableMethod.padding() = implementation!!.instructions.zipWithNext()
        .count { (nop, payload) -> nop.opcode == Opcode.NOP && payload.opcode == Opcode.PACKED_SWITCH_PAYLOAD }

    private fun MutableMethod.shape() = implementation!!.instructions.map { it.opcode to it.namedRegisters() }

    private fun assertRefused(method: MutableMethod, anchor: Int, target: Int, expected: String) {
        val before = method.shape()
        val refusal = assertThrows(PatchException::class.java) { method.skip(anchor, target) }
        assertTrue(refusal.message, refusal.message!!.endsWith("the code at instruction $anchor $expected"))
        assertEquals(before, method.shape())
    }

    private fun assertHooked(method: MutableMethod, anchor: Int, target: Int) {
        val size = method.implementation!!.instructions.size
        method.skip(anchor, target)
        assertEquals(size + 3, method.implementation!!.instructions.size)
    }
}
