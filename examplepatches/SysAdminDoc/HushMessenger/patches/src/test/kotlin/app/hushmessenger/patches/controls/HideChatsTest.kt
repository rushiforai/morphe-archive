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
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val MENU_PLUGIN = "LX/HzP;"
private const val MENU = "LX/HzM;"
private const val ROW = "LX/HzB;"
private const val BUILT_ROW = "LX/HzR;"
private const val ICONS = "LX/1zI;"
internal const val SYNTHETIC_HIDDEN_ROW = "$MENU->Bt2()Ljava/util/ArrayList;"
internal const val SYNTHETIC_HIDDEN_TAP = "$MENU->E6u(I)V"
private const val MENU_CHAT = "$MENU->A0w:$THREAD_SUMMARY"
private const val ROW_FACTORY = "$ROW->A00()$ROW"
private const val ROW_ID = "$ROW->A00:I"
private const val ROW_ICON = "$ROW->A08($ICONS)V"
private const val ROW_TITLE = "$ROW->A09(Ljava/lang/CharSequence;)V"
private const val ROW_DESCRIPTION = "$ROW->A06:Ljava/lang/String;"
private const val ROW_DESCRIBE = "$ROW->A0A(Ljava/lang/String;)V"
private const val ROW_BUILD = "$ROW->A02(${ROW}Ljava/lang/String;)$BUILT_ROW"
private const val CHAT_KEY = "$THREAD_SUMMARY->A0e:$THREAD_KEY_TYPE"
private const val CHAT_PEOPLE = "$THREAD_SUMMARY->A16:$IMMUTABLE_LIST"
private const val CHAT_NAME = "$THREAD_SUMMARY->A1c:Ljava/lang/String;"
private const val PERSON_INFO = "$THREAD_PARTICIPANT->A05:$PARTICIPANT_INFO"
private const val PERSON_USER = "$PARTICIPANT_INFO->A0F:$USER_KEY"
private const val USER_ID = "$USER_KEY->id:Ljava/lang/String;"
private const val PERSON_NAME = "$PARTICIPANT_INFO->A0A:$SECRET_STRING"
private const val SECRET_TEXT = "$SECRET_STRING->A00:Ljava/lang/String;"
private const val FILTER_CALL = "LX/4BL;->Ajo($CLIENT_FILTER${IMMUTABLE_LIST}Ljava/lang/String;)$IMMUTABLE_LIST"
private const val ITERATOR = "Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;"

/**
 * The items read as 586 has it, cut down: the trace, the listed count, the rows, the last client filter's list (with a
 * branch straight onto its walk), then the walk, which reads each chat's key and each person's account id.
 */
private val WALK_BODY = """
    const-string v1, "$INBOX_ITEMS_TRACE"
    invoke-static {v1}, LX/0Bv;->A01(Ljava/lang/String;)V
    iget v0, p0, $INBOX_SUPPLIER->A00:I
    iget-object v1, p0, $INBOX_SUPPLIER->A04:$IMMUTABLE_LIST
    const-string v2, "inbox"
    invoke-interface {v4, v5, v1, v2}, $FILTER_CALL
    move-result-object v0
    if-eqz v0, :walk
    :walk
    invoke-virtual {v0}, $ITERATOR
    move-result-object v3
    :loop
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :done
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, $THREAD_SUMMARY
    iget-object v2, v1, $CHAT_KEY
    iget-object v2, v1, $CHAT_PEOPLE
    iget-object v2, v2, $PERSON_INFO
    iget-object v2, v2, $PERSON_USER
    iget-object v2, v2, $USER_ID
    goto :loop
    :done
    const/4 v0, 0x0
    return-object v0
""".trimIndent()

