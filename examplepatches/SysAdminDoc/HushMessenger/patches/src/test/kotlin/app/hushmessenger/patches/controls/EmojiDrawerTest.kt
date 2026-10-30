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
private const val DRAWER_HELPER = "$CONFIG->A02()Z"
internal const val DRAWER_EFFECT = "LX/H1n;->invoke(Ljava/lang/Object;)Ljava/lang/Object;"
internal const val DRAWER_RENDERER = "LX/4wu;->render(LX/5Sd;)V"
/** The drawer's flag in 585. */
private const val FLAG = EMOJI_DRAWER_FLAG
/** 584, 583 and 582 numbered it differently. */
private const val FLAG_584 = 36320584214265525L
private const val FLAG_583 = 36320635751841408L
private const val FLAG_582 = 36320652931710646L
/** An older release's number for the same flag. */
private const val OLD_FLAG = 36320704471318256L
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

/**
 * 585's static getter: the config object, the flag, the interface check and its answer, returned as is. The renderer
 * only calls it. [extra] goes in just before the return.
 */
private fun drawerHelper(id: String = DRAWER_HELPER, flag: Long = FLAG, extra: String = "", flags: Int = STATIC) = fixtureMethod(id, """
    invoke-static {}, LX/1Aa;->A0A()LX/5V6;
    move-result-object v2
    const-wide v0, ${flag}L
    check-cast v2, $CONFIG
    invoke-interface {v2, v0, v1}, $CONFIG->Ah8(J)Z
    move-result v0
    $extra
    return v0
""".trimIndent().lines().filter { it.isNotBlank() }.joinToString("\n"), registers = 3, flags = flags)

/** A drawer component that reads the flag through a static (Object, J) check and inverts the answer. */
private fun drawerEffect(id: String = DRAWER_EFFECT, flag: Long = FLAG) = fixtureMethod(id, """
    invoke-static {}, LX/1Aa;->A0A()LX/5V6;
    move-result-object v4
    const-wide v0, ${flag}L
    invoke-static {v4, v0, v1}, LX/16z;->A1Z(Ljava/lang/Object;J)Z
    move-result v0
    xor-int/lit8 v0, v0, 0x1
    const/4 v0, 0x0
    return-object v0
""".trimIndent())

/** 585's renderer: it asks the getter, then throws the anchor when the redesign can't draw. */
private fun helperRenderer(call: String = DRAWER_HELPER) = fixtureMethod("LX/4tE;->A00(LX/5bm;)V", """
    invoke-static {}, $call
    move-result v0
    const-string v1, "$EMOJI_DRAWER_ANCHOR"
    return-void
""".trimIndent())

/**
 * The renderer reads the flag itself, twice, the first answer in a register outside the 4-bit range. A path without
 * a config object skips the first read and lands just after its answer.
 */
