package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

internal const val SYNTHETIC_TAB_BADGES = "LX/1n1;->A00(Ljava/lang/String;)LX/38i;"
internal const val SYNTHETIC_FACEBOOK_BADGE = "$FACEBOOK_BUTTON->A02()LX/2RS;"
private const val NO_BADGE = "LX/2RZ;->A00:LX/38i;"
private const val SESSION_CHECK = "invoke-virtual {v0, v3}, LX/1sM;->A03($FB_USER_SESSION)Z"
private const val BUTTON_INIT = "invoke-direct/range {v4 .. v13}, LX/2RS;-><init>(LX/1J7;LX/1SV;LX/1wn;LX/4Fm;LX/38i;" +
    "Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V"

/** The bottom bar's dispatcher as 584 writes it: a tab it knows gets its own controller, any other the no-badge one. */
private fun dispatcher(id: String = SYNTHETIC_TAB_BADGES, other: String = "sget-object v4, $NO_BADGE", registers: Int = 8) =
    fixtureMethod(id, """
        const-string v0, "$TAB_CONTENT_SPEC"
        const-string v1, "$BADGE_CONTROLLER_CALL"
        const-string v2, "inbox"
        move-object/from16 v5, p1
        invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v3
        if-eqz v3, :other
        iget-object v4, p0, LX/1n1;->A01:LX/38i;
        return-object v4
        :other
        $other
        return-object v4
    """.trimIndent(), registers = registers)

/**
 * The Facebook button's build as 584 writes it: the badge controller is cast first, dropped to null when the account
 * doesn't badge the button, and handed to the button either way.
 */
private fun buttonBuild(
    check: String = SESSION_CHECK,
    result: String = "v0",
    drop: String = "const/4 v9, 0x0",
    build: String = BUTTON_INIT,
    registers: Int = 15,
    id: String = SYNTHETIC_FACEBOOK_BADGE,
) = fixtureMethod(id, """
    sget-object v3, LX/1sN;->A00:$FB_USER_SESSION
    sget-object v9, LX/1sN;->A01:Ljava/lang/Object;
    check-cast v9, LX/38i;
    sget-object v0, LX/1sN;->A02:LX/1sM;
    $check
    move-result $result
    if-nez $result, :build
    $drop
    :build
    new-instance v4, LX/2RS;
    $build
    return-object v4
""".trimIndent(), registers = registers)

/** 587's build: the controller goes into the button's builder right after the check, and the builder into the button. */
private fun buttonBuild587(
    store: String = "iput-object v9, v8, LX/2LP;->A04:LX/38i;",
    build: String = "invoke-direct {v4, v8}, LX/2RS;-><init>(LX/2LP;)V",
) = fixtureMethod(SYNTHETIC_FACEBOOK_BADGE, """
    sget-object v3, LX/1sN;->A00:$FB_USER_SESSION
    sget-object v9, LX/1sN;->A01:Ljava/lang/Object;
    check-cast v9, LX/38i;
    new-instance v8, LX/2LP;
    invoke-direct {v8}, LX/2LP;-><init>()V
    sget-object v0, LX/1sN;->A02:LX/1sM;
    $SESSION_CHECK
    move-result v0
    if-nez v0, :build
    const/4 v9, 0x0
    :build
    $store
    new-instance v4, LX/2RS;
    $build
    return-object v4
""".trimIndent(), registers = 15)

/** Both hooks for the catalog-wide discovery fixture. */
internal fun tabBadgesFixture() = listOf(fixtureClass("LX/1n1;", listOf(dispatcher())), fixtureClass(FACEBOOK_BUTTON, listOf(buttonBuild())))

private fun Method.code() = implementation!!.instructions.toList()

/** The same method with only its parameters' registers. */
private fun MutableMethod.withoutLocals() = MutableMethod(ImmutableMethod(definingClass, name, parameters, returnType, accessFlags,
    null, null, ImmutableMethodImplementation(2, implementation!!.instructions, null, null)))

/** Five instructions go in at the top. A hidden tab returns the no-badge controller; every other tab runs stock code. */
private fun assertDispatcherHook(before: List<Instruction>, after: List<Instruction>, tab: Int, none: String, label: String) {
    assertEquals(before.size + 5, after.size, label)
    assertEquals(before, after.drop(5), label)
    val helper = after[0] as FiveRegisterInstruction
    assertEquals(Opcode.INVOKE_STATIC, helper.opcode, label)
    assertEquals(TAB_BADGE_HELPER, (helper as ReferenceInstruction).reference.toString(), label)
    assertEquals(listOf(1, tab), listOf(helper.registerCount, helper.registerC), label)
    assertEquals(Opcode.MOVE_RESULT, after[1].opcode, label)
    val answer = (after[1] as OneRegisterInstruction).registerA
    assertEquals(listOf(Opcode.IF_EQZ, answer, 5), listOf(after[2].opcode, (after[2] as OneRegisterInstruction).registerA, after.branchTarget(2)), label)
    assertEquals(Opcode.SGET_OBJECT, after[3].opcode, label)
    assertEquals(none, (after[3] as ReferenceInstruction).reference.toString(), label)
    assertEquals(Opcode.RETURN_OBJECT, after[4].opcode, label)
    assertEquals((after[3] as OneRegisterInstruction).registerA, (after[4] as OneRegisterInstruction).registerA, label)
}

