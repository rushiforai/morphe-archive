package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.code
import org.junit.Assert.*
import org.junit.Test

class EmoteConnectionTest {
    private fun connection(type: String, idRegister: String = "p1", prefix: String = "") =
        ImmutableMethod("Lsynthetic/Connection;", "<init>",
            listOf(type, "Ljava/lang/String;").map { ImmutableMethodParameter(it, null, null) }, "V",
            AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value, null, null,
            MutableMethodImplementation(5)).toMutable().apply {
                addInstructionsWithLabels(0, """
                    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
                    $prefix
                    iput-object $idRegister, p0, Lsynthetic/Connection;->channelId:$type
                    iput-object p2, p0, Lsynthetic/Connection;->channelName:Ljava/lang/String;
                    return-void
                """)
            }

    @Test fun channelIdRetainsItsConstructorArguments() {
        validateEmoteConnection(connection(CHANNEL_ID))
    }

    @Test fun reassignedOrIncorrectChannelArgumentsAreRejected() {
        assertThrows(PatchException::class.java) {
            validateEmoteConnection(connection(CHANNEL_ID, "p2"))
        }
        assertThrows(PatchException::class.java) {
            validateEmoteConnection(connection(CHANNEL_ID, prefix = "move-object p1, p2"))
        }
        assertThrows(PatchException::class.java) {
            validateEmoteConnection(connection("Ljava/lang/Object;"))
        }
    }

    @Test fun stringChannelIdsAreRejected() {
        assertThrows(PatchException::class.java) { validateEmoteConnection(connection("Ljava/lang/String;")) }
    }

    @Test fun typedIdBridgeConvertsOnlyTheIdAndPreservesTheChannelName() {
        val method = ImmutableMethod("Lsynthetic/Connection;", "connected",
            listOf(CHANNEL_ID, "Ljava/lang/String;").map { ImmutableMethodParameter(it, null, null) }, "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            MutableMethodImplementation(3)).toMutable()
        method.addInstructionsWithLabels(0, emoteConnectionBody())
        val code = method.code()
        assertEquals(Opcode.IF_EQZ, code[0].opcode)
        assertEquals("$CHANNEL_ID->toString()Ljava/lang/String;", (code[1] as ReferenceInstruction).reference.toString())
        val delivery = code[3] as FiveRegisterInstruction
        assertEquals(2, delivery.registerCount)
        assertEquals(0, delivery.registerC)
        assertEquals(2, delivery.registerD)
        assertEquals(Opcode.RETURN_VOID, code.last().opcode)
    }
}