private fun drawerRenderer(id: String = DRAWER_RENDERER, flag: Long = FLAG) = fixtureMethod(id, """
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

/** A drawer component that reads the flag and the renderer that reads it too, which ties both to the drawer. */
internal fun emojiDrawerFixture(): List<MutableClass> = listOf(
    fixtureClass("LX/H1n;", listOf(drawerEffect())),
    fixtureClass("LX/4wu;", listOf(drawerRenderer())),
)

private fun configClass(vararg methods: MutableMethod) =
    fixtureClass(CONFIG, methods.toList(), flags = AccessFlags.PUBLIC.value or AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value)

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
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(EMOJI_DRAWER).map { it.hookId() }.toSet()

    @Test fun theDrawerIsFoundWhereTheRendererReadsTheFlagItself() {
        assertEquals(setOf(DRAWER_RENDERER, DRAWER_EFFECT), found(emojiDrawerFixture()))
        validateControls(mirroredControls(emojiDrawerFixture()), setOf(EMOJI_DRAWER))
    }

    @Test fun theDrawerIsFoundWhereTheRendererAsksAStaticGetterThatReadsTheFlag() {
        // 585: the renderer calls MobileConfigUnsafeContext's getter, so the getter is the read that gets hooked.
        val classes = emojiDrawerFixture().filter { it.type != "LX/4wu;" } + configClass(drawerHelper()) +
            fixtureClass("LX/4tE;", listOf(helperRenderer()))
        assertEquals(setOf(DRAWER_HELPER, DRAWER_EFFECT), found(classes))
        val base = SYNTHETIC_PROFILE
        activeProfile = ControlProfile(base.hooks + (EMOJI_DRAWER to setOf(DRAWER_HELPER, DRAWER_EFFECT)), base.pluginSentinel,
            base.preferenceGetter, base.peopleKey, base.peopleFlagCheck, base.subtabsSupplier, base.browserPreferenceKey,
            base.browserPreferenceIndex, base.bubbleCapabilityGetter, base.bubbleRolloutGetter, base.nativeBubbleRoutes,
            base.nativeCommunityInbox)
        validateControls(mirroredControls(classes), setOf(EMOJI_DRAWER))
        assertEquals(1, assertEmojiDrawerInjected(drawerHelper(), "getter"))
    }

    @Test fun theFlagCountsOnlyWhenTheRendererThatThrowsTheAnchorReadsIt() {
        val readers = emojiDrawerFixture().filter { it.type != "LX/4wu;" }
        val cases = mapOf(
            "no renderer" to readers,
            "two renderers" to readers + fixtureClass("LX/4wu;", listOf(drawerRenderer())) +
                fixtureClass("LX/4wv;", listOf(drawerRenderer(id = "LX/4wv;->render(LX/5Sd;)V"))),
            "a renderer that doesn't read the flag" to readers + fixtureClass("LX/4wu;", listOf(drawerRenderer(flag = 0x1L))),
            // A getter that does more than hand back the read, or one the renderer can't call statically, proves nothing.
            "a getter that inverts the answer" to readers + configClass(drawerHelper(extra = "xor-int/lit8 v0, v0, 0x1")) +
                fixtureClass("LX/4tE;", listOf(helperRenderer())),
            "a getter that isn't static" to readers + configClass(drawerHelper(flags = AccessFlags.PUBLIC.value)) +
                fixtureClass("LX/4tE;", listOf(helperRenderer())),
            "a getter of 584's flag" to readers + configClass(drawerHelper(flag = FLAG_584)) + fixtureClass("LX/4tE;", listOf(helperRenderer())),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(EMOJI_DRAWER)) }
        }
    }

    @Test fun anOlderReleasesFlagIsNotTheDrawer() {
        for (flag in listOf(FLAG_584, FLAG_583, FLAG_582, OLD_FLAG)) {
            val other = drawerEffect("LX/EfL;->invoke(Ljava/lang/Object;)Ljava/lang/Object;", flag)
            val classes = listOf(fixtureClass("LX/51i;", listOf(drawerRenderer("LX/51i;->render(LX/5XD;)V", flag))), fixtureClass("LX/EfL;", listOf(other)))
            assertTrue(found(classes).isEmpty(), "$flag")
            assertFailsWith<PatchException>("$flag") { validateControls(mirroredControls(classes), setOf(EMOJI_DRAWER)) }
            assertFailsWith<PatchException>("$flag") { drawerRenderer(flag = flag).validateEmojiDrawer() }
        }
    }

    @Test fun everyFlagReadPassesThroughTheExtension() {
        assertEquals(1, assertEmojiDrawerInjected(drawerEffect(), "effect"))
        val renderer = drawerRenderer()
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
            "flag before another argument" to "const-wide v0, ${FLAG}L\ninvoke-static {v0, v1, v4}, LX/16z;->A1Z(JLjava/lang/Object;)Z\nmove-result v0\nreturn v0",
            "answer not a boolean" to "const-wide v0, ${FLAG}L\ninvoke-interface {v2, v0, v1}, $CONFIG->Ah8(J)I\nmove-result v0\nreturn v0",
            "answer never taken" to "const-wide v0, ${FLAG}L\ninvoke-interface {v2, v0, v1}, $CONFIG->Ah8(J)Z\nconst/4 v0, 0x0\nreturn v0",
            "flag logged" to "const-wide v0, ${FLAG}L\ninvoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;\nconst/4 v0, 0x0\nreturn v0",
            "cast over the flag" to "const-wide v0, ${FLAG}L\ncheck-cast v1, $CONFIG\ninvoke-interface {v2, v0, v1}, $CONFIG->Ah8(J)Z\nmove-result v0\nreturn v0",
            "jump into the read" to "if-eqz v3, :check\nconst-wide v0, ${FLAG}L\n:check\ninvoke-interface {v2, v0, v1}, $CONFIG->Ah8(J)Z\nmove-result v0\nreturn v0",
            "no flag at all" to "const-wide v0, 0x1L\ninvoke-interface {v2, v0, v1}, $CONFIG->Ah8(J)Z\nmove-result v0\nreturn v0",
        )
        for ((case, body) in shapes) {
            val good = drawerEffect()
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
        val method = drawerEffect()
        injectControl(EMOJI_DRAWER, mapOf(EMOJI_DRAWER to listOf(method)))
        val calls = method.code().mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertEquals(1, calls.count { it == EMOJI_DRAWER_HELPER })
        assertTrue(calls.none { it.startsWith("$SETTINGS->enabled") })
    }
}
