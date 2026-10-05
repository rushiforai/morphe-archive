package dev.twitchpatches.patches.twitch.diagnostics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import dev.twitchpatches.patches.twitch.shared.code
import org.junit.Assert.*
import org.junit.Test

class FrameTraceHooksTest {
    private fun caller(registers: Int, instructions: String) = ImmutableMethod("Lsynthetic/Event;", "stats",
        emptyList(), "Ljava/lang/Object;", AccessFlags.STATIC.value, null, null,
        MutableMethodImplementation(registers)).toMutable().apply { addInstructionsWithLabels(0, instructions) }

    @Test fun highRegisterReceiverAndOriginalResultBranchSurviveObserverReplacement() {
        val method = caller(260, """
            invoke-interface/range {v259 .. v259}, Lsynthetic/Player;->getStatistics()Ljava/lang/Object;
            move-result-object v0
            if-eqz v0, :done
            invoke-static {v0}, Lsynthetic/Event;->emit(Ljava/lang/Object;)V
            :done
            return-object v0
        """)
        val before = method.code().sumOf { it.codeUnits }
        val branch = (method.code()[2] as OffsetInstruction).codeOffset
        method.wrapStatisticsRead(0, "Lsynthetic/Trace;->read(Lsynthetic/Player;)Ljava/lang/Object;")
        assertEquals(259, statisticsReceiver(caller(260, """
            invoke-interface/range {v259 .. v259}, Lsynthetic/Player;->getStatistics()Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """), 0))
        assertEquals(Opcode.INVOKE_STATIC_RANGE, method.code()[0].opcode)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, method.code()[1].opcode)
        assertEquals(before, method.code().sumOf { it.codeUnits })
        assertEquals(branch, (method.code()[2] as OffsetInstruction).codeOffset)
        assertEquals(260, method.implementation?.registerCount)
    }

    @Test(expected = PatchException::class) fun argumentBearingCallCannotBeMistakenForGetter() {
        caller(2, """
            invoke-interface {v0, v1}, Lsynthetic/Player;->getStatistics(I)Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """).wrapStatisticsRead(0, "Lsynthetic/Trace;->read(Ljava/lang/Object;)Ljava/lang/Object;")
    }

    @Test(expected = PatchException::class) fun primitiveResultIsRejectedBeforeMutation() {
        caller(1, """
            invoke-interface {v0}, Lsynthetic/Player;->getStatistics()I
            move-result v0
            return-object v0
        """).wrapStatisticsRead(0, "Lsynthetic/Trace;->read(Ljava/lang/Object;)Ljava/lang/Object;")
    }
}
