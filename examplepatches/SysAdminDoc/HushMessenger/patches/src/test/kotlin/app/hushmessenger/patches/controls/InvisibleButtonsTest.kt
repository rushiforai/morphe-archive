package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

/**
 * #191: the dimmer opens where the chat first has a view, the same handover the jump menu and the screenshot block take,
 * so one method carries all three and a build that moves it fails them together.
 */
class InvisibleButtonsTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    @Test fun everyBuildHandsTheDimmerTheSameMethodAsTheJumpMenu() {
        for ((code, profile) in controlProfiles) {
            assertEquals(profile.hooks.getValue(CHAT_JUMP), profile.hooks.getValue(INVISIBLE_BUTTONS),
                message = code.toString())
        }
        assertEquals(SYNTHETIC_PROFILE.hooks.getValue(CHAT_JUMP), SYNTHETIC_PROFILE.hooks.getValue(INVISIBLE_BUTTONS))
    }

    @Test fun theExtensionGetsTheFragmentAndItsViewFirst() {
        val method = fixtureMethod(SYNTHETIC_CHAT_JUMP, "return-void", registers = 5)
        injectControl(INVISIBLE_BUTTONS, mapOf(INVISIBLE_BUTTONS to listOf(method)))
        val code = method.implementation!!.instructions.toList()
        assertEquals(2, code.size)
        val call = code.first()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals(INVISIBLE_BUTTONS_CALL, (call as ReferenceInstruction).reference.toString())
        assertEquals(listOf(2, 2), (call as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
    }

    @Test fun aMethodThatIsntTheChatsViewHandoverRefusesTheSwitchBeforeAnyEdit() {
        val bad = fixtureMethod("LX/1hl;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V", "return-void",
            registers = 5, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        val before = bad.implementation!!.instructions.toList()
        assertFailsWith<PatchException> { injectControl(INVISIBLE_BUTTONS, mapOf(INVISIBLE_BUTTONS to listOf(bad))) }
        assertEquals(before, bad.implementation!!.instructions.toList())
    }
}
