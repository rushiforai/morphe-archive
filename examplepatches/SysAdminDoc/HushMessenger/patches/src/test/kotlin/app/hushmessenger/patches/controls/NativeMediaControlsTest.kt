package app.hushmessenger.patches.controls

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

/** [castActivity] adds 581's check-cast of the provider result in v0, which moves the window code down one. */
internal fun screenshotViewerFixture(id: String, quickSize: Int = 438, castActivity: Boolean = false): MutableMethod {
    val body: String
    val registers: Int
    when {
        id.contains("->onResume(") -> {
            registers = 5
            body = List(7) { "nop" }.joinToString("\n") + "\n" + (if (castActivity) "check-cast v0, LX/Provider;\n" else "") + """
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
            """.trimIndent() + "\n" + List(24) { "nop" }.joinToString("\n") + "\nreturn-void"
        }
        id.contains("->onCreateView(") -> {
            registers = 23
            body = List(25) { "nop" }.joinToString("\n") + "\n" + """
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
            """.trimIndent() + "\n" + List(quickSize - 36) { "nop" }.joinToString("\n") + "\nreturn-object v0"
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
    label: Int = if (id.startsWith("LX/Ez5;")) GENERATE_AI_LABEL_581 else GENERATE_AI_LABEL,
    sourceCount: Int = if (id.startsWith("LX/Ez5;")) 5 else 4,
): List<MutableClass> {
    val type = id.substringBefore("->")
    val superclass = when (type) { "LX/FTy;", "LX/FfQ;" -> "LX/1Hw;"; "LX/FSU;" -> "LX/1IL;"; "LX/Ez5;" -> "LX/1IO;"; else -> "LX/1Hx;" }
    val size = when (type) { "LX/FfQ;" -> 106; "LX/Ez5;" -> 105; else -> 104 }
    val registers = if (type == "LX/Ez5;") 24 else 23
    val render = fixtureMethod(id, "const/4 v0, 0x0\n" + List(size - 2) { "nop" }.joinToString("\n") + "\nreturn-object v0", registers)
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
    return listOf(cell) + sources
}

private fun MethodImplementation.tryLocations() = tryBlocks.map { block ->
    Triple(block.startCodeAddress, block.codeUnitCount, block.exceptionHandlers.map { it.exceptionType to it.handlerCodeAddress })
}

private fun assertShiftedTries(before: List<Triple<Int, Int, List<Pair<String?, Int>>>>, method: MutableMethod, shift: Int) {
    assertEquals(before.map { (start, length, handlers) -> Triple(start + shift, length, handlers.map { (type, at) -> type to at + shift }) },
        method.implementation!!.tryLocations())
}

class NativeMediaControlsTest {
    @AfterTest fun reset() { activeProfile = BASE_PROFILE }

    @Test fun allMappingsReplaceOnlyTheFourCallsAndRetainTheirMasksAndLifecycle() {
        for (profile in controlProfiles.values.toSet()) {
            activeProfile = profile
            for (size in listOf(438, 439, 441, 442, 444, 448)) {
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

    @Test fun messenger581ViewerShapesKeepTheSameCallsAndRefuseAMissingCast() {
        val resume = screenshotViewerFixture("$EPHEMERAL_VIEWER->onResume()V", castActivity = true)
        val before = resume.implementation!!.instructions.toList()
        assertEquals(49, before.size)
        assertEquals(listOf(15, 22), resume.screenshotViewerSites())
        resume.injectScreenshotViewer()
        val after = resume.implementation!!.instructions.toList()
        assertEquals(before.filterIndexed { i, _ -> i !in setOf(15, 22) }, after.filterIndexed { i, _ -> i !in setOf(15, 22) })
        for (at in listOf(15, 22)) {
            assertEquals("$SETTINGS->setScreenshotFlags(Landroid/view/Window;II)V", (after[at] as ReferenceInstruction).reference.toString())
        }
        val uncast = screenshotViewerFixture("$EPHEMERAL_VIEWER->onResume()V", castActivity = true).apply { replaceInstruction(7, "nop") }
        assertFailsWith<PatchException> { uncast.screenshotViewerSites() }
        val mask = screenshotViewerFixture("$EPHEMERAL_VIEWER->onResume()V", castActivity = true).apply { replaceInstruction(10, "const/16 v1, 0x80") }
        assertFailsWith<PatchException> { mask.screenshotViewerSites() }
        assertEquals(listOf(9), screenshotViewerFixture("$EPHEMERAL_VIEWER->A1E(Landroid/os/Bundle;)Landroid/app/Dialog;").screenshotViewerSites())
        val quick = "$QUICKSNAP_VIEWER->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;"
        assertEquals(listOf(32), screenshotViewerFixture(quick, 444).screenshotViewerSites())
    }

    @Test fun messenger581CellNeedsItsOwnLabelAndFifthSource() {
        val id = "LX/Ez5;->render(LX/2AL;)LX/1Gd;"
        assertEquals(listOf(id), findAiStickerCells(aiStickerCellFixture(id, GENERATE_AI_LABEL_581, 5)).map { it.hookId() })
        assertTrue(findAiStickerCells(aiStickerCellFixture(id, GENERATE_AI_LABEL_581, 4)).isEmpty())
        assertTrue(findAiStickerCells(aiStickerCellFixture(id, GENERATE_AI_LABEL, 5)).isEmpty())
    }

    @Test fun paymentWindowsCleanupAndWrongProfileDialogNeverBecomeViewerHooks() {
        val payment = fixtureMethod("Lcom/facebook/payments/paymentmethods/cardform/CardFormActivity;->onResume()V", """
            const/16 v0, 0x2000
            invoke-virtual {v1, v0, v0}, Landroid/view/Window;->setFlags(II)V
            return-void
        """.trimIndent())
        val cleanup = fixtureMethod("$QUICKSNAP_VIEWER->onDestroyView()V", "const/16 v0, 0x2000\ninvoke-virtual {v1, v0}, Landroid/view/Window;->clearFlags(I)V\nreturn-void")
        val before = listOf(payment, cleanup).map { it.implementation!!.instructions.toList() }
        val found = findControls(listOf(fixtureClass(payment.definingClass, listOf(payment)), fixtureClass(cleanup.definingClass, listOf(cleanup))))
        assertTrue(found.getValue("screenshot_viewers").isEmpty())
        assertEquals(before, listOf(payment, cleanup).map { it.implementation!!.instructions.toList() })
        activeProfile = PROFILE_346013370
        assertFailsWith<PatchException> { screenshotViewerFixture("$EPHEMERAL_VIEWER->A1A(Landroid/os/Bundle;)Landroid/app/Dialog;").injectScreenshotViewer() }
    }

    @Test fun aLateViewerFailureCannotMutateAnExistingScreenshotHook() {
        val original = fixtureMethod("LX/N2h;->run()V", "return-void")
        val viewer = screenshotViewerFixture("$EPHEMERAL_VIEWER->onResume()V").apply { replaceInstruction(9, "const/16 v1, 0x80") }
        val before = listOf(original, viewer).map { it.implementation!!.instructions.toList() }
        assertFailsWith<PatchException> { injectControl("allow_screenshot", linkedMapOf("allow_screenshot" to listOf(original), "screenshot_viewers" to listOf(viewer))) }
        assertEquals(before, listOf(original, viewer).map { it.implementation!!.instructions.toList() })
    }

    @Test fun onlyTheProvenAiLabelCanBypassTheOriginalCellRender() {
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
            assertEquals(before, after.drop(10))
            assertEquals("${method.definingClass}->A00:I", (after[1] as ReferenceInstruction).reference.toString())
            val label = if (method.definingClass == "LX/Ez5;") GENERATE_AI_LABEL_581 else GENERATE_AI_LABEL
            assertEquals(label, (after[2] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(10, after.branchTarget(3))
            assertEquals(10, after.branchTarget(7))
            assertEquals(Opcode.IF_NE, after[3].opcode)
            assertEquals(Opcode.IF_EQZ, after[7].opcode)
            assertEquals("ai_stickers", ((after[4] as ReferenceInstruction).reference as StringReference).string)
            assertEquals("$SETTINGS->enabled(Ljava/lang/String;)Z", (after[5] as ReferenceInstruction).reference.toString())
            assertShiftedTries(tries, method, after.take(10).sumOf { it.codeUnits })
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
            assertFailsWith<PatchException>(change) { validateControls(findControls(fixture), setOf("ai_sticker_cell")) }
        }
    }

    @Test fun exactStockInputsKeepEveryLifecycleInstructionAndNativeCellBody() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val expectedHash = Files.readAllLines(Path.of("../scripts/profiles/$code.txt")).single { it.startsWith("sha256 ") }.substringAfter(' ')
            val digest = MessageDigest.getInstance("SHA-256")
            Files.newInputStream(apk).use { input -> val buffer = ByteArray(1024 * 1024); while (true) { val n = input.read(buffer); if (n < 0) break; digest.update(buffer, 0, n) } }
            assertEquals(expectedHash, digest.digest().joinToString("") { "%02x".format(it) })
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val cell = findAiStickerCells(classes).single()
            assertEquals(activeProfile.hooks.getValue("ai_sticker_cell").single(), cell.hookId())
            val viewerIds = activeProfile.hooks.getValue("screenshot_viewers")
            val viewers = classes.filter { it.type in setOf(EPHEMERAL_VIEWER, QUICKSNAP_VIEWER) }.flatMap { it.methods }.filter { it.hookId() in viewerIds }
            validateControls(mapOf("ai_sticker_cell" to listOf(cell), "screenshot_viewers" to viewers), setOf("ai_sticker_cell", "screenshot_viewers"))
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
            assertEquals(before, after.drop(10), code)
            assertShiftedTries(tries, render, after.take(10).sumOf { it.codeUnits })
            assertEquals(4, render.implementation!!.tryBlocks.size)
        }
    }
}
