package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val CONFIG = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;"
internal const val DRAWER_HELPER = "$CONFIG->A02()Z"
internal const val DRAWER_EFFECT = "LX/H1n;->invoke(Ljava/lang/Object;)Ljava/lang/Object;"
private const val DRAWER_RENDERER = "LX/4tE;->A00(LX/5bm;)V"
private const val FLAG_580 = 36320734536089357L
private const val FLAG_581 = 36320704471318256L
private const val FLAG_582 = 36320652931710646L
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

/** 580's helper: the config object, the flag, the interface check and its answer, returned as is. */
private fun drawerHelper(id: String = DRAWER_HELPER, flag: Long = FLAG_580) = fixtureMethod(id, """
    invoke-static {}, LX/1Aa;->A0A()LX/5V6;
    move-result-object v2
    const-wide v0, ${flag}L
    check-cast v2, $CONFIG
    invoke-interface {v2, v0, v1}, $CONFIG->Ah8(J)Z
    move-result v0
    return v0
""".trimIndent(), registers = 3, flags = STATIC)

/** A drawer component that reads the flag through a static (Object, J) check and inverts the answer. */
private fun drawerEffect(id: String = DRAWER_EFFECT, flag: Long = FLAG_580) = fixtureMethod(id, """
    invoke-static {}, LX/1Aa;->A0A()LX/5V6;
    move-result-object v4
    const-wide v0, ${flag}L
    invoke-static {v4, v0, v1}, LX/16z;->A1Z(Ljava/lang/Object;J)Z
    move-result v0
    xor-int/lit8 v0, v0, 0x1
    const/4 v0, 0x0
    return-object v0
""".trimIndent())

/** 580's renderer asks the helper, then throws the anchor when the redesign can't draw. */
private fun drawerRenderer(call: String = DRAWER_HELPER, id: String = DRAWER_RENDERER) = fixtureMethod(id, """
    invoke-static {}, $call
    move-result v0
    const-string v1, "$EMOJI_DRAWER_ANCHOR"
    return-void
""".trimIndent())

/**
 * 581's renderer reads the flag itself, twice, the first answer in a register outside the 4-bit range. A path without
 * a config object skips the first read and lands just after its answer.
 */
private fun drawerRenderer581(id: String = "LX/4wu;->render(LX/5Sd;)V", flag: Long = FLAG_581) = fixtureMethod(id, """
    invoke-static {}, LX/2v6;->A0A()LX/5Yf;
    move-result-object v13
    if-eqz v13, :after
    const-wide v4, ${flag}L
    check-cast v13, $CONFIG
    invoke-interface {v13, v4, v5}, $CONFIG->AhR(J)Z
    move-result v20
    :after
    const-string v1, "$EMOJI_DRAWER_ANCHOR"
    const-wide v4, ${flag}L
    invoke-interface {v13, v4, v5}, $CONFIG->AhR(J)Z
    move-result v4
    return-void
""".trimIndent(), registers = 24)

/** The 580 base mapping's two readers and the renderer that ties them to the drawer. */
internal fun emojiDrawerFixture(): List<MutableClass> = listOf(
    fixtureClass(CONFIG, listOf(drawerHelper()), flags = AccessFlags.PUBLIC.value or AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value),
    fixtureClass("LX/H1n;", listOf(drawerEffect())),
    fixtureClass("LX/4tE;", listOf(drawerRenderer())),
)

private fun Method.code() = implementation!!.instructions.toList()

/** Checks a native reader: every flag read gains the helper pair after its answer, and nothing else changes. */
internal fun assertEmojiDrawerInjected(native: Method, label: String): Int {
    val method = MutableMethod(native)
    val before = method.code()
    val sites = method.emojiDrawerSites()
    method.injectEmojiDrawer()
    val after = method.code()
    assertEquals(before.size + 2 * sites.size, after.size, label)
    val inserted = sites.mapIndexed { n, site -> site.result + 1 + 2 * n }
    for ((n, at) in inserted.withIndex()) {
        val call = after[at]
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode, label)
        assertEquals(EMOJI_DRAWER_HELPER, (call as ReferenceInstruction).reference.toString(), label)
        assertEquals(sites[n].register, (call as RegisterRangeInstruction).startRegister, label)
        assertEquals(1, call.registerCount, label)
        assertEquals(Opcode.MOVE_RESULT, after[at + 1].opcode, label)
        assertEquals(sites[n].register, (after[at + 1] as OneRegisterInstruction).registerA, label)
    }
    val skipped = inserted.flatMap { listOf(it, it + 1) }.toSet()
    assertEquals(before, after.filterIndexed { i, _ -> i !in skipped }, label)
    return sites.size
}

class EmojiDrawerTest {
    @AfterTest fun reset() {
        activeProfile = BASE_PROFILE
    }

    private fun found(classes: List<MutableClass>) = findControls(classes).getValue(EMOJI_DRAWER).map { it.hookId() }.toSet()

    @Test fun the580DrawerIsFoundThroughTheHelperItsRendererCalls() {
        assertEquals(setOf(DRAWER_HELPER, DRAWER_EFFECT), found(emojiDrawerFixture()))
        validateControls(findControls(emojiDrawerFixture()), setOf(EMOJI_DRAWER))
    }

