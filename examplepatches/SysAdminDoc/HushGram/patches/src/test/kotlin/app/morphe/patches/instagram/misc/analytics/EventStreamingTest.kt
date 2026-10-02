/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.analytics

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class EventStreamingTest {
    private val settings = "Lfixture/EventSettings;"
    private val step = "Lfixture/EventStep;"
    private val state = "Lfixture/StepState;"

    /**
     * The step's read of the settings' stream switch goes through streamEvents() before the branch
     * on it, on the register the branch tests. The step's own flag, read earlier, doesn't.
     */
    @Test
    fun theStreamSwitchGoesThroughTheExtension() {
        val context = PatchContexts.of(classes())

        assertNull(context.keepEventsOffTheStream(STREAM_EVENTS))

        val code = context.step().code()
        val calls = code.indices.filter { code[it].referenceText() == STREAM_EVENTS }
        assertEquals("streamEvents() calls", 1, calls.size)
        val call = calls.single()
        assertEquals("$settings->streaming:Z", code[call - 1].referenceText())
        val register = (code[call - 1] as TwoRegisterInstruction).registerA
        assertEquals("streamEvents()'s argument", register, (code[call] as RegisterRangeInstruction).startRegister)
        assertEquals(Opcode.MOVE_RESULT, code[call + 1].opcode)
        assertEquals(register, (code[call + 1] as OneRegisterInstruction).registerA)
        assertEquals("the branch tests the answer", Opcode.IF_EQZ, code[call + 2].opcode)
        assertEquals(register, (code[call + 2] as OneRegisterInstruction).registerA)
    }

    /** A build missing either piece, or whose step doesn't branch on the switch, says so and changes nothing. */
    @Test
    fun whatItCantPlaceItLeavesAlone() {
        val cases = mapOf(
            "no settings" to classes(settingsStrings = listOf("non-streamable events")),
            "no step" to classes(stepStrings = listOf("event.streaming.eligible")),
            "two steps" to classes(steps = 2),
            "no branch" to classes(branch = false),
        )
        for ((case, classes) in cases) {
            val context = PatchContexts.of(classes)

            val reason = context.keepEventsOffTheStream(STREAM_EVENTS)

            assertTrue(case, reason != null)
            assertTrue(case, context.classDefBy(step).methods.none { method -> method.code().any { it.referenceText() == STREAM_EVENTS } })
        }
    }

    /** In each declared build, the step's first read of the event settings goes through streamEvents() before its branch. */
    @Test
    fun eachDeclaredBuildKeepsEventsOffTheStream() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                val classes = mutableListOf<ClassDef>()
                FixtureDex.forEach(bundle) { dex ->
                    if ((EVENT_SETTINGS_STRINGS + STREAM_STEP_STRINGS).none { it in dex.stringSection }) return@forEach
                    for (classDef in dex.classes) {
                        val wanted = classDef.methods.any { method ->
                            val strings = method.strings()
                            (method.name == "<init>" && strings.containsAll(EVENT_SETTINGS_STRINGS)) || strings.containsAll(STREAM_STEP_STRINGS)
                        }
                        if (wanted) classes += ImmutableClassDef.of(classDef)
                    }
                }
                val context = PatchContexts.of(classes)

                assertNull(bundle.name, context.keepEventsOffTheStream(STREAM_EVENTS))

                val config = classes.single { classDef -> classDef.methods.any { it.name == "<init>" && it.strings().containsAll(EVENT_SETTINGS_STRINGS) } }
                val found = classes.flatMap { it.methods }.single { it.strings().containsAll(STREAM_STEP_STRINGS) }
                val code = context.classDefBy(found.definingClass).methods.single {
                    it.name == found.name && it.parameterTypes.map(Any::toString) == found.parameterTypes.map(Any::toString)
                }.code()
                val call = code.indices.single { code[it].referenceText() == STREAM_EVENTS }
                assertEquals("${bundle.name}: the switch read", Opcode.IGET_BOOLEAN, code[call - 1].opcode)
                assertTrue("${bundle.name}: a switch of the event settings", code[call - 1].referenceText()!!.startsWith("${config.type}->"))
                assertEquals("${bundle.name}: the branch on it", Opcode.IF_EQZ, code[call + 2].opcode)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun BytecodePatchContext.step(): Method = classDefBy(step).methods.single { it.name == "log" }

    private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.strings(): List<String> = code().mapNotNull {
        if (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) ((it as ReferenceInstruction).reference as StringReference).string else null
    }

    private fun Instruction.referenceText(): String? = (this as? ReferenceInstruction)?.reference?.toString()

    /**
     * The logger's event settings, whose constructor names its event sets and sets its stream
     * switch, and the step for each event: its own flag first, then the settings' stream switch with
     * the branch to the batch upload straight after.
     */
    private fun classes(
        settingsStrings: List<String> = EVENT_SETTINGS_STRINGS,
        stepStrings: List<String> = STREAM_STEP_STRINGS,
        steps: Int = 1,
        branch: Boolean = true,
    ): List<ClassDef> {
        val constructor = method(settings, "<init>", emptyList(), 3, AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value,
            settingsStrings.joinToString("\n") { "const-string v1, \"$it\"" } + """

                const/4 v0, 0x1
                iput-boolean v0, p0, $settings->streaming:Z
                iput-boolean v0, p0, $settings->started:Z
                return-void
            """)
        val names = listOf("log", "logAgain").take(steps)
        val logs = names.map { name ->
            method(step, name, listOf(settings), 4, AccessFlags.PUBLIC.value, """
                iget-boolean v0, p0, $step->first:Z
                if-nez v0, :seen
                const/4 v0, 0x1
                iput-boolean v0, p0, $step->first:Z
                :seen
                iget-boolean v0, p1, $settings->streaming:Z
                ${if (branch) "if-eqz v0, :batch" else "nop"}
                iget-boolean v1, p1, $settings->started:Z
                ${stepStrings.joinToString("\n") { "const-string v1, \"$it\"" }}
                return-void
                :batch
                invoke-static { p0 }, $state->batch(Ljava/lang/Object;)V
                return-void
            """)
        }
        return listOf(
            ImmutableClassDef(settings, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null,
                listOf("streaming", "started").map { ImmutableField(settings, it, "Z", AccessFlags.PUBLIC.value, null, null, null) },
                listOf(constructor)),
            ImmutableClassDef(step, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null,
                listOf(ImmutableField(step, "first", "Z", AccessFlags.PUBLIC.value, null, null, null)), logs),
        )
    }

    private fun method(owner: String, name: String, parameters: List<String>, registers: Int, flags: Int, body: String): Method {
        val mutable = MutableMethod(
            ImmutableMethod(
                owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, "V", flags, null, null,
                ImmutableMethodImplementation(registers, emptyList(), null, null),
            ),
        )
        mutable.addInstructionsWithLabels(0, body.trimIndent())
        return ImmutableMethod.of(mutable)
    }
}
