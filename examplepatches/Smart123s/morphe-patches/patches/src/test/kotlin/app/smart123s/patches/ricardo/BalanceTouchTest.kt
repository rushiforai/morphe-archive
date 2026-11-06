package app.smart123s.patches.ricardo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertSame

internal class BalanceTouchTest {
    private fun touchMethod(prefixLength: Int): MutableMethod {
        val method = MutableMethod(ImmutableMethod(
            "Lricardonemlopot/nemlopot/rube/RubeLoaderTest;", "touchDown",
            List(4) { ImmutableMethodParameter("I", emptySet(), null) }, "Z",
            AccessFlags.PUBLIC.value, emptySet(), emptySet(),
            ImmutableMethodImplementation(14, emptyList(), emptyList(), emptyList()),
        ))
        method.addInstructions(0, """
            ${List(prefixLength) { "const/4 v1, 0x0" }.joinToString("\n")}
            sput-object v1, Lricardonemlopot/nemlopot/rube/RubeLoaderTest;->t:Lcom/badlogic/gdx/math/Vector3;
            sget-object v1, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;
            const/4 v0, 0x0
            return v0
        """)
        return method
    }

    @Test
    fun `ordinary taps jump to original dispatch regardless of insertion position`() {
        // Reproduces the freeze: a label left in the compiler's temporary method
        // used to jump backwards into the prelude, repeating the touch hook.
        for (prefixLength in listOf(17, 40)) {
            val method = touchMethod(prefixLength)
            val implementation = method.implementation!!
            val insertion = prefixLength + 1
            val continuation = implementation.instructions[insertion]
            method.hookBalanceTouch()
            val hook = implementation.instructions
            val branch = hook[insertion + 2] as BuilderOffsetInstruction
            assertEquals(Opcode.IF_EQZ, branch.opcode)
            assertEquals(insertion + 7, branch.target.location.index)
            assertSame(continuation, branch.target.location.instruction)
            assertEquals(12, (hook[insertion] as FiveRegisterInstruction).registerC)
            assertEquals(14, implementation.registerCount)
        }
    }

    @Test
    fun `original early return still bypasses touch handling`() {
        val method = touchMethod(17)
        val implementation = method.implementation!!
        val originalReturn = implementation.instructions.last()
        method.addInstructionsWithLabels(0, """
            const/4 v1, 0x0
            if-eqz v1, :skip_touch
        """, ExternalLabel("skip_touch", originalReturn))
        method.hookBalanceTouch()
        val originalGuard = implementation.instructions[1] as BuilderOffsetInstruction
        assertSame(originalReturn, originalGuard.target.location.instruction)
        assertEquals(implementation.instructions.lastIndex, originalGuard.target.location.index)
    }
}
