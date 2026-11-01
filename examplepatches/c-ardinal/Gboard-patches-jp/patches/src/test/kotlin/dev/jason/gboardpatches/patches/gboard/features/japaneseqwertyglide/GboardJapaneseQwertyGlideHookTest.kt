package dev.jason.gboardpatches.patches.gboard.features.japaneseqwertyglide

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.jason.gboardpatches.patches.gboard.shared.isFieldReference
import dev.jason.gboardpatches.patches.gboard.shared.isInvoke
import dev.jason.gboardpatches.patches.gboard.shared.isRegisterOperation
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotSame
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

class GboardJapaneseQwertyGlideHookTest {
    private val hook = JAPANESE_GLIDE_HOOKS.single {
        it.target == GboardJapaneseQwertyGlideTargets.handlerContextSend
    }

    @Test
    fun handlerReplacementReservesLocalAndPreservesContextAndEventOnFallback() {
        val original = stockHandler()
        val patched = original.applyJapaneseGlideHook(hook)
        assertNotSame(original, patched)
        assertEquals(2, original.implementation!!.registerCount)
        assertEquals(4, original.implementation!!.instructions.size)
        assertEquals(3, patched.implementation!!.registerCount)
        assertTrue(patched.implementation!!.tryBlocks.isEmpty())

        val instructions = patched.implementation!!.instructions.toList()
        assertEquals(8, instructions.size)
        assertTrue(instructions[0].isInvoke("INVOKE_STATIC", RuntimeAbiCatalog.abi(hook.call).reference, 1, 2))
        assertTrue(instructions[1].isRegisterOperation("MOVE_RESULT", 0))
        assertTrue(instructions[2].isRegisterOperation("IF_EQZ", 0))
        // The false result jumps past return-void directly to the stock dispatch.
        assertEquals(3, (instructions[2] as OffsetInstruction).codeOffset)
        assertTrue(instructions[4].isRegisterOperation("IGET_OBJECT", 0, 1))
        assertTrue(instructions[4].isFieldReference(GboardJapaneseQwertyGlideTargets.HANDLER_CONTEXT_MANAGER_FIELD))
        assertTrue(instructions[5].isRegisterOperation("IGET_OBJECT", 0, 0))
        assertTrue(instructions[5].isFieldReference(GboardJapaneseQwertyGlideTargets.MANAGER_DELEGATE_FIELD))
        assertTrue(instructions[6].isInvoke("INVOKE_INTERFACE", GboardJapaneseQwertyGlideTargets.MANAGER_SEND, 0, 2))
    }

    @Test
    fun applyingHookToReturnedReplacementIsIdempotent() {
        val patched = stockHandler().applyJapaneseGlideHook(hook)
        val instructions = patched.implementation!!.instructions.toList()
        assertSame(patched, patched.applyJapaneseGlideHook(hook))
        assertEquals(instructions, patched.implementation!!.instructions.toList())
    }

    @Test
    fun wrongStockDispatchRegistersAreRejectedBeforeMutation() {
        val malformed = stockHandler(dispatchRegisters = "v1, v0")
        val instructions = malformed.implementation!!.instructions.toList()
        try {
            malformed.applyJapaneseGlideHook(hook)
            fail("Malformed stock dispatch must be rejected")
        } catch (failure: IllegalStateException) {
            assertTrue(failure.message.orEmpty().contains("MALFORMED state before mutation"))
        }
        assertEquals(2, malformed.implementation!!.registerCount)
        assertEquals(instructions, malformed.implementation!!.instructions.toList())
    }

    private fun stockHandler(dispatchRegisters: String = "v0, v1"): MutableMethod =
        ImmutableMethod(
            "Lpml;", "n", listOf(ImmutableMethodParameter("Lohe;", emptySet(), null)), "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, emptySet(), emptySet(),
            MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(0, """
                iget-object v0, v0, ${GboardJapaneseQwertyGlideTargets.HANDLER_CONTEXT_MANAGER_FIELD}
                iget-object v0, v0, ${GboardJapaneseQwertyGlideTargets.MANAGER_DELEGATE_FIELD}
                invoke-interface {$dispatchRegisters}, ${GboardJapaneseQwertyGlideTargets.MANAGER_SEND}
                return-void
            """.trimIndent())
        }
}
