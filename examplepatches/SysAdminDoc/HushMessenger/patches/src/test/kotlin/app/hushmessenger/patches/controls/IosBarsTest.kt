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
 * #162: the translucent bars are found from the chat's own views, so the switch rides the handover the jump menu, the
 * screenshot block and the dimmer already take instead of fingerprinting a bar of its own.
 */
class IosBarsTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    @Test fun everyBuildHandsTheBarsTheSameMethodAsTheJumpMenu() {
        for ((code, profile) in controlProfiles) {
            assertEquals(profile.hooks.getValue(CHAT_JUMP), profile.hooks.getValue(IOS_BARS), message = code.toString())
        }
        assertEquals(SYNTHETIC_PROFILE.hooks.getValue(CHAT_JUMP), SYNTHETIC_PROFILE.hooks.getValue(IOS_BARS))
    }

    @Test fun theExtensionGetsTheFragmentAndItsViewFirst() {
        val method = fixtureMethod(SYNTHETIC_CHAT_JUMP, "return-void", registers = 5)
        injectControl(IOS_BARS, mapOf(IOS_BARS to listOf(method)))
        val code = method.implementation!!.instructions.toList()
        assertEquals(2, code.size)
        val call = code.first()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals(IOS_BARS_CALL, (call as ReferenceInstruction).reference.toString())
        assertEquals(listOf(2, 2), (call as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
    }

    @Test fun aMethodThatIsntTheChatsViewHandoverRefusesTheSwitchBeforeAnyEdit() {
        val bad = fixtureMethod("LX/1hl;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V", "return-void",
            registers = 5, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        val before = bad.implementation!!.instructions.toList()
        assertFailsWith<PatchException> { injectControl(IOS_BARS, mapOf(IOS_BARS to listOf(bad))) }
        assertEquals(before, bad.implementation!!.instructions.toList())
    }
}
