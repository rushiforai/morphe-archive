/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.feed

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class ReachingWritesTest {
    @Test
    fun `both arms' writes reach the join, and no path from the entry does`() {
        val method = smali(
            registers = 3, params = listOf("Z"),
            body = """
                if-eqz p0, :zero
                const/4 v0, 0x1
                goto :join
                :zero
                const/4 v0, 0x0
                :join
                invoke-static {v0}, Lcom/example/Log;->note(I)V
                return-void
            """,
        )
        assertEquals(Reaching(setOf(1, 3), fromEntry = false), method.reaching(4, setOf(0)))
    }

    @Test
    fun `an arm that leaves the register alone reaches from the entry`() {
        val method = smali(
            registers = 3, params = listOf("Z"),
            body = """
                if-eqz p0, :join
                const/4 v0, 0x1
                :join
                invoke-static {v0}, Lcom/example/Log;->note(I)V
                return-void
            """,
        )
        assertEquals(Reaching(setOf(1), fromEntry = true), method.reaching(2, setOf(0)))
        assertEquals(Reaching(emptySet(), fromEntry = true), method.reaching(0, setOf(0)))
    }

    @Test
    fun `a wide write counts for both halves of its pair and nothing else`() {
        val method = smali(
            registers = 4, params = emptyList(),
            body = """
                const-wide/16 v0, 0x5
                const/4 v2, 0x0
                invoke-static {v1}, Lcom/example/Log;->note(I)V
                return-void
            """,
        )
        val wide = method.implementation!!.instructions.first()
        assertTrue(wide.writes(0))
        assertTrue(wide.writes(1))
        assertFalse(wide.writes(2))
        assertEquals(Reaching(setOf(0), fromEntry = false), method.reaching(2, setOf(1)))
        assertEquals(Reaching(setOf(1), fromEntry = false), method.reaching(2, setOf(2)))
        assertEquals(Reaching(emptySet(), fromEntry = true), method.reaching(2, setOf(3)))
    }

    @Test
    fun `a write later in a loop reaches back to its top, and the walk ends`() {
        val method = smali(
            registers = 3, params = listOf("Z"),
            body = """
                const/4 v0, 0x0
                :top
                invoke-static {v0}, Lcom/example/Log;->note(I)V
                const/4 v0, 0x1
                if-eqz p0, :top
                return-void
            """,
        )
        assertEquals(Reaching(setOf(0, 2), fromEntry = false), method.reaching(1, setOf(0)))
    }

    @Test
    fun `a write that throws leaves the handler with what the register held before`() {
        val box = ImmutableFieldReference("Lcom/example/Box;", "value", "I")
        val note = ImmutableMethodReference("Lcom/example/Log;", "note", listOf("I"), "V")
        // 0: const/4 v1, 0           address 0
        // 1: iget v2, v1, Box.value  address 1, in the try: can throw, writes v2
        // 2: return-void             address 3, in the try
        // 3: move-exception v0       address 4, the handler
        // 4: invoke-static {v2} note address 5, the handler reads v2
        // 5: return-void
        val instructions = listOf(
            ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
            ImmutableInstruction22c(Opcode.IGET, 2, 1, box),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
            ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 0),
            ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 2, 0, 0, 0, 0, note),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        )
        val tryBlock = ImmutableTryBlock(1, 3, listOf(ImmutableExceptionHandler("Ljava/lang/Exception;", 4)))
        val method = MutableMethod(ImmutableMethod(
            "Lcom/example/Host;", "run", emptyList(), "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(3, instructions, listOf(tryBlock), null),
        ))
        // The iget throwing never wrote v2, so the entry's value reaches the handler too. The write
        // reaches it through the return, which sits in the try as well.
        assertEquals(Reaching(setOf(1), fromEntry = true), method.reaching(4, setOf(2)))
    }

    private fun smali(registers: Int, params: List<String>, body: String) = MutableMethod(
        ImmutableMethod(
            "Lcom/example/Host;", "run", params.map { ImmutableMethodParameter(it, null, null) }, "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, body.trimIndent()) }
}