    @Test fun theFlagCountsOnlyWhenTheRendererThatThrowsTheAnchorReadsIt() {
        val readers = emojiDrawerFixture().filter { it.type != "LX/4tE;" }
        val cases = mapOf(
            "no renderer" to readers,
            "two renderers" to readers + fixtureClass("LX/4tE;", listOf(drawerRenderer())) +
                fixtureClass("LX/4tF;", listOf(drawerRenderer(id = "LX/4tF;->A00(LX/5bm;)V"))),
            "a renderer asking another boolean" to readers + fixtureClass("LX/4tE;", listOf(drawerRenderer("$CONFIG->A03()Z"))),
            "a renderer asking a reader that takes arguments" to readers.filter { it.type != CONFIG } +
                fixtureClass(CONFIG, listOf(drawerHelper("$CONFIG->A02(I)Z"))) +
                fixtureClass("LX/4tE;", listOf(drawerRenderer("$CONFIG->A02(I)Z"))),
            "a renderer asking a non-static reader" to readers.filter { it.type != CONFIG } +
                fixtureClass(CONFIG, listOf(fixtureMethod(DRAWER_HELPER, "const-wide v0, ${FLAG_580}L\nconst/4 v0, 0x0\nreturn v0", 3))) +
                fixtureClass("LX/4tE;", listOf(drawerRenderer())),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(findControls(classes), setOf(EMOJI_DRAWER)) }
        }
    }

    @Test fun the581DrawerIsFoundWhereTheRendererReadsTheFlagItself() {
        val other = drawerEffect("LX/Eyg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;", FLAG_581)
        val classes = listOf(fixtureClass("LX/4wu;", listOf(drawerRenderer581())), fixtureClass("LX/Eyg;", listOf(other)))
        assertEquals(setOf("LX/4wu;->render(LX/5Sd;)V", "LX/Eyg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;"), found(classes))
        // The same readers without the renderer are just a flag.
        assertTrue(found(classes.drop(1)).isEmpty())
    }

    @Test fun the582FlagIsFoundTheSameWay() {
        val other = drawerEffect("LX/EfL;->invoke(Ljava/lang/Object;)Ljava/lang/Object;", FLAG_582)
        val classes = listOf(fixtureClass("LX/51i;", listOf(drawerRenderer581("LX/51i;->render(LX/5XD;)V", FLAG_582))), fixtureClass("LX/EfL;", listOf(other)))
        assertEquals(setOf("LX/51i;->render(LX/5XD;)V", "LX/EfL;->invoke(Ljava/lang/Object;)Ljava/lang/Object;"), found(classes))
        assertEquals(2, assertEmojiDrawerInjected(classes[0].methods.single(), "582 renderer"))
    }

    @Test fun everyFlagReadPassesThroughTheExtension() {
        assertEquals(1, assertEmojiDrawerInjected(drawerHelper(), "helper"))
        assertEquals(1, assertEmojiDrawerInjected(drawerEffect(), "effect"))
        val renderer = drawerRenderer581()
        assertEquals(listOf(20, 4), renderer.emojiDrawerSites().map { it.register })
        assertEquals(2, assertEmojiDrawerInjected(renderer, "renderer"))
        // The path that skipped the first read still lands on the original instruction, past that read's helper pair.
        val injected = MutableMethod(renderer).apply { injectEmojiDrawer() }.code()
        assertEquals(EMOJI_DRAWER_HELPER, (injected[7] as ReferenceInstruction).reference.toString())
        assertEquals(9, injected.branchTarget(2))
        assertEquals(Opcode.CONST_STRING, injected[9].opcode)
    }

    @Test fun anyOtherUseOfTheFlagRefusesTheSwitchBeforeAnyEdit() {
        val shapes = mapOf(
            "flag before another argument" to "const-wide v0, ${FLAG_580}L\ninvoke-static {v0, v1, v4}, LX/16z;->A1Z(JLjava/lang/Object;)Z\nmove-result v0\nreturn v0",
            "answer not a boolean" to "const-wide v0, ${FLAG_580}L\ninvoke-interface {v2, v0, v1}, $CONFIG->Ah8(J)I\nmove-result v0\nreturn v0",
            "answer never taken" to "const-wide v0, ${FLAG_580}L\ninvoke-interface {v2, v0, v1}, $CONFIG->Ah8(J)Z\nconst/4 v0, 0x0\nreturn v0",
            "flag logged" to "const-wide v0, ${FLAG_580}L\ninvoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;\nconst/4 v0, 0x0\nreturn v0",
            "cast over the flag" to "const-wide v0, ${FLAG_580}L\ncheck-cast v1, $CONFIG\ninvoke-interface {v2, v0, v1}, $CONFIG->Ah8(J)Z\nmove-result v0\nreturn v0",
            "jump into the read" to "if-eqz v3, :check\nconst-wide v0, ${FLAG_580}L\n:check\ninvoke-interface {v2, v0, v1}, $CONFIG->Ah8(J)Z\nmove-result v0\nreturn v0",
            "no flag at all" to "const-wide v0, 0x1L\ninvoke-interface {v2, v0, v1}, $CONFIG->Ah8(J)Z\nmove-result v0\nreturn v0",
        )
        for ((case, body) in shapes) {
            val good = drawerHelper()
            val bad = fixtureMethod("LX/H1n;->A00()Z", body)
            val before = good.code()
            val failure = assertFailsWith<PatchException>(case) {
                injectControl(EMOJI_DRAWER, mapOf(EMOJI_DRAWER to listOf(good, bad)))
            }
            assertContains(failure.message.orEmpty(), "emoji drawer flag read", message = case)
            assertEquals(before, good.code(), case)
        }
    }

    @Test fun onlyItsOwnSwitchLiftsTheRedesign() {
        val method = drawerHelper()
        injectControl(EMOJI_DRAWER, mapOf(EMOJI_DRAWER to listOf(method)))
        val calls = method.code().mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertEquals(1, calls.count { it == EMOJI_DRAWER_HELPER })
        assertTrue(calls.none { it.startsWith("$SETTINGS->enabled") })
    }
}
