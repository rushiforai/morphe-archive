package app.hushmessenger.patches.controls

import app.hushmessenger.patches.CompatMirror
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import java.nio.file.Files
import java.nio.file.Path
import java.security.MessageDigest
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.*

/** Emoji drawer flag reads in 585, one in each of its six drawer hooks. */
private const val EMOJI_DRAWER_READS = 6

/** [resumeTail] pads onResume after the guarded part: 22 instructions in 585. An older release's two more are refused. */
internal fun screenshotViewerFixture(
    id: String, quickSize: Int = 446, resumeTail: Int = 22, quickSite: Int = 32, quickRegisters: Int = 40,
): MutableMethod {
    val body: String
    val registers: Int
    when {
        id.contains("->onResume(") -> {
            registers = 5
            body = List(7) { "nop" }.joinToString("\n") + "\n" + """
                invoke-virtual {p0}, LX/Fragment;->getActivity()Landroid/app/Activity;
                move-result-object v0
                const/16 v1, 0x2000
                if-eqz v0, :dialog
                invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                move-result-object v0
                if-eqz v0, :dialog
                :activity_flags
                invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V
                :dialog
                invoke-virtual {p0}, LX/Fragment;->getDialog()Landroid/app/Dialog;
                move-result-object v0
                if-eqz v0, :resume
                invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;
                move-result-object v0
                if-eqz v0, :resume
                invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V
                :resume
                invoke-static {}, LX/Lifecycle;->resume()V
            """.trimIndent() + "\n" + List(resumeTail) { "nop" }.joinToString("\n") + "\nreturn-void"
        }
        id.contains("->onCreateView(") -> {
            registers = quickRegisters
            body = List(quickSite - 7) { "nop" }.joinToString("\n") + "\n" + """
                invoke-virtual {v8}, LX/Fragment;->getDialog()Landroid/app/Dialog;
                move-result-object v0
                if-eqz v0, :inflate
                invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;
                move-result-object v1
                if-eqz v1, :inflate
                const/16 v0, 0x2000
                invoke-virtual {v1, v0}, Landroid/view/Window;->addFlags(I)V
                :inflate
                invoke-static {}, LX/Lifecycle;->inflate()V
                const/4 v0, 0x0
            """.trimIndent() + "\n" + List(quickSize - quickSite - 4) { "nop" }.joinToString("\n") + "\nreturn-object v0"
        }
        else -> {
            registers = 5
            body = """
                nop
                nop
                nop
                invoke-super {p0, p1}, LX/Fragment;->createDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
                move-result-object v2
                invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;
                move-result-object v1
                if-eqz v1, :listeners
                const/16 v0, 0x2000
                invoke-virtual {v1, v0, v0}, Landroid/view/Window;->setFlags(II)V
                :listeners
                const/4 v1, 0x0
                new-instance v0, LX/Listener;
                invoke-direct {v0}, LX/Listener;-><init>()V
                invoke-static {}, LX/Lifecycle;->dialogListeners()V
                return-object v2
            """.trimIndent()
        }
    }
    return fixtureMethod(id, body, registers)
}

