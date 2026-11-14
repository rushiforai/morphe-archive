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
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

private const val ITEMS_MENU = "LX/HzM;"
private const val ITEMS_BUILDER = "LX/HzB;"
private const val ITEMS_ROW = "LX/HzR;"
private const val ITEMS_ICONS = "LX/1zI;"
private const val ITEMS_FACTORY = "$ITEMS_BUILDER->A00()$ITEMS_BUILDER"
private const val ITEMS_TITLE = "$ITEMS_BUILDER->A09(Ljava/lang/CharSequence;)V"
private const val ITEMS_DESCRIPTION = "$ITEMS_BUILDER->A06:Ljava/lang/String;"
private const val ITEMS_BUILD = "$ITEMS_BUILDER->A02(${ITEMS_BUILDER}Ljava/lang/String;)$ITEMS_ROW"

/** The menu's row list as 586 has it, cut down: one row through the builder, the padding up to the menu's count, the list back. */
private val ITEMS_BODY = """
    const/4 v0, 0x2
    invoke-static {v0}, LX/001;->A0z(I)Ljava/util/ArrayList;
    move-result-object v3
    invoke-static {}, $ITEMS_FACTORY
    move-result-object v1
    const/16 v0, 0x4b
    iput v0, v1, $ITEMS_BUILDER->A00:I
    sget-object v0, $ITEMS_ICONS->A6Q:$ITEMS_ICONS
    invoke-virtual {v1, v0}, $ITEMS_BUILDER->A08($ITEMS_ICONS)V
    const-string v2, "Mute"
    invoke-virtual {v1, v2}, $ITEMS_TITLE
    iput-object v2, v1, $ITEMS_DESCRIPTION
    const-string v0, "mute"
    invoke-static {v1, v0}, $ITEMS_BUILD
    move-result-object v0
    invoke-virtual {v3, v0}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z
    :pad
    invoke-virtual {v3}, Ljava/util/AbstractCollection;->size()I
    move-result v1
    const/4 v0, 0x2
    if-ge v1, v0, :done
    const/4 v0, 0x0
    invoke-virtual {v3, v0}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z
    goto :pad
    :done
    return-object v3
""".trimIndent()

private fun menuItemsRows(body: String = ITEMS_BODY, registers: Int = 6) = fixtureMethod(SYNTHETIC_HIDDEN_ROW, body, registers = registers)

private fun Method.items(): List<Instruction> = implementation!!.instructions.toList()

private fun List<Instruction>.calls(reference: String) = count { (it as? ReferenceInstruction)?.reference?.toString() == reference }

class ChatMenuItemsTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    @Test fun theMenusRowListIsFoundAndProvedWithOrWithoutTheEyeIcons() {
        for (eyes in listOf(listOf("EYE", "EYE_CROSS"), listOf("EYE"))) {
            // The mirror also checks CompatReport finds the same list, and only when the patch would prove it.
            val found = mirroredControls(hiddenChatsMenuFixture(eyes = eyes))
            assertEquals(listOf(SYNTHETIC_HIDDEN_ROW), found.getValue(CHAT_MENU_ITEMS).map { it.hookId() }, "$eyes")
            validateControls(found, setOf(CHAT_MENU_ITEMS))
        }
        assertEquals(setOf(SYNTHETIC_HIDDEN_ROW), SYNTHETIC_PROFILE.hooks.getValue(CHAT_MENU_ITEMS))
        assertEquals(BASE_PROFILE.hooks.getValue(HIDDEN_CHAT_ROW), BASE_PROFILE.hooks.getValue(CHAT_MENU_ITEMS))
    }

    @Test fun theRouteNamesTheBuildersFactoryTitleDescriptionAndBuild() {
        val site = assertNotNull(menuItemsRows().hiddenRowSite())
        assertEquals(listOf(ITEMS_FACTORY, ITEMS_TITLE, ITEMS_DESCRIPTION, ITEMS_BUILD).joinToString("|"), site.builder.menuItemsRoute())
    }

    @Test fun on587TheRouteNamesTheDescriptionSetter() {
        val setter = "$ITEMS_BUILDER->A0A(Ljava/lang/String;)V"
        val site = assertNotNull(menuItemsRows(ITEMS_BODY.replace("iput-object v2, v1, $ITEMS_DESCRIPTION", "invoke-virtual {v1, v2}, $setter")).hiddenRowSite())
        assertEquals(listOf(ITEMS_FACTORY, ITEMS_TITLE, setter, ITEMS_BUILD).joinToString("|"), site.builder.menuItemsRoute())
    }

    @Test fun theExtensionGetsTheListJustBeforeItGoesBackAndThePaddingLoopStillEndsThere() {
        val rows = menuItemsRows()
        val before = rows.items()
        injectControl(CHAT_MENU_ITEMS, mapOf(CHAT_MENU_ITEMS to listOf(rows)))
        val code = rows.items()
        assertEquals(before.size + 2, code.size)
        assertEquals(before.dropLast(1), code.dropLast(3))
        assertEquals(listOf(Opcode.CONST_STRING, Opcode.INVOKE_STATIC, Opcode.RETURN_OBJECT), code.takeLast(3).map { it.opcode })
        val route = code[code.size - 3]
        assertEquals(0, (route as OneRegisterInstruction).registerA)
        assertEquals(listOf(ITEMS_FACTORY, ITEMS_TITLE, ITEMS_DESCRIPTION, ITEMS_BUILD).joinToString("|"),
            ((route as ReferenceInstruction).reference as StringReference).string)
        assertEquals(CHAT_MENU_ITEMS_CALL, (code[code.size - 2] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(3, 0), (code[code.size - 2] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
        assertEquals(3, (code.last() as OneRegisterInstruction).registerA)
        assertEquals(code.size - 3, code.branchTarget(code.indexOfFirst { it.opcode == Opcode.IF_GE }))
    }

    // Hide chosen chats adds its row to the same list. Whichever edit comes first, both calls run once, the list still
    // goes back once, and the padding loop's exit lands on the first edit.
    @Test fun hideChosenChatsOnTheSameListWorksInEitherOrder() {
        for (order in listOf(listOf(HIDDEN_CHAT_ROW, CHAT_MENU_ITEMS), listOf(CHAT_MENU_ITEMS, HIDDEN_CHAT_ROW))) {
            val rows = menuItemsRows()
            val before = rows.items()
            for (hook in order) injectControl(hook, mapOf(hook to listOf(rows)))
            val code = rows.items()
            assertEquals(before.size + 4, code.size, "$order")
            assertEquals(1, code.calls(HIDE_ROW_CALL), "$order")
            assertEquals(1, code.calls(CHAT_MENU_ITEMS_CALL), "$order")
            assertEquals(1, code.count { it.opcode == Opcode.RETURN_OBJECT }, "$order")
            assertEquals(3, (code.last() as OneRegisterInstruction).registerA, "$order")
            assertEquals(code.size - 5, code.branchTarget(code.indexOfFirst { it.opcode == Opcode.IF_GE }), "$order")
            val first = code.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() in setOf(HIDE_ROW_CALL, CHAT_MENU_ITEMS_CALL) }
            val expected = if (order.first() == HIDDEN_CHAT_ROW) HIDE_ROW_CALL else CHAT_MENU_ITEMS_CALL
            assertEquals(expected, (code[first] as ReferenceInstruction).reference.toString(), "$order")
        }
    }

    @Test fun aRowListItCantUseIsRefusedBeforeAnyEdit() {
        val cases = mapOf(
            "the rows out of a plain call's reach" to menuItemsRows(ITEMS_BODY.replace("return-object v3", "move-object/from16 v16, v3\nreturn-object v16"), registers = 20),
            "two returns" to menuItemsRows("$ITEMS_BODY\nreturn-object v3"),
            "no row builder" to menuItemsRows(ITEMS_BODY.replace("invoke-static {v1, v0}, $ITEMS_BUILD\nmove-result-object v0\n", "")),
            "no title setter" to menuItemsRows(ITEMS_BODY.replace("invoke-virtual {v1, v2}, $ITEMS_TITLE\n", "")),
        )
        for ((case, rows) in cases) {
            val before = rows.items()
            assertFailsWith<PatchException>(case) { injectControl(CHAT_MENU_ITEMS, mapOf(CHAT_MENU_ITEMS to listOf(rows))) }
            assertEquals(before, rows.items(), case)
        }
    }

    @Test fun everySupportedBuildFindsTheRowListAndRoutesTheBuilderHideChosenChatsUses() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val byType = classes.associateBy { it.type }
            val menu = findHiddenChats(classes)
            val rows = chatMenuRows(menu)
            assertEquals(activeProfile.hooks.getValue(CHAT_MENU_ITEMS), rows.map { it.hookId() }.toSet(), code)
            val row = rows.single()
            val list = byType.getValue(INBOX_SUPPLIER).methods.single { it.hiddenListSite() != null }
            // The same builder pieces Hide chosen chats proves on this build, read from its own stock dex.
            val chats = resolveHiddenChatRoute(list, row, menu.getValue(HIDDEN_CHAT_TAP).single()) { byType[it] }
            val route = assertNotNull(row.hiddenRowSite()).builder.menuItemsRoute()
            assertEquals(listOf(chats.factory, chats.title, chats.description, chats.build).joinToString("|"), route, code)
            val mutable = MutableMethod(row)
            val before = mutable.items()
            injectControl(CHAT_MENU_ITEMS, mapOf(CHAT_MENU_ITEMS to listOf(mutable)))
            val after = mutable.items()
            assertEquals(before.size + 2, after.size, code)
            assertEquals(1, after.calls(CHAT_MENU_ITEMS_CALL), code)
            assertTrue(after.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == route }, code)
        }
    }
}
