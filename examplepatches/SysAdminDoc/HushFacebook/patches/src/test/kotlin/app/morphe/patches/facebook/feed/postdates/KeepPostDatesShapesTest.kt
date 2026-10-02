/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.postdates

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The parts of Keep post dates that need no Facebook build: the shape of the post header's choice
 * the patch accepts, the shapes it refuses, and where its hook goes.
 */
class KeepPostDatesShapesTest {
    private fun method(body: String, registers: Int = 20) = MutableMethod(
        ImmutableMethod(
            "Lfixture/PostHeaderSubtitle;", "render", listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)),
            "Ljava/lang/Object;", AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null, null, ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, body.trimIndent()) }

    /**
     * The choice as 577 and 580 make it: a call's boolean answer, logged right away through
     * String.valueOf, then a branch on it between the rotating subtitle and the one line. The
     * answer sits in v17 by default, past the four bits a plain call can name, as a later build
     * might put it, so the log's call is a range one there. The patcher's compiler drops a plain
     * call naming a register past v15 without a word, so every call here names its registers the
     * way a real build has to. [head] goes before the call and [tail] after the last return.
     */
    private fun header(
        head: String = "",
        answer: Int = 17,
        between: String = "",
        written: String = "invoke-static/range { v$answer .. v$answer }, $VALUE_OF_BOOLEAN",
        branch: String = "if-eqz v$answer, :one_line",
        secondLog: String = "",
        tail: String = "",
    ) = method(
        """
            $head
            invoke-static/range { p1 .. p1 }, Lfixture/Flags;->A1Y(Ljava/lang/Object;)Z
            move-result v$answer
            $between
            :log
            const-string v4, "$CYCLING_LOG"
            $written
            move-result-object v3
            $secondLog
            const-string v4, "$CYCLING_COUNT_LOG"
            $branch
            const-string v0, "rotating"
            return-object v0
            :one_line
            const-string v0, "one line"
            return-object v0
            $tail
        """,
    )

    private fun MutableMethod.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun stringAt(code: List<Instruction>, index: Int) =
        ((code[index] as? ReferenceInstruction)?.reference as? StringReference)?.string

    @Test
    fun `the choice is the answer logged right after its call and branched on`() {
        val method = header()
        assertEquals("the log's range call", Opcode.INVOKE_STATIC_RANGE, method.body()[3].opcode)
        val choice = cyclingChoice(method)
        assertEquals(17, choice.register)
        assertEquals(CYCLING_LOG, stringAt(method.body(), choice.logIndex))
        // 577 and 580 keep the answer in a register that fits, and their log names it with a plain call.
        val plain = header(answer = 5, written = "invoke-static { v5 }, $VALUE_OF_BOOLEAN")
        assertEquals("the log's plain call", Opcode.INVOKE_STATIC, plain.body()[3].opcode)
        assertEquals(5, cyclingChoice(plain).register)
    }

    /** Each shape changes one thing from [header], and has to be refused for that thing. */
    @Test
    fun `a log that doesn't follow the answer, or writes another register, or goes unbranched is refused`() {
        val wrongWrite = "doesn't write v17"
        val shapes = mapOf(
            "a load between the answer and the log" to
                (header(between = "const/4 v5, 0x0") to "doesn't come right after a call's boolean answer"),
            "the log writing another register" to
                (header(written = "invoke-static { v5 }, $VALUE_OF_BOOLEAN") to wrongWrite),
            "the log writing another register in a range" to
                (header(written = "invoke-static/range { v16 .. v16 }, $VALUE_OF_BOOLEAN") to wrongWrite),
            "the log writing an int" to
                (header(written = "invoke-static/range { v17 .. v17 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;") to wrongWrite),
            "a branch on another register" to (header(branch = "if-eqz v5, :one_line") to "branches on v17"),
            "the answer's register written again before the branch" to
                (header(secondLog = "const/16 v17, 0x1") to "v17 is written again"),
            "a branch no way from the log reaches" to
                (header(branch = "const/4 v5, 0x0", tail = "if-eqz v17, :one_line") to "nothing in"),
            "the answer's register written again on one way to the branch" to
                (header(secondLog = "if-eqz v5, :keep\nconst/16 v17, 0x1\n:keep") to "some ways from the log"),
            "a wide write over the answer's register on one way to the branch" to
                (header(secondLog = "if-eqz v5, :keep\nconst-wide/16 v16, 0x0\n:keep") to "some ways from the log"),
            "a way that skips the branch on the answer and branches on another value" to
                (header(secondLog = "if-nez v5, :skip", tail = ":skip\nconst/16 v17, 0x0\nif-eqz v17, :one_line\nreturn-object v3") to
                    "some ways from the log"),
            "the name loaded twice" to
                (header(secondLog = "const-string v4, \"$CYCLING_LOG\"") to "expected one load of \"$CYCLING_LOG\""),
        )
        for ((shape, case) in shapes) {
            val (method, reason) = case
            val refusal = assertThrows(shape, PatchException::class.java) { cyclingChoice(method) }
            val message = refusal.message!!
            assertTrue("$shape: $message", message.startsWith("$PATCH: ") && reason in message)
        }
    }

    /**
     * A handler reached from the log's call, which can throw, starts a way of its own that still
     * holds the answer: a branch on the register there reads the choice, and one past a write of
     * that register refuses the patch.
     */
    @Test
    fun `a handler reached from the choice is one more way from the log`() {
        fun caught(handler: String) = header(tail = "move-exception v0\n$handler\nreturn-object v3").apply {
            val code = body()
            val log = code.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == VALUE_OF_BOOLEAN }
            val start = code.indexOfFirst { it.opcode == Opcode.MOVE_EXCEPTION }
            implementation!!.apply {
                addCatch("Ljava/lang/Exception;", newLabelForIndex(log), newLabelForIndex(log + 1), newLabelForIndex(start))
            }
        }
        val reading = caught("if-eqz v17, :one_line")
        val log = reading.body().indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == VALUE_OF_BOOLEAN }
        assertEquals("the try block is in the flow", listOf(reading.body().indexOfFirst { it.opcode == Opcode.MOVE_EXCEPTION }),
            ControlFlow.of(reading).exceptional[log])
        assertEquals(17, cyclingChoice(reading).register)
        val refusal = assertThrows(PatchException::class.java) { cyclingChoice(caught("const/16 v17, 0x1\nif-eqz v17, :one_line")) }
        assertTrue(refusal.message!!, "some ways from the log of \"$CYCLING_LOG\" write v17 again before the branch" in refusal.message!!)
    }

    /**
     * The branch between the two subtitles is on the way the header takes when nothing throws. A
     * branch on the answer that only the log's call throwing leads to isn't it, so with the one
     * real branch on another register the method is refused, by name.
     */
    @Test
    fun `a branch on the answer only a catch handler leads to isn't the branch on the choice`() {
        val method = header(branch = "if-eqz v5, :one_line", tail = "move-exception v0\nif-eqz v17, :one_line\nreturn-object v3")
        val code = method.body()
        val log = code.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == VALUE_OF_BOOLEAN }
        val handler = code.indexOfFirst { it.opcode == Opcode.MOVE_EXCEPTION }
        method.implementation!!.apply {
            addCatch("Ljava/lang/Exception;", newLabelForIndex(log), newLabelForIndex(log + 1), newLabelForIndex(handler))
        }
        assertEquals("the try block is in the flow", listOf(handler), ControlFlow.of(method).exceptional[log])
        val refusal = assertThrows(PatchException::class.java) { cyclingChoice(method) }.message!!
        assertTrue(refusal, "in Lfixture/PostHeaderSubtitle;->render the log of \"$CYCLING_LOG\" leads to a branch on v17 only " +
            "through a catch handler" in refusal)
    }

    /**
     * A branch on the answer in a handler that only a nop leads to is on no way from the log, since
     * a nop can't throw. With the one real branch on another register the method is refused, the
     * same as without the try block.
     */
    @Test
    fun `a branch on the answer in a handler only a nop leads to isn't the branch on the choice`() {
        val tail = "move-exception v0\nif-eqz v17, :one_line\nreturn-object v3"
        fun shape(caught: Boolean) = header(secondLog = "nop", branch = "if-eqz v5, :one_line", tail = tail).apply {
            if (!caught) return@apply
            val code = body()
            val nop = code.indexOfFirst { it.opcode == Opcode.NOP }
            val handler = code.indexOfFirst { it.opcode == Opcode.MOVE_EXCEPTION }
            implementation!!.apply {
                addCatch("Ljava/lang/Exception;", newLabelForIndex(nop), newLabelForIndex(nop + 1), newLabelForIndex(handler))
            }
            assertEquals("the try block is in the flow", listOf(handler), ControlFlow.of(this).exceptional[nop])
        }
        val reason = "nothing in Lfixture/PostHeaderSubtitle;->render branches on v17 after the log of \"$CYCLING_LOG\""
        for (caught in listOf(false, true)) {
            val refusal = assertThrows(PatchException::class.java) { cyclingChoice(shape(caught)) }.message!!
            assertTrue("caught $caught: $refusal", reason in refusal)
        }
    }

    /**
     * A try block over a write of the answer's register and a nop can't reach its handler, since
     * neither can throw, so the branch in that handler is on no way from the log and the choice
     * reads as it does without the try block.
     */
    @Test
    fun `a try block over what can't throw between the choice and its branch changes nothing`() {
        val tail = ":skip\nconst/16 v17, 0x0\nnop\nreturn-object v3\nmove-exception v0\nif-eqz v17, :one_line\nreturn-object v3"
        val plain = header(secondLog = "if-nez v5, :skip", tail = tail)
        val method = header(secondLog = "if-nez v5, :skip", tail = tail)
        val code = method.body()
        val rewrite = code.indexOfFirst { it.opcode == Opcode.CONST_16 && (it as OneRegisterInstruction).registerA == 17 }
        assertEquals(Opcode.NOP, code[rewrite + 1].opcode)
        val handler = code.indexOfFirst { it.opcode == Opcode.MOVE_EXCEPTION }
        method.implementation!!.apply {
            addCatch("Ljava/lang/Exception;", newLabelForIndex(rewrite), newLabelForIndex(rewrite + 2), newLabelForIndex(handler))
        }
        assertEquals("the try block is in the flow", listOf(handler), ControlFlow.of(method).exceptional[rewrite + 1])
        val choice = cyclingChoice(method)
        val without = cyclingChoice(plain)
        assertEquals(without.logIndex to without.register, choice.logIndex to choice.register)
    }

    /**
     * A choice made again on a loop's next pass gets the hook again, since the hook sits right
     * after it, so a way back round to it before the branch is no other value.
     */
    @Test
    fun `a choice made inside a loop with every branch reading it is accepted`() {
        val method = header(head = ":again", secondLog = "if-nez p1, :again")
        assertEquals(17, cyclingChoice(method).register)
    }

    /** 577 uses the answer's register again further on, after the branch, and that's no reason to refuse. */
    @Test
    fun `a branch on the register after it's written again past the choice is left alone`() {
        val method = header(branch = "if-eqz v17, :one_line\nconst/16 v17, 0x3\nif-eqz v17, :one_line")
        assertEquals(17, cyclingChoice(method).register)
    }

    /**
     * The hook goes in at the log's own label: between the answer and the log, and a jump to the
     * log goes through it too. A range call names the register whatever its number, and the
     * extension's answer lands back where the branch reads it.
     */
    @Test
    fun `the hook sits at the log's label and hands the answer back to the same register`() {
        val method = header(tail = "goto :log")
        val before = method.body()
        val choice = cyclingChoice(method)
        val jump = before.indexOfLast { it.opcode == Opcode.GOTO }
        assertEquals("the fixture's jump back to the log", listOf(choice.logIndex), ControlFlow.of(method).normal[jump])
        method.hookCyclingChoice(choice)

        val after = method.body()
        assertEquals(before.size + 2, after.size)
        val call = after[choice.logIndex]
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals(CYCLING, (call as ReferenceInstruction).reference.toString())
        val range = call as RegisterRangeInstruction
        assertEquals(17 to 1, range.startRegister to range.registerCount)
        assertEquals(Opcode.MOVE_RESULT, after[choice.logIndex + 1].opcode)
        assertEquals(17, (after[choice.logIndex + 1] as OneRegisterInstruction).registerA)
        assertEquals(CYCLING_LOG, stringAt(after, choice.logIndex + 2))
        assertEquals("the jump to the log goes through the hook", listOf(choice.logIndex), ControlFlow.of(method).normal[jump + 2])
    }
}