internal fun aiStickerCellFixture(
    id: String = activeProfile.hooks.getValue("ai_sticker_cell").single(),
    label: Int = aiCells.single { it.render == id }.label,
    sourceCount: Int = aiCells.single { it.render == id }.sources,
    superclass: String = aiCells.single { it.render == id }.superclass,
    size: Int = aiCells.single { it.render == id }.size,
    // An older release's render isn't in aiCells, so it gets 585's arm64 menu label.
    menu: Int = aiCells.singleOrNull { it.render == id }?.menu ?: GENERATE_MENU_LABEL,
    menuSources: Int = aiCells.singleOrNull { it.render == id }?.menuSources ?: AI_MENU_SOURCES,
    // The first menu source as 585's Suggested grid loop instead of a bare render, whether it keeps 584's Generate AI
    // branch, and what to break in it.
    grid: Boolean = false,
    gridAi: Boolean = false,
    gridChange: String? = null,
): List<MutableClass> {
    val type = id.substringBefore("->")
    val render = fixtureMethod(id, "const/4 v0, 0x0\n" + List(size - 2) { "nop" }.joinToString("\n") + "\nreturn-object v0", AI_CELL_REGISTERS)
    render.implementation!!.run {
        for (at in listOf(1, 3, 5, 7)) addCatch(newLabelForIndex(at), newLabelForIndex(at + 1), newLabelForIndex(size - 1))
    }
    val ctorId = "$type-><init>(Lcom/facebook/auth/usersession/FbUserSession;LX/Icon;LX/Style;LX/Style;LX/Theme;LX/Layout;Ljava/lang/Float;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;LX/Click;I)V"
    val ctor = fixtureMethod(ctorId, List(5) { "nop" }.joinToString("\n") + "\niput p11, p0, $type->A00:I\n" +
        List(8) { "nop" }.joinToString("\n") + "\nreturn-void", 12)
    val cell = fixtureClass(type, listOf(ctor, render), superclass = superclass,
        extraFields = listOf(ImmutableField(type, "A00", "I", AccessFlags.PUBLIC.value, null, null, null)))
    val sources = (0 until sourceCount).map { index ->
        val source = "LX/CellSource$index;"
        fixtureClass(source, listOf(fixtureMethod("$source->render(LX/Scope;)LX/Component;", """
            const v11, 0x${label.toString(16)}
            new-instance v0, $type
            invoke-direct/range {v0 .. v11}, $ctorId
            const/4 v0, 0x0
            return-object v0
        """.trimIndent(), 14)))
    }
    // As in the Suggested grid, the music sticker branch jumps into the Generate menu cell's constructor call.
    val menus = (0 until menuSources).map { index ->
        if (index == 0 && (grid || gridAi || gridChange != null))
            return@map aiStickerGridClass(type, ctorId, menu, label, gridAi || gridChange in setOf("ai_entered", "unfed"), gridChange)
        val source = "LX/MenuSource$index;"
        fixtureClass(source, listOf(fixtureMethod("$source->render(LX/Scope;)LX/Component;", """
            if-eqz p1, :music
            const v11, 0x${menu.toString(16)}
            :joined
            new-instance v0, $type
            invoke-direct/range {v0 .. v11}, $ctorId
            const/4 v0, 0x0
            return-object v0
            :music
            const v11, 0x7f14398b
            goto :joined
        """.trimIndent(), 14)))
    }
    return listOf(cell) + sources + menus
}

/**
 * 585's DwT.render as the Suggested grid: a plain iterator loop over the items whose instance-of chain builds the Generate
 * menu cell straight from its label, the custom cell and the music cell (it jumps into the menu cell's constructor call),
 * then throws on an unknown item. [ai] adds 584's Generate AI branch, whose label jumps into the custom cell's constructor
 * call. [change] breaks one part of that for the refusal tests.
 */
private fun aiStickerGridClass(type: String, ctorId: String, menu: Int, label: Int, ai: Boolean, change: String?): MutableClass {
    val id = activeProfile.hooks.getValue("ai_sticker_grid").single()
    val menuFlag = if (change == "flag") "v5" else "v4"
    val aiBranch = if (!ai) "" else """
        :ai_item
        instance-of v4, v1, LX/AiItem;
        if-eqz v4, :music_item
        :ai_site
        const v11, 0x${(if (change == "ai_label") 0x7f140559 else label).toString(16)}
        ${if (change == "unfed") "const/4 v11, 0x0" else ""}
        goto :custom_cell
    """.trimIndent()
    val body = """
        invoke-static {}, LX/GridItems;->get()Ljava/util/List;
        move-result-object v12
        invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v12
        :head
        invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z
        move-result v1
        if-eqz v1, :done
        invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v1
        ${if (change == "cast") "nop" else ""}
        check-cast v1, LX/GridItem;
        instance-of v4, v1, LX/StickerItem;
        if-eqz v4, :menu_item
        invoke-static {v1}, LX/Grid;->add(Ljava/lang/Object;)V
        goto :head
        :menu_item
        instance-of $menuFlag, v1, LX/MenuItem;
        if-eqz $menuFlag, :custom_item
        :menu_site
        const v11, 0x${(if (change == "menu_label") 0x7f14128f else menu).toString(16)}
        :menu_cell
        new-instance v0, $type
        invoke-direct/range {v0 .. v11}, $ctorId
        :added
        invoke-static {v0}, LX/Grid;->add(Ljava/lang/Object;)V
        goto :head
        :custom_item
        instance-of v4, v1, LX/CustomItem;
        if-eqz v4, ${if (ai) ":ai_item" else ":music_item"}
        const v11, 0x7f14128f
        :custom_cell
        new-instance v0, $type
        invoke-direct/range {v0 .. v11}, $ctorId
        ${if (change == "back_edge") "if-nez v0, :head" else ""}
        goto :added
        $aiBranch
        :music_item
        instance-of v4, v1, LX/MusicItem;
        if-eqz v4, :unknown
        const v11, 0x7f14398b
        ${when (change) { "entered" -> "goto :menu_site"; "ai_entered" -> "goto :ai_site"; else -> "goto :menu_cell" }}
        :unknown
        invoke-static {}, LX/Grid;->unknown()Ljava/lang/IllegalStateException;
        move-result-object v0
        throw v0
        :done
        ${if (change == "stray") "const v11, 0x${menu.toString(16)}" else ""}
        const/4 v0, 0x0
        return-object v0
    """.lines().map { it.trim() }.filter { it.isNotBlank() }.joinToString("\n")
    return fixtureClass(id.substringBefore("->"), listOf(fixtureMethod(id, body, 16)))
}

