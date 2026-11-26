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
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

internal const val SYNTHETIC_TAB_ICONS = "LX/1sR;->A01(LX/1sR;)Lcom/google/common/collect/ImmutableList;"
private const val TAB_HOLDER = "LX/1si;"
private const val TAB_DESCRIPTION = "LX/1sm;"
private const val DRAWABLE_TYPE = "Landroid/graphics/drawable/Drawable;"
private const val INBOX_PLUGIN = "Lcom/facebook/messaging/inbox/tab/plugins/inbox/InboxTabContentImplementation;"
private const val PEOPLE_PLUGIN = "Lcom/facebook/messaging/people/plugins/people/PeopleTabContentImplementation;"
private const val NOT_A_PLUGIN = "Lcom/facebook/messaging/people/PeopleTabSomethingElse;"

/**
 * The bar's render-info builder as the supported builds write it: the trace it's found by, then one tab at a time, each
 * reached through its own plugin class, its drawable wrapped in the icon holder and the holder handed to the tab's
 * description. Two tabs are enough: the second proves the sites stay apart and keep their own names.
 */
private fun builder(
    id: String = SYNTHETIC_TAB_ICONS,
    trace: String = TAB_ICON_TRACE,
    holderParams: String = DRAWABLE_TYPE,
    firstPlugin: String = INBOX_PLUGIN,
    secondPlugin: String = PEOPLE_PLUGIN,
    firstArguments: String = "v1",
    secondArguments: String = "v4",
    firstMove: String = "move-result-object v2",
    descriptionCall: String = "$TAB_DESCRIPTION-><init>(${TAB_HOLDER}Ljava/lang/String;Ljava/lang/String;Z)V",
    between: String = "nop",
    tail: String = "nop",
    registers: Int = 8,
): MutableMethod {
    val holderCall = "$TAB_HOLDER->A00($holderParams)$TAB_HOLDER"
    return fixtureMethod(id, """
        const-string v0, "$trace"
        invoke-static {v0}, LX/0Bv;->A01(Ljava/lang/String;)V
        const/4 v5, 0x0
        const-string v6, "Chats"
        sget-object v0, $firstPlugin->A00:Ljava/lang/Object;
        invoke-static {$firstArguments}, $holderCall
        $firstMove
        new-instance v3, $TAB_DESCRIPTION
        invoke-direct {v3, v2, v6, v6, v5}, $descriptionCall
        $between
        sget-object v0, $secondPlugin->A00:Ljava/lang/Object;
        invoke-static {$secondArguments}, $holderCall
        move-result-object v2
        new-instance v3, $TAB_DESCRIPTION
        invoke-direct {v3, v2, v6, v6, v5}, $descriptionCall
        $tail
        return-object v3
    """.trimIndent(), registers = registers)
}

/** The same builder with a catch over the first tab's icon call. */
private fun guardedBuilder(): MutableMethod {
    val method = builder(tail = "goto :done\n:caught\nmove-exception v0\n:done\nnop")
    val code = method.implementation!!.instructions.toList()
    val at = IntArray(code.size + 1).also { a -> for (i in code.indices) a[i + 1] = a[i] + code[i].codeUnits }
    val handler = code.indexOfFirst { it.opcode == Opcode.MOVE_EXCEPTION }
    return MutableMethod(ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
        method.accessFlags, null, null, ImmutableMethodImplementation(method.implementation!!.registerCount, code,
            listOf(ImmutableTryBlock(at[5], at[7] - at[5], listOf(ImmutableExceptionHandler(null, at[handler])))), null)))
}

/** A builder whose every register is read again after its one icon, so there's nothing spare to put the tab's name in. */
private fun crowdedBuilder() = fixtureMethod(SYNTHETIC_TAB_ICONS, """
    const-string v0, "$TAB_ICON_TRACE"
    invoke-static {v0}, LX/0Bv;->A01(Ljava/lang/String;)V
    sget-object v0, $INBOX_PLUGIN->A00:Ljava/lang/Object;
    invoke-static {v1}, $TAB_HOLDER->A00($DRAWABLE_TYPE)$TAB_HOLDER
    move-result-object v1
    invoke-direct {v0, v1, v2, v3, v4}, $TAB_DESCRIPTION-><init>(${TAB_HOLDER}Ljava/lang/String;Ljava/lang/String;Z)V
    return-void
""".trimIndent(), registers = 5)

