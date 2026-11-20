import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.smali.InlineSmaliCompiler
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test
import java.io.ByteArrayOutputStream
import java.io.PrintStream

/**
 * Probes morphe-patcher 1.8.0's inline smali compiler with registers that do not fit a 4-bit
 * operand. No APK needed: the target is an in-memory method.
 *
 * Finding (2026-10-16): `InlineSmaliCompiler.compile` throws only on *parser* (and lexer)
 * syntax errors. Register width is checked later, in smali's tree walker, whose error count
 * the compiler never reads. The walker reports the error to stderr, skips that one
 * instruction, and the rest of the snippet is inserted. These tests pin that behaviour so a
 * patcher update that starts refusing such snippets shows up here.
 */
class InlineSmaliRegisterWidthTest {

    /** Non-static `target(II)V` with [registers] registers: p0 = v(n-3), p1 = v(n-2), p2 = v(n-1). */
    private fun target(registers: Int = 21): MutableMethod = MutableMethod(
        ImmutableMethod(
            "Lprobe/Target;",
            "target",
            listOf(ImmutableMethodParameter("I", null, null), ImmutableMethodParameter("I", null, null)),
            "V",
            AccessFlags.PUBLIC.value,
            null,
            null,
            ImmutableMethodImplementation(registers, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), null, null),
        )
    )

    private fun MutableMethod.count() = implementation!!.instructions.size
    private fun MutableMethod.opcodes() = implementation!!.instructions.map { it.opcode }

    /** Runs [block] and returns what it printed to stderr (smali's tree walker reports there). */
    private fun stderrOf(block: () -> Unit): String {
        val old = System.err
        val buf = ByteArrayOutputStream()
        System.setErr(PrintStream(buf, true))
        try { block() } finally { System.setErr(old) }
        return buf.toString()
    }

    private data class Probe(val written: Int, val added: Int, val opcodes: List<Opcode>, val stderr: String)

    private fun probe(smali: String, written: Int, registers: Int = 21): Probe {
        val m = target(registers)
        val before = m.count()
        val err = stderrOf { m.addInstructions(0, smali) }
        return Probe(written, m.count() - before, m.opcodes(), err.trim())
    }

    private fun report(label: String, p: Probe) =
        println("[$label] written=${p.written} added=${p.added} opcodes=${p.opcodes} stderr=${p.stderr.ifEmpty { "<none>" }}")

    @Test
    fun `const4 into v17 is dropped silently when anything else survives`() {
        val p = probe("const/4 v0, 0x1\nconst/4 v17, 0x0", written = 2)
        report("const/4 v17 (+1 good)", p)
        assertEquals(1, p.added, "const/4 v17 was emitted or refused, not dropped")
        assertEquals(listOf(Opcode.CONST_4, Opcode.RETURN_VOID), p.opcodes)
    }

    @Test
    fun `a snippet whose only instructions are all dropped throws an opaque NoSuchElement`() {
        // The walker emits no method at all for an empty body, and InlineSmaliCompiler.kt:68
        // calls classDef.methods.first(): loud, but the message names neither register nor method.
        for (smali in listOf("const/4 v17, 0x0", "const/4 p1, 0x0")) {
            val m = target()
            val thrown = runCatching { stderrOf { m.addInstructions(0, smali) } }.exceptionOrNull()
            println("[$smali alone] thrown=$thrown count=${m.count()}")
            assertEquals(NoSuchElementException::class, thrown?.let { it::class })
            assertEquals(1, m.count(), "method changed")
        }
    }

    @Test
    fun `non-range invoke with v20 is dropped but the rest of the snippet stays`() {
        val p = probe(
            """
                const/4 v0, 0x1
                invoke-static {v20}, Lprobe/Hook;->hook(I)V
                const/4 v1, 0x0
            """.trimIndent(),
            written = 3,
        )
        report("invoke-static {v20}", p)
        assertEquals(2, p.added, "expected only the invoke to be dropped")
        assertEquals(listOf(Opcode.CONST_4, Opcode.CONST_4, Opcode.RETURN_VOID), p.opcodes)
    }

    @Test
    fun `const4 into p1 above v15 is dropped`() {
        // 21 registers, 3 parameter registers: p1 = v19.
        val p = probe("const/4 p1, 0x0\nreturn-void", written = 2)
        report("const/4 p1 (=v19)", p)
        assertEquals(1, p.added)
        assertEquals(listOf(Opcode.RETURN_VOID, Opcode.RETURN_VOID), p.opcodes)
    }

    @Test
    fun `iget and if-eq with 4-bit operands above v15 are dropped`() {
        val p = probe(
            """
                iget v0, p0, Lprobe/Target;->f:I
                if-eq v0, v1, :done
                :done
            """.trimIndent(),
            written = 2,
        )
        report("iget p0 (=v18)", p)
        // iget uses p0 = v18 (22c, 4-bit B) and is dropped; if-eq v0, v1 fits.
        assertEquals(1, p.added)
        assertEquals(Opcode.IF_EQ, p.opcodes.first())
    }

    @Test
    fun `an out-of-range const4 literal is dropped the same way`() {
        // Not a register problem, but the same unread tree-walker error: const/4 holds -8..7.
        val p = probe("const/4 v0, 0x8\nreturn-void", written = 2)
        report("const/4 v0, 0x8", p)
        assertEquals(1, p.added)
        assertEquals(listOf(Opcode.RETURN_VOID, Opcode.RETURN_VOID), p.opcodes)
    }

    @Test
    fun `controls that fit are emitted`() {
        val cases = listOf(
            "const/4 v15, 0x0" to Opcode.CONST_4,
            "const/16 v17, 0x0" to Opcode.CONST_16,
            "invoke-static/range {v20 .. v20}, Lprobe/Hook;->hook(I)V" to Opcode.INVOKE_STATIC_RANGE,
            "move-result v200" to Opcode.MOVE_RESULT,
            "if-eqz v17, :l\n:l" to Opcode.IF_EQZ,
            "sget-object v20, Lprobe/Hook;->o:Ljava/lang/Object;" to Opcode.SGET_OBJECT,
        )
        for ((smali, opcode) in cases) {
            val p = probe(smali, written = 1, registers = 256)
            report(smali.lines().first(), p)
            assertEquals(1, p.added, "control '$smali' was not emitted")
            assertEquals(opcode, p.opcodes.first())
        }
        // const/4 p1 in a small method (5 registers: p1 = v3) fits.
        val small = probe("const/4 p1, 0x0", written = 1, registers = 5)
        report("const/4 p1 (=v3)", small)
        assertEquals(1, small.added)
    }

    @Test
    fun `compiler API drops too and does not throw`() {
        val err = stderrOf {
            val out = InlineSmaliCompiler.compile("const/4 v17, 0x0\nreturn-void", "II", 21, false)
            println("[compile] written=2 compiled=${out.size} opcodes=${out.map { it.opcode }}")
            assertEquals(1, out.size)
        }
        println("[compile] stderr=${err.trim()}")
    }

    @Test
    fun `single addInstruction with a bad register throws an opaque NoSuchElement`() {
        val m = target()
        val thrown = runCatching { stderrOf { m.addInstruction(0, "const/4 v17, 0x0") } }.exceptionOrNull()
        println("[addInstruction] thrown=$thrown count=${m.count()}")
        // toInstruction() is toInstructions().first(): an empty list throws rather than dropping.
        assertEquals(NoSuchElementException::class, thrown?.let { it::class })
    }

    @Test
    fun `addInstructionsWithLabels drops the hook call silently`() {
        val m = target()
        val ret = m.implementation!!.instructions.last()
        val err = stderrOf {
            m.addInstructionsWithLabels(
                0,
                """
                    const/4 v0, 0x1
                    invoke-static {v20}, Lprobe/Hook;->hook(I)V
                    if-eqz v0, :skip
                    const/4 v1, 0x0
                """.trimIndent(),
                ExternalLabel("skip", ret),
            )
        }
        println("[withLabels] written=4 opcodes=${m.opcodes()} stderr=${err.trim()}")
        // Written: const/4, invoke, if-eqz, const/4 (+ the original return-void). Only the
        // invoke is missing; the label placeholder nop is still trimmed correctly.
        assertEquals(listOf(Opcode.CONST_4, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN_VOID), m.opcodes())
    }

    @Test
    fun `payload alignment nops shift raw instruction counts`() {
        val m = target(registers = 4)
        m.addInstructions(
            0,
            """
                const/4 v0, 0x0
                packed-switch v0, :table
                :end
                return-void
                :table
                .packed-switch 0x0
                    :end
                .end packed-switch
            """.trimIndent(),
        )
        val before = m.opcodes()
        m.addInstructions(0, "const/4 v1, 0x0")
        val after = m.opcodes()
        println("[payload] before=$before")
        println("[payload] after=$after")
        val rawDelta = after.size - before.size
        val nonNopDelta = after.count { it != Opcode.NOP } - before.count { it != Opcode.NOP }
        println("[payload] rawDelta=$rawDelta nonNopDelta=$nonNopDelta (1 instruction written)")
        // The payload's alignment nop disappears when the insert shifts it to an even offset:
        // a raw before/after count says "0 added" although the instruction is there.
        assertEquals(0, rawDelta)
        assertEquals(1, nonNopDelta)
    }
}