private fun MethodImplementation.tryLocations() = tryBlocks.map { block ->
    Triple(block.startCodeAddress, block.codeUnitCount, block.exceptionHandlers.map { it.exceptionType to it.handlerCodeAddress })
}

private fun assertShiftedTries(before: List<Triple<Int, Int, List<Pair<String?, Int>>>>, method: MutableMethod, shift: Int) {
    assertEquals(before.map { (start, length, handlers) -> Triple(start + shift, length, handlers.map { (type, at) -> type to at + shift }) },
        method.implementation!!.tryLocations())
}

class NativeMediaControlsTest {
    @AfterTest fun reset() { activeProfile = SYNTHETIC_PROFILE }

    @Test fun allMappingsReplaceOnlyTheFourCallsAndRetainTheirMasksAndLifecycle() {
        for (profile in controlProfiles.values.toSet()) {
            activeProfile = profile
            for (size in listOf(451)) {
                val methods = profile.hooks.getValue("screenshot_viewers").map { screenshotViewerFixture(it, size) }
                for (method in methods) {
                    val before = method.implementation!!.instructions.toList()
                    val sites = method.screenshotViewerSites()
                    method.injectScreenshotViewer()
                    val after = method.implementation!!.instructions.toList()
                    assertEquals(before.size, after.size)
                    assertEquals(before.filterIndexed { i, _ -> i !in sites }, after.filterIndexed { i, _ -> i !in sites })
                    for (at in sites) {
                        assertEquals(before[at].codeUnits, after[at].codeUnits)
                        val old = before[at] as FiveRegisterInstruction
                        val new = after[at] as FiveRegisterInstruction
                        assertEquals(listOf(old.registerCount, old.registerC, old.registerD, old.registerE),
                            listOf(new.registerCount, new.registerC, new.registerD, new.registerE))
                        assertTrue((after[at] as ReferenceInstruction).reference.toString().startsWith("$SETTINGS->"))
                    }
                }
            }
        }
    }

    @Test fun changedFlagsMasksReceiversNullBranchesAndExtraSettersAreRefused() {
        val id = "$EPHEMERAL_VIEWER->onResume()V"
        val mutations = listOf(
            9 to "const/16 v1, 0x80",
            14 to "invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setFlags(II)V",
            21 to "invoke-virtual {v2, v1, v1}, Landroid/view/Window;->setFlags(II)V",
            18 to "invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;",
            19 to "const/4 v0, 0x0",
            16 to "const/4 v1, 0x0",
            20 to "nop",
            30 to "invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V",
        )
        for ((at, change) in mutations) {
            val method = screenshotViewerFixture(id).apply { replaceInstruction(at, change) }
            val before = method.implementation!!.instructions.toList()
            assertFailsWith<PatchException>(change) { method.injectScreenshotViewer() }
            assertEquals(before, method.implementation!!.instructions.toList())
        }
        val branch = screenshotViewerFixture(id).apply {
            val target = implementation!!.newLabelForIndex(14)
            implementation!!.replaceInstruction(0, com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10t(com.android.tools.smali.dexlib2.Opcode.GOTO, target))
        }
        assertFailsWith<PatchException> { branch.injectScreenshotViewer() }
        val caught = screenshotViewerFixture(id).apply { implementation!!.addCatch(implementation!!.newLabelForIndex(7), implementation!!.newLabelForIndex(9), implementation!!.newLabelForIndex(14)) }
        assertFailsWith<PatchException> { caught.injectScreenshotViewer() }
    }

