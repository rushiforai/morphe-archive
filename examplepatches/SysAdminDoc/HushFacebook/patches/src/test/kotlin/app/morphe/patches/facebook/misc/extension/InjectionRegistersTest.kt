/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.extension

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.RegisterLiveness
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Which registers a hook put in the middle of a method may borrow ([freeLocalsAt], [requireFreeAt])
 * and whether a parameter it reads there is still the parameter ([requireParameterIntact]). Having
 * locals, which is all [requireLocals] asks, only makes a register free at index 0.
 */
class InjectionRegistersTest {
    private fun smali(registers: Int, params: List<String>, body: String) = MutableMethod(
        ImmutableMethod(
            "Lcom/example/Host;", "run", params.map { ImmutableMethodParameter(it, null, null) }, "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, body.trimIndent()) }

    private fun method(registers: Int, instructions: List<Instruction>, tryBlock: ImmutableTryBlock? = null, params: List<String> = emptyList()) =
        MutableMethod(
            ImmutableMethod(
                "Lcom/example/Host;", "run", params.map { ImmutableMethodParameter(it, null, null) }, "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
                ImmutableMethodImplementation(registers, instructions, listOfNotNull(tryBlock), null),
            ),
        )

    private val risky = ImmutableMethodReference("Lcom/example/Io;", "risky", emptyList<String>(), "V")
    private val note = ImmutableMethodReference("Lcom/example/Log;", "note", listOf("I"), "V")

    @Test
    fun `a local the method still reads after the injection point is not free`() {
        val method = smali(
            registers = 4, params = emptyList(),
            body = """
                const/4 v0, 0x1
                const/4 v1, 0x0
                invoke-static {v0}, Lcom/example/Log;->note(I)V
                return-void
            """,
        )
        // Four locals, so the old check was satisfied, and v0 is the one still wanted.
        method.requireLocals("Fixture", 1)
        assertEquals(listOf(1), method.freeLocalsAt("Fixture", 2, 1))
        assertEquals(listOf(1, 2, 3), method.freeLocalsAt("Fixture", 2, 3))
        method.requireFreeAt("Fixture", 2, listOf(1, 2))

        val refused = assertThrows(PatchException::class.java) { method.requireFreeAt("Fixture", 2, listOf(0, 1)) }
        assertTrue(refused.message, refused.message.orEmpty().contains("still reads v0 after instruction 2"))
    }

    @Test
    fun `a register read where the hook can jump to is not free`() {
        val method = smali(
            registers = 3, params = listOf("Z"),
            body = """
                const/4 v1, 0x1
                if-eqz p0, :read
                return-void
                :read
                invoke-static {v1}, Lcom/example/Log;->note(I)V
                return-void
            """,
        )
        // In front of the return nothing is read; the hook's jump to the call reads v1.
        method.requireFreeAt("Fixture", 2, listOf(1))
        assertThrows(PatchException::class.java) { method.requireFreeAt("Fixture", 2, listOf(1), targets = listOf(3)) }
        assertEquals(listOf(0), method.freeLocalsAt("Fixture", 2, 1, targets = listOf(3)))
    }

    /**
     * A try block's end label stays on the first instruction after its range, so code put in front
     * of that instruction lands inside the block and can throw into its handler. The instruction's
     * own liveness doesn't count that handler; this does.
     */
    @Test
    fun `code put in front of the instruction after a try block lands inside it`() {
        // 0: const/4 v1, 0        address 0
        // 1: invoke-static risky  address 1, the try's only instruction
        // 2: const/4 v2, 0        address 4, just after the try's range
        // 3: return-void          address 5
        // 4: move-exception v0    address 6, the handler
        // 5: invoke-static {v1}   address 7, the handler reads v1
        // 6: return-void
        fun build() = method(
            3,
            listOf(
                ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
                ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0, risky),
                ImmutableInstruction11n(Opcode.CONST_4, 2, 0),
                ImmutableInstruction10x(Opcode.RETURN_VOID),
                ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 0),
                ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 1, 0, 0, 0, 0, note),
                ImmutableInstruction10x(Opcode.RETURN_VOID),
            ),
            ImmutableTryBlock(1, 3, listOf(ImmutableExceptionHandler("Ljava/lang/Exception;", 6))),
        )
        val method = build()
        assertFalse("the instruction's own liveness misses the handler", 1 in RegisterLiveness.of(method).liveInto(2))
        assertTrue(1 in method.liveAcrossInjection(2))
        assertThrows(PatchException::class.java) { method.requireFreeAt("Fixture", 2, listOf(1)) }
        assertEquals(listOf(0, 2), method.freeLocalsAt("Fixture", 2, 2))