/** The check's answer goes through the helper right after its move-result, and the test still lands on the build. */
private fun assertButtonHook(before: List<Instruction>, after: List<Instruction>, result: Int, label: String) {
    val register = (before[result] as OneRegisterInstruction).registerA
    assertEquals(before.size + 2, after.size, label)
    assertEquals(before, after.filterIndexed { i, _ -> i != result + 1 && i != result + 2 }, label)
    val helper = after[result + 1] as FiveRegisterInstruction
    assertEquals(Opcode.INVOKE_STATIC, helper.opcode, label)
    assertEquals(FACEBOOK_BADGE_HELPER, (helper as ReferenceInstruction).reference.toString(), label)
    assertEquals(listOf(1, register), listOf(helper.registerCount, helper.registerC), label)
    assertEquals(Opcode.MOVE_RESULT, after[result + 2].opcode, label)
    assertEquals(register, (after[result + 2] as OneRegisterInstruction).registerA, label)
    assertEquals(Opcode.IF_NEZ, after[result + 3].opcode, label)
    assertEquals(register, (after[result + 3] as OneRegisterInstruction).registerA, label)
    assertEquals(result + 5, after.branchTarget(result + 3), label)
}

class TabBadgesTest {
    @AfterTest fun reset() { activeProfile = SYNTHETIC_PROFILE }

    private fun found(vararg methods: MutableMethod) =
        mirroredControls(methods.groupBy { it.definingClass }.map { (type, group) -> fixtureClass(type, group) })

    @Test fun theDispatcherAndTheFacebookButtonGoThroughTheExtensionAndNothingStockMoves() {
        val tab = dispatcher()
        val button = buttonBuild()
        val found = found(tab, button)
        assertEquals(listOf(SYNTHETIC_TAB_BADGES), found.getValue(TAB_BADGES).map { it.hookId() })
        assertEquals(listOf(SYNTHETIC_FACEBOOK_BADGE), found.getValue(FACEBOOK_BADGE).map { it.hookId() })
        validateControls(found, setOf(TAB_BADGES, FACEBOOK_BADGE))
        assertEquals(NO_BADGE, tab.noBadgeController())
        val tabBefore = tab.code()
        val buttonBefore = button.code()
        val result = button.facebookBadgeCheck()!!
        injectControl(TAB_BADGES, mapOf(TAB_BADGES to listOf(tab), FACEBOOK_BADGE to listOf(button)))
        assertDispatcherHook(tabBefore, tab.code(), tab.parameterRegister(1), NO_BADGE, "dispatcher")
        assertButtonHook(buttonBefore, button.code(), result, "button")
    }