/** The menu's row list: one row through the builder, then the padding up to the menu's count, then the list back. */
private val ROW_BODY = """
    const/4 v0, 0x2
    invoke-static {v0}, LX/001;->A0z(I)Ljava/util/ArrayList;
    move-result-object v3
    invoke-static {}, $ROW_FACTORY
    move-result-object v1
    const/16 v0, 0x4b
    iput v0, v1, $ROW_ID
    sget-object v0, $ICONS->A6Q:$ICONS
    invoke-virtual {v1, v0}, $ROW_ICON
    const-string v2, "Mute"
    invoke-virtual {v1, v2}, $ROW_TITLE
    iput-object v2, v1, $ROW_DESCRIPTION
    const-string v0, "mute"
    invoke-static {v1, v0}, $ROW_BUILD
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

/** 587's builder fills the description through a setter, as it does the title. */
private val ROW_BODY_587 = ROW_BODY.replace("iput-object v2, v1, $ROW_DESCRIPTION", "invoke-virtual {v1, v2}, $ROW_DESCRIBE")

private val TAP_BODY = """
    iget-object v0, p0, $MENU_CHAT
    const/16 v1, 0x4b
    if-ne p1, v1, :done
    invoke-static {v0}, LX/2on;->A0F(Ljava/lang/Object;)LX/5bt;
    :done
    return-void
""".trimIndent()

private fun pluginBody(menu: String) = """
    const-string v0, "MenuItems"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :other
    new-instance v0, $menu
    return-object v0
    :other
    const/4 v0, 0x0
    return-object v0