internal fun tabIconsFixture() = listOf(fixtureClass(SYNTHETIC_TAB_ICONS.substringBefore("->"), listOf(builder())))

private fun Method.body() = implementation!!.instructions.toList()

/**
 * Every register a narrow call can reach is read again after the one icon, but v16 and v17 never are, so the icon has
 * to go through a pair of them.
 */
private fun highPairBuilder() = fixtureMethod(SYNTHETIC_TAB_ICONS, """
    const-string v0, "$TAB_ICON_TRACE"
    invoke-static {v0}, LX/0Bv;->A01(Ljava/lang/String;)V
    sget-object v0, $INBOX_PLUGIN->A00:Ljava/lang/Object;
    invoke-static {v1}, $TAB_HOLDER->A00($DRAWABLE_TYPE)$TAB_HOLDER
    move-result-object v1
    invoke-direct {v0, v1, v2, v3, v4}, $TAB_DESCRIPTION-><init>(${TAB_HOLDER}Ljava/lang/String;Ljava/lang/String;Z)V
    invoke-static/range {v0 .. v15}, LX/0Bv;->A02(${"Ljava/lang/Object;".repeat(16)})V
    return-void
""".trimIndent(), registers = 20)

/** Where each site's hook starts once every earlier one has gone in. */
private fun hookStarts(sites: List<TabIconSite>) = sites.indices.map { i -> sites[i].at + sites.take(i).sumOf { it.size } }

/** The three instructions one icon takes in front of the call that wraps it, or four through a pair. */
private fun assertIconHook(after: List<Instruction>, at: Int, site: TabIconSite, label: String) {
    if (site.pair) return assertPairHook(after, at, site, label)
    assertEquals(Opcode.CONST_STRING, after[at].opcode, label)
    assertEquals(site.scratch, (after[at] as OneRegisterInstruction).registerA, label)
    assertEquals(site.key, ((after[at] as ReferenceInstruction).reference as StringReference).string, label)
    assertEquals(Opcode.INVOKE_STATIC, after[at + 1].opcode, label)
    assertEquals(PICK_TAB_ICON, (after[at + 1] as ReferenceInstruction).reference.toString(), label)
    val call = after[at + 1] as FiveRegisterInstruction
    assertEquals(2, call.registerCount, label)
    assertEquals(site.register, call.registerC, label)
    assertEquals(site.scratch, call.registerD, label)
    assertEquals(Opcode.MOVE_RESULT_OBJECT, after[at + 2].opcode, label)
    assertEquals(site.register, (after[at + 2] as OneRegisterInstruction).registerA, label)
    // The drawable's register holds a drawable on both sides of the call, so a catch over the site sees no change.
    assertTrue(site.scratch != site.register, label)
}

/** The drawable copied into the pair's first register, the name in the second, and the helper reading both. */
private fun assertPairHook(after: List<Instruction>, at: Int, site: TabIconSite, label: String) {
    assertEquals(Opcode.MOVE_OBJECT_FROM16, after[at].opcode, label)
    assertEquals(site.scratch, (after[at] as TwoRegisterInstruction).registerA, label)
    assertEquals(site.register, (after[at] as TwoRegisterInstruction).registerB, label)
    assertEquals(Opcode.CONST_STRING, after[at + 1].opcode, label)
    assertEquals(site.scratch + 1, (after[at + 1] as OneRegisterInstruction).registerA, label)
    assertEquals(site.key, ((after[at + 1] as ReferenceInstruction).reference as StringReference).string, label)
    assertEquals(Opcode.INVOKE_STATIC_RANGE, after[at + 2].opcode, label)
    assertEquals(PICK_TAB_ICON, (after[at + 2] as ReferenceInstruction).reference.toString(), label)
    val call = after[at + 2] as RegisterRangeInstruction
    assertEquals(site.scratch, call.startRegister, label)
    assertEquals(2, call.registerCount, label)
    assertEquals(Opcode.MOVE_RESULT_OBJECT, after[at + 3].opcode, label)
    assertEquals(site.register, (after[at + 3] as OneRegisterInstruction).registerA, label)
    assertTrue(site.register !in site.scratch..site.scratch + 1, label)
}

