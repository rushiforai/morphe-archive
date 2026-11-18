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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/** The home screen, its tab type and the tab configuration that holds the list, as 587 names them. */
private const val HOME = "LX/Tc5;"
private const val TAB = "LX/Tc6;"
private const val TAB_CONFIGURATION = "LX/Tc7;"

private const val READER = "$HOME->A1h()$TAB"
private const val SELECT = "$HOME->A1n($TAB)V"
internal const val SYNTHETIC_TAB_SWIPE =
    "$HOME->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;"

/** What the patch writes for the fixture: the current-tab read, the configuration field, its list and the switch. */
internal val SYNTHETIC_SWIPE_ROUTE = TabSwipeRoute(READER, "$HOME->A0C:$TAB_CONFIGURATION",
    "$TAB_CONFIGURATION->A00:Ljava/util/List;", SELECT)

/**
 * The home screen's current tab as 587 writes it: the configuration out of the fragment's own field, its list, the
 * index of the tab showing, and the cast of what the list hands back.
 */
private val READER_BODY = """
    iget-object v1, p0, $HOME->A0C:$TAB_CONFIGURATION
    iget-object v1, v1, $TAB_CONFIGURATION->A00:Ljava/util/List;
    iget v0, p0, $HOME->A02:I
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, $TAB
    return-object v0
""".trimIndent()

/** The switch a tab button's click listener calls: the tab passed on with no arguments of its own. */
private val SELECT_BODY = """
    const/4 v0, 0x0
    invoke-virtual {p0, v0, p1}, $HOME->A1s(Landroid/os/Bundle;$TAB)Z
    return-void
""".trimIndent()

/** The home screen's view builder, cut down: the page for the tab showing, inflated into the fragment's root. */
private val VIEW_BODY = """
    const/4 v0, 0x0
    invoke-virtual {p0}, $READER
    move-result-object v1
    invoke-static {p1, p2, v0}, LX/Tc8;->A00(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;I)Landroid/view/View;
    move-result-object v3
    return-object v3
""".trimIndent()

private fun reader(body: String = READER_BODY, id: String = READER, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value) =
    fixtureMethod(id, body, 3, flags)

private fun select(body: String = SELECT_BODY, id: String = SELECT, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value) =
    fixtureMethod(id, body, 3, flags)

private fun homeViewBuilder(body: String = VIEW_BODY, id: String = SYNTHETIC_TAB_SWIPE, registers: Int = 8) =
    fixtureMethod(id, body, registers)

/** The home screen with everything Swipe between tabs reads off it. */
internal fun tabSwipeFixture(
    read: MutableMethod = reader(),
    switch: MutableMethod = select(),
    view: MutableMethod = homeViewBuilder(),
): List<MutableClass> = listOf(fixtureClass(HOME, listOfNotNull(read, switch, view)))

private fun Method.code() = implementation!!.instructions.toList()

class TabSwipeTest {
    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(TAB_SWIPE).map { it.hookId() }

    private fun string(stub: Method) =
        ((stub.implementation!!.instructions.first() as ReferenceInstruction).reference as StringReference).string

    private fun classOf(classes: List<MutableClass>) = { type: String -> classes.firstOrNull { it.type == type } }

    @Test fun theHomeScreensViewBuilderIsTheHook() {
        val classes = tabSwipeFixture()
        assertEquals(listOf(SYNTHETIC_TAB_SWIPE), found(classes))
        validateControls(mirroredControls(classes), setOf(TAB_SWIPE))
        assertEquals(SYNTHETIC_SWIPE_ROUTE, resolveTabSwipe(classes.single().methods.single { it.hookId() == SYNTHETIC_TAB_SWIPE },
            classOf(classes)))
    }

    // Everything the extension reflects on has to be in the route, in the order Route.of reads it.
    @Test fun theRouteNamesTheFourMembersTheExtensionLooksUp() {
        assertEquals(listOf(READER, "$HOME->A0C:$TAB_CONFIGURATION", "$TAB_CONFIGURATION->A00:Ljava/util/List;", SELECT),
            SYNTHETIC_SWIPE_ROUTE.toString().split("|"))
    }

