package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

/** #240: the smaller stories row hears about every screen from the same onResume refresh_rate hooks. */
class StoryRowSizeTest {
    @Test fun theFinderAndItsMirrorTakeTheScreensResume() {
        assertEquals(setOf(SYNTHETIC_REFRESH_RATE), mirroredControls(refreshRateFixture()).getValue(STORY_ROW_SIZE).map { it.hookId() }.toSet())
        assertEquals(listOf(SYNTHETIC_REFRESH_RATE), findStoryRowSize(refreshRateFixture()).map { it.hookId() })
    }

    @Test fun everyBuildHooksTheSameMethodAsRefreshRate() {
        for ((code, profile) in controlProfiles) {
            assertEquals(profile.hooks.getValue(REFRESH_RATE), profile.hooks.getValue(STORY_ROW_SIZE), message = code.toString())
        }
    }

    @Test fun bothHooksLandOnOneResumeAndEachGetsItsCall() {
        val method = fixtureMethod(SYNTHETIC_REFRESH_RATE, "return-void", registers = 4)
        injectControl(REFRESH_RATE, mapOf(REFRESH_RATE to listOf(method)))
        injectControl(STORY_ROW_SIZE, mapOf(STORY_ROW_SIZE to listOf(method)))
        val code = method.implementation!!.instructions.toList()
        assertEquals(3, code.size)
        val calls = code.take(2).map { it as ReferenceInstruction }
        assertEquals(listOf(STORY_ROW_SIZE_CALL, REFRESH_RATE_CALL), calls.map { it.reference.toString() })
        for (call in calls) {
            assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
            assertEquals(listOf(3, 1), (call as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
        }
        assertEquals(Opcode.RETURN_VOID, code.last().opcode)
    }

    @Test fun anotherMethodRefusesTheSwitchBeforeAnyEdit() {
        val bad = fixtureMethod("$FB_FRAGMENT_ACTIVITY->onPause()V", "return-void", 4)
        val before = bad.implementation!!.instructions.toList()
        assertFailsWith<PatchException> { injectControl(STORY_ROW_SIZE, mapOf(STORY_ROW_SIZE to listOf(bad))) }
        assertEquals(before, bad.implementation!!.instructions.toList())
    }
}
