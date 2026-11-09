/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.voice

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.names.origString
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

private const val MESSAGE = "Lorg/telegram/messenger/MessageObject;"

/** The locked phone guard in Play voice messages one at a time, on the pinned builds. */
class LockedVoiceFixtureTest {
    @Test fun `the play method asks the runtime first and otherwise runs as Telegram wrote it`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + lockedVoiceHosts(build))
            val guard = context.resolveLockedVoiceGuard()
            assertNull("$name: ${guard.missing}", guard.missing)
            val play = guard.play!!
            // 13.2 folded the overload with the silent flag into the plain one.
            val silent = context.tgMutableClassDefBy(MEDIA_CONTROLLER).methods.any { it.origString() == PLAY_MESSAGE }
            assertEquals("$name: the play method", if (silent) PLAY_MESSAGE else PLAY_MESSAGE_PLAIN, play.origString())
            val before = ImmutableMethod.of(play).controlBody().map(::operands)
            guard.rehearse()
            assertEquals("$name: the rehearsal leaves the play method alone", before, play.controlBody().map(::operands))

            assertEquals(emptyList<String>(), PatchLogCapture.warnings { voiceOneAtATimePatch.execute(context) })
            val after = play.controlBody()
            assertEquals("$name: nine instructions in front", before.size + 9, after.size)
            val self = play.localRegisterCount()
            val message = play.parameterRegisterNumber(0)
            assertEquals("$name: the hook", listOf(
                listOf(Opcode.MOVE_OBJECT_FROM16, listOf(0, self), null, null),
                listOf(Opcode.IGET_OBJECT, listOf(1, 0), PLAYING_MESSAGE, null),
                listOf(Opcode.IGET_BOOLEAN, listOf(2, 0), PLAYER_PAUSED, null),
                listOf(Opcode.MOVE_OBJECT_FROM16, listOf(0, message), null, null),
                listOf(Opcode.INVOKE_STATIC, listOf(0, 1, 2), LOCKED_REFUSE, null),
                listOf(Opcode.MOVE_RESULT, listOf(0), null, null),
                listOf(Opcode.IF_EQZ, listOf(0), null, null),
                listOf(Opcode.CONST_4, listOf(0), null, 0),
                listOf(Opcode.RETURN, listOf(0), null, null),
            ), after.take(9).map(::operands))
            // A refusal returns before Telegram's code, which starts where the hook's branch lands.
            assertEquals("$name: the branch lands on Telegram's first instruction", setOf(7, 9), ControlFlow.of(play).normal[6].toSet())
            assertEquals("$name: a refusal returns", emptyList<Int>(), ControlFlow.of(play).normal[8])
            assertEquals("$name: Telegram's own code follows unchanged", before, after.drop(9).map(::operands))

            val stub = context.tgMutableClassDefBy(LOCKED_VOICE).methods.single { it.origName == "voiceOrRound" }.controlBody()
            assertEquals("$name: the stub asks Telegram's own checks", listOf("$MESSAGE->isVoice()Z", "$MESSAGE->isRoundVideo()Z"),
                stub.filter { it.opcode == Opcode.INVOKE_VIRTUAL }.map { it.controlRef() })
            for (flag in listOf("voiceOneAtATime", "lockedVoice")) {
                val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.controlBody()
                assertEquals("$name: $flag", 1L, (status.first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }

    @Test fun `every caller of the plain play method and the resume reaches the hook`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val controller = lockedVoiceHosts(build).single { it.origType == MEDIA_CONTROLLER }
            val plays = controller.methods.filter { it.origName == "playMessage" }
            val plain = plays.single { it.parameterTypes.size == 1 }
            if (plays.size == 1) {
                // 13.2: the plain play method is the only one and plays itself.
                assertEquals("$name: the only play method", PLAY_MESSAGE_PLAIN, plain.origString())
            } else {
                assertEquals("$name: the plain play method hands over", listOf(PLAY_MESSAGE), plain.controlBody().mapNotNull { it.controlRef() })
            }
            // Only the play method resumes, so a paused voice message can't start again around the hook.
            val resumers = controller.methods.filter { method -> method.controlBody().any { it.controlRef()?.contains("->resumeAudio(") == true } }
            assertEquals("$name: one resume caller", listOf("playMessage"), resumers.map { it.origName })
            assertEquals("$name: the resume caller", (plays - plain).ifEmpty { listOf(plain) }, resumers)
        }
    }

    @Test fun `a changed player keeps the queue switch and logs why the guard is missing`() {
        val cases = listOf<Triple<String, String, (BytecodePatchContext, MutableMethod) -> Unit>>(
            Triple("resume elsewhere", "a paused message can be resumed around the play method") { context, _ ->
                val other = context.tgMutableClassDefBy(MEDIA_CONTROLLER).methods.single { it.origName == "playMessageAtIndex" }
                other.addInstructions(0, "invoke-direct {p0, v0}, $MEDIA_CONTROLLER->resumeAudio($MESSAGE)Z")
            },
            Triple("plain play goes elsewhere", "the play method without a silent flag no longer hands over to it") { context, play ->
                val controller = context.tgMutableClassDefBy(MEDIA_CONTROLLER)
                val plain = controller.methods.single { it.origName == "playMessage" && it.parameterTypes.size == 1 }
                val call = plain.controlBody().indexOfFirst { it.controlRef() == PLAY_MESSAGE }
                if (call >= 0) {
                    plain.replaceInstruction(call, "invoke-virtual {p0, p1}, $MEDIA_CONTROLLER->pauseMessage($MESSAGE)Z")
                } else {
                    // 13.2 has no overload with the silent flag: one comes back that the plain one doesn't hand over to.
                    controller.methods.add(ImmutableMethod(controller.type, "playMessage", listOf(
                        ImmutableMethodParameter(play.parameterTypes[0].toString(), null, null), ImmutableMethodParameter("Z", null, null)),
                        "Z", AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, ImmutableMethodImplementation(3,
                            listOf(ImmutableInstruction11n(Opcode.CONST_4, 0, 0), ImmutableInstruction11x(Opcode.RETURN, 0)), null, null)).toMutable())
                }
            },
            Triple("loop to the start", "something jumps back to the start of the play method") { _, play ->
                play.addInstructionsWithLabels(1, "goto :hush_start", ExternalLabel("hush_start", play.getInstruction(0)))
            },
            Triple("paused flag unread", "the play method no longer reads the player's message and paused flag") { _, play ->
                val body = play.controlBody()
                for (at in body.indices.reversed()) {
                    if (body[at].opcode == Opcode.IGET_BOOLEAN && body[at].controlRef() == PLAYER_PAUSED) {
                        play.replaceInstruction(at, "const/4 v${body[at].namedRegisters()[0]}, 0x0")
                    }
                }
            },
        )
        for (build in Fixtures.declaredBuilds()) {
            for ((case, reason, change) in cases) {
                val what = "${build.name}: $case"
                val context = PatchContexts.of(ExtensionDex.classes() + lockedVoiceHosts(build))
                val found = context.resolveLockedVoiceGuard()
                assertNull("$what: ${found.missing}", found.missing)
                val play = found.play!!
                change(context, play)
                val before = play.controlBody().map(::operands)
                assertEquals(what, listOf("Play voice messages one at a time: $reason. The patch goes on without the locked phone guard."),
                    PatchLogCapture.warnings { voiceOneAtATimePatch.execute(context) })
                assertEquals("$what: the play method stays as it was", before, play.controlBody().map(::operands))
                assertTrue("$what: the stub was never written", context.tgMutableClassDefBy(LOCKED_VOICE).methods
                    .single { it.origName == "voiceOrRound" }.controlBody().none { it.opcode == Opcode.INVOKE_VIRTUAL })
                for ((flag, value) in listOf("voiceOneAtATime" to 1L, "lockedVoice" to 0L)) {
                    val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.controlBody()
                    assertEquals("$what: $flag", value, (status.first() as WideLiteralInstruction).wideLiteral)
                }
            }
        }
    }

    private fun operands(instruction: Instruction): List<Any?> = listOf(instruction.opcode, instruction.namedRegisters(),
        instruction.controlRef(), (instruction as? NarrowLiteralInstruction)?.narrowLiteral)
}

/** MediaController and the message class its guard asks, from [build]. */
internal fun lockedVoiceHosts(build: File): List<ClassDef> =
    FixtureDex.classes(build, setOf(MEDIA_CONTROLLER, MESSAGE)).values.map(ImmutableClassDef::of)
