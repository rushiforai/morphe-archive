package me.dyskal.patches.discord

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class MediaSessionHookTest {
    private val setter = ImmutableMethodReference("Landroid/media/session/MediaSession;", "setMetadata",
        listOf("Landroid/media/MediaMetadata;"), "V")
    private val callback = "onSetMetadata(Landroid/media/MediaMetadata;)V"

    @Test
    fun `normal setter uses argument rather than receiver`() {
        val call = ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 3, 9, 0, 0, 0, setter)
        assertEquals(expected(9), mediaSessionCallbackInstruction(call, callback))
    }

    @Test
    fun `range setter supports high registers`() {
        val call = ImmutableInstruction3rc(Opcode.INVOKE_VIRTUAL_RANGE, 240, 2, setter)
        assertEquals(expected(241), mediaSessionCallbackInstruction(call, callback))
    }

    @Test
    fun `unexpected invocation shape fails before injection`() {
        val missingArgument = ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 3, 0, 0, 0, 0, setter)
        assertFailsWith<IllegalArgumentException> { mediaSessionCallbackInstruction(missingArgument, callback) }
        val staticCall = ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 240, 2, setter)
        assertFailsWith<PatchException> { mediaSessionCallbackInstruction(staticCall, callback) }
    }

    private fun expected(register: Int) =
        "invoke-static/range {v$register .. v$register}, Lme/dyskal/ytmrpc/DiscordRpcPatch;->$callback"
}