    @Test fun olderViewerShapesAreRefusedAndTheOtherDialogNameKeepsItsCall() {
        val resume = "$EPHEMERAL_VIEWER->onResume()V"
        assertEquals(listOf(14, 21), screenshotViewerFixture(resume).screenshotViewerSites())
        // Older releases ran onResume two instructions longer.
        assertFailsWith<PatchException> { screenshotViewerFixture(resume, resumeTail = 24).screenshotViewerSites() }
        val mask = screenshotViewerFixture(resume).apply { replaceInstruction(9, "const/16 v1, 0x80") }
        assertFailsWith<PatchException> { mask.screenshotViewerSites() }
        assertEquals(listOf(9), screenshotViewerFixture("$EPHEMERAL_VIEWER->A1J(Landroid/os/Bundle;)Landroid/app/Dialog;").screenshotViewerSites())
        assertEquals(listOf(9), screenshotViewerFixture("$EPHEMERAL_VIEWER->A1H(Landroid/os/Bundle;)Landroid/app/Dialog;").screenshotViewerSites())
        // 584's A1K, A1O and A1I, 583's A1F and 582's A1D overrides, same body, are refused.
        for (old in listOf("A1K", "A1O", "A1I", "A1F", "A1D")) assertFailsWith<PatchException>(old) {
            screenshotViewerFixture("$EPHEMERAL_VIEWER->$old(Landroid/os/Bundle;)Landroid/app/Dialog;").screenshotViewerSites()
        }
        val quick = "$QUICKSNAP_VIEWER->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;"
        // Builds have put the flag anywhere from 29 to 32. The one addFlags call is the site, with the same guarded prefix
        // ahead of it, in 585's 40-register arm64 frame or 39-register armv7 one. 584's 23-register frame is refused.
        assertEquals(listOf(30), screenshotViewerFixture(quick, quickSite = 30, quickRegisters = 39).screenshotViewerSites())
        assertEquals(listOf(30), CompatMirror.screenshotViewerSites(screenshotViewerFixture(quick, quickSite = 30, quickRegisters = 39)))
        assertFailsWith<PatchException> { screenshotViewerFixture(quick, quickRegisters = 23).screenshotViewerSites() }
        assertEquals(emptyList(), CompatMirror.screenshotViewerSites(screenshotViewerFixture(quick, quickRegisters = 23)))
        // 585's body has try blocks past the site, which leave it alone. One that covers the guarded prefix is refused.
        fun quickCaught(from: Int, to: Int) = screenshotViewerFixture(quick).apply {
            implementation!!.addCatch(implementation!!.newLabelForIndex(from), implementation!!.newLabelForIndex(to), implementation!!.newLabelForIndex(40))
        }
        assertEquals(listOf(32), quickCaught(34, 36).screenshotViewerSites())
        assertEquals(listOf(32), CompatMirror.screenshotViewerSites(quickCaught(34, 36)))
        for ((from, to) in listOf(10 to 12, 31 to 33, 32 to 34)) {
            assertFailsWith<PatchException>("$from..$to") { quickCaught(from, to).screenshotViewerSites() }
            assertEquals(emptyList(), CompatMirror.screenshotViewerSites(quickCaught(from, to)), "$from..$to")
        }
        assertEquals(listOf(32), screenshotViewerFixture(quick, 446).screenshotViewerSites())
        assertEquals(listOf(29), screenshotViewerFixture(quick, 444, quickSite = 29).screenshotViewerSites())
        assertEquals(listOf(32), screenshotViewerFixture(quick, 445).screenshotViewerSites())
        assertEquals(listOf(29), CompatMirror.screenshotViewerSites(screenshotViewerFixture(quick, 444, quickSite = 29)))
        assertEquals(listOf(32), CompatMirror.screenshotViewerSites(screenshotViewerFixture(quick, 445)))
        val twice = screenshotViewerFixture(quick, 445).apply { replaceInstruction(40, "invoke-virtual {v1, v0}, Landroid/view/Window;->addFlags(I)V") }
        assertFailsWith<PatchException> { twice.screenshotViewerSites() }
        assertEquals(emptyList(), CompatMirror.screenshotViewerSites(twice))
        val bare = screenshotViewerFixture(quick, 445).apply { replaceInstruction(28, "nop") }
        assertFailsWith<PatchException> { bare.screenshotViewerSites() }
        assertEquals(emptyList(), CompatMirror.screenshotViewerSites(bare))
    }

