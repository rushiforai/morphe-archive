package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

/** 588's sound player, the one class whose static sound method plays the send, sent and in-app message sounds. */
private const val OCX_PLAYER = "LX/AhH;"
private const val OCX_DESCRIPTOR = "Landroid/content/res/AssetFileDescriptor;"
private const val OCX_OPEN = "Landroid/content/res/Resources;->openRawResourceFd(I)$OCX_DESCRIPTOR"

internal const val SYNTHETIC_OWN_CHAT_SOUNDS = "$OCX_PLAYER->A05(${OCX_PLAYER}FIIZ)Z"

/**
 * The sound method cut down to its file descriptor route: it opens the raw sound by the id in its third parameter, hands
 * the descriptor's file, offset and length to a new MediaPlayer and closes it. With 16 registers the parameters are v11
 * (the player), v12 (volume), v13 (the sound), v14 and v15, as in 588.
 */
private fun ocxPlayer(
    owner: String = OCX_PLAYER,
    registers: Int = 16,
    soundParameter: Int = 2,
    opens: Int = 1,
    closes: Boolean = true,
    static: Boolean = true,
): MutableMethod {
    val p = registers - 5
    val open = listOf("invoke-virtual {v0, v${p + soundParameter}}, $OCX_OPEN", "move-result-object v1")
    val body = listOf(
        "iget-object v8, v$p, $owner->A07:Landroid/content/Context;",
        "invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;",
        "move-result-object v0",
    ) + List(opens) { open }.flatten() + listOf(
        "if-eqz v1, :quiet",
        "new-instance v3, Landroid/media/MediaPlayer;",
        "invoke-direct {v3}, Landroid/media/MediaPlayer;-><init>()V",
        "iput-object v3, v$p, $owner->A00:Landroid/media/MediaPlayer;",
        "invoke-virtual {v1}, $OCX_DESCRIPTOR->getFileDescriptor()Ljava/io/FileDescriptor;",
        "move-result-object v4",
        "invoke-virtual {v1}, $OCX_DESCRIPTOR->getStartOffset()J",
        "move-result-wide v5",
        "invoke-virtual {v1}, $OCX_DESCRIPTOR->getLength()J",
        "move-result-wide v7",
        "invoke-virtual/range {v3 .. v8}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V",
    ) + listOfNotNull(if (closes) "invoke-virtual {v1}, $OCX_DESCRIPTOR->close()V" else null) + listOf(
        "const/4 v2, 0x1",
        "return v2",
        ":quiet",
        "const/4 v2, 0x0",
        "return v2",
    )
    val flags = AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0)
    return fixtureMethod("$owner->A05(${owner}FIIZ)Z", body.joinToString("\n"), registers = registers, flags = flags)
}

internal fun ownChatSoundsFixture(): List<MutableClass> = listOf(fixtureClass(OCX_PLAYER, listOf(ocxPlayer())))

private fun MutableMethod.ocxCode() = implementation!!.instructions.toList()

private fun Instruction.ocxReference() = (this as? ReferenceInstruction)?.reference?.toString()

class OwnChatSoundsTest {
    private fun hook(method: MutableMethod) = injectControl(OWN_CHAT_SOUNDS, mapOf(OWN_CHAT_SOUNDS to listOf(method)))

    @Test fun theFinderAndItsMirrorTakeThePlayer() {
        assertEquals(setOf(SYNTHETIC_OWN_CHAT_SOUNDS), findOwnChatSounds(ownChatSoundsFixture()).map { it.hookId() }.toSet())
        assertEquals(setOf(SYNTHETIC_OWN_CHAT_SOUNDS), mirroredControls(ownChatSoundsFixture()).getValue(OWN_CHAT_SOUNDS).map { it.hookId() }.toSet())
    }

    /** The open becomes the extension call on the same resources and sound registers, and nothing else moves. */
    @Test fun theRawSoundOpenGoesThroughTheExtension() {
        val method = ocxPlayer()
        val before = method.ocxCode()
        val open = before.indexOfFirst { it.ocxReference() == OCX_OPEN }
        hook(method)
        val code = method.ocxCode()
        assertEquals(before.size, code.size)
        assertEquals(Opcode.INVOKE_STATIC, code[open].opcode)
        assertEquals(OWN_CHAT_SOUNDS_CALL, code[open].ocxReference())
        val call = code[open] as FiveRegisterInstruction
        assertEquals(listOf(2, 0, 13), listOf(call.registerCount, call.registerC, call.registerD))
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[open + 1].opcode)
        assertEquals(1, (code[open + 1] as OneRegisterInstruction).registerA)
        assertTrue(code.none { it.ocxReference() == OCX_OPEN })
        assertEquals(before.filterIndexed { i, _ -> i != open }.map { it.opcode }, code.filterIndexed { i, _ -> i != open }.map { it.opcode })
    }

    @Test fun aSecondPassLeavesTheHookAsItIs() {
        val method = ocxPlayer()
        hook(method)
        assertTrue(method.validateOwnChatSounds().hooked)
        val code = method.ocxCode().map { it.opcode to it.ocxReference() }
        hook(method)
        assertEquals(code, method.ocxCode().map { it.opcode to it.ocxReference() })
        assertEquals(1, method.ocxCode().count { it.ocxReference() == OWN_CHAT_SOUNDS_CALL })
    }

    @Test fun onlyTheStockShapeIsTaken() {
        assertFalse(ocxPlayer().validateOwnChatSounds().hooked)
        // An instance method, a sound from another parameter, two opens, a descriptor nobody closes.
        assertNull(ocxPlayer(static = false).rawSoundSite())
        assertNull(ocxPlayer(soundParameter = 3).rawSoundSite())
        assertNull(ocxPlayer(opens = 2).rawSoundSite())
        assertNull(ocxPlayer(closes = false).rawSoundSite())
        // Two players of the same shape leave the finder with nothing to pick.
        assertTrue(findOwnChatSounds(listOf(fixtureClass(OCX_PLAYER, listOf(ocxPlayer())), fixtureClass("LX/Ak0;", listOf(ocxPlayer(owner = "LX/Ak0;"))))).isEmpty())
        assertFailsWith<PatchException> { ocxPlayer(soundParameter = 3).validateOwnChatSounds() }
    }

    /** The sound's register comes from the method's frame, so a smaller one moves it with it. */
    @Test fun theHookFollowsTheFramesRegisters() {
        val method = ocxPlayer(registers = 14)
        val site = method.validateOwnChatSounds()
        assertEquals(11, site.id)
        assertEquals(0, site.resources)
        hook(method)
        val call = method.ocxCode().single { it.ocxReference() == OWN_CHAT_SOUNDS_CALL } as FiveRegisterInstruction
        assertEquals(11, call.registerD)
    }
}
