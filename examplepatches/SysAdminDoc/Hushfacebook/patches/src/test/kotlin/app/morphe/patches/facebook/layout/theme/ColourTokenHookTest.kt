/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The colour token the resolver hooks read at each return: it has to still be in its parameter's
 * register there, found past `this` and any wide parameter before it.
 */
class ColourTokenHookTest {
    private val resolve = "Lfixture/Palette;->resolve(Landroid/content/Context;Lfixture/Token;)I"

    private fun resolver(parameters: List<String>, registers: Int, smali: String): MutableMethod = MutableMethod(
        ImmutableMethod(
            "Lfixture/Resolver;", "colour", parameters.map { ImmutableMethodParameter(it, null, null) }, "I",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, smali) }

    private fun MutableMethod.body(): List<Instruction> = implementation!!.instructions.toList()

    /** The registers each extension call passes: the colour, then the token. */
    private fun MutableMethod.hookCalls(): List<List<Int>> = body()
        .filter { (it as? ReferenceInstruction)?.reference?.toString() == APPLY }
        .map { listOf((it as FiveRegisterInstruction).registerC, it.registerD) }

    /**
     * The resolver is done with the token before it returns and puts the context in its register.
     * The hook would hand the extension the context as the token, which verifies all the same.
     */
    @Test
    fun `a resolver that reuses the token's register before returning stops the hook`() {
        val method = resolver(
            listOf("Landroid/content/Context;", "Lfixture/Token;"), 3,
            """
                invoke-static { v1, v2 }, $resolve
                move-result v0
                move-object v2, v1
                return v0
            """,
        )
        val before = method.body().size
        val refused = assertThrows(PatchException::class.java) { method.hookColorReturns(tokenParameterIndex = 1, target = APPLY) }
        assertTrue(refused.message, refused.message.orEmpty().startsWith("Colour token hook:"))
        assertTrue(refused.message, refused.message.orEmpty().contains("parameter 1 (v2) at instruction(s) 2"))
        assertEquals("nothing went in", before, method.body().size)
    }

    /** The positive control: the token's register is only reused on a path that throws. */
    @Test
    fun `a token register reused only on the way to a throw still takes the hook`() {
        val method = resolver(
            listOf("Landroid/content/Context;", "Lfixture/Token;"), 3,
            """
                if-nez v2, :resolve
                new-instance v2, Ljava/lang/IllegalStateException;
                invoke-direct { v2 }, Ljava/lang/IllegalStateException;-><init>()V
                throw v2
                :resolve
                invoke-static { v1, v2 }, $resolve
                move-result v0
                return v0
            """,
        )
        method.hookColorReturns(tokenParameterIndex = 1, target = APPLY)
        assertEquals(listOf(listOf(0, 2)), method.hookCalls())
        assertEquals(Opcode.RETURN, method.body().last().opcode)
    }

    /**
     * A long before the token takes two registers. Counted as one, the hook read the long's upper
     * half as the token. A long after it moves nothing, which a count of parameters in place of
     * their registers would get wrong.
     */
    @Test
    fun `the token is read from its own register with a wide parameter on either side`() {
        val after = resolver(
            listOf("J", "Lfixture/Token;"), 4,
            """
                long-to-int v0, v1
                return v0
            """,
        )
        after.hookColorReturns(tokenParameterIndex = 1, target = APPLY)
        assertEquals("after a long", listOf(listOf(0, 3)), after.hookCalls())

        val before = resolver(
            listOf("Lfixture/Token;", "J"), 4,
            """
                long-to-int v0, v2
                return v0
            """,
        )
        before.hookColorReturns(tokenParameterIndex = 0, target = APPLY)
        assertEquals("before a long", listOf(listOf(0, 1)), before.hookCalls())
    }
}
