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
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
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

private const val BUILDER = "LX/Tb1;"
private const val CHATS_PAGE = "LX/Tb2;"
private const val FRAME = "LX/Tb3;"
private const val BUILDER_PARAMETERS = "(Landroid/content/Context;Lcom/facebook/auth/usersession/FbUserSession;Z)"
internal const val SYNTHETIC_TAB_BAR_BUILDER = "$BUILDER->A01$BUILDER_PARAMETERS$FRAME"
internal const val SYNTHETIC_CHATS_SCROLL_AWAY = "$CHATS_PAGE->F7L()Z"
private const val FLOATING = "$SETTINGS->floatingTabBar(I)Z"
private const val OVERLAY = "$SETTINGS->tabBarOverlay(I)Z"
private const val SCROLL_AWAY = "$SETTINGS->tabBarScrollAway(I)Z"
private const val CONFIG = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;"

/**
 * The home screen's frame builder as 586 writes it, cut down. v12 is this, v13 the Context, v14 the session, v15 the
 * boolean. Two checks that keep the plain bar come first in the overlay check's own shape, then the pill's flag, then
 * the overlay choice.
 */
private const val BUILDER_BODY = """const/4 v4, 0x0
move-object v6, v14
if-eqz v15, :none
const/4 v7, 0x0
invoke-static {v13}, LX/Tb4;->A00(Landroid/content/Context;)Z
move-result v0
const/4 v10, 0x0
if-nez v0, :built
invoke-static {v13}, LX/Tb5;->A00(Landroid/content/Context;)Z
move-result v0
if-nez v0, :built
invoke-static {}, LX/2wm;->A05()LX/4vN;
move-result-object v8
const-wide v0, 0x0101055400014313L
move-object v9, v8
check-cast v9, $CONFIG
invoke-interface {v9, v0, v1}, $CONFIG->B1S(J)Z
move-result v0
if-eqz v0, :built
new-instance v10, LX/4fy;
invoke-direct {v10}, Ljava/lang/Object;-><init>()V
:built
invoke-static {}, LX/Tb6;->A00()LX/0U4;
move-result-object v11
if-nez v10, :overlay
invoke-static {v11}, LX/17m;->A1Y(LX/0U4;)Z
move-result v0
if-nez v0, :overlay
sget-object v4, LX/0R1;->A00:Ljava/lang/Integer;
:frame
new-instance v1, $FRAME
invoke-direct {v1}, Ljava/lang/Object;-><init>()V
iput-object v4, v1, $FRAME->A00:Ljava/lang/Integer;
iput-object v10, v1, $FRAME->A01:LX/4fy;
return-object v1
:overlay
sget-object v4, LX/0R1;->A01:Ljava/lang/Integer;
goto :frame
:none
move-object v10, v4
goto :built"""

/** The Chats page's scroll-away answer as 586 writes it: the session check, then the flag read straight into the return. */
private const val CHATS_BODY = """iget-object v0, v3, $CHATS_PAGE->A0E:Lcom/facebook/auth/usersession/FbUserSession;
if-nez v0, :ready
invoke-static {}, LX/0R9;->createAndThrow()LX/0R9;
move-result-object v0
throw v0
:ready
invoke-static {}, LX/2wm;->A05()LX/4vN;
move-result-object v2
const-wide v0, 0x0101039400033264L
invoke-static {v2, v0, v1}, LX/17k;->A1X(Ljava/lang/Object;J)Z
move-result v0
return v0"""

/** [body] with each swap made once, failing if one doesn't apply. */
private fun edited(body: String, vararg swaps: Pair<String, String>) = swaps.fold(body) { text, (from, to) ->
    check(text.split(from).size == 2) { "$from isn't in the body once" }
    text.replace(from, to)
}

private fun builder(body: String = BUILDER_BODY, id: String = SYNTHETIC_TAB_BAR_BUILDER, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value) =
    fixtureMethod(id, body, 16, flags)

private fun chatsPage(body: String = CHATS_BODY, id: String = SYNTHETIC_CHATS_SCROLL_AWAY, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value) =
    fixtureMethod(id, body, 4, flags)

/** The frame builder on its singleton and the Chats page that answers whether the bar may slide away. */
internal fun tabBarFixture(builder: MutableMethod = builder(), page: MutableMethod = chatsPage()): List<MutableClass> =
    listOf(fixtureClass(BUILDER, listOf(builder)), fixtureClass(CHATS_PAGE, listOf(page)))

