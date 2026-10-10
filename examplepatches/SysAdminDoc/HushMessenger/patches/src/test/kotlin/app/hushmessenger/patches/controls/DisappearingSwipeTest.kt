package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
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

/**
 * The start method cut down to what every build shares: it logs the swipe's impression and answers true, with the
 * eighteen registers all six families give it (seven parameter words, so v0 is a local).
 */
private val START_BODY = """
    const/4 v5, 0x1
    const-string v1, "disappearing_message"
    const-string v0, "$DISAPPEARING_SWIPE_MARK"
    return v5
""".trimIndent()

private fun start(
    owner: String = OVERSCROLL_BEHAVIOR,
    body: String = START_BODY,
    registers: Int = 18,
    flags: Int = AccessFlags.PUBLIC.value,
): MutableMethod = fixtureMethod(OVERSCROLL_START.replace(OVERSCROLL_BEHAVIOR, owner), body, registers, flags)

/** The behavior as Messenger ships it: the start method beside the scroll callbacks that never get a hook. */
internal fun disappearingSwipeFixture(startMethod: MutableMethod = start()): List<MutableClass> = listOf(
    fixtureClass(OVERSCROLL_BEHAVIOR, listOf(
        startMethod,
        fixtureMethod("$OVERSCROLL_BEHAVIOR->onStopNestedScroll(Landroidx/coordinatorlayout/widget/CoordinatorLayout;" +
            "Landroid/view/View;Landroid/view/View;I)V", "const-string v0, \"disappearing_message\"\nreturn-void", registers = 25),
    ), superclass = "Lcom/facebook/messaging/threadview/overscroll/ui/ViewOffsetBehavior;"),
)

private fun Method.code() = implementation!!.instructions.toList()

class DisappearingSwipeTest {
    @AfterTest fun reset() {
        activeProfile = BASE_PROFILE
    }

    private fun found(classes: List<MutableClass>) = findControls(classes).getValue(DISAPPEARING_SWIPE).map { it.hookId() }

    @Test fun theStartMethodIsFoundByItsClassAndTheImpressionItLogs() {
        assertEquals(listOf(OVERSCROLL_START), found(disappearingSwipeFixture()))
        validateControls(findControls(disappearingSwipeFixture()), setOf(DISAPPEARING_SWIPE))
    }

    @Test fun everyProfileHooksTheSameNamedMethod() {
        val profiles = listOf(BASE_PROFILE, PROFILE_346013370, PROFILE_346013423, PROFILE_346013357, PROFILE_346013374,
            PROFILE_346213494)
        for (profile in profiles) {
            assertEquals(setOf(OVERSCROLL_START), profile.hooks.getValue(DISAPPEARING_SWIPE))
            activeProfile = profile
            validateControls(findControls(disappearingSwipeFixture()), setOf(DISAPPEARING_SWIPE))
        }
    }

    @Test fun lookalikesAreNotTheSwipe() {
        val cases = mapOf(
            "no impression" to disappearingSwipeFixture(start(body = "const/4 v5, 0x1\nreturn v5")),
            "static" to disappearingSwipeFixture(start(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)),
            "another class" to listOf(fixtureClass("LX/Other;", listOf(start(owner = "LX/Other;")))),
            "no behavior" to listOf(fixtureClass("LX/Unrelated;")),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(findControls(classes), setOf(DISAPPEARING_SWIPE)) }
        }
    }

    @Test fun theSwitchDeclinesTheGestureBeforeAnyStockWork() {
        val method = start()
        val before = method.code()
        injectControl(DISAPPEARING_SWIPE, mapOf(DISAPPEARING_SWIPE to listOf(method)))
        val code = method.code()
        assertEquals("$SETTINGS->blockDisappearingSwipe()Z", ((code[0] as ReferenceInstruction).reference).toString())
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(0, (code[1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(5, code.branchTarget(2))
        assertEquals(0, (code[3] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, code[4].opcode)
        assertEquals(0, (code[4] as OneRegisterInstruction).registerA)
        // Off, Pause and safe mode fall through to Messenger's own method, unchanged.
        assertEquals(before, code.drop(5))
    }

    @Test fun anUnusableStartRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            // Seven registers are exactly the parameter words, so v0 would be this.
            "no free register" to start(body = "const-string v0, \"$DISAPPEARING_SWIPE_MARK\"\nconst/4 v0, 0x1\nreturn v0", registers = 7),
            "no impression" to start(body = "const/4 v5, 0x1\nreturn v5"),
            "another method" to fixtureMethod("$OVERSCROLL_BEHAVIOR->layoutDependsOn(Landroidx/coordinatorlayout/widget/CoordinatorLayout;" +
                "Landroid/view/View;Landroid/view/View;)Z", "const-string v0, \"$DISAPPEARING_SWIPE_MARK\"\nconst/4 v0, 0x0\nreturn v0"),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) {
                injectControl(DISAPPEARING_SWIPE, mapOf(DISAPPEARING_SWIPE to listOf(bad)))
            }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildDeclinesTheSwipeFromItsOneStartMethod() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val starts = findDisappearingSwipe(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(DISAPPEARING_SWIPE), starts.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(DISAPPEARING_SWIPE to starts), setOf(DISAPPEARING_SWIPE))
            val method = MutableMethod(starts.single())
            val before = method.code()
            method.injectDisappearingSwipe()
            val after = method.code()
            assertEquals("$SETTINGS->blockDisappearingSwipe()Z", ((after[0] as ReferenceInstruction).reference).toString(), code)
            assertEquals(5, after.branchTarget(2), code)
            assertEquals(Opcode.RETURN, after[4].opcode, code)
            assertEquals(before.map { it.opcode }, after.drop(5).map { it.opcode }, code)
        }
    }
}
