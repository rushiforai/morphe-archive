package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val PAGE = "LX/NZx;"
private const val CALLBACK = "LX/P1b;"
internal const val SYNTHETIC_STORY_COMPLETION = "$PAGE->CMi()V"
private const val HAND_OFF = "$CALLBACK->A05(LX/4oC;)V"
private const val ADVANCE = "$MONTAGE_VIEWER->A0l(${MONTAGE_VIEWER}Ljava/lang/Integer;)V"

/** The replay Messenger starts instead when reactions were just scrolled. */
private const val REPLAY = "iget v1, p0, $PAGE->A00:I\nif-eqz v1, :finished\ninvoke-static {p0}, $PAGE->A0v($PAGE)V\nreturn-void\n:finished\n"

/** The null-checked hand-off and its return. */
private const val HAND_OFF_CODE = "if-eqz v0, :done\ninvoke-virtual {v0, p0}, $HAND_OFF\nreturn-void"

/**
 * The completion as Messenger 583 writes it, cut down: no card means nothing to do, a replay when reactions were just
 * scrolled, the finished log, then the null-checked hand-off right before the return.
 */
private const val COMPLETION_BODY = "iget-object v0, p0, $PAGE->A0R:Lcom/facebook/messaging/montage/model/MontageCard;\nif-eqz v0, :done\n" +
    REPLAY + "const-string v0, \"$STORY_FINISHED\"\niget-object v0, p0, $PAGE->A0c:$CALLBACK\n" + HAND_OFF_CODE + "\n:done\nreturn-void"

/** The viewer's callback: moves the viewer on with reason 0, automatic play. */
private val CALLBACK_BODY = """
    sget-object v0, LX/0Qp;->A00:Ljava/lang/Integer;
    const/4 v1, 0x0
    invoke-static {v1, v0}, $ADVANCE
    return-void
""".trimIndent()

private fun completion(body: String = COMPLETION_BODY, registers: Int = 6, flags: Int = AccessFlags.PUBLIC.value) =
    fixtureMethod(SYNTHETIC_STORY_COMPLETION, body, registers, flags)

private fun callback(body: String = CALLBACK_BODY) = fixtureMethod(HAND_OFF, body, 4)

/** The story page with its completion, and the viewer's callback. */
internal fun storyHoldFixture(page: List<MutableMethod> = listOf(completion())): List<MutableClass> =
    listOf(fixtureClass(PAGE, page), fixtureClass(CALLBACK, listOf(callback())))

private fun Method.code() = implementation!!.instructions.toList()

class StoryHoldTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(STORY_HOLD).map { it.hookId() }.toSet()

    @Test fun theCompletionIsFoundWhenItHandsThePageToTheViewer() {
        assertEquals(setOf(SYNTHETIC_STORY_COMPLETION), found(storyHoldFixture()))
        validateControls(mirroredControls(storyHoldFixture()), setOf(STORY_HOLD))
    }

    @Test fun eachMappingHooksItsOwnCompletion() {
        assertEquals(setOf(SYNTHETIC_STORY_COMPLETION), SYNTHETIC_PROFILE.hooks.getValue(STORY_HOLD))
        assertEquals(setOf("LX/OYP;->CNH()V"), BASE_PROFILE.hooks.getValue(STORY_HOLD))
    }

    // The switch says a story waits for a tap. A build that finishes stories some other way would make that untrue, or
    // hold something that isn't a story, so it gets no hook at all.
    @Test fun anyOtherShapeLeavesTheControlUnapplied() {
        val secondLogger = fixtureClass("LX/Zzq;", listOf(fixtureMethod("LX/Zzq;->A00()V", "const-string v0, \"$STORY_FINISHED\"\nreturn-void")))
        fun changed(from: String, to: String) = storyHoldFixture(listOf(completion(COMPLETION_BODY.replace(from, to).also { check(it != COMPLETION_BODY) })))
        val cases = mapOf(
            "a second finished logger" to storyHoldFixture() + secondLogger,
            "a callback that doesn't move the viewer" to listOf(fixtureClass(PAGE, listOf(completion())), fixtureClass(CALLBACK, listOf(callback("return-void")))),
            "no callback class" to listOf(fixtureClass(PAGE, listOf(completion()))),
            "no null check before the hand-off" to changed(HAND_OFF_CODE, "invoke-virtual {v0, p0}, $HAND_OFF\nreturn-void"),
            "a hand-off that doesn't return" to changed(HAND_OFF_CODE, "if-eqz v0, :done\ninvoke-virtual {v0, p0}, $HAND_OFF\nconst/4 v1, 0x0\nreturn-void"),
            "a hand-off of another page" to changed("invoke-virtual {v0, p0}", "invoke-virtual {v0, v0}"),
            "a static hand-off" to changed("invoke-virtual {v0, p0}, $HAND_OFF", "invoke-static {v0, p0}, $CALLBACK->A09(${CALLBACK}LX/4oC;)V"),
            "a branch straight to the hand-off" to storyHoldFixture(listOf(completion(COMPLETION_BODY
                .replace("if-eqz v1, :finished", "if-eqz v1, :finished\nif-nez v0, :hand_off")
                .replace("invoke-virtual {v0, p0}", ":hand_off\ninvoke-virtual {v0, p0}")))),
            "two hand-offs" to changed("invoke-static {p0}, $PAGE->A0v($PAGE)V\nreturn-void", HAND_OFF_CODE),
            "a static completion" to storyHoldFixture(listOf(completion(COMPLETION_BODY.replace("p0", "v5"), flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value))),
            // Two registers: v0 holds the callback and v1 is the page, so the guard would have nowhere to write.
            "no register to spare" to storyHoldFixture(listOf(completion(COMPLETION_BODY.replace(REPLAY, ""), registers = 2))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(STORY_HOLD)) }
        }
    }

    @Test fun theGuardReturnsJustBeforeTheHandOffAndLeavesTheRestAlone() {
        val method = completion()
        val before = method.code()
        val at = before.indexOfFirst { it.opcode == Opcode.INVOKE_VIRTUAL }
        injectControl(STORY_HOLD, mapOf(STORY_HOLD to listOf(method)))
        val code = method.code()
        // The card check, the replay and the finished log run first, as in stock.
        assertEquals(before.take(at), code.take(at))
        assertEquals("$SETTINGS->holdStoryAtEnd()Z", (code[at] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.MOVE_RESULT, code[at + 1].opcode)
        val scratch = (code[at + 1] as OneRegisterInstruction).registerA
        // A local the hand-off doesn't read: not the callback in v0 and not the page in p0.
        assertTrue(scratch != 0 && scratch < 5, "scratch v$scratch")
        assertEquals(Opcode.IF_EQZ, code[at + 2].opcode)
        assertEquals(scratch, (code[at + 2] as OneRegisterInstruction).registerA)
        assertEquals(at + 4, code.branchTarget(at + 2))
        // On, the page keeps its card: return before the viewer hears of it.
        assertEquals(Opcode.RETURN_VOID, code[at + 3].opcode)
        // Off, Pause and safe mode hand the page on exactly as Messenger wrote it.
        assertEquals(HAND_OFF, (code[at + 4] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(0, 5), (code[at + 4] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
        assertEquals(before.drop(at).map { it.opcode }, code.drop(at + 4).map { it.opcode })
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "the callback itself" to callback(),
            "a completion with no register to spare" to completion(COMPLETION_BODY.replace(REPLAY, ""), registers = 2),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(STORY_HOLD, mapOf(STORY_HOLD to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildHoldsTheSameCompletion() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val hooks = findStoryHold(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(STORY_HOLD), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(STORY_HOLD to hooks), setOf(STORY_HOLD))
            val method = MutableMethod(hooks.single())
            val before = method.code()
            val at = method.storyAdvance()!!.index
            method.injectStoryHold()
            val after = method.code()
            assertEquals("$SETTINGS->holdStoryAtEnd()Z", (after[at] as ReferenceInstruction).reference.toString(), code)
            assertEquals(Opcode.RETURN_VOID, after[at + 3].opcode, code)
            assertEquals(before.map { it.opcode }.filter { it != Opcode.NOP }, (after.take(at) + after.drop(at + 4)).map { it.opcode }.filter { it != Opcode.NOP }, code)
        }
    }
}
