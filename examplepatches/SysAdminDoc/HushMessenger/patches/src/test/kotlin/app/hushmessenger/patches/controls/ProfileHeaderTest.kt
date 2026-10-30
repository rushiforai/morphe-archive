package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue

internal const val SYNTHETIC_PROFILE_HEADER = "LX/AXJ;->A0p(LX/1RI;)LX/1IG;"

private const val ACTIONS = "LX/8Nt;"
private const val READ = "iget-object v9, v3, LX/AXJ;->A08:Ljava/util/List;"

/**
 * The empty chat header row's render as 585 writes it: its own action list read once, its name, then the list asked for
 * View profile (A2L) and for the chat details action (A21).
 */
private fun headerRow(
    read: String = READ,
    between: String = "",
    name: String = "const-string v11, \"$HEADER_ROW\"",
    asked: String = "v9",
    jump: String = "",
    id: String = SYNTHETIC_PROFILE_HEADER,
    flags: Int = AccessFlags.PUBLIC.value,
) = fixtureMethod(id, """
        $jump
        $read
        :after_read
        $between
        $name
        sget-object v10, $ACTIONS->A2L:$ACTIONS
        invoke-interface {$asked, v10}, Ljava/util/List;->contains(Ljava/lang/Object;)Z
        move-result v0
        sget-object v1, $ACTIONS->A21:$ACTIONS
        invoke-interface {$asked, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z
        move-result v2
        const/4 v0, 0x0
        return-object v0
    """.trimIndent(), registers = 20, flags = flags)

/** The action enum's initializer, naming A21 and A2L the way Messenger's does. */
private fun headerEnum(viewProfile: String = "const-string v1, \"$VIEW_PROFILE\"", superclass: String = "Ljava/lang/Enum;") =
    fixtureClass(ACTIONS, listOf(fixtureMethod("$ACTIONS-><clinit>()V", """
        new-instance v0, $ACTIONS
        const-string v1, "THREAD_DETAILS"
        const/4 v2, 0x0
        invoke-direct {v0, v1, v2}, $ACTIONS-><init>(Ljava/lang/String;I)V
        sput-object v0, $ACTIONS->A21:$ACTIONS
        new-instance v0, $ACTIONS
        $viewProfile
        const/4 v2, 0x1
        invoke-direct {v0, v1, v2}, $ACTIONS-><init>(Ljava/lang/String;I)V
        sput-object v0, $ACTIONS->A2L:$ACTIONS
        return-void
    """.trimIndent(), registers = 3, flags = AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value)), superclass = superclass)

/** The row and its enum for the catalog-wide discovery fixture. */
internal fun profileHeaderFixture() = listOf(fixtureClass("LX/AXJ;", listOf(headerRow())), headerEnum())

private fun Method.code() = implementation!!.instructions.toList()

/** The helper pair sits right after the list read, and nothing stock moves or changes. */
private fun assertHeaderHook(before: List<Instruction>, after: List<Instruction>, read: Int, label: String) {
    val list = (before[read] as TwoRegisterInstruction).registerA
    assertEquals(before.size + 2, after.size, label)
    assertStockKept(before, after.filterIndexed { i, _ -> i != read + 1 && i != read + 2 }, label)
    val helper = after[read + 1] as FiveRegisterInstruction
    assertEquals(Opcode.INVOKE_STATIC, helper.opcode, label)
    assertEquals(PROFILE_HEADER_HELPER, (helper as ReferenceInstruction).reference.toString(), label)
    assertEquals(listOf(1, list), listOf(helper.registerCount, helper.registerC), label)
    assertEquals(Opcode.MOVE_RESULT_OBJECT, after[read + 2].opcode, label)
    assertEquals(list, (after[read + 2] as OneRegisterInstruction).registerA, label)
}

class ProfileHeaderTest {
    @AfterTest fun reset() { activeProfile = SYNTHETIC_PROFILE }

