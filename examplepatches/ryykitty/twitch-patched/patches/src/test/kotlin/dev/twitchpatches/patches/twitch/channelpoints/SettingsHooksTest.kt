package dev.twitchpatches.patches.twitch.channelpoints

import dev.twitchpatches.patches.twitch.shared.code
import dev.twitchpatches.patches.twitch.shared.insertAtReturn
import dev.twitchpatches.patches.twitch.shared.uniqueHook

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Test

class SettingsHooksTest {
    @Test fun branchIntoReturnExecutesHookAndLeavesReturnIntact() {
        val method = ImmutableMethod("Lsynthetic/Settings;", "factory", emptyList(), "Ljava/lang/Object;",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            MutableMethodImplementation(1)).toMutable()
        method.addInstructionsWithLabels(0, """
            const/4 v0, 0x0
            goto :done
            const/4 v0, 0x0
            :done
            return-object v0
        """)
        method.insertAtReturn(3, """
            invoke-static/range {v0 .. v0}, Lsynthetic/Hook;->wrap(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
        """)
        val instructions = method.code()
        val branch = instructions[1] as OffsetInstruction
        val targetAddress = instructions[0].codeUnits + branch.codeOffset
        var address = 0
        val target = instructions.first { instruction ->
            val matches = address == targetAddress
            address += instruction.codeUnits
            matches
        }
        assertEquals(Opcode.INVOKE_STATIC_RANGE, target.opcode)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, instructions[4].opcode)
        assertEquals(Opcode.RETURN_OBJECT, instructions.last().opcode)
    }

    @Test(expected = app.morphe.patcher.patch.PatchException::class)
    fun ambiguousMandatoryHookIsRejected() {
        listOf("first", "second").uniqueHook("synthetic")
    }
}