    @Test fun the587ButtonThatTakesItsControllerThroughABuilderGoesThroughTheExtension() {
        val button = buttonBuild587()
        val found = found(button)
        assertEquals(listOf(SYNTHETIC_FACEBOOK_BADGE), found.getValue(FACEBOOK_BADGE).map { it.hookId() })
        validateControls(found, setOf(FACEBOOK_BADGE))
        val before = button.code()
        val result = button.facebookBadgeCheck()!!
        injectControl(FACEBOOK_BADGE, mapOf(FACEBOOK_BADGE to listOf(button)))
        assertButtonHook(before, button.code(), result, "587 button")
        val wrong = mapOf(
            "the builder's field isn't the controller's type" to buttonBuild587(store = "iput-object v9, v8, LX/2LP;->A04:Ljava/lang/Object;"),
            "the button never gets the builder" to buttonBuild587(build = "invoke-direct {v4, v7}, LX/2RS;-><init>(LX/2LP;)V"),
            "the button takes the builder as an Object" to buttonBuild587(build = "invoke-direct {v4, v8}, LX/2RS;-><init>(Ljava/lang/Object;)V"),
        )
        for ((case, bad) in wrong) {
            assertTrue(found(bad).getValue(FACEBOOK_BADGE).isEmpty(), case)
            val code = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(FACEBOOK_BADGE, mapOf(FACEBOOK_BADGE to listOf(bad))) }
            assertEquals(code, bad.code(), case)
        }
    }

    @Test fun onlyTheOneDispatcherAndTheFacebookButtonItselfCount() {
        // Two dispatchers make the set differ from the build's, so the control stops.
        val twice = found(dispatcher(), dispatcher(id = "LX/1n2;->A00(Ljava/lang/String;)LX/38i;"))
        assertEquals(2, twice.getValue(TAB_BADGES).size)
        assertFailsWith<PatchException> { validateControls(twice, setOf(TAB_BADGES)) }
        // A dispatcher-shaped method that takes an Object, or the button's shape in another class, isn't either hook.
        assertTrue(found(dispatcher(id = "LX/1n1;->A00(Ljava/lang/Object;)LX/38i;")).getValue(TAB_BADGES).isEmpty())
        assertTrue(found(buttonBuild(id = "LX/Zz9;->A02()LX/2RS;")).getValue(FACEBOOK_BADGE).isEmpty())
    }

    @Test fun aShapeThatMovedStopsBeforeAnyEdit() {
        val dispatchers = mapOf(
            "two no-badge controllers" to dispatcher(other = "sget-object v4, $NO_BADGE\nif-nez v3, :done\nsget-object v4, LX/2RZ;->A01:LX/38i;\n:done"),
            "no no-badge controller" to dispatcher(other = "const/4 v4, 0x0"),
            "tab id past v15" to dispatcher(registers = 17),
            "tab id isn't a String" to dispatcher(id = "LX/1n1;->A00(Ljava/lang/Object;)LX/38i;"),
        )
        val buttons = mapOf(
            "check takes no session" to buttonBuild(check = "invoke-virtual {v0}, LX/1sM;->A03()Z"),
            "check is an interface call" to buttonBuild(check = "invoke-interface {v0, v3}, LX/1sM;->A03($FB_USER_SESSION)Z"),
            "a second session check" to buttonBuild(check = "$SESSION_CHECK\nmove-result v0\nif-nez v0, :second\nconst/4 v9, 0x0\n:second\n$SESSION_CHECK"),
            "drop keeps a value" to buttonBuild(drop = "const/4 v9, 0x1"),
            "drop clears a register that wasn't cast" to buttonBuild(drop = "const/4 v8, 0x0"),
            "button never gets the controller" to buttonBuild(build = "invoke-direct {v4, v8}, LX/2RS;-><init>(LX/38i;)V"),
            "button gets it twice" to buttonBuild(build = "invoke-direct {v4, v9, v9}, LX/2RS;-><init>(LX/38i;LX/38i;)V"),
            "button takes it as an Object" to buttonBuild(build = "invoke-direct {v4, v9}, LX/2RS;-><init>(Ljava/lang/Object;)V"),
            "answer past v15" to buttonBuild(result = "v16", registers = 17),
            "another jump lands on the test" to fixtureMethod(SYNTHETIC_FACEBOOK_BADGE, """
                sget-object v3, LX/1sN;->A00:$FB_USER_SESSION
                sget-object v9, LX/1sN;->A01:Ljava/lang/Object;
                check-cast v9, LX/38i;
                sget-object v0, LX/1sN;->A02:LX/1sM;
                if-eqz v3, :test
                $SESSION_CHECK
                move-result v0
                :test
                if-nez v0, :build
                const/4 v9, 0x0
                :build
                new-instance v4, LX/2RS;
                $BUTTON_INIT
                return-object v4
            """.trimIndent(), registers = 15),
        )
        // A bad half of the control leaves the good half alone too, whichever half it is.
        for ((case, bad) in dispatchers) {
            val good = buttonBuild()
            val before = good.code()
            val failure = assertFailsWith<PatchException>(case) {
                injectControl(TAB_BADGES, mapOf(FACEBOOK_BADGE to listOf(good), TAB_BADGES to listOf(bad)))
            }
            assertContains(failure.message.orEmpty(), "tab badges no longer match", message = case)
            assertEquals(before, good.code(), case)
        }
        for ((case, bad) in buttons) {
            val good = dispatcher()
            val before = good.code()
            val failure = assertFailsWith<PatchException>(case) {
                injectControl(TAB_BADGES, mapOf(TAB_BADGES to listOf(good), FACEBOOK_BADGE to listOf(bad)))
            }
            assertContains(failure.message.orEmpty(), "tab badges no longer match", message = case)
            assertEquals(before, good.code(), case)
        }
        // The no-badge controller goes into v0, so the dispatcher needs a local register.
        val starved = dispatcher().withoutLocals()
        val failure = assertFailsWith<PatchException> { injectControl(TAB_BADGES, mapOf(TAB_BADGES to listOf(starved))) }
        assertContains(failure.message.orEmpty(), "no local register")
    }

    @Test fun everySupportedBuildHooksItsDispatcherAndFacebookButton() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val tabs = findTabBadges(classes)
            val buttons = findFacebookBadge(classes)
            assertEquals(activeProfile.hooks.getValue(TAB_BADGES), tabs.map { it.hookId() }.toSet(), code)
            assertEquals(activeProfile.hooks.getValue(FACEBOOK_BADGE), buttons.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(TAB_BADGES to tabs, FACEBOOK_BADGE to buttons), setOf(TAB_BADGES, FACEBOOK_BADGE))
            val tab = MutableMethod(tabs.single())
            val button = MutableMethod(buttons.single())
            val none = tab.noBadgeController()
            val result = button.facebookBadgeCheck()!!
            val tabBefore = tab.code()
            val buttonBefore = button.code()
            injectControl(TAB_BADGES, mapOf(TAB_BADGES to listOf(tab), FACEBOOK_BADGE to listOf(button)))
            assertDispatcherHook(tabBefore, tab.code(), tab.parameterRegister(1), none, code)
            assertButtonHook(buttonBefore, button.code(), result, code)
        }
    }
}