class TabIconsTest {
    @AfterTest fun reset() { activeProfile = SYNTHETIC_PROFILE }

    private fun found(vararg methods: MutableMethod) =
        mirroredControls(methods.groupBy { it.definingClass }.map { (type, group) -> fixtureClass(type, group) })

    @Test fun everyTabsDrawableGoesThroughTheExtensionNamedForItsTab() {
        val method = builder()
        val hooks = found(method)
        assertEquals(listOf(SYNTHETIC_TAB_ICONS), hooks.getValue(TAB_ICONS).map { it.hookId() })
        validateControls(hooks, setOf(TAB_ICONS))
        val before = method.body()
        val sites = method.validateTabIcons()
        assertEquals(listOf("inbox", "people"), sites.map { it.key })
        assertEquals(listOf(1, 4), sites.map { it.register })
        injectControl("tab_icons", mapOf(TAB_ICONS to listOf(method)))
        val after = method.body()
        assertEquals(before.size + 6, after.size)
        // The first site stayed where it was found; the second moved along by the three the first took.
        assertIconHook(after, sites[0].at, sites[0], "first tab")
        assertIconHook(after, sites[1].at + 3, sites[1], "second tab")
        // Everything Messenger had is still there, in order.
        val added = (sites[0].at until sites[0].at + 3) + (sites[1].at + 3 until sites[1].at + 6)
        assertEquals(before.map { it.opcode }, after.filterIndexed { i, _ -> i !in added }.map { it.opcode })
    }

    /** A jump over a tab's icon still lands where it did, so the bar's branches survive the insert. */
    @Test fun jumpsOverAnIconStillLandWhereTheyDid() {
        val method = builder(between = "if-eqz v5, :skip", tail = ":skip\nnop")
        val before = method.body()
        val jump = before.indexOfFirst { it.opcode == Opcode.IF_EQZ }
        val target = before.branchTarget(jump)
        injectControl("tab_icons", mapOf(TAB_ICONS to listOf(method)))
        val after = method.body()
        // One site sits in front of the jump and one behind it, so the jump moved three and its target six.
        assertEquals(jump + 3, after.indexOfFirst { it.opcode == Opcode.IF_EQZ })
        assertEquals(target + 6, after.branchTarget(jump + 3))
    }

    /**
     * Every build catches around its tab icons, so a site inside a try is patched rather than refused. What keeps that
     * safe is the drawable's register: it holds a drawable before the call and a drawable after it, and the tab's name
     * goes in a register the method never reads again, so the catch sees the frame exactly as Messenger left it.
     */
    @Test fun anIconInsideATryIsStillPatched() {
        val method = guardedBuilder()
        val sites = method.validateTabIcons()
        val before = method.body()
        injectControl("tab_icons", mapOf(TAB_ICONS to listOf(method)))
        assertEquals(before.size + 3 * sites.size, method.body().size)
        for ((index, site) in sites.withIndex()) assertIconHook(method.body(), site.at + 3 * index, site, site.key)
    }

