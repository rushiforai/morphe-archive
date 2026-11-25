package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

internal const val SYNTHETIC_REFRESH_RATE = "$FB_FRAGMENT_ACTIVITY->onResume()V"

/** The hook as the stock build writes it, beside a screen's onCreate the finder has to pass over. */
internal fun refreshRateFixture(): List<MutableClass> = listOf(
    fixtureClass(FB_FRAGMENT_ACTIVITY, listOf(
        fixtureMethod(SYNTHETIC_REFRESH_RATE, "return-void", 4),
        fixtureMethod("$FB_FRAGMENT_ACTIVITY->onCreate(Landroid/os/Bundle;)V", "return-void", 5),
    )),
)

/** #208: every screen comes through FbFragmentActivity.onResume, where the extension sets the window's display mode. */
class RefreshRateTest {
    @Test fun theFinderAndItsMirrorTakeTheStockHook() {
        assertEquals(setOf(SYNTHETIC_REFRESH_RATE), mirroredControls(refreshRateFixture()).getValue(REFRESH_RATE).map { it.hookId() }.toSet())
        assertEquals(listOf(SYNTHETIC_REFRESH_RATE), findRefreshRate(refreshRateFixture()).map { it.hookId() })
    }

    @Test fun everyBuildHooksTheSameRealNamedMethod() {
        for ((code, profile) in controlProfiles) {
            assertEquals(setOf(SYNTHETIC_REFRESH_RATE), profile.hooks.getValue(REFRESH_RATE), message = code.toString())
        }
    }

    @Test fun theScreenReachesTheExtensionFirst() {
        val method = fixtureMethod(SYNTHETIC_REFRESH_RATE, "return-void", registers = 4)
        injectControl(REFRESH_RATE, mapOf(REFRESH_RATE to listOf(method)))
        val code = method.implementation!!.instructions.toList()
        assertEquals(2, code.size)
        val call = code.first()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals(REFRESH_RATE_CALL, (call as ReferenceInstruction).reference.toString())
        assertEquals(listOf(3, 1), (call as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
        assertTrue(code.last().opcode == Opcode.RETURN_VOID)
    }

    @Test fun anythingButTheScreensOwnResumeRefusesTheSwitchBeforeAnyEdit() {
        val shapes = listOf(
            fixtureMethod("$FB_FRAGMENT_ACTIVITY->onResume()V", "return-void", 4,
                flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
            fixtureMethod("$FB_FRAGMENT_ACTIVITY->onPause()V", "return-void", 4),
            fixtureMethod("LX/0AL;->onResume()V", "return-void", 4),
        )
        for (bad in shapes) {
            val before = bad.implementation!!.instructions.toList()
            assertFailsWith<PatchException> { injectControl(REFRESH_RATE, mapOf(REFRESH_RATE to listOf(bad))) }
            assertEquals(before, bad.implementation!!.instructions.toList())
        }
        // Two onResume methods (a merged class, say) aren't one clear hook.
        val twice = refreshRateFixture() + fixtureClass(FB_FRAGMENT_ACTIVITY, listOf(fixtureMethod(SYNTHETIC_REFRESH_RATE, "return-void", 4)))
        assertEquals(emptyList(), findRefreshRate(twice))
    }
}
