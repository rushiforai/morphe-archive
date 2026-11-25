package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNull
import kotlin.test.assertTrue

/** 587's message sound picker, its in-app sounds object and the sound player that object extends. */
private const val OCS_PICKER = "LX/9zz;"
private const val OCS_SOUNDS = "LX/7Et;"
private const val OCS_PLAYER = "LX/3Bh;"
private const val OCS_HOOK_SIZE = 6

internal const val SYNTHETIC_OPEN_CHAT_SOUND = "$OCS_PICKER->A01($FB_USER_SESSION${MESSAGE}ZZ)Z"

/**
 * The picker cut down to its three ways out: a sticker in the open chat gets its own sound, any other message there only
 * the dropped in-app sounds check, and a message from another chat the in-app message sound. With 11 registers the
 * parameters are v6 (this), v7 (session), v8 (message), v9 (open chat) and v10 (from a notification). v0 holds the in-app
 * sounds object at the dropped check and v1 at the in-app sound call, as in 587.
 */
private fun ocsPicker(
    trace: String = SOUND_TRACE,
    keepAnswer: Boolean = false,
    sameRegister: Boolean = false,
    registers: Int = 11,
): MutableMethod {
    val p = registers - 5
    val sounds = if (sameRegister) "v1" else "v0"
    val dropped = if (keepAnswer) "move-result v0\n    return v0" else "return v3"
    return fixtureMethod(SYNTHETIC_OPEN_CHAT_SOUND, """
        const/4 v3, 0x1
        const-string v1, "$trace"
        const-string v0, "$SOUND_STEP"
        iget-object v2, v$p, $OCS_PICKER->A04:Ljava/lang/Object;
        if-eqz v${p + 3}, :not_open
        invoke-static {v${p + 2}}, LX/2Di;->A0Y($MESSAGE)Z
        move-result v0
        if-eqz v0, :plain
        const-string v0, "incoming_sticker_message"
        check-cast v2, LX/A00;
        iget-object v1, v2, LX/A00;->A07:$OCS_SOUNDS
        invoke-static {v${p + 1}, v1, v0}, $OCS_SOUNDS->A05($FB_USER_SESSION${OCS_SOUNDS}Ljava/lang/String;)V
        return v3
        :plain
        check-cast v2, LX/A00;
        iget-object $sounds, v2, LX/A00;->A07:$OCS_SOUNDS
        invoke-virtual {$sounds, v${p + 1}}, $OCS_SOUNDS->A0C($FB_USER_SESSION)Z
        $dropped
        :not_open
        if-nez v${p + 4}, :quiet
        check-cast v2, LX/A00;
        iget-object v1, v2, LX/A00;->A07:$OCS_SOUNDS
        invoke-virtual {v1, v${p + 1}}, $OCS_SOUNDS->A0C($FB_USER_SESSION)Z
        move-result v0
        if-eqz v0, :quiet
        const/16 v0, 0x83f
        invoke-static {v0}, LX/189;->A00(I)Ljava/lang/String;
        move-result-object v0
        invoke-virtual {v1, v${p + 1}, v0}, $OCS_PLAYER->A09(${FB_USER_SESSION}Ljava/lang/String;)V
        return v3
        :quiet
        const/4 v3, 0x0
        return v3
    """.trimIndent(), registers = registers)
}

internal fun openChatSoundFixture(): List<MutableClass> = listOf(fixtureClass(OCS_PICKER, listOf(ocsPicker())))

private fun MutableMethod.ocsCode() = implementation!!.instructions.toList()

private fun Instruction.ocsReference() = (this as? ReferenceInstruction)?.reference?.toString()

class OpenChatSoundTest {
    private fun hook(method: MutableMethod) = injectControl(OPEN_CHAT_SOUND, mapOf(OPEN_CHAT_SOUND to listOf(method)))