    /** With no low register free the icon goes through two dead ones above v15, and the rest stays as it was. */
    @Test fun anIconWithNoLowRegisterFreeGoesThroughAPair() {
        val method = highPairBuilder()
        val before = method.body()
        val site = method.validateTabIcons().single()
        assertEquals(TabIconSite(3, 1, "inbox", scratch = 16, pair = true), site)
        injectControl("tab_icons", mapOf(TAB_ICONS to listOf(method)))
        val after = method.body()
        assertEquals(before.size + 4, after.size)
        assertIconHook(after, site.at, site, "pair")
        assertEquals(before.map { it.opcode }, after.filterIndexed { i, _ -> i !in site.at until site.at + 4 }.map { it.opcode })
        // A frame one register short of the pair still has nothing to spare.
        val short = fixtureMethod(SYNTHETIC_TAB_ICONS, """
            const-string v0, "$TAB_ICON_TRACE"
            invoke-static {v0}, LX/0Bv;->A01(Ljava/lang/String;)V
            sget-object v0, $INBOX_PLUGIN->A00:Ljava/lang/Object;
            invoke-static {v1}, $TAB_HOLDER->A00($DRAWABLE_TYPE)$TAB_HOLDER
            move-result-object v1
            invoke-direct {v0, v1, v2, v3, v4}, $TAB_DESCRIPTION-><init>(${TAB_HOLDER}Ljava/lang/String;Ljava/lang/String;Z)V
            invoke-static/range {v0 .. v16}, LX/0Bv;->A02(${"Ljava/lang/Object;".repeat(17)})V
            return-void
        """.trimIndent(), registers = 17)
        val failure = assertFailsWith<PatchException> { injectControl("tab_icons", mapOf(TAB_ICONS to listOf(short))) }
        assertContains(failure.message.orEmpty(), "no register to spare")
    }

    @Test fun onlyMessengersOwnTabBarBuilderIsTaken() {
        assertTrue(found(builder(trace = "TabBarPresenter.render")).getValue(TAB_ICONS).isEmpty())
    }

    @Test fun aChangedBuilderIsRefusedInsteadOfPatched() {
        for ((case, method) in listOf(
            "no icon is built" to builder(holderParams = "Ljava/lang/String;"),
            "a tab with no plugin of its own" to builder(firstPlugin = NOT_A_PLUGIN, secondPlugin = NOT_A_PLUGIN),
            "the icon is dropped" to builder(firstMove = "nop"),
            "no register to spare" to crowdedBuilder(),
        )) {
            val before = method.body().map { it.opcode }
            val failure = assertFailsWith<PatchException>(case) { injectControl("tab_icons", mapOf(TAB_ICONS to listOf(method))) }
            assertContains(failure.message.orEmpty(), "the tab bar's icons no longer match", message = case)
            assertEquals(before, method.body().map { it.opcode }, case)
        }
    }

    /** A drawable the holder is handed twice has no one register to carry the answer back in. */
    @Test fun aDrawablePassedTwiceIsRefused() {
        val method = builder(holderParams = "$DRAWABLE_TYPE$DRAWABLE_TYPE", firstArguments = "v1, v1", secondArguments = "v4, v4")
        val before = method.body().map { it.opcode }
        val failure = assertFailsWith<PatchException> { injectControl("tab_icons", mapOf(TAB_ICONS to listOf(method))) }
        assertContains(failure.message.orEmpty(), "passed twice")
        assertEquals(before, method.body().map { it.opcode })
    }

    @Test fun everySupportedBuildSendsItsTabIconsThroughTheExtension() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val builders = findTabIcons(classes)
            assertEquals(activeProfile.hooks.getValue(TAB_ICONS), builders.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(TAB_ICONS to builders), setOf(TAB_ICONS))
            for (built in builders) {
                val method = MutableMethod(built)
                val before = method.body()
                val sites = method.validateTabIcons()
                assertTrue(sites.isNotEmpty(), code)
                assertContains(sites.map { it.key }, "inbox", "$code names the chat list's tab")
                injectControl("tab_icons", mapOf(TAB_ICONS to listOf(method)))
                assertEquals(before.size + sites.sumOf { it.size }, method.body().size, "$code ${built.hookId()}")
                for ((site, at) in sites.zip(hookStarts(sites)))
                    assertIconHook(method.body(), at, site, "$code ${site.key}")
            }
        }
    }
}