    @Test fun eachAiCellNeedsItsOwnLabelAndAllItsSources() {
        for (cell in aiCells) {
            assertEquals(listOf(cell.render), findAiStickerCells(aiStickerCellFixture(cell.render)).map { it.hookId() })
            assertTrue(findAiStickerCells(aiStickerCellFixture(cell.render, sourceCount = cell.sources - 1)).isEmpty())
            assertTrue(findAiStickerCells(aiStickerCellFixture(cell.render, sourceCount = cell.sources + 1)).isEmpty())
            // An older release's label for the same row: 584's and 582's.
            assertTrue(findAiStickerCells(aiStickerCellFixture(cell.render, label = 0x7f140559)).isEmpty())
            assertTrue(findAiStickerCells(aiStickerCellFixture(cell.render, label = 0x7f14051c)).isEmpty())
            assertTrue(findAiStickerCells(aiStickerCellFixture(cell.render, menuSources = cell.menuSources - 1)).isEmpty())
            assertTrue(findAiStickerCells(aiStickerCellFixture(cell.render, menuSources = cell.menuSources + 1)).isEmpty())
            // "Generate custom stickers" in the menu label's place: the custom sticker cell isn't the AI menu.
            assertTrue(findAiStickerCells(aiStickerCellFixture(cell.render, menu = 0x7f14128f)).isEmpty())
        }
        // Every 585 cell offers its AI label from four renders and its Generate menu label from one.
        assertEquals(listOf(
            listOf(GENERATE_AI_LABEL, 4, 109, GENERATE_MENU_LABEL, 1),
            listOf(GENERATE_AI_LABEL, 4, 109, GENERATE_MENU_LABEL, 1),
            listOf(GENERATE_AI_LABEL, 4, 109, GENERATE_MENU_LABEL_ARMV7, 1),
            listOf(GENERATE_AI_LABEL, 4, 113, GENERATE_MENU_LABEL_ARMV7, 1),
        ), aiCells.map { listOf(it.label, it.sources, it.size, it.menu, it.menuSources) })
    }

    @Test fun aMenuLabelThatBranchesBeforeTheCellIsNotASource() {
        val fixture = aiStickerCellFixture().toMutableList()
        val menu = fixture.last().methods.single()
        // A branch between the menu label and the constructor call means the label may not reach the cell.
        menu.addInstructionsWithLabels(2, "if-eqz p1, :skip\nnop\n:skip\nnop")
        assertTrue(findAiStickerCells(fixture).isEmpty())
        assertFailsWith<PatchException> { validateControls(mirroredControls(fixture), setOf("ai_sticker_cell")) }
    }

    @Test fun a582CellIsNoLongerFound() {
        // 582's CoQ under LX/1N9; offered its own label from five renders, and its render ran 105 instructions.
        val cell = aiStickerCellFixture("LX/CoQ;->render(LX/2Cg;)LX/1GU;", label = 0x7f14051c, sourceCount = 5,
            superclass = "LX/1N9;", size = 105)
        assertTrue(findAiStickerCells(cell).isEmpty())
        assertFailsWith<PatchException> { validateControls(mirroredControls(cell), setOf("ai_sticker_cell")) }
    }

    @Test fun paymentWindowsCleanupAndWrongProfileDialogNeverBecomeViewerHooks() {
        val payment = fixtureMethod("Lcom/facebook/payments/paymentmethods/cardform/CardFormActivity;->onResume()V", """
            const/16 v0, 0x2000
            invoke-virtual {v1, v0, v0}, Landroid/view/Window;->setFlags(II)V
            return-void
        """.trimIndent())
        val cleanup = fixtureMethod("$QUICKSNAP_VIEWER->onDestroyView()V", "const/16 v0, 0x2000\ninvoke-virtual {v1, v0}, Landroid/view/Window;->clearFlags(I)V\nreturn-void")
        val before = listOf(payment, cleanup).map { it.implementation!!.instructions.toList() }
        val found = mirroredControls(listOf(fixtureClass(payment.definingClass, listOf(payment)), fixtureClass(cleanup.definingClass, listOf(cleanup))))
        assertTrue(found.getValue("screenshot_viewers").isEmpty())
        assertEquals(before, listOf(payment, cleanup).map { it.implementation!!.instructions.toList() })
        activeProfile = BASE_PROFILE
        assertFailsWith<PatchException> { screenshotViewerFixture("$EPHEMERAL_VIEWER->A1D(Landroid/os/Bundle;)Landroid/app/Dialog;").injectScreenshotViewer() }
    }

    @Test fun aLateViewerFailureCannotMutateAnExistingScreenshotHook() {
        val original = fixtureMethod("LX/N2h;->run()V", "return-void")
        val viewer = screenshotViewerFixture("$EPHEMERAL_VIEWER->onResume()V").apply { replaceInstruction(9, "const/16 v1, 0x80") }
        val before = listOf(original, viewer).map { it.implementation!!.instructions.toList() }
        assertFailsWith<PatchException> { injectControl("allow_screenshot", linkedMapOf("allow_screenshot" to listOf(original), "screenshot_viewers" to listOf(viewer))) }
        assertEquals(before, listOf(original, viewer).map { it.implementation!!.instructions.toList() })
    }