    @Test fun theRowsActionListGoesThroughTheExtensionRightAfterTheRead() {
        val method = headerRow()
        val found = mirroredControls(profileHeaderFixture())
        assertEquals(listOf(SYNTHETIC_PROFILE_HEADER), found.getValue(FACEBOOK_PROFILE_HEADER).map { it.hookId() })
        validateControls(found, setOf(FACEBOOK_PROFILE_HEADER))
        val before = method.code()
        val actions = assertNotNull(method.headerActions())
        assertEquals(listOf("A2L", "A21"), actions.checked.map { it.name })
        injectControl(FACEBOOK_PROFILE_HEADER, mapOf(FACEBOOK_PROFILE_HEADER to listOf(method)))
        assertHeaderHook(before, method.code(), actions.read, "row")
    }

    @Test fun aRowThatMovedIsntFound() {
        val moved = mapOf(
            "no row name" to headerRow(name = ""),
            "list read from another class" to headerRow(read = READ.replace("LX/AXJ;->", "LX/AXK;->")),
            "two list reads" to headerRow(between = "iget-object v4, v3, LX/AXJ;->A09:Ljava/util/List;"),
            "list overwritten before the checks" to headerRow(between = "const/4 v9, 0x0"),
            "another list asked" to headerRow(asked = "v4"),
            "static render" to headerRow(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
        )
        for ((case, method) in moved) assertNull(method.headerActions(), case)
    }

    @Test fun onlyTheOneRowThatAsksForViewProfileIsHooked() {
        val row = fixtureClass("LX/AXJ;", listOf(headerRow()))
        val others = mapOf(
            "no View profile constant" to listOf(row, headerEnum(viewProfile = "const-string v1, \"VIEW_DETAILS\"")),
            "two names for one constant" to listOf(row, headerEnum(viewProfile = "const-string v1, \"VIEW_PROFILE\"\nconst-string v2, \"X\"")),
            "constants not an enum" to listOf(row, headerEnum(superclass = "Ljava/lang/Object;")),
            "enum missing" to listOf(row),
            "two rows" to profileHeaderFixture() +
                fixtureClass("LX/AXI;", listOf(headerRow(read = READ.replace("LX/AXJ;->", "LX/AXI;->"), id = SYNTHETIC_PROFILE_HEADER.replace("LX/AXJ;", "LX/AXI;")))),
        )
        for ((case, classes) in others) assertTrue(mirroredControls(classes).getValue(FACEBOOK_PROFILE_HEADER).isEmpty(), case)
    }

    @Test fun aJumpPastTheReadStopsBeforeAnyEdit() {
        // A path landing right past the read would reach the row with the stock list.
        val jumped = headerRow(jump = "if-eqz v3, :after_read")
        val found = mirroredControls(listOf(fixtureClass("LX/AXJ;", listOf(jumped)), headerEnum()))
        assertEquals(listOf(SYNTHETIC_PROFILE_HEADER), found.getValue(FACEBOOK_PROFILE_HEADER).map { it.hookId() })
        val before = jumped.code()
        val failure = assertFailsWith<PatchException> { injectControl(FACEBOOK_PROFILE_HEADER, mapOf(FACEBOOK_PROFILE_HEADER to listOf(jumped))) }
        assertContains(failure.message.orEmpty(), "empty chat header's buttons moved")
        assertEquals(before, jumped.code())
    }

    @Test fun everySupportedBuildHooksItsOneHeaderRow() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val rows = findProfileHeader(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(FACEBOOK_PROFILE_HEADER), rows.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(FACEBOOK_PROFILE_HEADER to rows), setOf(FACEBOOK_PROFILE_HEADER))
            val method = MutableMethod(rows.single())
            val before = method.code()
            val read = method.headerActions()!!.read
            method.injectProfileHeader()
            assertHeaderHook(before, method.code(), read, code)
        }
    }
}
