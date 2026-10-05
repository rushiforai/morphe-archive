package dev.twitchpatches.patches.twitch.promotions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.code
import org.junit.Assert.*
import org.junit.Test

class OptionalRendererGateTest {
    private fun renderer(registers: Int, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value) =
        ImmutableMethod("Lsynthetic/Promotion;", "render", listOf(ImmutableMethodParameter("J", null, null)),
            "V", flags, null, null, MutableMethodImplementation(registers)).toMutable().apply {
            addInstructionsWithLabels(0, """
                invoke-static/range {p0 .. p1}, Lsynthetic/Compose;->start(J)V
                return-void
            """)
        }

    @Test fun enabledGateReturnsBeforeAnyOriginalComposeGroupAndOffPreservesArguments() {
        val method = renderer(3)
        method.gateOptionalRenderer("Lsynthetic/Policy;")
        val code = method.code()
        assertEquals(Opcode.RETURN_VOID, code[3].opcode)
        val branch = code[2] as OffsetInstruction
        assertEquals(code[2].codeUnits + code[3].codeUnits, branch.codeOffset)
        assertEquals("Lsynthetic/Compose;->start(J)V", (code[5] as ReferenceInstruction).reference.toString())
        assertEquals(3, method.implementation?.registerCount)
    }

    @Test(expected = PatchException::class) fun wideParametersCannotBeMistakenForScratchSpace() {
        renderer(2).gateOptionalRenderer("Lsynthetic/Policy;")
    }

    @Test(expected = PatchException::class) fun instanceRendererCannotBeGatedWithStaticRegisterContract() {
        renderer(4, AccessFlags.PUBLIC.value).gateOptionalRenderer("Lsynthetic/Policy;")
    }
}