        // What dexlib2 does, shown rather than assumed: the try block grows over the new code.
        val patched = build()
        patched.addInstructions(2, "invoke-static {}, Lcom/example/Io;->risky()V")
        val block = patched.implementation!!.tryBlocks.single()
        val injectedAt = patched.implementation!!.instructions.take(2).sumOf { it.codeUnits }
        assertTrue(
            "the injected call at address $injectedAt sits in the try from ${block.startCodeAddress} for ${block.codeUnitCount}",
            injectedAt >= block.startCodeAddress && injectedAt < block.startCodeAddress + block.codeUnitCount,
        )
    }

    @Test
    fun `a parameter is never borrowed, even where nothing reads it`() {
        val method = smali(
            registers = 3, params = listOf("I"),
            body = """
                const/4 v0, 0x0
                return-void
            """,
        )
        assertEquals(listOf(0, 1), method.freeLocalsAt("Fixture", 1, 2))
        assertThrows(PatchException::class.java) { method.freeLocalsAt("Fixture", 1, 3) }
        val refused = assertThrows(PatchException::class.java) { method.requireFreeAt("Fixture", 1, listOf(2)) }
        assertTrue(refused.message, refused.message.orEmpty().contains("keeps a parameter in v2"))
    }

    @Test
    fun `a register past what the hook's operands can name is not offered`() {
        val method = smali(
            registers = 20, params = emptyList(),
            body = """
                invoke-static/range {v0 .. v15}, Lcom/example/Log;->many(IIIIIIIIIIIIIIII)V
                return-void
            """,
        )
        val refused = assertThrows(PatchException::class.java) { method.freeLocalsAt("Fixture", 0, 1) }
        assertTrue(refused.message, refused.message.orEmpty().contains("up to v15"))
        assertEquals(listOf(16), method.freeLocalsAt("Fixture", 0, 1, highest = 255))
    }

    @Test
    fun `a parameter written over before the hook reads it is refused`() {
        val method = smali(
            registers = 3, params = listOf("I", "Ljava/lang/Object;"),
            body = """
                const/4 v0, 0x0
                const/4 v2, 0x0
                return-void
            """,
        )
        val refused = assertThrows(PatchException::class.java) { method.requireParameterIntact("Fixture", 1, listOf(2)) }
        assertTrue(refused.message, refused.message.orEmpty().contains("parameter 1 (v2) at instruction(s) 1"))
        // The positive control: the other parameter is never written.
        method.requireParameterIntact("Fixture", 0, listOf(2))
    }

    @Test
    fun `a write on a path that never reaches the read leaves the parameter intact`() {
        val method = smali(
            registers = 3, params = listOf("I", "Ljava/lang/Object;"),
            body = """
                if-eqz v1, :ok
                const/4 v2, 0x0
                throw v2
                :ok
                return-void
            """,
        )
        method.requireParameterIntact("Fixture", 1, listOf(3))
    }

    @Test
    fun `a write that a later throw carries into a handler reaches the handler's read`() {
        // 0: const/4 v0, 0        address 0
        // 1: const/4 v2, 0        address 1, in the try: overwrites the parameter
        // 2: invoke-static risky  address 2, in the try: throws with the new value in v2
        // 3: return-void          address 5
        // 4: move-exception v0    address 6, the handler
        // 5: return-void          address 7, where the hook would read it
        val method = method(
            3,
            listOf(
                ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                ImmutableInstruction11n(Opcode.CONST_4, 2, 0),
                ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0, risky),
                ImmutableInstruction10x(Opcode.RETURN_VOID),
                ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 0),
                ImmutableInstruction10x(Opcode.RETURN_VOID),
            ),
            ImmutableTryBlock(1, 4, listOf(ImmutableExceptionHandler("Ljava/lang/Exception;", 6))),
            params = listOf("I", "Ljava/lang/Object;"),
        )
        assertThrows(PatchException::class.java) { method.requireParameterIntact("Fixture", 1, listOf(5)) }
    }

    @Test
    fun `a parameter's register counts this and the wide parameters before it`() {
        val static = smali(registers = 5, params = listOf("J", "Ljava/lang/Object;"), body = "return-void")
        assertEquals("two locals, then the long's pair", 4, static.parameterRegisterNumber(1))
        val instance = MutableMethod(
            ImmutableMethod(
                "Lcom/example/Host;", "run",
                listOf(ImmutableMethodParameter("D", null, null), ImmutableMethodParameter("Ljava/lang/Object;", null, null)),
                "V", AccessFlags.PUBLIC.value, null, null,
                ImmutableMethodImplementation(6, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), null, null),
            ),
        )
        assertEquals("two locals, this, then the double's pair", 5, instance.parameterRegisterNumber(1))
    }
}
