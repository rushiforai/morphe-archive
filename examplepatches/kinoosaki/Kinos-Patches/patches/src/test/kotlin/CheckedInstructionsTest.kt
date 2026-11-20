import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.smaliInstructionCount
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.assertThrows

/**
 * The checked smali helpers (shared/CheckedInstructions.kt) refuse every case that
 * InlineSmaliRegisterWidthTest shows the patcher dropping, and accept the controls.
 */
class CheckedInstructionsTest {

    /** Non-static `target(II)V`; with 21 registers p0 = v18, p1 = v19, p2 = v20. */
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

    private fun MutableMethod.opcodes() = implementation!!.instructions.map { it.opcode }

    private fun assertRefused(block: () -> Unit) {
        val e = assertThrows<PatchException> { block() }
        println("[refused] ${e.message?.lineSequence()?.first()}")
        assertTrue(e.message!!.contains("Lprobe/Target;->target(II)V"), "message does not name the method")
    }

    @Test
    fun `refuses const4 v17`() {
        assertRefused { target().addInstructionsChecked(0, "const/4 v0, 0x1\nconst/4 v17, 0x0") }
        assertRefused { target().addInstructionsChecked(0, "const/4 v17, 0x0") }
    }

    @Test
    fun `refuses non-range invoke with v20`() {
        assertRefused {
            target().addInstructionsChecked(
                0,
                """
                    const/4 v0, 0x1
                    invoke-static {v20}, Lprobe/Hook;->hook(I)V
                    const/4 v1, 0x0
                """.trimIndent(),
            )
        }
    }

    @Test
    fun `refuses const4 p1 above v15`() {
        assertRefused { target().addInstructionsChecked(0, "const/4 p1, 0x0\nreturn-void") }
        assertRefused { target().addInstructionsChecked("const/4 p1, 0x0") }
    }

    @Test
    fun `refuses iget on p0 above v15`() {
        assertRefused { target().addInstructionsChecked(0, "iget v0, p0, Lprobe/Target;->f:I\nreturn-void") }
    }

    @Test
    fun `refuses an out-of-range const4 literal`() {
        assertRefused { target().addInstructionsChecked(0, "const/4 v0, 0x8\nreturn-void") }
    }

    @Test
    fun `refuses a dropped hook in addInstructionsWithLabels`() {
        val m = target()
        val ret = m.implementation!!.instructions.last()
        assertRefused {
            m.addInstructionsWithLabelsChecked(
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
    }

    @Test
    fun `addInstructionChecked refuses a bad register and multi-instruction snippets`() {
        assertRefused { target().addInstructionChecked(0, "const/4 v17, 0x0") }
        // The patcher's addInstruction keeps only the first compiled instruction.
        assertRefused { target().addInstructionChecked(0, "const/4 v0, 0x0\nreturn-void") }
    }

    @Test
    fun `accepts controls that fit`() {
        val big = target(registers = 256)
        big.addInstructionsChecked(
            0,
            """
                const/4 v15, 0x0
                const/16 v17, 0x0
                invoke-static/range {v20 .. v20}, Lprobe/Hook;->hook(I)V
                move-result v200
                if-eqz v17, :l
                sget-object v20, Lprobe/Hook;->o:Ljava/lang/Object;
                :l
                nop
            """.trimIndent(),
        )
        assertEquals(
            listOf(
                Opcode.CONST_4, Opcode.CONST_16, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT,
                Opcode.IF_EQZ, Opcode.SGET_OBJECT, Opcode.NOP, Opcode.RETURN_VOID,
            ),
            big.opcodes(),
        )
        val small = target(registers = 5)
        small.addInstructionChecked(0, "const/4 p1, 0x0")
        small.addInstructionChecked("return-void")
        assertEquals(listOf(Opcode.CONST_4, Opcode.RETURN_VOID, Opcode.RETURN_VOID), small.opcodes())

        val withLabel = target()
        val ret = withLabel.implementation!!.instructions.last()
        withLabel.addInstructionsWithLabelsChecked(0, "const/4 v0, 0x1\nif-eqz v0, :skip\nconst/4 v1, 0x0", ExternalLabel("skip", ret))
        assertEquals(listOf(Opcode.CONST_4, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN_VOID), withLabel.opcodes())
    }

    @Test
    fun `accepts inserts that move a payload alignment nop`() {
        val m = target(registers = 4)
        m.addInstructionsChecked(
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
        // Raw count does not change here (the alignment nop goes away), but this is not a drop.
        m.addInstructionsChecked(0, "const/4 v1, 0x0")
        assertEquals(before.size, m.opcodes().size)
        // And the reverse: the nop comes back.
        m.addInstructionsChecked(0, "const/4 v2, 0x0")
        assertEquals(before.size + 2, m.opcodes().size)
    }

    @Test
    fun `counts snippet instructions`() {
        assertEquals(0, smaliInstructionCount(""))
        assertEquals(1, smaliInstructionCount("  const/4 v0, 0x1  # comment"))
        assertEquals(2, smaliInstructionCount("# c\n:label\nconst/4 v0, 0x1\n.line 4\nreturn v0\n"))
        assertEquals(1, smaliInstructionCount("nop\nreturn-void"))
        assertEquals(
            3,
            smaliInstructionCount(
                """
                    packed-switch v0, :t
                    return-void
                    :t
                    .packed-switch 0x0
                        :a
                        :b
                    .end packed-switch
                """.trimIndent()
            ),
        )
        assertEquals(2, smaliInstructionCount("const-string v0, \"a # b\"\n.array-data 4\n 0x1\n 0x2\n.end array-data"))
    }
}