    @Test fun theFinderAndItsMirrorTakeThePicker() {
        assertEquals(setOf(SYNTHETIC_OPEN_CHAT_SOUND), findOpenChatSound(openChatSoundFixture()).map { it.hookId() }.toSet())
        assertEquals(setOf(SYNTHETIC_OPEN_CHAT_SOUND), mirroredControls(openChatSoundFixture()).getValue(OPEN_CHAT_SOUND).map { it.hookId() }.toSet())
    }

    /** The dropped answer goes to the extension; a yes lands on the in-app sound with the sounds object, a no on the stock return. */
    @Test fun theDroppedAnswerGoesOnToTheInAppSound() {
        val method = ocsPicker()
        val before = method.ocsCode()
        val check = before.indexOfFirst { it.ocsReference() == "$OCS_SOUNDS->A0C($FB_USER_SESSION)Z" }
        assertEquals(Opcode.RETURN, before[check + 1].opcode)
        hook(method)
        val code = method.ocsCode()
        assertEquals(before.size + OCS_HOOK_SIZE, code.size)
        assertEquals(Opcode.MOVE_RESULT, code[check + 1].opcode)
        assertEquals(1, (code[check + 1] as OneRegisterInstruction).registerA)
        assertEquals(OPEN_CHAT_SOUND_CALL, code[check + 2].ocsReference())
        assertEquals(listOf(1), (code[check + 2] as RegisterRangeInstruction).let { it.startRegister until it.startRegister + it.registerCount }.toList())
        assertEquals(Opcode.MOVE_RESULT, code[check + 3].opcode)
        assertEquals(Opcode.IF_EQZ, code[check + 4].opcode)
        assertEquals(check + 7, code.branchTarget(check + 4), "a no returns as Messenger did")
        assertEquals(Opcode.RETURN, code[check + 7].opcode)
        assertEquals(Opcode.MOVE_OBJECT_FROM16, code[check + 5].opcode)
        assertEquals(1 to 0, (code[check + 5] as TwoRegisterInstruction).let { it.registerA to it.registerB })
        assertEquals(Opcode.GOTO_16, code[check + 6].opcode)
        val target = code.branchTarget(check + 6)
        assertEquals(Opcode.CONST_16, code[target].opcode)
        assertEquals("$OCS_PLAYER->A09(${FB_USER_SESSION}Ljava/lang/String;)V", code[target + 3].ocsReference())
        assertEquals(before.map { it.opcode }, code.filterIndexed { i, _ -> i !in check + 1..check + OCS_HOOK_SIZE }.map { it.opcode })
    }

    @Test fun aSecondPassLeavesTheHookAsItIs() {
        val method = ocsPicker()
        hook(method)
        val size = method.ocsCode().size
        assertTrue(method.validateOpenChatSound().hooked)
        hook(method)
        assertEquals(size, method.ocsCode().size)
        assertEquals(1, method.ocsCode().count { it.ocsReference() == OPEN_CHAT_SOUND_CALL })
    }

    @Test fun onlyTheStockShapeIsTaken() {
        // Another trace, an answer Messenger already uses, the sounds object in the register the sound call reads.
        assertNull(ocsPicker(trace = "other").openChatSite())
        assertNull(ocsPicker(keepAnswer = true).openChatSite())
        assertNull(ocsPicker(sameRegister = true).openChatSite())
        // Two pickers of the same shape, or the picker in a build with its session somewhere else.
        assertTrue(findOpenChatSound(listOf(fixtureClass(OCS_PICKER, listOf(ocsPicker())), fixtureClass("LX/A1y;", listOf(ocsPicker())))).isEmpty())
        assertTrue(findOpenChatSound(openChatSoundFixture()).isNotEmpty())
        assertFailsWith<PatchException> { ocsPicker(keepAnswer = true).validateOpenChatSound() }
    }

    /** The registers the hook writes come from the method, so a bigger frame moves them with it. */
    @Test fun theHookFollowsTheFramesRegisters() {
        val method = ocsPicker(registers = 14)
        val site = method.validateOpenChatSound()
        assertEquals(0, site.sounds)
        assertEquals(1, site.player)
        hook(method)
        assertEquals(1, method.ocsCode().count { it.ocsReference() == OPEN_CHAT_SOUND_CALL })
    }
}