    @Test fun onlyTheProvenAiLabelsCanBypassTheOriginalCellRender() {
        for (profile in controlProfiles.values.toSet()) {
            activeProfile = profile
            val fixture = aiStickerCellFixture()
            val methods = findAiStickerCells(fixture)
            assertEquals(profile.hooks.getValue("ai_sticker_cell"), methods.map { it.hookId() }.toSet())
            val method = methods.single() as MutableMethod
            val before = method.implementation!!.instructions.toList()
            val tries = method.implementation!!.tryLocations()
            method.injectAiStickerCell()
            val after = method.implementation!!.instructions.toList()
            val cell = aiCells.single { it.render == method.hookId() }
            assertEquals(before, after.drop(12))
            assertEquals("${method.definingClass}->A00:I", (after[1] as ReferenceInstruction).reference.toString())
            // The AI label goes to the switch check, the Generate menu label too, any other label straight to the stock render.
            assertEquals(cell.label, (after[2] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.IF_EQ, after[3].opcode)
            assertEquals(6, after.branchTarget(3))
            assertEquals(cell.menu, (after[4] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.IF_NE, after[5].opcode)
            assertEquals(12, after.branchTarget(5))
            assertEquals("ai_stickers", ((after[6] as ReferenceInstruction).reference as StringReference).string)
            assertEquals("$SETTINGS->enabled(Ljava/lang/String;)Z", (after[7] as ReferenceInstruction).reference.toString())
            assertEquals(Opcode.IF_EQZ, after[9].opcode)
            assertEquals(12, after.branchTarget(9))
            assertEquals(Opcode.RETURN_OBJECT, after[11].opcode)
            assertShiftedTries(tries, method, after.take(12).sumOf { it.codeUnits })
        }
    }

    /** Each cell under its own name, to check the injection compares that cell's labels. */
    @Test fun eachCellComparesItsOwnLabels() {
        for (cell in aiCells) {
            val base = SYNTHETIC_PROFILE
            activeProfile = ControlProfile(base.hooks + ("ai_sticker_cell" to setOf(cell.render)), base.pluginSentinel, base.preferenceGetter,
                base.peopleKey, base.peopleFlagCheck, base.subtabsSupplier, base.browserPreferenceKey, base.browserPreferenceIndex,
                base.bubbleCapabilityGetter, base.bubbleRolloutGetter, base.nativeBubbleRoutes,
                base.nativeCommunityInbox)
            val method = findAiStickerCells(aiStickerCellFixture(cell.render)).single() as MutableMethod
            val before = method.implementation!!.instructions.toList()
            method.injectAiStickerCell()
            val after = method.implementation!!.instructions.toList()
            assertEquals(before, after.drop(12), cell.type)
            assertEquals(cell.label, (after[2] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(cell.menu, (after[4] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(6, after.branchTarget(3))
            assertEquals(12, after.branchTarget(5))
            assertEquals(12, after.branchTarget(9))
        }
    }

    @Test fun disconnectedOrChangedAiLabelSourcesAndFieldsFailDiscovery() {
        for (change in listOf("label", "argument", "store", "ctor_argument", "ctor_receiver", "field", "superclass", "extra", "duplicate")) {
            val fixture = aiStickerCellFixture().toMutableList()
            val cell = fixture.first()
            when (change) {
                "label" -> fixture[1].methods.single().replaceInstruction(0, "const v11, 0x7f14115e")
                "argument" -> fixture[1].methods.single().replaceInstruction(1, "const/4 v11, 0x0")
                "store" -> cell.methods.single { it.name == "<init>" }.replaceInstruction(5, "iput p10, p0, ${cell.type}->A00:I")
                "ctor_argument" -> cell.methods.single { it.name == "<init>" }.replaceInstruction(4, "const/4 p11, 0x0")
                "ctor_receiver" -> cell.methods.single { it.name == "<init>" }.replaceInstruction(4, "const/4 p0, 0x0")
                "field" -> fixture[0] = fixtureClass(cell.type, cell.methods.toList(), superclass = cell.superclass!!,
                    extraFields = listOf(ImmutableField(cell.type, "A00", "Ljava/lang/String;", AccessFlags.PUBLIC.value, null, null, null)))
                "superclass" -> fixture[0] = fixtureClass(cell.type, cell.methods.toList(), extraFields = cell.fields.toList())
                "extra" -> fixture.add(fixtureClass("LX/ExtraSource;", fixture[1].methods.toList()))
                "duplicate" -> fixture.add(cell)
            }
            assertTrue(findAiStickerCells(fixture).isEmpty(), change)
            assertFailsWith<PatchException>(change) { validateControls(mirroredControls(fixture), setOf("ai_sticker_cell")) }
        }
    }

    /** Checks [method]'s grid injection keeps every original instruction in order and every original branch on its target. */
    private fun assertGridInjected(method: MutableMethod, where: String, sites: Int) {
        val before = method.implementation!!.instructions.toList()
        val targets = before.indices.filter { before[it] is OffsetInstruction }.associateWith { before.branchTarget(it) }
        val grid = method.validateAiStickerGrid()
        assertEquals(sites, grid.sites.size, where)
        for (site in grid.sites) assertEquals(Opcode.INSTANCE_OF, before[site - 2].opcode, where)
        method.injectAiStickerGrid()
        val after = method.implementation!!.instructions.toList()
        fun moved(at: Int) = at + 7 * grid.sites.count { it <= at }
        assertEquals(before.size + 7 * sites, after.size, where)
        val addresses = after.runningFold(0) { sum, instruction -> sum + instruction.codeUnits }
        for (at in before.indices) {
            val now = after[moved(at)]
            // dexlib2 widens a goto whose jump grew past 8 bits (584 has one), and only that one; the target check below still pins it.
            if (before[at].opcode == Opcode.GOTO && now.opcode in setOf(Opcode.GOTO_16, Opcode.GOTO_32)) {
                assertTrue(addresses[after.branchTarget(moved(at))] - addresses[moved(at)] !in -128..127, "$where goto $at widened")
                continue
            }
            assertSame(before[at], now, "$where instruction $at")
        }
        for ((at, target) in targets) assertEquals(moved(target), after.branchTarget(moved(at)), "$where branch $at")
        for (site in grid.sites) {
            val block = site + 7 * grid.sites.count { it < site }
            assertEquals("ai_stickers", ((after[block] as ReferenceInstruction).reference as StringReference).string, where)
            assertEquals(grid.flag, (after[block] as OneRegisterInstruction).registerA, where)
            assertEquals("$SETTINGS->enabled(Ljava/lang/String;)Z", (after[block + 1] as ReferenceInstruction).reference.toString(), where)
            assertEquals(Opcode.MOVE_RESULT, after[block + 2].opcode, where)
            assertEquals(Opcode.IF_EQZ, after[block + 3].opcode, where)
            assertEquals(block + 6, after.branchTarget(block + 3), where)
            assertEquals(0, (after[block + 4] as NarrowLiteralInstruction).narrowLiteral, where)
            // On: straight back to the loop's hasNext, so the item never reaches the grid.
            assertEquals(Opcode.GOTO_16, after[block + 5].opcode, where)
            assertEquals(moved(grid.skip), after.branchTarget(block + 5), where)
            // Off: the flag gets back the instance-of result it held, then the branch runs as it shipped.
            assertEquals(1, (after[block + 6] as NarrowLiteralInstruction).narrowLiteral, where)
            assertSame(before[site], after[block + 7], where)
        }
    }

    @Test fun theGridSkipsOnlyTheGenerateItemsAndEveryOtherBranchKeepsItsTarget() {
        for (profile in controlProfiles.values.toSet()) for (ai in listOf(false, true)) {
            activeProfile = profile
            val fixture = aiStickerCellFixture(grid = true, gridAi = ai)
            val discovered = mirroredControls(fixture)
            // The grid stays the cell's one Generate menu source, so the cell hook is found alongside it.
            validateControls(discovered, setOf("ai_sticker_cell", "ai_sticker_grid"))
            val method = discovered.getValue("ai_sticker_grid").single() as MutableMethod
            val code = method.implementation!!.instructions.toList()
            val grid = method.validateAiStickerGrid()
            assertEquals(4, grid.flag)
            assertEquals("Ljava/util/Iterator;->hasNext()Z", (code[grid.skip] as ReferenceInstruction).reference.toString())
            val menu = aiCells.single { it.render == activeProfile.hooks.getValue("ai_sticker_cell").single() }.menu
            // 585 dropped the Generate AI item from the grid; a build that still lists it gets that branch skipped too.
            assertEquals(listOf(menu) + listOfNotNull(GENERATE_AI_LABEL.takeIf { ai }),
                grid.sites.map { (code[it] as NarrowLiteralInstruction).narrowLiteral })
            assertGridInjected(method, "fixture", if (ai) 2 else 1)
        }
        // A bare render that builds the menu cell with no loop around it is no grid.
        assertTrue(findAiStickerGrids(aiStickerCellFixture()).isEmpty())
        // An item branch whose label isn't a Generate label is no Generate item: the grid is found, and only its menu branch is skipped.
        activeProfile = SYNTHETIC_PROFILE
        val relabelled = mirroredControls(aiStickerCellFixture(gridAi = true, gridChange = "ai_label")).getValue("ai_sticker_grid").single() as MutableMethod
        val relabelledCode = relabelled.implementation!!.instructions.toList()
        assertEquals(listOf(aiCells.single { it.render == activeProfile.hooks.getValue("ai_sticker_cell").single() }.menu),
            relabelled.validateAiStickerGrid().sites.map { (relabelledCode[it] as NarrowLiteralInstruction).narrowLiteral })
    }

    @Test fun aGridThatChangesShapeIsRefused() {
        for (change in listOf("menu_label", "flag", "cast", "back_edge", "entered", "ai_entered", "unfed", "stray")) {
            val fixture = aiStickerCellFixture(gridChange = change)
            assertTrue(findAiStickerGrids(fixture).isEmpty(), change)
            assertFailsWith<PatchException>(change) { validateControls(mirroredControls(fixture), setOf("ai_sticker_grid")) }
        }
        // The stock grid passes the same checks, so each refusal above is the change's own.
        validateControls(mirroredControls(aiStickerCellFixture(grid = true)), setOf("ai_sticker_grid"))
    }

    @Test fun exactStockGridSkipsOnlyItsGenerateMenuBranch() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val grids = findAiStickerGrids(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue("ai_sticker_grid"), grids.map { it.hookId() }.toSet(), code)
            assertGridInjected(MutableMethod(grids.single()), code, 1)
        }
    }

    @Test fun exactStockInputsKeepEveryLifecycleInstructionAndNativeCellBody() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        assertEquals(controlProfiles.keys.map { it.toString() }.toSet(), apks.map { it.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-') }.toSet())
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val expectedHash = Files.readAllLines(Path.of("../scripts/profiles/$code.txt")).single { it.startsWith("sha256 ") }.substringAfter(' ')
            val digest = MessageDigest.getInstance("SHA-256")
            Files.newInputStream(apk).use { input -> val buffer = ByteArray(1024 * 1024); while (true) { val n = input.read(buffer); if (n < 0) break; digest.update(buffer, 0, n) } }
            assertEquals(expectedHash, digest.digest().joinToString("") { "%02x".format(it) })
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val discovered = mirroredControls(classes)
            validateControls(discovered, setOf("ai_sticker_cell", "screenshot_viewers", EMOJI_DRAWER, ANALYTICS_UPLOADS, MESSAGE_LOG))
            // The emoji drawer rides on the same discovery: every flag read takes the helper and nothing else moves.
            val drawerReads = discovered.getValue(EMOJI_DRAWER).sumOf { assertEmojiDrawerInjected(it, "$code ${it.hookId()}") }
            assertEquals(EMOJI_DRAWER_READS, drawerReads, code)
            // So do the analytics uploads: each entry point keeps every original instruction after the switch's guard.
            for (native in discovered.getValue(ANALYTICS_UPLOADS)) {
                val method = MutableMethod(native)
                val before = method.implementation!!.instructions.toList()
                method.injectAnalyticsUpload()
                val after = method.implementation!!.instructions.toList()
                assertEquals(before, after.drop(after.size - before.size), "$code ${native.hookId()}")
            }
            // The message log lands on the one new-message notification constructor and keeps its body after the guard.
            val notification = discovered.getValue(MESSAGE_LOG).single()
            assertEquals(activeProfile.hooks.getValue(MESSAGE_LOG).single(), notification.hookId(), code)
            val logMethod = MutableMethod(notification)
            val logBefore = logMethod.implementation!!.instructions.toList()
            logMethod.injectMessageLog()
            val logAfter = logMethod.implementation!!.instructions.toList()
            assertEquals(logBefore, logAfter.drop(logAfter.size - logBefore.size), "$code ${notification.hookId()}")
            val cell = discovered.getValue("ai_sticker_cell").single()
            assertEquals(activeProfile.hooks.getValue("ai_sticker_cell").single(), cell.hookId())
            val viewers = discovered.getValue("screenshot_viewers")
            assertEquals(4, viewers.sumOf { it.screenshotViewerSites().size })
            for (native in viewers) {
                val method = MutableMethod(native)
                val before = method.implementation!!.instructions.toList()
                val sites = method.screenshotViewerSites()
                method.injectScreenshotViewer()
                val after = method.implementation!!.instructions.toList()
                assertEquals(before.filterIndexed { i, _ -> i !in sites }, after.filterIndexed { i, _ -> i !in sites }, code)
            }
            val render = MutableMethod(cell)
            val before = render.implementation!!.instructions.toList()
            val tries = render.implementation!!.tryLocations()
            render.injectAiStickerCell()
            val after = render.implementation!!.instructions.toList()
            assertEquals(before, after.drop(12), code)
            assertShiftedTries(tries, render, after.take(12).sumOf { it.codeUnits })
            assertEquals(4, render.implementation!!.tryBlocks.size)
        }
    }
}
