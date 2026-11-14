/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.patches.music.interaction.crossfade

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.*
import org.junit.Test

class QueueAdvanceHookTest {
    private val setter = "Landroid/media/session/MediaSession;->setPlaybackState(" +
        "Landroid/media/session/PlaybackState;)V"

    private fun method(registers: Int, parameters: List<String>, body: String): MutableMethod = ImmutableMethod(
        "LSessionTest;", "publish", parameters.map { ImmutableMethodParameter(it, null, null) }, "V",
        AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(registers)
    ).toMutable().apply { addInstructions(0, body) }

    @Test fun compactPublicationCapturesNoncontiguousLiveArguments() {
        val native = method(4, listOf("Landroid/media/session/MediaSession;", "Z",
            "Landroid/media/session/PlaybackState;"), """
            invoke-virtual {p1, p3}, $setter
            return-void
        """)
        native.installMediaNextHook()
        val capture = native.implementation!!.instructions[0]
        assertEquals(Opcode.INVOKE_STATIC, capture.opcode)
        assertEquals(1, (capture as FiveRegisterInstruction).registerC)
        assertEquals(3, capture.registerD)
        assertEquals("capture", capture.getReference<MethodReference>()!!.name)
    }

    @Test fun rangePublicationPreservesHighSessionAndStateRegisters() {
        val native = method(30, listOf("Landroid/media/session/MediaSession;",
            "Landroid/media/session/PlaybackState;"), """
            invoke-virtual/range {p1 .. p2}, $setter
            return-void
        """)
        native.installMediaNextHook()
        val capture = native.implementation!!.instructions[0]
        assertEquals(Opcode.INVOKE_STATIC_RANGE, capture.opcode)
        assertEquals(28, (capture as RegisterRangeInstruction).startRegister)
        assertEquals(2, capture.registerCount)
        assertEquals("capture", capture.getReference<MethodReference>()!!.name)
    }

    @Test fun releaseClearsOnlyTheExactReleasedSession() {
        val native = method(25, listOf("Landroid/media/session/MediaSession;"), """
            invoke-virtual/range {p1 .. p1}, Landroid/media/session/MediaSession;->release()V
            return-void
        """)
        native.installMediaSessionReleaseHook()
        val release = native.implementation!!.instructions[1]
        assertEquals(Opcode.INVOKE_STATIC_RANGE, release.opcode)
        assertEquals(24, (release as RegisterRangeInstruction).startRegister)
        assertEquals(1, release.registerCount)
        assertEquals("release", release.getReference<MethodReference>()!!.name)
    }

    private val presentationFilter =
        "Lapp/morphe/extension/music/patches/misc/MediaNotificationControlsPatch;" +
            "->changePlaybackState(Landroid/media/session/PlaybackState;)Landroid/media/session/PlaybackState;"

    @Test fun notificationFilterInstalledFirstCannotHideNativeNextCapability() {
        val native = method(3, listOf("Landroid/media/session/MediaSession;",
            "Landroid/media/session/PlaybackState;"), """
            invoke-static {p2}, $presentationFilter
            move-result-object p2
            invoke-virtual {p1, p2}, $setter
            return-void
        """)
        native.installMediaNextHook()
        val code = native.implementation!!.instructions
        assertEquals("capture", code[0].getReference<MethodReference>()!!.name)
        assertEquals(1, (code[0] as FiveRegisterInstruction).registerC)
        assertEquals(2, (code[0] as FiveRegisterInstruction).registerD)
        assertEquals("changePlaybackState", code[1].getReference<MethodReference>()!!.name)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[2].opcode)
        assertEquals("setPlaybackState", code[3].getReference<MethodReference>()!!.name)
    }

    @Test fun notificationFilterInstalledLaterStillRunsAfterCapabilityCapture() {
        val native = method(3, listOf("Landroid/media/session/MediaSession;",
            "Landroid/media/session/PlaybackState;"), """
            invoke-virtual {p1, p2}, $setter
            return-void
        """)
        native.installMediaNextHook()
        val index = native.implementation!!.instructions.indexOfFirst {
            it.getReference<MethodReference>()?.name == "setPlaybackState"
        }
        // Same insertion boundary as MediaNotificationControlsPatch: immediately before publication.
        native.addInstructions(index, """
            invoke-static {p2}, $presentationFilter
            move-result-object p2
        """)
        val calls = native.implementation!!.instructions.mapNotNull { it.getReference<MethodReference>()?.name }
        assertEquals(listOf("capture", "changePlaybackState", "setPlaybackState"), calls)
    }

    @Test fun nativeBranchToPublicationCannotBypassCapabilityCapture() {
        val native = method(4, listOf("Landroid/media/session/MediaSession;",
            "Landroid/media/session/PlaybackState;", "Z"), """
            if-eqz p3, :publish
            nop
            :publish
            invoke-virtual {p1, p2}, $setter
            return-void
        """).let { ImmutableMethod.of(it).toMutable() }
        native.installMediaNextHook()
        val code = native.implementation!!.instructions
        val target = (code[0] as OffsetInstruction).codeOffset
        var address = 0
        val targetInstruction = code.first {
            val matches = address == target
            address += it.codeUnits
            matches
        }
        assertEquals("capture", targetInstruction.getReference<MethodReference>()!!.name)
    }

    @Test fun lyricsAndScrobblingObserversMayRemainBetweenFilteringAndPublication() {
        val native = method(3, listOf("Landroid/media/session/MediaSession;",
            "Landroid/media/session/PlaybackState;"), """
            invoke-static {p2}, $presentationFilter
            move-result-object p2
            invoke-static {p2}, LLyrics;->state(Landroid/media/session/PlaybackState;)V
            invoke-static {p2}, LScrobbler;->state(Landroid/media/session/PlaybackState;)V
            invoke-virtual {p1, p2}, $setter
            return-void
        """)
        native.installMediaNextHook()
        val calls = native.implementation!!.instructions.mapNotNull { it.getReference<MethodReference>()?.name }
        assertEquals(listOf("capture", "changePlaybackState", "state", "state", "setPlaybackState"), calls)
    }

    @Test(expected = IllegalStateException::class)
    fun overwrittenPublicationOwnerIsRejectedDuringReadOnlyPreflight() {
        method(4, listOf("Landroid/media/session/MediaSession;", "Z",
            "Landroid/media/session/PlaybackState;"), """
            invoke-static {p3}, $presentationFilter
            move-result-object p3
            move-object p1, p3
            invoke-virtual {p1, p3}, $setter
            return-void
        """).mediaNextHookEdits()
    }
}