private fun Method.code() = implementation!!.instructions.toList()

private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference?.toString()

class TabBarTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>, key: String) = mirroredControls(classes).getValue(key).map { it.hookId() }.toSet()

    @Test fun theBuilderAndTheChatsPageAreFound() {
        val classes = tabBarFixture()
        assertEquals(setOf(SYNTHETIC_TAB_BAR_BUILDER), found(classes, FLOATING_TAB_BAR))
        assertEquals(setOf(SYNTHETIC_TAB_BAR_BUILDER), found(classes, TAB_BAR_OVERLAY))
        assertEquals(setOf(SYNTHETIC_CHATS_SCROLL_AWAY), found(classes, TAB_BAR_SCROLL_AWAY))
        validateControls(mirroredControls(classes), setOf(FLOATING_TAB_BAR, TAB_BAR_OVERLAY, TAB_BAR_SCROLL_AWAY))
    }

    @Test fun eachFamilyMapsItsOwnBuilderAndChatsPage() {
        fun ids(profile: ControlProfile) = listOf(FLOATING_TAB_BAR, TAB_BAR_OVERLAY, TAB_BAR_SCROLL_AWAY).map { profile.hooks.getValue(it) }
        val a = "LX/1uO;->A01$BUILDER_PARAMETERS" + "LX/1uo;"
        val b = "LX/1uP;->A01$BUILDER_PARAMETERS" + "LX/1up;"
        val c = "LX/1un;->A01$BUILDER_PARAMETERS" + "LX/1vD;"
        assertEquals(listOf(setOf(a), setOf(a), setOf("LX/1yu;->F7L()Z")), ids(PROFILE_347215348))
        assertEquals(listOf(setOf(c), setOf(c), setOf("LX/1zJ;->F7j()Z")), ids(PROFILE_347215341))
        assertEquals(listOf(setOf(b), setOf(b), setOf("LX/1yv;->F86()Z")), ids(PROFILE_347215273))
    }

    // A check before the pill's flag in the overlay's own shape, even on a register of its own, isn't the overlay.
    @Test fun aCheckBeforeThePillsFlagIsNeverTakenForTheOverlay() {
        val method = builder(edited(BUILDER_BODY, "LX/Tb5;->A00(Landroid/content/Context;)Z\nmove-result v0\nif-nez v0, :built" to
            "LX/Tb5;->A00(Landroid/content/Context;)Z\nmove-result v2\nif-nez v2, :built"))
        assertEquals(setOf(SYNTHETIC_TAB_BAR_BUILDER), found(tabBarFixture(method), TAB_BAR_OVERLAY))
        val gate = method.validateTabBarOverlay()
        assertEquals("LX/17m;->A1Y(LX/0U4;)Z", method.code()[gate.index - 2].ref())
    }

    // Floating tab bar and Hide the tab bar while scrolling promise only Messenger's own bar choices. A builder we can't
    // tie to the pill's flag, or an overlay check that could be something else, gets no hook.
    @Test fun anyOtherBuilderShapeLeavesItsControlUnapplied() {
        fun body(vararg swaps: Pair<String, String>) = tabBarFixture(builder(edited(BUILDER_BODY, *swaps)))
        val floatingOnly = mapOf(
            "the pill's gate flipped" to body("if-eqz v0, :built" to "if-nez v0, :built"),
            "something else between the flag and its read" to body("const-wide v0, 0x0101055400014313L\n" to "const-wide v0, 0x0101055400014313L\nconst/4 v2, 0x0\n"),
            "a move over the flag before its read" to body("move-object v9, v8\n" to "move-object v1, v8\n"),
            "the flag read through another interface" to body("invoke-interface {v9, v0, v1}, $CONFIG->B1S(J)Z" to "invoke-interface {v9, v0, v1}, LX/4vN;->B1S(J)Z"),
            "the flag read as something other than a yes or no" to body("$CONFIG->B1S(J)Z\nmove-result v0\nif-eqz v0, :built" to
                "$CONFIG->BMX(J)J\nmove-result-wide v0\nif-eqz v0, :built"),
            "the pill's flag loaded twice" to body("if-eqz v0, :built\n" to "if-eqz v0, :built\nconst-wide v0, 0x0101055400014313L\n"),
            "a branch onto the pill's gate" to body("const/4 v10, 0x0\n" to "const/4 v10, 0x0\nif-nez v7, :gate\n",
                "move-result v0\nif-eqz v0, :built" to "move-result v0\n:gate\nif-eqz v0, :built"),
        )
        val overlayOnly = mapOf(
            "the overlay check chained on the answer it tests" to body("if-nez v10, :overlay" to "if-nez v0, :overlay"),
            "the two branches landing apart" to body("move-result v0\nif-nez v0, :overlay" to "move-result v0\nif-nez v0, :frame"),
            "an overlay check that takes more" to body("invoke-static {v11}, LX/17m;->A1Y(LX/0U4;)Z" to "invoke-static {v11, v10}, LX/17m;->A1Y(LX/0U4;LX/4fy;)Z"),
            "an overlay check with no object" to body("invoke-static {v11}, LX/17m;->A1Y(LX/0U4;)Z" to "invoke-static {v7}, LX/17m;->A1Y(I)Z"),
            "a second overlay check" to body("sget-object v4, LX/0R1;->A00:Ljava/lang/Integer;\n:frame" to
                "if-nez v10, :overlay\ninvoke-static {v11}, LX/17m;->A1Z(LX/0U4;)Z\nmove-result v2\nif-nez v2, :overlay\nsget-object v4, LX/0R1;->A00:Ljava/lang/Integer;\n:frame"),
            "a branch onto the overlay gate" to body("move-result v0\nif-nez v0, :overlay\n" to "move-result v0\n:gate\nif-nez v0, :overlay\n",
                "move-object v10, v4\ngoto :built" to "move-object v10, v4\ngoto :gate"),
        )
        val both = mapOf(
            "another flag" to body("0x0101055400014313L" to "0x0101055400084316L"),
            "a static builder" to tabBarFixture(builder(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)),
            "a builder without the boolean" to tabBarFixture(builder(id = "$BUILDER->A01(Landroid/content/Context;Lcom/facebook/auth/usersession/FbUserSession;)$FRAME")),
            "a builder that hands back no frame" to tabBarFixture(builder(edited(BUILDER_BODY, "return-object v1" to "return-void"), id = "$BUILDER->A01${BUILDER_PARAMETERS}V")),
            "two builders" to tabBarFixture() + fixtureClass("LX/Tb7;", listOf(builder(id = "LX/Tb7;->A01$BUILDER_PARAMETERS$FRAME"))),
        )
        for ((case, classes) in floatingOnly) {
            assertTrue(found(classes, FLOATING_TAB_BAR).isEmpty(), case)
            assertEquals(setOf(SYNTHETIC_TAB_BAR_BUILDER), found(classes, TAB_BAR_OVERLAY), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(FLOATING_TAB_BAR)) }
        }
        for ((case, classes) in overlayOnly) {
            assertTrue(found(classes, TAB_BAR_OVERLAY).isEmpty(), case)
            assertEquals(setOf(SYNTHETIC_TAB_BAR_BUILDER), found(classes, FLOATING_TAB_BAR), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(TAB_BAR_OVERLAY)) }
        }
        for ((case, classes) in both) {
            assertTrue(found(classes, FLOATING_TAB_BAR).isEmpty(), case)
            assertTrue(found(classes, TAB_BAR_OVERLAY).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(FLOATING_TAB_BAR)) }
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(TAB_BAR_OVERLAY)) }
        }
    }

    // Only the Chats page's own answer may change, read straight from its flag into the return.
    @Test fun anyOtherChatsPageShapeLeavesScrollAwayUnapplied() {
        fun body(vararg swaps: Pair<String, String>) = tabBarFixture(page = chatsPage(edited(CHATS_BODY, *swaps)))
        val read = "invoke-static {v2, v0, v1}, LX/17k;->A1X(Ljava/lang/Object;J)Z"
        val cases = mapOf(
            "another page's flag" to body("0x0101039400033264L" to "0x0101039400033265L"),
            "the flag read through an interface" to body(read to "invoke-interface {v2, v0, v1}, $CONFIG->B1S(J)Z"),
            "the flag read with something else" to body(read to "invoke-static {v2, v0, v1}, LX/17k;->A1X(Ljava/lang/String;J)Z"),
            "something between the answer and the return" to body("move-result v0\nreturn v0" to "move-result v0\nconst/4 v0, 0x1\nreturn v0"),
            "another register returned" to body("move-result v0\nreturn v0" to "move-result v0\nreturn v2"),
            "a branch onto the return" to body("move-result-object v2\n" to "move-result-object v2\nif-eqz v2, :done\n",
                "move-result v0\nreturn v0" to "move-result v0\n:done\nreturn v0"),
            "a static page" to tabBarFixture(page = chatsPage(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)),
            "a page that takes a parameter" to tabBarFixture(page = fixtureMethod("$CHATS_PAGE->F7L(I)Z", CHATS_BODY, 5)),
            "two pages reading the Chats flag" to tabBarFixture() + fixtureClass("LX/Tb8;", listOf(
                fixtureMethod("LX/Tb8;->F7L()Z", CHATS_BODY.replace(CHATS_PAGE, "LX/Tb8;"), 4))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes, TAB_BAR_SCROLL_AWAY).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(TAB_BAR_SCROLL_AWAY)) }
        }
    }

    @Test fun thePillsGateReadsItsFlagThroughTheSwitch() {
        val method = builder()
        val before = method.code()
        val gate = before.indexOfFirst { it.opcode == Opcode.IF_EQZ && (it as OneRegisterInstruction).registerA == 0 }
        injectControl(FLOATING_TAB_BAR, mapOf(FLOATING_TAB_BAR to listOf(method)))
        val code = method.code()
        assertEquals(before.take(gate), code.take(gate))
        assertEquals(FLOATING, code[gate].ref())
        assertEquals(0, (code[gate] as FiveRegisterInstruction).registerC)
        assertEquals(Opcode.MOVE_RESULT, code[gate + 1].opcode)
        assertEquals(0, (code[gate + 1] as OneRegisterInstruction).registerA)
        // The same if-eqz still decides, so no still skips the pill's setup.
        assertEquals(before.drop(gate).map { it.opcode }, code.drop(gate + 2).map { it.opcode })
        assertEquals(1, code.count { it.ref() == FLOATING })
    }

    @Test fun theOverlayChoiceReadsItsAnswerThroughTheSwitch() {
        val method = builder()
        val before = method.code()
        val gate = before.indices.single { before[it].ref() == "LX/17m;->A1Y(LX/0U4;)Z" } + 2
        injectControl(TAB_BAR_OVERLAY, mapOf(TAB_BAR_OVERLAY to listOf(method)))
        val code = method.code()
        assertEquals(before.take(gate), code.take(gate))
        assertEquals(OVERLAY, code[gate].ref())
        assertEquals(0, (code[gate] as FiveRegisterInstruction).registerC)
        assertEquals(0, (code[gate + 1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_NEZ, code[gate + 2].opcode)
        assertEquals(before.drop(gate).map { it.opcode }, code.drop(gate + 2).map { it.opcode })
        // The floating setup's own branch still lands on the overlay, so the pill never meets the switch.
        assertEquals(code.branchTarget(gate - 3), code.branchTarget(gate + 2))
    }

    @Test fun bothBuilderControlsLandInEitherOrder() {
        for (order in listOf(listOf(FLOATING_TAB_BAR, TAB_BAR_OVERLAY), listOf(TAB_BAR_OVERLAY, FLOATING_TAB_BAR))) {
            val method = builder()
            val before = method.code()
            for (key in order) injectControl(key, mapOf(key to listOf(method)))
            val code = method.code()
            assertEquals(1, code.count { it.ref() == FLOATING }, "$order")
            assertEquals(1, code.count { it.ref() == OVERLAY }, "$order")
            val floating = code.indexOfFirst { it.ref() == FLOATING }
            val overlay = code.indexOfFirst { it.ref() == OVERLAY }
            assertEquals(Opcode.IF_EQZ, code[floating + 2].opcode, "$order")
            assertEquals("LX/17m;->A1Y(LX/0U4;)Z", code[overlay - 2].ref(), "$order")
            assertEquals(before.map { it.opcode }, code.filterIndexed { i, _ -> i !in setOf(floating, floating + 1, overlay, overlay + 1) }.map { it.opcode }, "$order")
        }
    }

    @Test fun theChatsPageHandsItsAnswerThroughTheSwitch() {
        val method = chatsPage()
        val before = method.code()
        injectControl(TAB_BAR_SCROLL_AWAY, mapOf(TAB_BAR_SCROLL_AWAY to listOf(method)))
        val code = method.code()
        val end = before.size - 1
        assertEquals(before.take(end), code.take(end))
        assertEquals(SCROLL_AWAY, code[end].ref())
        assertEquals(0, (code[end] as FiveRegisterInstruction).registerC)
        assertEquals(Opcode.MOVE_RESULT, code[end + 1].opcode)
        assertEquals(0, (code[end + 1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.RETURN, code[end + 2].opcode)
        assertEquals(0, (code[end + 2] as OneRegisterInstruction).registerA)
    }

    @Test fun anUnprovedMethodRefusesBeforeAnyEdit() {
        val cases = listOf(
            Triple("the Chats page as the builder", FLOATING_TAB_BAR, chatsPage()),
            Triple("a builder with a flipped pill gate", FLOATING_TAB_BAR, builder(edited(BUILDER_BODY, "if-eqz v0, :built" to "if-nez v0, :built"))),
            Triple("the Chats page as the overlay", TAB_BAR_OVERLAY, chatsPage()),
            Triple("a builder with its overlay check chained", TAB_BAR_OVERLAY, builder(edited(BUILDER_BODY, "if-nez v10, :overlay" to "if-nez v0, :overlay"))),
            Triple("the builder as the Chats page", TAB_BAR_SCROLL_AWAY, builder()),
            Triple("a page reading another flag", TAB_BAR_SCROLL_AWAY, chatsPage(edited(CHATS_BODY, "0x0101039400033264L" to "0x0101039400033265L"))),
        )
        for ((case, key, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(key, mapOf(key to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildGatesTheSameBuilderAndChatsPage() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val floating = findFloatingTabBar(classes)
            val overlay = findTabBarOverlay(classes)
            val pages = findTabBarScrollAway(classes)
            assertEquals(activeProfile.hooks.getValue(FLOATING_TAB_BAR), floating.map { it.hookId() }.toSet(), code)
            assertEquals(activeProfile.hooks.getValue(TAB_BAR_OVERLAY), overlay.map { it.hookId() }.toSet(), code)
            assertEquals(activeProfile.hooks.getValue(TAB_BAR_SCROLL_AWAY), pages.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(FLOATING_TAB_BAR to floating, TAB_BAR_OVERLAY to overlay, TAB_BAR_SCROLL_AWAY to pages),
                setOf(FLOATING_TAB_BAR, TAB_BAR_OVERLAY, TAB_BAR_SCROLL_AWAY))

            // Both builder controls on the one method, as the patch applies them, each on the register its own gate tests.
            val builder = MutableMethod(floating.single())
            val before = builder.code()
            val pill = builder.validateFloatingTabBar()
            val choice = builder.validateTabBarOverlay()
            assertTrue(pill.index < choice.index, code)
            builder.injectFloatingTabBar()
            builder.injectTabBarOverlay()
            val after = builder.code()
            assertEquals(FLOATING, after[pill.index].ref(), code)
            assertEquals(pill.answer, (after[pill.index] as FiveRegisterInstruction).registerC, code)
            assertEquals(pill.answer, (after[pill.index + 1] as OneRegisterInstruction).registerA, code)
            assertEquals(OVERLAY, after[choice.index + 2].ref(), code)
            assertEquals(choice.answer, (after[choice.index + 2] as FiveRegisterInstruction).registerC, code)
            assertEquals(choice.answer, (after[choice.index + 3] as OneRegisterInstruction).registerA, code)
            val added = setOf(pill.index, pill.index + 1, choice.index + 2, choice.index + 3)
            assertEquals(before.map { it.opcode }.filter { it != Opcode.NOP },
                after.filterIndexed { i, _ -> i !in added }.map { it.opcode }.filter { it != Opcode.NOP }, code)

            val page = MutableMethod(pages.single())
            val pageBefore = page.code()
            val end = page.validateTabBarScrollAway()
            page.injectTabBarScrollAway()
            val pageAfter = page.code()
            assertEquals(SCROLL_AWAY, pageAfter[end.index].ref(), code)
            assertEquals(end.answer, (pageAfter[end.index] as FiveRegisterInstruction).registerC, code)
            assertEquals(end.answer, (pageAfter[end.index + 1] as OneRegisterInstruction).registerA, code)
            assertEquals(end.answer, (pageAfter.last() as OneRegisterInstruction).registerA, code)
            assertEquals(pageBefore.map { it.opcode }.filter { it != Opcode.NOP },
                (pageAfter.take(end.index) + pageAfter.drop(end.index + 2)).map { it.opcode }.filter { it != Opcode.NOP }, code)
        }
    }
}
