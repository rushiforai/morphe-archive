package dev.twitchpatches.patches.twitch.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import dev.twitchpatches.patches.twitch.shared.code
import dev.twitchpatches.patches.twitch.shared.insertBeforeWithLabels
import org.junit.Assert.assertEquals
import org.junit.Test

class SettingsEntryTest {
    private fun group(registers: Int, body: String): MutableMethod =
        ImmutableMethod("Lsynthetic/Settings;", "group", emptyList(), "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            MutableMethodImplementation(registers)).toMutable().apply {
                addInstructionsWithLabels(0, body)
            }

    @Test fun nativeRowArgumentsSurviveInjectionIncludingIncomingBranch() {
        val method = group(120, """
            goto :row
            :row
            invoke-static/range {v98 .. v105}, Lsynthetic/Row;->render(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Object;II)V
            return-void
        """)
        assertEquals(103, rowComposerRegister(method, 1))
        method.insertBeforeWithLabels(1,
            "invoke-static/range {v103 .. v103}, Lsynthetic/Entry;->render(Ljava/lang/Object;)V")
        val code = method.code()
        val branch = code[0] as OffsetInstruction
        assertEquals(code[0].codeUnits, branch.codeOffset)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, code[1].opcode)
        val original = code[2] as RegisterRangeInstruction
        assertEquals(98, original.startRegister)
        assertEquals(8, original.registerCount)
        assertEquals(Opcode.RETURN_VOID, code[3].opcode)
    }

    @Test(expected = PatchException::class) fun changedArgumentWidthIsRejected() {
        rowComposerRegister(group(9, """
            invoke-static/range {v0 .. v8}, Lsynthetic/Row;->render(JIIIIIII)V
            return-void
        """), 0)
    }

    @Test(expected = PatchException::class) fun outOfBoundsRangeIsRejected() {
        rowComposerRegister(group(7, """
            invoke-static/range {v0 .. v7}, Lsynthetic/Row;->render(IIIIIIII)V
            return-void
        """), 0)
    }

    @Test(expected = PatchException::class) fun changedInvocationKindIsRejected() {
        rowComposerRegister(group(8, """
            invoke-virtual/range {v0 .. v7}, Lsynthetic/Row;->render(IIIIIII)V
            return-void
        """), 0)
    }
}
