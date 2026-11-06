package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.*
import org.junit.Test
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import dev.twitchpatches.patches.twitch.shared.code

class ReplayEmoteHooksTest {
    @Test fun bindingPreservesThisAndTheHolderOutsideTheOriginalRegisterFrame() {
        val original = ImmutableMethodReference("Lfixture/Row;", "savedBind", listOf("Lfixture/Holder;"), "V")
        val bridge = ImmutableMethodReference("Lfixture/Row;", "emotes", listOf("Lfixture/Row;", "Lfixture/Holder;"), "V")
        val wrapper = replayBindingWrapper(original, bridge, "bind")
        assertEquals(2, requireNotNull(wrapper.implementation).registerCount)
        val code = wrapper.code()
        assertEquals(listOf(Opcode.INVOKE_VIRTUAL_RANGE, Opcode.INVOKE_STATIC_RANGE, Opcode.RETURN_VOID), code.map { it.opcode })
        assertEquals(listOf(original.toString(), bridge.toString()), code.filterIsInstance<ReferenceInstruction>().map { it.reference.toString() })
        code.filterIsInstance<RegisterRangeInstruction>().forEach { assertEquals(0, it.startRegister); assertEquals(2, it.registerCount) }
    }
    private fun description(body: String) = ImmutableMethod("Lsynthetic/Comment;", "toString", emptyList(), "Ljava/lang/String;",
        AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(3)).toMutable().apply { addInstructions(0, body) }

    @Test fun replayChannelUsesTheOwnerFieldBeforeTheVodLabel() {
        val method = description("""
            const-string v0, ", channelId="
            iget-object v1, p0, Lsynthetic/Comment;->channel:Ljava/lang/String;
            const-string v0, ", vodId="
            iget-object v1, p0, Lsynthetic/Comment;->video:Ljava/lang/String;
            return-object v1
        """)
        assertEquals("channel", labeledReplayField(method, ", channelId=").name)
    }

    @Test fun missingChannelCannotFallThroughToTheVideoId() {
        val method = description("""
            const-string v0, ", channelId="
            const-string v0, ", vodId="
            iget-object v1, p0, Lsynthetic/Comment;->video:Ljava/lang/String;
            return-object v1
        """)
        assertThrows(IllegalStateException::class.java) { labeledReplayField(method, ", channelId=") }
    }

    @Test fun optimizedConcatenationUsesTheChannelArgumentAndRejectsReorderedLabels() {
        for (label in listOf(", vodId=", ", createdAt=")) {
            val method = description("""
                const-string v0, ", channelId="
                const-string v0, "$label"
                iget-object v1, p0, Lsynthetic/Comment;->channel:Ljava/lang/String;
                invoke-static {v2, v1, v0, v1, v0}, Lsynthetic/Strings;->join(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
                return-object v1
            """)
            if (label == ", vodId=") assertEquals("channel", labeledReplayField(method, ", channelId=").name)
            else assertThrows(IllegalArgumentException::class.java) { labeledReplayField(method, ", channelId=") }
        }
    }
}
