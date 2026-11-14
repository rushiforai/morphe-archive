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
private const val SLIDE_PAGE = "LX/Tb9;"
internal const val SYNTHETIC_CHATS_SLIDE = "$CHATS_PAGE->D2x()Z"
private const val SLIDE_FRAME = "LX/Td1;"
internal const val SYNTHETIC_SLIDE_START = "$SLIDE_FRAME->EWo(Landroid/view/View;Landroid/view/View;II)Z"
internal const val SYNTHETIC_SLIDE_GATE = "$SLIDE_FRAME->A03(Landroid/view/View;${SLIDE_FRAME}I)Z"
/** Hide the tab bar while scrolling's four hooks in the synthetic fixture. */
internal val SYNTHETIC_SCROLL_AWAY_HOOKS = setOf(SYNTHETIC_CHATS_SCROLL_AWAY, SYNTHETIC_CHATS_SLIDE, SYNTHETIC_SLIDE_START, SYNTHETIC_SLIDE_GATE)
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
const-wide v0, 0x0101055600014560L
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
const-wide v0, 0x0101039000033352L
invoke-static {v2, v0, v1}, LX/17k;->A1X(Ljava/lang/Object;J)Z
move-result v0
return v0"""

private const val FRAGMENT = "LX/Tc1;"
private const val SYNTHETIC_TAB_BAR_FRAGMENT =
    "$FRAGMENT->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;"

/**
 * 587 builds the frame inline in the tab fragment's onCreateView, cut down here. v12 is this. The pill's flag goes
 * through a cast to the config interface, and the overlay choice reads a lazy boolean inline: the floating setup goes
 * straight to the overlay, another check to the column, then the lazy answer's if-eqz to the column.
 */
private const val FRAGMENT_BODY = """iget-object v6, v12, $FRAGMENT->A00:Lkotlin/Lazy;
iget-boolean v0, v12, $FRAGMENT->A01:Z
const/4 v4, 0x0
const/4 v10, 0x0
invoke-static {}, LX/2wm;->A05()LX/4vN;
move-result-object v8
const-wide v2, 0x0101055600014560L
move-object v9, v8
check-cast v9, $CONFIG
invoke-interface {v9, v2, v3}, $CONFIG->B3T(J)Z
move-result v2
if-eqz v2, :built
new-instance v10, LX/4fy;
invoke-direct {v10}, Ljava/lang/Object;-><init>()V
:built
if-nez v10, :overlay
if-nez v0, :column
invoke-interface {v6}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;
move-result-object v8
check-cast v8, Ljava/lang/Boolean;
invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z
move-result v8
if-eqz v8, :column
:overlay
sget-object v4, LX/0R1;->A01:Ljava/lang/Integer;
:frame
new-instance v1, $FRAME
invoke-direct {v1}, Ljava/lang/Object;-><init>()V
iput-object v4, v1, $FRAME->A00:Ljava/lang/Integer;
iput-object v10, v1, $FRAME->A01:LX/4fy;
return-object v1
:column
sget-object v4, LX/0R1;->A00:Ljava/lang/Integer;
goto :frame"""

/** The Chats page as 587 writes it: the flag read through a cast to the config interface. */
private const val CHATS_587_BODY = """invoke-static {}, LX/2wm;->A05()LX/4vN;
move-result-object v2
const-wide v0, 0x0101039000033352L
check-cast v2, $CONFIG
invoke-interface {v2, v0, v1}, $CONFIG->B3T(J)Z
move-result v0
return v0"""

/**
 * The Chats page's slide answer as 587 writes it, cut down. v3 is this. No while the page isn't shown or its list is
 * busy, each no a jump onto the return, else its own flag read the same way as the scroll-away answer.
 */
private const val SLIDE_BODY = """iget-boolean v0, v3, $CHATS_PAGE->A05:Z
const/4 v2, 0x0
if-eqz v0, :done
invoke-virtual {v3}, $CHATS_PAGE->isAdded()Z
move-result v0
if-eqz v0, :done
iget-boolean v0, v3, $CHATS_PAGE->A01:Z
if-nez v0, :done
invoke-static {}, LX/2wm;->A05()LX/4vN;
move-result-object v2
const-wide v0, 0x0101039000003351L
check-cast v2, $CONFIG
invoke-interface {v2, v0, v1}, $CONFIG->B3T(J)Z
move-result v2
:done
return v2"""

/**
 * The frame's onStartNestedScroll, cut down. v5 is this. It asks the page under it for its slide answer, then its own
 * slide check held in a field, before it takes the scroll.
 */
private const val SLIDE_START_BODY = """const/4 v3, 0x0
and-int/lit8 v0, v8, 0x2
if-eqz v0, :done
iget-object v0, v5, $SLIDE_FRAME->A07:$SLIDE_PAGE
if-eqz v0, :done
invoke-interface {v0}, $SLIDE_PAGE->D2x()Z
move-result v1
const/4 v0, 0x1
if-ne v1, v0, :done
iget-object v0, v5, $SLIDE_FRAME->A08:Lkotlin/jvm/functions/Function0;
invoke-static {v0}, LX/18D;->A1X(Lkotlin/jvm/functions/Function0;)Z
move-result v0
if-eqz v0, :done
iget-object v0, v5, $SLIDE_FRAME->A04:Landroid/view/View;
if-ne v6, v0, :done
const/4 v3, 0x1
:done
return v3"""

/** The frame's static check each nested pre-scroll goes through: the same two questions, the answer reused as the yes. */
private const val SLIDE_GATE_BODY = """if-nez v3, :other
iget-object v0, v2, $SLIDE_FRAME->A05:Landroid/view/View;
:check
if-ne v1, v0, :no
iget-object v0, v2, $SLIDE_FRAME->A07:$SLIDE_PAGE
if-eqz v0, :no
invoke-interface {v0}, $SLIDE_PAGE->D2x()Z
move-result v0
const/4 v1, 0x1
if-ne v0, v1, :no
iget-object v0, v2, $SLIDE_FRAME->A08:Lkotlin/jvm/functions/Function0;
invoke-static {v0}, LX/18D;->A1X(Lkotlin/jvm/functions/Function0;)Z
move-result v0
if-eqz v0, :no
return v1
:other
iget-object v0, v2, $SLIDE_FRAME->A03:Landroid/view/View;
goto :check
:no
const/4 v1, 0x0
return v1"""

/** [body] with each swap made once, failing if one doesn't apply. */
private fun edited(body: String, vararg swaps: Pair<String, String>) = swaps.fold(body) { text, (from, to) ->
    check(text.split(from).size == 2) { "$from isn't in the body once" }
    text.replace(from, to)
}

private fun builder(body: String = BUILDER_BODY, id: String = SYNTHETIC_TAB_BAR_BUILDER, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value) =
    fixtureMethod(id, body, 16, flags)

private fun chatsPage(body: String = CHATS_BODY, id: String = SYNTHETIC_CHATS_SCROLL_AWAY, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value) =
    fixtureMethod(id, body, 4, flags)

private fun fragment(body: String = FRAGMENT_BODY) = fixtureMethod(SYNTHETIC_TAB_BAR_FRAGMENT, body, 16)

private fun chatsSlide(body: String = SLIDE_BODY, id: String = SYNTHETIC_CHATS_SLIDE) = fixtureMethod(id, body, 4, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)

private fun slideStart(body: String = SLIDE_START_BODY) = fixtureMethod(SYNTHETIC_SLIDE_START, body, 10, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)

private fun slideGate(body: String = SLIDE_GATE_BODY) = fixtureMethod(SYNTHETIC_SLIDE_GATE, body, 4, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)

/**
 * The frame builder on its singleton, the Chats page with its two answers on whether the bar may slide away, and the
 * bar's frame that asks the page through [pageInterfaces].
 */
internal fun tabBarFixture(
    builder: MutableMethod = builder(),
    page: MutableMethod = chatsPage(),
    slide: MutableMethod? = chatsSlide(),
    checks: List<MutableMethod> = listOf(slideStart(), slideGate()),
    pageInterfaces: List<String> = listOf(SLIDE_PAGE),
): List<MutableClass> = listOf(
    fixtureClass(builder.definingClass, listOf(builder)),
    fixtureClass(CHATS_PAGE, listOfNotNull(page, slide), interfaces = pageInterfaces),
    fixtureClass(SLIDE_FRAME, checks),
)

/** 587's tab fragment and Chats page. */
private fun tabBar587Fixture(builder: MutableMethod = fragment(), page: MutableMethod = chatsPage(CHATS_587_BODY)) = tabBarFixture(builder, page)

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
        assertEquals(SYNTHETIC_SCROLL_AWAY_HOOKS, found(classes, TAB_BAR_SCROLL_AWAY))
        validateControls(mirroredControls(classes), setOf(FLOATING_TAB_BAR, TAB_BAR_OVERLAY, TAB_BAR_SCROLL_AWAY))
    }

    // #154: the scroll-away answer alone never moved the bar, since the frame first asks the page's slide answer and
    // then its own slide check, which Messenger fills from its overlay flag for the floating pill.
    @Test fun theSlideAnswerAndTheFramesChecksAreFoundWithTheScrollAwayAnswer() {
        val classes = tabBarFixture()
        assertEquals(SYNTHETIC_SCROLL_AWAY_HOOKS, found(classes, TAB_BAR_SCROLL_AWAY))
        val page = chatsSlide()
        val start = slideStart()
        val gate = slideGate()
        val befores = listOf(page, start, gate).map { it.code() }
        // Builder branches read their offsets from the labels when asked, so the early jumps are counted before the edit.
        val end = befores[0].size - 1
        val early = befores[0].indices.filter { befores[0].branchTarget(it) == end }
        assertEquals(3, early.size)
        injectControl(TAB_BAR_SCROLL_AWAY, mapOf(TAB_BAR_SCROLL_AWAY to listOf(page, start, gate)))
        // The slide answer goes through the switch right before its return, like the scroll-away answer. Its early no's
        // still land on the return itself, so a page that isn't showing never meets the switch.
        val answer = page.code()
        assertEquals(befores[0].take(end), answer.take(end))
        assertEquals(SCROLL_AWAY, answer[end].ref())
        assertEquals(2, (answer[end] as FiveRegisterInstruction).registerC)
        assertEquals(Opcode.RETURN, answer[end + 2].opcode)
        for (at in early) assertEquals(end + 2, answer.branchTarget(at))
        // Each frame check hands its own slide check's answer through the switch, and the same if-eqz still decides.
        for ((method, before) in listOf(start, gate).zip(befores.drop(1))) {
            val code = method.code()
            val at = before.indices.single { before[it].opcode == Opcode.IF_EQZ && before.getOrNull(it - 2)?.ref() =="LX/18D;->A1X(Lkotlin/jvm/functions/Function0;)Z" }
            assertEquals(before.take(at), code.take(at), method.hookId())
            assertEquals(SCROLL_AWAY, code[at].ref(), method.hookId())
            assertEquals(0, (code[at] as FiveRegisterInstruction).registerC, method.hookId())
            assertEquals(0, (code[at + 1] as OneRegisterInstruction).registerA, method.hookId())
            assertEquals(before.drop(at).map { it.opcode }, code.drop(at + 2).map { it.opcode }, method.hookId())
            assertEquals(1, code.count { it.ref() == SCROLL_AWAY }, method.hookId())
        }
    }

    // Without every part, or with the page's answers or the frame's question pointing anywhere else, nothing changes.
    @Test fun aMissingOrStraySlidePartLeavesScrollAwayUnapplied() {
        val elsewhere = "LX/Tc2;"
        val cases = mapOf(
            "no slide answer" to tabBarFixture(slide = null),
            "no frame check" to tabBarFixture(checks = emptyList()),
            "two slide answers" to tabBarFixture() + fixtureClass(elsewhere, listOf(chatsSlide(id = "$elsewhere->D2x()Z")), interfaces = listOf(SLIDE_PAGE)),
            "the slide answer on another page" to tabBarFixture(slide = null) +
                fixtureClass(elsewhere, listOf(chatsSlide(id = "$elsewhere->D2x()Z")), interfaces = listOf(SLIDE_PAGE)),
            "a page the frame never asks" to tabBarFixture(pageInterfaces = listOf("LX/Tc3;")),
            "the frame asking another answer" to tabBarFixture(checks = listOf(
                slideStart(SLIDE_START_BODY.replace("D2x()Z", "D2y()Z")), slideGate(SLIDE_GATE_BODY.replace("D2x()Z", "D2y()Z")))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes, TAB_BAR_SCROLL_AWAY).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(TAB_BAR_SCROLL_AWAY)) }
        }
    }

    // The slide answer's early jumps skip the switch, so each must carry a no. Anything else there, or a way into the
    // early checks past the no, leaves the slide answer and with it the whole control unapplied.
    @Test fun aSlideAnswerWhoseEarlyJumpsMayCarryAnythingButNoLeavesScrollAwayUnapplied() {
        fun slide(vararg swaps: Pair<String, String>) = tabBarFixture(slide = chatsSlide(edited(SLIDE_BODY, *swaps)))
        val cases = mapOf(
            "an early yes" to slide("const/4 v2, 0x0" to "const/4 v2, 0x1"),
            "an early answer never set" to slide("const/4 v2, 0x0\n" to ""),
            "the no overwritten before a jump" to slide("iget-boolean v0, v3, $CHATS_PAGE->A01:Z" to "iget-boolean v2, v3, $CHATS_PAGE->A01:Z\nmove v0, v2"),
            "a way into the early checks past the no" to slide("const/4 v2, 0x0\n" to "if-nez v0, :mid\nconst/4 v2, 0x0\n",
                "invoke-virtual {v3}" to ":mid\ninvoke-virtual {v3}"),
            "a wide write over the no" to slide("iget-boolean v0, v3, $CHATS_PAGE->A01:Z" to "const-wide v1, 0x0L\niget-boolean v0, v3, $CHATS_PAGE->A01:Z"),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes, TAB_BAR_SCROLL_AWAY).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(TAB_BAR_SCROLL_AWAY)) }
        }
    }

    // A frame check in any other shape stays as it is, so the control can't match the tested build's four hooks.
    @Test fun anyOtherSlideCheckShapeLeavesScrollAwayUnapplied() {
        fun start(vararg swaps: Pair<String, String>) = tabBarFixture(checks = listOf(slideStart(edited(SLIDE_START_BODY, *swaps)), slideGate()))
        val unbox = "invoke-static {v0}, LX/18D;->A1X(Lkotlin/jvm/functions/Function0;)Z"
        val cases = mapOf(
            "the check's if-eqz flipped" to start("move-result v0\nif-eqz v0, :done" to "move-result v0\nif-nez v0, :done"),
            "a check held as something else" to start("A08:Lkotlin/jvm/functions/Function0;" to "A08:Lkotlin/Lazy;"),
            "a helper taking more" to start(unbox to "invoke-static {v0, v1}, LX/18D;->A1X(Lkotlin/jvm/functions/Function0;I)Z"),
            "a helper unboxing another register" to start(unbox to "invoke-static {v1}, LX/18D;->A1X(Lkotlin/jvm/functions/Function0;)Z"),
            "a virtual helper" to start(unbox to "invoke-virtual {v0}, LX/18D;->A1X(Lkotlin/jvm/functions/Function0;)Z"),
            "another register tested" to start("move-result v0\nif-eqz v0, :done" to "move-result v0\nif-eqz v1, :done"),
            "something else between the page's answer and the check" to start("const/4 v0, 0x1\nif-ne v1, v0, :done" to
                "const/4 v0, 0x1\nif-ne v1, v0, :done\nadd-int/lit8 v1, v1, 0x1"),
            "a branch onto the check's if-eqz" to start("const/4 v3, 0x0\n" to "const/4 v3, 0x0\nif-nez v7, :gate\n",
                "move-result v0\nif-eqz v0, :done" to "move-result v0\n:gate\nif-eqz v0, :done"),
            "the check asked twice" to start(":done\nreturn v3" to "iget-object v0, v5, $SLIDE_FRAME->A07:$SLIDE_PAGE\n" +
                "invoke-interface {v0}, $SLIDE_PAGE->D2x()Z\nmove-result v1\niget-object v0, v5, $SLIDE_FRAME->A08:Lkotlin/jvm/functions/Function0;\n" +
                "$unbox\nmove-result v0\nif-eqz v0, :done\nconst/4 v3, 0x1\n:done\nreturn v3"),
        )
        for ((case, classes) in cases) {
            assertEquals(SYNTHETIC_SCROLL_AWAY_HOOKS - SYNTHETIC_SLIDE_START, found(classes, TAB_BAR_SCROLL_AWAY), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(TAB_BAR_SCROLL_AWAY)) }
        }
    }

    @Test fun eachFamilyMapsItsOwnBuilderAndChatsPage() {
        fun ids(profile: ControlProfile) = listOf(FLOATING_TAB_BAR, TAB_BAR_OVERLAY, TAB_BAR_SCROLL_AWAY).map { profile.hooks.getValue(it) }
        val view = "->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;"
        // Family B keeps arm64's tab fragment and only renames the Chats page's answers and the frame's checks.
        val a = "LX/1er;$view"
        val c = "LX/1fH;$view"
        val scroll = "(Landroid/view/View;Landroid/view/View;II)Z"
        assertEquals(listOf(setOf(a), setOf(a), setOf("LX/1p9;->EWo$scroll", "LX/1tj;->DUs()Z", "LX/1tj;->FGC()Z",
            "LX/4d2;->A03(Landroid/view/View;LX/4d2;I)Z")), ids(PROFILE_347415354))
        assertEquals(listOf(setOf(c), setOf(c), setOf("LX/1pZ;->EXA$scroll", "LX/1u9;->DVG()Z", "LX/1u9;->FGl()Z",
            "LX/4dY;->A03(Landroid/view/View;LX/4dY;I)Z")), ids(PROFILE_347415262))
        assertEquals(listOf(setOf(a), setOf(a), setOf("LX/1p9;->EWr$scroll", "LX/1tj;->DV4()Z", "LX/1tj;->FGF()Z",
            "LX/4cN;->A03(Landroid/view/View;LX/4cN;I)Z")), ids(PROFILE_347415280))
    }

    // A check before the pill's flag in the overlay's own shape, even on a register of its own, isn't the overlay.
    @Test fun aCheckBeforeThePillsFlagIsNeverTakenForTheOverlay() {
        val method = builder(edited(BUILDER_BODY, "LX/Tb5;->A00(Landroid/content/Context;)Z\nmove-result v0\nif-nez v0, :built" to
            "LX/Tb5;->A00(Landroid/content/Context;)Z\nmove-result v2\nif-nez v2, :built"))
        assertEquals(setOf(SYNTHETIC_TAB_BAR_BUILDER), found(tabBarFixture(method), TAB_BAR_OVERLAY))
        val gate = method.validateTabBarOverlay()
        assertEquals("LX/17m;->A1Y(LX/0U4;)Z", method.code()[gate.index - 2].ref())
    }

    @Test fun the587FragmentAndItsChatsPageAreFound() {
        val classes = tabBar587Fixture()
        assertEquals(setOf(SYNTHETIC_TAB_BAR_FRAGMENT), found(classes, FLOATING_TAB_BAR))
        assertEquals(setOf(SYNTHETIC_TAB_BAR_FRAGMENT), found(classes, TAB_BAR_OVERLAY))
        assertEquals(SYNTHETIC_SCROLL_AWAY_HOOKS, found(classes, TAB_BAR_SCROLL_AWAY))
        activeProfile = syntheticProfileWith(FLOATING_TAB_BAR to setOf(SYNTHETIC_TAB_BAR_FRAGMENT), TAB_BAR_OVERLAY to setOf(SYNTHETIC_TAB_BAR_FRAGMENT))
        validateControls(mirroredControls(classes), setOf(FLOATING_TAB_BAR, TAB_BAR_OVERLAY, TAB_BAR_SCROLL_AWAY))
    }

    @Test fun the587OverlayChoiceReadsItsLazyAnswerThroughTheSwitch() {
        val method = fragment()
        val before = method.code()
        val gate = before.indices.single { before[it].opcode == Opcode.IF_EQZ && (before[it] as OneRegisterInstruction).registerA == 8 }
        injectControl(TAB_BAR_OVERLAY, mapOf(TAB_BAR_OVERLAY to listOf(method)))
        val code = method.code()
        assertEquals(before.take(gate), code.take(gate))
        assertEquals(OVERLAY, code[gate].ref())
        assertEquals(8, (code[gate] as FiveRegisterInstruction).registerC)
        assertEquals(8, (code[gate + 1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_EQZ, code[gate + 2].opcode)
        assertEquals(before.drop(gate).map { it.opcode }, code.drop(gate + 2).map { it.opcode })
        // Yes falls through to the overlay, where the floating setup's own branch lands, so the pill never meets the switch.
        assertEquals(gate + 3, code.branchTarget(gate - 7))
    }

    // The lazy read only counts in 587's exact branch layout: the floating setup to the overlay, the rest to the column.
    @Test fun any587OverlayShapeElseLeavesTheOverlayUnapplied() {
        fun body(vararg swaps: Pair<String, String>) = tabBar587Fixture(fragment(edited(FRAGMENT_BODY, *swaps)))
        val cases = mapOf(
            "the column check flipped" to body("if-eqz v8, :column" to "if-nez v8, :column"),
            "the floating setup going to the column" to body("if-nez v10, :overlay" to "if-nez v10, :column"),
            "the other check going to the overlay" to body("if-nez v0, :column" to "if-nez v0, :overlay"),
            "no branch before the lazy read" to body("if-nez v10, :overlay\nif-nez v0, :column\n" to ""),
            "the answer cast to something else" to body("check-cast v8, Ljava/lang/Boolean;" to "check-cast v8, Ljava/lang/Integer;"),
            "another register tested" to body("if-eqz v8, :column" to "if-eqz v7, :column"),
            "the lazy read unboxing another object" to body("invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z" to
                "invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z"),
            "a branch onto the overlay gate" to body("const/4 v10, 0x0\n" to "const/4 v10, 0x0\nif-nez v4, :gate\n",
                "move-result v8\nif-eqz v8, :column" to "move-result v8\n:gate\nif-eqz v8, :column"),
            "a second lazy read" to body("sget-object v4, LX/0R1;->A00:Ljava/lang/Integer;\ngoto :frame" to
                "if-nez v10, :over\ninvoke-interface {v6}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;\nmove-result-object v8\n" +
                    "check-cast v8, Ljava/lang/Boolean;\ninvoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z\nmove-result v8\n" +
                    "if-eqz v8, :plain\n:over\nsget-object v4, LX/0R1;->A01:Ljava/lang/Integer;\ngoto :frame\n" +
                    ":plain\nsget-object v4, LX/0R1;->A00:Ljava/lang/Integer;\ngoto :frame"),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes, TAB_BAR_OVERLAY).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(TAB_BAR_OVERLAY)) }
        }
    }

    @Test fun the587ChatsPageHandsItsAnswerThroughTheSwitch() {
        val method = chatsPage(CHATS_587_BODY)
        val before = method.code()
        injectControl(TAB_BAR_SCROLL_AWAY, mapOf(TAB_BAR_SCROLL_AWAY to listOf(method)))
        val code = method.code()
        val end = before.size - 1
        assertEquals(before.take(end), code.take(end))
        assertEquals(SCROLL_AWAY, code[end].ref())
        assertEquals(0, (code[end] as FiveRegisterInstruction).registerC)
        assertEquals(Opcode.RETURN, code[end + 2].opcode)
    }

    @Test fun any587ChatsPageShapeElseLeavesScrollAwayUnapplied() {
        fun body(vararg swaps: Pair<String, String>) = tabBar587Fixture(page = chatsPage(edited(CHATS_587_BODY, *swaps)))
        val read = "invoke-interface {v2, v0, v1}, $CONFIG->B3T(J)Z"
        val cases = mapOf(
            "a cast to something else" to body("check-cast v2, $CONFIG" to "check-cast v2, LX/4vN;"),
            "another interface" to body(read to "invoke-interface {v2, v0, v1}, LX/4vN;->B3T(J)Z"),
            "the read on an object that wasn't cast" to body(read to "invoke-interface {v3, v0, v1}, $CONFIG->B3T(J)Z"),
            "the read taking more" to body(read to "invoke-interface {v2, v0, v1}, $CONFIG->B3T(Ljava/lang/Object;J)Z"),
            "a cast over the flag" to body("check-cast v2, $CONFIG" to "check-cast v1, $CONFIG"),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes, TAB_BAR_SCROLL_AWAY).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(TAB_BAR_SCROLL_AWAY)) }
        }
    }

    // Floating tab bar and Hide the tab bar while scrolling promise only Messenger's own bar choices. A builder we can't
    // tie to the pill's flag, or an overlay check that could be something else, gets no hook.
    @Test fun anyOtherBuilderShapeLeavesItsControlUnapplied() {
        fun body(vararg swaps: Pair<String, String>) = tabBarFixture(builder(edited(BUILDER_BODY, *swaps)))
        val floatingOnly = mapOf(
            "the pill's gate flipped" to body("if-eqz v0, :built" to "if-nez v0, :built"),
            "something else between the flag and its read" to body("const-wide v0, 0x0101055600014560L\n" to "const-wide v0, 0x0101055600014560L\nconst/4 v2, 0x0\n"),
            "a move over the flag before its read" to body("move-object v9, v8\n" to "move-object v1, v8\n"),
            "the flag read through another interface" to body("invoke-interface {v9, v0, v1}, $CONFIG->B1S(J)Z" to "invoke-interface {v9, v0, v1}, LX/4vN;->B1S(J)Z"),
            "the flag read as something other than a yes or no" to body("$CONFIG->B1S(J)Z\nmove-result v0\nif-eqz v0, :built" to
                "$CONFIG->BMX(J)J\nmove-result-wide v0\nif-eqz v0, :built"),
            "the pill's flag loaded twice" to body("if-eqz v0, :built\n" to "if-eqz v0, :built\nconst-wide v0, 0x0101055600014560L\n"),
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
            "another flag" to body("0x0101055600014560L" to "0x0101055600084563L"),
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
            "another page's flag" to body("0x0101039000033352L" to "0x0101039000033353L"),
            "the flag read through an interface" to body(read to "invoke-interface {v2, v0, v1}, $CONFIG->B1S(J)Z"),
            "the flag read with something else" to body(read to "invoke-static {v2, v0, v1}, LX/17k;->A1X(Ljava/lang/String;J)Z"),
            "something between the answer and the return" to body("move-result v0\nreturn v0" to "move-result v0\nconst/4 v0, 0x1\nreturn v0"),
            "another register returned" to body("move-result v0\nreturn v0" to "move-result v0\nreturn v2"),
            "a branch onto the return carrying no answer" to body("move-result-object v2\n" to "move-result-object v2\nif-eqz v2, :done\n",
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
            Triple("a page reading another flag", TAB_BAR_SCROLL_AWAY, chatsPage(edited(CHATS_BODY, "0x0101039000033352L" to "0x0101039000033353L"))),
            Triple("a slide answer with an early yes", TAB_BAR_SCROLL_AWAY, chatsSlide(edited(SLIDE_BODY, "const/4 v2, 0x0" to "const/4 v2, 0x1"))),
            Triple("a frame check with its if-eqz flipped", TAB_BAR_SCROLL_AWAY,
                slideStart(edited(SLIDE_START_BODY, "move-result v0\nif-eqz v0, :done" to "move-result v0\nif-nez v0, :done"))),
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

            // The page's two answers and the frame's checks, each handing the yes or no it tests through the switch.
            assertEquals(2, pages.count { it.parameterTypes.isEmpty() }, code)
            for (hooked in pages) {
                val id = "$code ${hooked.hookId()}"
                val page = MutableMethod(hooked)
                val pageBefore = page.code()
                val gate = page.validateTabBarScrollAway()
                page.injectTabBarScrollAway()
                val pageAfter = page.code()
                assertEquals(SCROLL_AWAY, pageAfter[gate.index].ref(), id)
                assertEquals(gate.answer, (pageAfter[gate.index] as FiveRegisterInstruction).registerC, id)
                assertEquals(gate.answer, (pageAfter[gate.index + 1] as OneRegisterInstruction).registerA, id)
                assertEquals(pageBefore[gate.index].opcode, pageAfter[gate.index + 2].opcode, id)
                assertEquals(gate.answer, (pageAfter[gate.index + 2] as OneRegisterInstruction).registerA, id)
                assertEquals(pageBefore.map { it.opcode }.filter { it != Opcode.NOP },
                    (pageAfter.take(gate.index) + pageAfter.drop(gate.index + 2)).map { it.opcode }.filter { it != Opcode.NOP }, id)
                // The slide answer's early no's still land on its return, past the switch.
                for (at in pageBefore.indices.filter { it < gate.index && pageBefore.branchTarget(it) == gate.index })
                    assertEquals(gate.index + 2, pageAfter.branchTarget(at), id)
            }
        }
    }
}
