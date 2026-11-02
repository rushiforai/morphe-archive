package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val AUDIO_PROXY = "Lcom/facebook/rsys/audio/gen/AudioProxy;"
private const val AUDIO_API = "Lcom/facebook/rsys/audio/gen/AudioApi;"
private const val PARENT = "LX/BuA;"
private const val PROXY = "LX/B5v;"
private const val VOICE_PROXY = "LX/B64;"
internal const val SYNTHETIC_CALL_API = "$PROXY->setApi($AUDIO_API)V"
internal const val SYNTHETIC_CALL_ACTIVE = "$PROXY->setIsCallActive(Z)V"

/** The proxy calls run on keeps the API and does nothing with the call's state. */
private fun apiMethod(type: String = PROXY): MutableMethod = fixtureMethod("$type->setApi($AUDIO_API)V", """
    iput-object p1, p0, $type->A00:$AUDIO_API
    return-void
""".trimIndent(), registers = 2)

private fun activeMethod(type: String = PROXY): MutableMethod = fixtureMethod("$type->setIsCallActive(Z)V", "return-void", registers = 2)

/** Meta AI's voice proxy has the same two methods, and passes the state on. */
private fun voiceActive(): MutableMethod = fixtureMethod("$VOICE_PROXY->setIsCallActive(Z)V", """
    iput-boolean p1, p0, $VOICE_PROXY->A01:Z
    return-void
""".trimIndent(), registers = 4)

internal fun callRecordingFixture(
    proxy: List<MutableMethod> = listOf(apiMethod(), activeMethod()),
    parent: String = AUDIO_PROXY,
): List<MutableClass> = listOf(
    fixtureClass(PARENT, superclass = parent),
    fixtureClass(PROXY, proxy, superclass = PARENT),
    fixtureClass(VOICE_PROXY, listOf(apiMethod(VOICE_PROXY), voiceActive()), superclass = PARENT),
)

class CallRecordingTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(CALL_RECORDING).map { it.hookId() }.toSet()

    @Test fun callsRunOnTheProxyThatOnlyKeepsTheApiNotMetaAisVoiceOne() {
        assertEquals(setOf(SYNTHETIC_CALL_API, SYNTHETIC_CALL_ACTIVE), found(callRecordingFixture()))
        validateControls(mirroredControls(callRecordingFixture()), setOf(CALL_RECORDING))
        assertEquals(setOf(SYNTHETIC_CALL_API, SYNTHETIC_CALL_ACTIVE), SYNTHETIC_PROFILE.hooks.getValue(CALL_RECORDING))
        assertEquals(2, BASE_PROFILE.hooks.getValue(CALL_RECORDING).size)
    }

    @Test fun lookalikesAreNotTheProxy() {
        val cases = mapOf(
            "not under the audio proxy" to callRecordingFixture(parent = "LX/Other;"),
            "no call state" to callRecordingFixture(proxy = listOf(apiMethod())),
            "no audio API" to callRecordingFixture(proxy = listOf(activeMethod())),
            "two proxies that only keep the API" to callRecordingFixture() +
                fixtureClass("LX/Second;", listOf(apiMethod("LX/Second;"), activeMethod("LX/Second;")), superclass = PARENT),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(CALL_RECORDING)) }
        }
    }

    @Test fun bothMethodsTellTheExtensionFirst() {
        for ((method, call) in listOf(apiMethod() to CALL_RECORDING_API_CALL, activeMethod() to CALL_RECORDING_ACTIVE_CALL)) {
            val before = method.implementation!!.instructions.count()
            injectControl(CALL_RECORDING, mapOf(CALL_RECORDING to listOf(method)))
            val code = method.implementation!!.instructions.toList()
            assertEquals(before + 1, code.size)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, code[0].opcode)
            assertEquals(call, (code[0] as ReferenceInstruction).reference.toString())
            assertEquals(method.parameterRegister(1), (code[0] as RegisterRangeInstruction).startRegister)
            assertEquals(1, (code[0] as RegisterRangeInstruction).registerCount)
        }
    }
}