    @Test fun aHomeScreenThatMovedIsNoHook() {
        for ((case, classes) in listOf(
            "no current tab" to tabSwipeFixture(read = reader(READER_BODY.replace("iget v0, p0, $HOME->A02:I", "const/4 v0, 0x0"))),
            "the index off something else" to tabSwipeFixture(read = reader(READER_BODY.replace("iget v0, p0,", "iget v0, v1,"))),
            "the list off another holder" to tabSwipeFixture(
                read = reader(READER_BODY.replace("iget-object v1, v1, $TAB_CONFIGURATION->A00", "iget-object v1, p0, LX/Other;->A00"))),
            "nothing cast" to tabSwipeFixture(read = reader(READER_BODY.replace("check-cast v0, $TAB\n", ""), READER.replace(TAB, "Ljava/lang/Object;"))),
            "a static read" to tabSwipeFixture(read = reader(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)),
            "no switch" to tabSwipeFixture(switch = select(SELECT_BODY.replace("invoke-virtual {p0, v0, p1}", "invoke-virtual {p0, p1, v0}"))),
            "the switch keeps the answer" to tabSwipeFixture(
                switch = select(SELECT_BODY.replace("return-void", "move-result v0\nreturn-void"))),
            "the switch calls elsewhere" to tabSwipeFixture(switch = select(SELECT_BODY.replace("$HOME->A1s", "LX/Other;->A1s"))),
            "two ways back" to tabSwipeFixture(view = homeViewBuilder(VIEW_BODY.replace("move-result-object v3",
                "move-result-object v3\nif-eqz v0, :out\nreturn-object v3\n:out"))),
            "a jump onto the way back" to tabSwipeFixture(view = homeViewBuilder(VIEW_BODY.replace("const/4 v0, 0x0",
                "const/4 v0, 0x0\nif-eqz v0, :out").replace("return-object v3", ":out\nreturn-object v3"))),
            "no locals" to tabSwipeFixture(view = homeViewBuilder(registers = 4)),
        )) {
            assertTrue(found(classes).isEmpty(), case)
        }
        // Two home screens can't say which one is Messenger's. Every name in the copy moves, since a reader only
        // counts when the index and the configuration it reads are the fragment's own fields.
        fun moved(text: String) =
            text.replace(HOME, "LX/Tc9;").replace(TAB_CONFIGURATION, "LX/TcB;").replace(TAB, "LX/TcA;")
        val second = listOf(reader(moved(READER_BODY), moved(READER)),
            select(moved(SELECT_BODY), moved(SELECT)),
            homeViewBuilder(moved(VIEW_BODY), moved(SYNTHETIC_TAB_SWIPE)))
        assertTrue(found(tabSwipeFixture() + fixtureClass("LX/Tc9;", second)).isEmpty())
    }

    @Test fun theRouteIsWrittenOnlyIntoTheExtensionsEmptyStub() {
        val stub = tabSwipeRouteMethod()
        stub.writeTabSwipeRoute(SYNTHETIC_SWIPE_ROUTE)
        assertEquals(listOf(Opcode.CONST_STRING, Opcode.RETURN_OBJECT), stub.implementation!!.instructions.map { it.opcode })
        assertEquals(SYNTHETIC_SWIPE_ROUTE.toString(), string(stub))
        // A second write would mean two runs share one stub.
        assertFailsWith<PatchException> { stub.writeTabSwipeRoute(SYNTHETIC_SWIPE_ROUTE) }
        for (changed in listOf(
            tabSwipeRouteMethod("const/4 v0, 0x0\nreturn-object v0"),
            tabSwipeRouteMethod("const-string v0, \"\"\nconst-string v0, \"\"\nreturn-object v0"),
            tabSwipeRouteMethod(flags = AccessFlags.PUBLIC.value),
            fixtureMethod(TAB_SWIPE_ROUTE.replace("tabSwipeRoute", "other"), "const-string v0, \"\"\nreturn-object v0", 1, AccessFlags.STATIC.value),
        )) {
            assertFailsWith<PatchException> { changed.writeTabSwipeRoute(SYNTHETIC_SWIPE_ROUTE) }
        }
    }

    @Test fun theViewGoesThroughTheFrameOnEveryPathAndNothingElseMoves() {
        val classes = tabSwipeFixture()
        val view = classes.single().methods.single { it.hookId() == SYNTHETIC_TAB_SWIPE } as MutableMethod
        val before = view.code()
        val exit = before.indices.single { before[it].opcode == Opcode.RETURN_OBJECT }
        injectControl(TAB_SWIPE, mapOf(TAB_SWIPE to listOf(view)))
        val after = view.code()
        assertEquals(before.take(exit).map { it.opcode }, after.take(exit).map { it.opcode })
        assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT,
            Opcode.RETURN_OBJECT), after.drop(exit).map { it.opcode })
        val call = after[exit + 2] as FiveRegisterInstruction
        assertEquals(TAB_SWIPE_WRAP, (call as ReferenceInstruction).reference.toString())
        assertEquals(listOf(0, 1), listOf(call.registerC, call.registerD))
        // The view the builder was handing back, and the fragment itself, are what the frame is given.
        assertEquals((before[exit] as OneRegisterInstruction).registerA, (after[exit] as TwoRegisterInstruction).registerB)
        assertEquals(view.parameterRegister(0), (after[exit + 1] as TwoRegisterInstruction).registerB)
        assertEquals(0, (after[exit + 4] as OneRegisterInstruction).registerA)
    }

    @Test fun aBuilderTheFrameCantGoIntoIsRefused() {
        for ((case, method) in listOf(
            "two ways back" to homeViewBuilder(VIEW_BODY.replace("return-object v3", "return-object v3\nreturn-object v3")),
            "no locals" to homeViewBuilder(registers = 4),
            "another method" to reader(),
        )) {
            assertFailsWith<PatchException>(case) { method.injectTabSwipe() }
        }
    }

    @Test fun everySupportedBuildHasOneHomeScreenToSwipe() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val view = findTabSwipe(classes).singleOrNull() ?: error("$code has no home screen to swipe")
            assertEquals(controlProfileFor(code).hooks.getValue(TAB_SWIPE), setOf(view.hookId()), code)
            val route = resolveTabSwipe(view) { type -> classes.firstOrNull { it.type == type } }
            val stub = tabSwipeRouteMethod()
            stub.writeTabSwipeRoute(route)
            assertEquals(route.toString(), string(stub), code)
            // The switch takes the tab the current-tab read hands back, which is what the extension calls it with.
            assertEquals(route.current.substringAfter(")"), route.select.substringAfter("(").substringBefore(")"), code)
        }
    }
}