""".trimIndent()

private fun walkItems(body: String = WALK_BODY, registers: Int = 7) =
    fixtureMethod(INBOX_ITEMS_HOOK, body, registers = registers, flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)

private fun hiddenRow(body: String = ROW_BODY, registers: Int = 6, id: String = SYNTHETIC_HIDDEN_ROW) = fixtureMethod(id, body, registers = registers)

private fun hiddenTap(body: String = TAP_BODY, registers: Int = 4, id: String = SYNTHETIC_HIDDEN_TAP) = fixtureMethod(id, body, registers = registers)

private fun iconsClass(eyes: List<String>, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or AccessFlags.ENUM.value) =
    fixtureClass(ICONS, listOf(fixtureMethod("$ICONS-><clinit>()V", (eyes.map { "const-string v0, \"$it\"" } + "return-void").joinToString("\n"),
        registers = 1, flags = AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value)), superclass = "Ljava/lang/Enum;", flags = flags)

/** The plugin that builds the chat list's menu, the menu with its row list and tap, and the row icons. */
internal fun hiddenChatsMenuFixture(
    row: MutableMethod = hiddenRow(),
    tap: MutableMethod = hiddenTap(),
    eyes: List<String> = listOf("EYE", "EYE_CROSS"),
    icons: MutableClass = iconsClass(eyes),
): List<MutableClass> = listOf(
    fixtureClass(MENU_PLUGIN, listOf(fixtureMethod("$MENU_PLUGIN->A00(Ljava/lang/String;)Ljava/lang/Object;", pluginBody(MENU), registers = 3))),
    fixtureClass(MENU, listOf(row, tap)),
    icons,
)

/** Where the settings list's names come from: the chat list's namer, a person's toString and SecretString's constructor. */
private fun chatNameClasses() = listOf(
    fixtureClass(STANDARD_THREAD_NAME, listOf(fixtureMethod("$STANDARD_THREAD_NAME->A00($THREAD_SUMMARY)Ljava/lang/String;",
        "iget-object v0, p1, $CHAT_NAME\nreturn-object v0", registers = 3))),
    fixtureClass(PARTICIPANT_INFO, listOf(fixtureMethod("$PARTICIPANT_INFO->toString()Ljava/lang/String;",
        "const-string v0, \"name\"\niget-object v1, p0, $PERSON_NAME\nreturn-object v0", registers = 3))),
    fixtureClass(SECRET_STRING, listOf(fixtureMethod("$SECRET_STRING-><init>(Ljava/lang/String;)V",
        "invoke-direct {p0}, Ljava/lang/Object;-><init>()V\niput-object p1, p0, $SECRET_TEXT\nreturn-void", registers = 2,
        flags = AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value))),
)

private fun hiddenChatsFixture(items: MutableMethod = walkItems(), menu: List<MutableClass> = hiddenChatsMenuFixture()): List<MutableClass> =
    listOf(inboxSupplierClass(items), inboxObserverClass()) + chatNameClasses() + menu

private fun Method.code() = implementation!!.instructions.toList()

private fun List<MutableClass>.classOf(): (String) -> MutableClass? = { type -> firstOrNull { it.type == type } }

private fun List<MutableClass>.method(id: String) = flatMap { it.methods }.single { it.hookId() == id }

class HideChatsTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    @Test fun theWalkTheMenusRowListAndItsTapAreFoundAndProved() {
        val found = mirroredControls(hiddenChatsFixture())
        assertEquals(listOf(INBOX_ITEMS_HOOK), found.getValue(HIDDEN_CHAT_LIST).map { it.hookId() })
        assertEquals(listOf(SYNTHETIC_HIDDEN_ROW), found.getValue(HIDDEN_CHAT_ROW).map { it.hookId() })
        assertEquals(listOf(SYNTHETIC_HIDDEN_TAP), found.getValue(HIDDEN_CHAT_TAP).map { it.hookId() })
        validateControls(found, setOf(HIDDEN_CHAT_LIST, HIDDEN_CHAT_ROW, HIDDEN_CHAT_TAP))
    }

    @Test fun theRouteNamesEveryFieldAndCallTheExtensionReads() {
        val classes = hiddenChatsFixture()
        val route = resolveHiddenChatRoute(classes.method(INBOX_ITEMS_HOOK), classes.method(SYNTHETIC_HIDDEN_ROW), classes.method(SYNTHETIC_HIDDEN_TAP), classes.classOf())
        assertEquals(listOf(CHAT_KEY, CHAT_NAME, CHAT_PEOPLE, PERSON_INFO, PERSON_USER, USER_ID, PERSON_NAME, SECRET_TEXT, MENU_CHAT,
            ROW_FACTORY, ROW_ID, ROW_ICON, ROW_TITLE, ROW_DESCRIPTION, ROW_BUILD, INBOX_ROUTE.toString()).joinToString("|"), route.toString())
    }

    @Test fun the587RowListThatSetsItsDescriptionThroughASetterIsFoundAndRoutesTheSetter() {
        val classes = hiddenChatsFixture(menu = hiddenChatsMenuFixture(row = hiddenRow(ROW_BODY_587)))
        val found = mirroredControls(classes)
        assertEquals(listOf(SYNTHETIC_HIDDEN_ROW), found.getValue(HIDDEN_CHAT_ROW).map { it.hookId() })
        validateControls(found, setOf(HIDDEN_CHAT_ROW))
        val route = resolveHiddenChatRoute(classes.method(INBOX_ITEMS_HOOK), classes.method(SYNTHETIC_HIDDEN_ROW), classes.method(SYNTHETIC_HIDDEN_TAP), classes.classOf())
        assertEquals(ROW_ICON, route.icon)
        assertEquals(ROW_DESCRIBE, route.description)
        // A second String setter leaves the description unknown.
        val twoSetters = hiddenRow(ROW_BODY_587.replace("invoke-virtual {v1, v2}, $ROW_DESCRIBE", "invoke-virtual {v1, v2}, $ROW_DESCRIBE\ninvoke-virtual {v1, v2}, $ROW->A0B(Ljava/lang/String;)V"))
        val before = twoSetters.code()
        assertFailsWith<PatchException> { injectControl(HIDDEN_CHAT_ROW, mapOf(HIDDEN_CHAT_ROW to listOf(twoSetters))) }
        assertEquals(before, twoSetters.code())
    }

    @Test fun theWalkGoesOverTheListTheExtensionHandsBackAndABranchOntoItStillLandsFirst() {
        val items = walkItems()
        val before = items.code()
        val at = before.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == ITERATOR }
        injectControl(HIDDEN_CHAT_LIST, mapOf(HIDDEN_CHAT_LIST to listOf(items)))
        val code = items.code()
        assertEquals(before.size + 4, code.size)
        assertEquals(before.take(at), code.take(at))
        // The iterator's register holds the supplier for the call, then takes the iterator as before.
        assertEquals(Opcode.MOVE_OBJECT_FROM16, code[at].opcode)
        assertEquals(listOf(3, 6), (code[at] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals(HIDDEN_ROWS_CALL, (code[at + 1] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(3, 0), (code[at + 1] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
        assertEquals(listOf(Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL), code.subList(at + 2, at + 5).map { it.opcode })
        assertEquals(0, (code[at + 2] as OneRegisterInstruction).registerA)
        assertEquals(ITERATOR, (code[at + 4] as ReferenceInstruction).reference.toString())
        assertEquals(0, (code[at + 4] as FiveRegisterInstruction).registerC)
        assertEquals(before.drop(at + 1).map { it.opcode }, code.drop(at + 5).map { it.opcode })
        assertEquals(at, code.branchTarget(at - 1), "The branch onto the walk would skip the extension")
    }

    @Test fun theWalkKeepsItsEditWhicheverOtherItemsReadEditComesFirst() {
        val orders = listOf(listOf(INBOX_REFRESH_HOOK, PIN_LIST, HIDDEN_CHAT_LIST), listOf(HIDDEN_CHAT_LIST, PIN_LIST, INBOX_REFRESH_HOOK))
        val results = orders.map { order ->
            val items = walkItems()
            for (hook in order) injectControl(hook, mapOf(hook to listOf(items)))
            items.code()
        }
        assertEquals(results[0].map { it.opcode }, results[1].map { it.opcode })
        for (code in results) {
            val asked = code.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == HIDDEN_ROWS_CALL }
            assertEquals(ITERATOR, (code[asked + 3] as ReferenceInstruction).reference.toString())
            assertEquals(1, code.count { (it as? ReferenceInstruction)?.reference?.toString() == HIDDEN_ROWS_CALL })
        }
    }

    @Test fun theRowGoesInJustBeforeTheMenuHandsItsListBackAndThePaddingLoopStillEndsThere() {
        val row = hiddenRow()
        val before = row.code()
        injectControl(HIDDEN_CHAT_ROW, mapOf(HIDDEN_CHAT_ROW to listOf(row)))
        val code = row.code()
        assertEquals(before.size + 2, code.size)
        assertEquals(before.dropLast(1), code.dropLast(3))
        assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC, Opcode.RETURN_OBJECT), code.takeLast(3).map { it.opcode })
        assertEquals(listOf(0, 5), (code[code.size - 3] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals(HIDE_ROW_CALL, (code[code.size - 2] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(0, 3), (code[code.size - 2] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
        assertEquals(3, (code.last() as OneRegisterInstruction).registerA)
        assertEquals(code.size - 3, code.branchTarget(code.indexOfFirst { it.opcode == Opcode.IF_GE }))
    }

    @Test fun theTapAsksTheExtensionFirstAndGoesOnAsStockWhenItSaysNo() {
        val tap = hiddenTap()
        val before = tap.code()
        injectControl(HIDDEN_CHAT_TAP, mapOf(HIDDEN_CHAT_TAP to listOf(tap)))
        val code = tap.code()
        assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_FROM16, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID),
            code.take(6).map { it.opcode })
        assertEquals(listOf(0, 2), (code[0] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals(listOf(1, 3), (code[1] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals(HIDE_TAP_CALL, (code[2] as ReferenceInstruction).reference.toString())
        assertEquals(6, code.branchTarget(4))
        assertEquals(before, code.drop(6))
    }

    // Hide chosen chats, Special contacts and the message log's chat menu row (#172) all take the walk, the menu's rows
    // and its tap; whichever patches first puts them in.
    @Test fun hideChosenChatsAndSpecialContactsShareTheirHooksAndEachGoesInOnce() {
        val shared = setOf(HIDDEN_CHAT_LIST, HIDDEN_CHAT_ROW, HIDDEN_CHAT_TAP)
        assertEquals(shared, controlHooks.getValue(HIDDEN_CHATS))
        assertEquals(shared + SPECIAL_CONTACTS, controlHooks.getValue(SPECIAL_CONTACTS))
        assertTrue(controlHooks.getValue("message_log").containsAll(shared + MESSAGE_LOG))
        val classes = hiddenChatsFixture()
        val route = resolveHiddenChatRoute(classes.method(INBOX_ITEMS_HOOK), classes.method(SYNTHETIC_HIDDEN_ROW), classes.method(SYNTHETIC_HIDDEN_TAP), classes.classOf())
        val methods = mapOf(HIDDEN_CHAT_LIST to listOf(walkItems()), HIDDEN_CHAT_ROW to listOf(hiddenRow()), HIDDEN_CHAT_TAP to listOf(hiddenTap()))
        val stub = fixtureMethod(HIDDEN_CHAT_ROUTE, "const-string v0, \"\"\nreturn-object v0", 1, AccessFlags.STATIC.value)
        injectControl(HIDDEN_CHATS, methods)
        stub.writeHiddenChatRoute(route)
        val first = methods.mapValues { (_, m) -> m.single().code() } + (HIDDEN_CHAT_ROUTE to stub.code())
        injectControl(SPECIAL_CONTACTS, methods)
        stub.writeHiddenChatRoute(route)
        assertEquals(first, methods.mapValues { (_, m) -> m.single().code() } + (HIDDEN_CHAT_ROUTE to stub.code()))
        injectControl("message_log", methods)
        stub.writeHiddenChatRoute(route)
        assertEquals(first, methods.mapValues { (_, m) -> m.single().code() } + (HIDDEN_CHAT_ROUTE to stub.code()))
        for ((hook, call) in listOf(HIDDEN_CHAT_LIST to HIDDEN_ROWS_CALL, HIDDEN_CHAT_ROW to HIDE_ROW_CALL, HIDDEN_CHAT_TAP to HIDE_TAP_CALL)) {
            assertEquals(1, methods.getValue(hook).single().code().count { (it as? ReferenceInstruction)?.reference?.toString() == call }, hook)
        }
        assertEquals(route.toString(), (stub.code()[0] as ReferenceInstruction).reference.toString())
        // A stub that already holds some other route means the two halves disagree, so the patch stops.
        assertFailsWith<PatchException> { stub.writeHiddenChatRoute(route.copy(key = "LX/0;->x:I")) }
    }

    @Test fun aWalkRowListOrTapItCantUseIsRefusedBeforeAnyEdit() {
        val cases = mapOf(
            "the walk's list not a client filter's" to (HIDDEN_CHAT_LIST to walkItems(WALK_BODY.replace("invoke-interface {v4, v5, v1, v2}, $FILTER_CALL",
                "invoke-interface {v4, v1, v2}, LX/4BL;->Ajp(${IMMUTABLE_LIST}Ljava/lang/String;)$IMMUTABLE_LIST"))),
            "a walk over something other than chats" to (HIDDEN_CHAT_LIST to walkItems(WALK_BODY.replace("check-cast v1, $THREAD_SUMMARY", "check-cast v1, Ljava/lang/Object;"))),
            "no person's account id" to (HIDDEN_CHAT_LIST to walkItems(WALK_BODY.replace("iget-object v2, v2, $USER_ID\n", ""))),
            "this overwritten" to (HIDDEN_CHAT_LIST to walkItems(WALK_BODY.replace("\n:done\n", "\n:done\nconst/4 p0, 0x0\n"))),
            "two walks" to (HIDDEN_CHAT_LIST to walkItems(WALK_BODY.replace("\n:done\n", "\n:done\ninvoke-virtual {v0}, $ITERATOR\nmove-result-object v3\n" +
                WALK_BODY.substringAfter("move-result-object v3\n").substringBefore("goto :loop").replace(":loop\n", "") + "\n"))),
            "the rows out of a plain call's reach" to (HIDDEN_CHAT_ROW to hiddenRow(ROW_BODY.replace("return-object v3", "move-object/from16 v16, v3\nreturn-object v16"), registers = 20)),
            "two returns" to (HIDDEN_CHAT_ROW to hiddenRow("$ROW_BODY\nreturn-object v3")),
            "no row builder" to (HIDDEN_CHAT_ROW to hiddenRow(ROW_BODY.replace("invoke-static {v1, v0}, $ROW_BUILD\nmove-result-object v0\n", ""))),
            "two icon setters" to (HIDDEN_CHAT_ROW to hiddenRow(ROW_BODY.replace("invoke-virtual {v1, v0}, $ROW_ICON", "invoke-virtual {v1, v0}, $ROW_ICON\ninvoke-virtual {v1, v0}, $ROW->A07($ICONS)V"))),
            "a tap with one local" to (HIDDEN_CHAT_TAP to hiddenTap("iget-object v0, p0, $MENU_CHAT\nif-eqz p1, :done\ninvoke-static {v0}, LX/2on;->A0F(Ljava/lang/Object;)LX/5bt;\n:done\nreturn-void", registers = 3)),
            "a jump to the tap's start" to (HIDDEN_CHAT_TAP to hiddenTap(":top\niget-object v0, p0, $MENU_CHAT\nif-eqz p1, :top\nreturn-void")),
            "a tap that reads no chat" to (HIDDEN_CHAT_TAP to hiddenTap(TAP_BODY.replace("iget-object v0, p0, $MENU_CHAT", "const/4 v0, 0x0"))),
        )
        for ((case, target) in cases) {
            val (hook, method) = target
            val before = method.code()
            assertFailsWith<PatchException>(case) { injectControl(hook, mapOf(hook to listOf(method))) }
            assertEquals(before, method.code(), case)
        }
    }

    @Test fun aSecondMenuOrNoneLeavesBothMenuHooksOut() {
        val second = "LX/HzN;"
        val twoMenus = hiddenChatsFixture() + fixtureClass("LX/HzQ;", listOf(fixtureMethod("LX/HzQ;->A00(Ljava/lang/String;)Ljava/lang/Object;", pluginBody(second), registers = 3))) +
            fixtureClass(second, listOf(hiddenRow(id = "$second->Bt2()Ljava/util/ArrayList;"), hiddenTap(TAP_BODY.replace("$MENU->", "$second->"), id = "$second->E6u(I)V")))
        val noPlugin = hiddenChatsFixture().filter { it.type != MENU_PLUGIN }
        for (classes in listOf(twoMenus, noPlugin)) {
            val found = mirroredControls(classes)
            assertTrue(found.getValue(HIDDEN_CHAT_ROW).isEmpty())
            assertTrue(found.getValue(HIDDEN_CHAT_TAP).isEmpty())
            assertFailsWith<PatchException> { validateControls(found, setOf(HIDDEN_CHAT_ROW)) }
            assertFailsWith<PatchException> { validateControls(found, setOf(HIDDEN_CHAT_TAP)) }
        }
    }

    @Test fun withoutBothEyeIconsOrTheChatNamesTheRouteIsRefused() {
        val cases = mapOf(
            "no crossed eye" to hiddenChatsFixture(menu = hiddenChatsMenuFixture(eyes = listOf("EYE"))),
            "icons that aren't an enum" to hiddenChatsFixture(menu = hiddenChatsMenuFixture(icons = iconsClass(listOf("EYE", "EYE_CROSS"), AccessFlags.PUBLIC.value))),
            "no namer" to hiddenChatsFixture().filter { it.type != STANDARD_THREAD_NAME },
            "a person's toString with no name" to hiddenChatsFixture().filter { it.type != PARTICIPANT_INFO } + fixtureClass(PARTICIPANT_INFO,
                listOf(fixtureMethod("$PARTICIPANT_INFO->toString()Ljava/lang/String;", "const-string v0, \"id\"\niget-object v1, p0, $PERSON_NAME\nreturn-object v0", registers = 3))),
        )
        for ((case, classes) in cases) {
            // The mirror checks CompatReport refuses these the same way.
            mirroredControls(classes)
            assertFailsWith<PatchException>(case) {
                resolveHiddenChatRoute(classes.method(INBOX_ITEMS_HOOK), classes.method(SYNTHETIC_HIDDEN_ROW), classes.method(SYNTHETIC_HIDDEN_TAP), classes.classOf())
            }
        }
    }

    @Test fun bothSupportedBuildsFindTheWalkTheMenuAndEveryRoutePiece() {
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
            for (hook in listOf(HIDDEN_CHAT_ROW, HIDDEN_CHAT_TAP)) {
                assertEquals(activeProfile.hooks.getValue(hook), menu.getValue(hook).map { it.hookId() }.toSet(), "$code $hook")
            }
            val walks = byType.getValue(INBOX_SUPPLIER).methods.filter { it.hiddenListSite() != null }
            assertEquals(activeProfile.hooks.getValue(HIDDEN_CHAT_LIST), walks.map { it.hookId() }.toSet(), code)
            val list = walks.single()
            val row = menu.getValue(HIDDEN_CHAT_ROW).single()
            val tap = menu.getValue(HIDDEN_CHAT_TAP).single()
            val route = resolveHiddenChatRoute(list, row, tap) { byType[it] }
            assertEquals(17, route.toString().split('|').size, "$code $route")
            assertTrue(route.key.startsWith("$THREAD_SUMMARY->") && route.key.endsWith(":$THREAD_KEY_TYPE"), "$code $route")
            assertTrue(route.name.startsWith("$THREAD_SUMMARY->") && route.name.endsWith(":Ljava/lang/String;"), "$code $route")
            assertTrue(route.participants.startsWith("$THREAD_SUMMARY->") && route.participants.endsWith(":$IMMUTABLE_LIST"), "$code $route")
            assertEquals(USER_ID, route.userId, code)
            assertTrue(route.menuSummary.startsWith("${row.definingClass}->") && route.menuSummary.endsWith(":$THREAD_SUMMARY"), "$code $route")
            // The extension copies the kept chats with ImmutableList.copyOf(Collection), so the build has to keep it by that name.
            assertTrue(byType.getValue(IMMUTABLE_LIST).methods.any { m ->
                m.name == "copyOf" && m.parameterTypes.map { it.toString() } == listOf("Ljava/util/Collection;") && AccessFlags.STATIC.isSet(m.accessFlags)
            }, code)
            val calls = mapOf(HIDDEN_CHAT_LIST to (list to HIDDEN_ROWS_CALL), HIDDEN_CHAT_ROW to (row to HIDE_ROW_CALL), HIDDEN_CHAT_TAP to (tap to HIDE_TAP_CALL))
            for ((hook, target) in calls) {
                val mutable = MutableMethod(target.first)
                val before = mutable.code()
                injectControl(hook, mapOf(hook to listOf(mutable)))
                val after = mutable.code()
                assertTrue(after.size > before.size, "$code $hook")
                assertEquals(1, after.count { (it as? ReferenceInstruction)?.reference?.toString() == target.second }, "$code $hook")
            }
        }
    }
}
