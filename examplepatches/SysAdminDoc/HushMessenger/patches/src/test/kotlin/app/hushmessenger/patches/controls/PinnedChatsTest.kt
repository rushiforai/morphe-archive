package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

internal const val SYNTHETIC_PINNED_CHAT_LIMIT = "LX/2na;->A00($FB_USER_SESSION)I"
private const val CONFIG_READ = "LX/17P;->A0A(Ljava/lang/Object;J)I"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

/** A read as Messenger writes it in place: the session's config, the limit's id, one read, its answer compared after. */
private val READ_BODY = """
    invoke-static {p0}, LX/2on;->A0F(Ljava/lang/Object;)LX/5bt;
    move-result-object p0
    const-wide v0, 0x8205ad0002101eL
    invoke-static {p0, v0, v1}, $CONFIG_READ
    move-result v0
    const/4 v1, 0x3
    if-ge v0, v1, :done
    const/4 v0, 0x0
    :done
    return v0
""".trimIndent()

private fun reader(body: String = READ_BODY, id: String = SYNTHETIC_PINNED_CHAT_LIMIT, flags: Int = STATIC, registers: Int = 3) =
    fixtureMethod(id, body, registers = registers, flags = flags)

internal fun pinnedChatLimitFixture(vararg methods: MutableMethod = arrayOf(reader())): List<MutableClass> =
    methods.map { fixtureClass(it.definingClass, listOf(it)) }

private const val PIN_OWNER = "LX/JbH;"
private const val PIN_LOCATION = "LX/1o8;"
private const val PIN_LAMBDA = "LX/KLj;"
private const val PIN_KEY_FIELD = "$THREAD_SUMMARY->A0e:$THREAD_KEY_TYPE"
private const val PIN_OTHER_FLAG = "$THREAD_SUMMARY->A2R:Z"
private const val PIN_FLAG = "$THREAD_SUMMARY->A2Q:Z"
private const val PIN_LIST_FIELD = "$INBOX_SUPPLIER->A04:$IMMUTABLE_LIST"
private const val PIN_DIALOG = "$PIN_OWNER->A00(Landroid/app/Activity;Landroid/content/Context;Landroid/content/DialogInterface\$OnClickListener;${PIN_OWNER}II)V"
internal const val SYNTHETIC_PIN_ROW = "$PIN_MENU_ITEM->A00($FB_USER_SESSION$THREAD_SUMMARY$PIN_LOCATION)Z"
internal const val SYNTHETIC_UNPIN_ROW = "$UNPIN_MENU_ITEM->A00($FB_USER_SESSION$THREAD_SUMMARY$PIN_LOCATION)Z"
internal const val SYNTHETIC_PIN_ASK = "$PIN_OWNER->A01(Landroid/content/Context;Landroid/content/DialogInterface\$OnClickListener;$THREAD_KEY_TYPE$PIN_OWNER${PIN_LOCATION}Ljava/lang/Long;Z)V"
internal const val SYNTHETIC_PIN_DROP = "$PIN_OWNER->A02($THREAD_KEY_TYPE$PIN_OWNER${PIN_LOCATION}Ljava/lang/Long;Z)V"
internal const val SYNTHETIC_PIN_FULL = "$PIN_LAMBDA->invoke(Ljava/lang/Object;)Ljava/lang/Object;"

/** The pin call as Messenger has it: it builds the lambda the count answers, then reads the limit, the chat's key in a parameter. */
private val PIN_ASK_BODY = """
    new-instance v6, $PIN_LAMBDA
    invoke-static {v11}, LX/2on;->A0F(Ljava/lang/Object;)LX/5bt;
    move-result-object v5
    const-wide v0, 0x8205ad0002101eL
    invoke-static {v5, v0, v1}, $CONFIG_READ
    move-result v2
    return-void
""".trimIndent()

/** The count's answer: under the limit it pins, at the limit it reads the dialog's arguments and shows "can't pin". */
private fun pinAnswer(under: String) = """
    invoke-static {p1}, LX/001;->A1U(Ljava/lang/Object;)Z
    move-result v2
    iget-object v3, p0, $PIN_LAMBDA->A05:Ljava/lang/Object;
    check-cast v3, $PIN_OWNER
    if-eqz v2, $under
    iget-object v4, p0, $PIN_LAMBDA->A00:Ljava/lang/Object;
    check-cast v4, Landroid/content/Context;
    iget-object v1, p0, $PIN_LAMBDA->A03:Ljava/lang/Object;
    check-cast v1, $THREAD_KEY_TYPE
    invoke-static/range {v4 .. v9}, $PIN_DIALOG
    if-eqz v3, :done
""".trimIndent()

private val PIN_FULL_BODY = pinAnswer(":under") + "\n" + """
    :under
    const/4 v5, 0x0
    :done
    sget-object v0, LX/04C;->A00:LX/04C;
    return-object v0
""".trimIndent()

/** A menu row's check: no for a chat already pinned or a chat its capability bits refuse, the answer always in v4. */
private val PIN_ROW_BODY = """
    const/4 v4, 0x0
    iget-object v6, p1, $PIN_KEY_FIELD
    iget-boolean v0, p1, $PIN_OTHER_FLAG
    if-nez v0, :no
    iget-boolean v0, p1, $PIN_FLAG
    if-eqz v0, :yes
    :no
    return v4
    :yes
    const/4 v4, 0x1
    return v4
""".trimIndent()

private val STATIC_ROW = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

private fun pinRow(body: String = PIN_ROW_BODY, id: String = SYNTHETIC_PIN_ROW, registers: Int = 11) =
    fixtureMethod(id, body, registers = registers, flags = STATIC_ROW)

private fun pinAsk(body: String = PIN_ASK_BODY) = fixtureMethod(SYNTHETIC_PIN_ASK, body, registers = 15, flags = STATIC_ROW)

private fun pinDrop(body: String = "invoke-static {p0}, LX/2on;->A0F(Ljava/lang/Object;)LX/5bt;\nreturn-void", registers: Int = 8) =
    fixtureMethod(SYNTHETIC_PIN_DROP, body, registers = registers, flags = STATIC_ROW)

private fun pinFull(body: String = PIN_FULL_BODY) = fixtureMethod(SYNTHETIC_PIN_FULL, body, registers = 12)

/** The controller, the lambda its pin builds and both menu rows. The chat list read is the inbox supplier's own fixture. */
internal fun pinnedChatsFixture(
    ask: MutableMethod = pinAsk(),
    drop: MutableMethod = pinDrop(),
    full: MutableMethod = pinFull(),
    row: MutableMethod = pinRow(),
    unpin: MutableMethod = pinRow(id = SYNTHETIC_UNPIN_ROW),
): List<MutableClass> = listOf(
    fixtureClass(PIN_OWNER, listOf(ask, drop)),
    fixtureClass(PIN_LAMBDA, listOf(full)),
    fixtureClass(PIN_MENU_ITEM, listOf(row)),
    fixtureClass(UNPIN_MENU_ITEM, listOf(unpin)),
)

private fun Method.code() = implementation!!.instructions.toList()

class PinnedChatsTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(PINNED_CHATS).map { it.hookId() }.toSet()

    @Test fun theLimitsReadIsFoundByItsConfigId() {
        assertEquals(setOf(SYNTHETIC_PINNED_CHAT_LIMIT), found(pinnedChatLimitFixture()))
        validateControls(mirroredControls(pinnedChatLimitFixture()), setOf(PINNED_CHATS))
    }

    @Test fun everyReaderIsFoundWhateverItsShape() {
        val other = "LX/HRN;->A0Q(Ljava/lang/Object;Ljava/lang/Object;I)V"
        val classes = pinnedChatLimitFixture(reader(), reader(READ_BODY.replace("return v0", "return-void"), id = other, flags = AccessFlags.PUBLIC.value, registers = 6))
        assertEquals(setOf(SYNTHETIC_PINNED_CHAT_LIMIT, other), found(classes))
    }

    // The fourth read decides a new pin. It keeps Messenger's own number, since the server refuses anything past it.
    @Test fun everyBuildRaisesThreeReadsAndLeavesTheOneThatDecidesAPin() {
        for ((code, profile) in controlProfiles) {
            assertEquals(3, profile.hooks.getValue(PINNED_CHATS).size, "$code")
            assertEquals(1, profile.hooks.getValue(PIN_ASK).size, "$code")
            assertTrue(profile.hooks.getValue(PINNED_CHATS).none { THREAD_KEY_TYPE in it }, "$code")
        }
    }

    @Test fun theReadThatDecidesAPinIsNotRaisedAndEveryPinHookIsFound() {
        val found = mirroredControls(pinnedChatsFixture() + pinnedChatLimitFixture())
        assertEquals(setOf(SYNTHETIC_PINNED_CHAT_LIMIT), found.getValue(PINNED_CHATS).map { it.hookId() }.toSet())
        assertEquals(listOf(SYNTHETIC_PIN_ASK), found.getValue(PIN_ASK).map { it.hookId() })
        assertEquals(listOf(SYNTHETIC_PIN_DROP), found.getValue(PIN_DROP).map { it.hookId() })
        assertEquals(listOf(SYNTHETIC_PIN_FULL), found.getValue(PIN_FULL).map { it.hookId() })
        assertEquals(setOf(SYNTHETIC_PIN_ROW, SYNTHETIC_UNPIN_ROW), found.getValue(PIN_ROWS).map { it.hookId() }.toSet())
        validateControls(found, setOf(PINNED_CHATS, PIN_ASK, PIN_DROP, PIN_FULL, PIN_ROWS))
    }

    @Test fun theChatRowsAnswerGoesThroughTheExtensionAtEveryReturnEvenOnABranchIntoIt() {
        val row = pinRow()
        injectControl(PIN_ROWS, mapOf(PIN_ROWS to listOf(row)))
        val code = row.code()
        assertEquals(PIN_ROW_CALL, (code[6] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.RETURN), code.subList(6, 9).map { it.opcode })
        assertEquals(listOf(4, 9), (code[6] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
        assertEquals(6, code.branchTarget(3), "The already pinned branch would skip the extension")
        assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.RETURN), code.takeLast(3).map { it.opcode })
        assertEquals(9, code.branchTarget(5))
        assertEquals(1, code.count { it.opcode == Opcode.CONST_4 && (it as NarrowLiteralInstruction).narrowLiteral == 1 })
        val unpin = pinRow(id = SYNTHETIC_UNPIN_ROW)
        injectControl(PIN_ROWS, mapOf(PIN_ROWS to listOf(unpin)))
        assertEquals(UNPIN_ROW_CALL, (unpin.code()[6] as ReferenceInstruction).reference.toString())
    }

    @Test fun aRowCheckThatCantAskIsRefusedBeforeAnyEdit() {
        val cases = mapOf(
            "the summary overwritten" to pinRow(PIN_ROW_BODY.replace("const/4 v4, 0x0", "const/4 v4, 0x0\nconst/4 v9, 0x0")),
            "the summary out of a plain call's reach" to pinRow("move-object/from16 v9, p1\n" + PIN_ROW_BODY.replace(", p1,", ", v9,"), registers = 18),
            "only one flag read" to pinRow(PIN_ROW_BODY.replace("iget-boolean v0, p1, $PIN_FLAG\n", "")),
            "no key read" to pinRow(PIN_ROW_BODY.replace("iget-object v6, p1, $PIN_KEY_FIELD\n", "")),
            "no return" to pinRow(PIN_ROW_BODY.replace("return v4", "return-void")),
            "not static" to fixtureMethod(SYNTHETIC_PIN_ROW, PIN_ROW_BODY, registers = 11, flags = AccessFlags.PUBLIC.value),
        )
        for ((case, bad) in cases) {
            val before = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(PIN_ROWS, mapOf(PIN_ROWS to listOf(bad))) }
            assertEquals(before, bad.code(), case)
        }
    }

    @Test fun bothPinCallsAskTheExtensionFirstAndGoOnAsStockWhenItSaysNo() {
        val cases = listOf(Triple(PIN_ASK, pinAsk(), PINNING_CALL to 10), Triple(PIN_DROP, pinDrop(), UNPINNING_CALL to 3))
        for ((hook, method, expected) in cases) {
            val before = method.code()
            injectControl(hook, mapOf(hook to listOf(method)))
            val code = method.code()
            val ask = code[0] as RegisterRangeInstruction
            assertEquals(expected.first, (ask as ReferenceInstruction).reference.toString(), hook)
            assertEquals(listOf(1, expected.second), listOf(ask.registerCount, ask.startRegister), hook)
            assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), code.subList(1, 4).map { it.opcode }, hook)
            assertEquals(4, code.branchTarget(2), hook)
            assertEquals(before.map { it.opcode }, code.drop(4).map { it.opcode }, hook)
        }
    }

    @Test fun aPinCallWithNoRoomToAskIsRefused() {
        val cases = mapOf(
            "unpin with no local" to (PIN_DROP to pinDrop(registers = 5)),
            "unpin starting on a jump target" to (PIN_DROP to pinDrop(":top\nnop\nif-eqz p4, :top\nreturn-void")),
            "pin that stopped reading the limit" to (PIN_ASK to pinAsk("return-void")),
        )
        for ((case, target) in cases) {
            val (hook, method) = target
            val before = method.code()
            assertFailsWith<PatchException>(case) { injectControl(hook, mapOf(hook to listOf(method))) }
            assertEquals(before, method.code(), case)
        }
    }

    @Test fun atTheLimitTheExtensionKeepsThePinAndTheDialogIsSkippedOtherwiseItShowsAsStock() {
        val full = pinFull()
        val before = full.code()
        injectControl(PIN_FULL, mapOf(PIN_FULL to listOf(full)))
        val code = full.code()
        // Past the branch that means "at the limit", before the dialog's arguments are read.
        assertEquals(before.take(5), code.take(5))
        assertEquals("$PIN_LAMBDA->A03:Ljava/lang/Object;", (code[5] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(4, 10), (code[5] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals(PIN_FULL_CALL, (code[6] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.MOVE_RESULT, code[7].opcode)
        assertEquals(Opcode.IF_NEZ, code[8].opcode)
        assertEquals(before.drop(5).map { it.opcode }, code.drop(9).map { it.opcode })
        assertEquals(Opcode.SGET_OBJECT, code[code.branchTarget(8)].opcode, "A kept pin leaves by the lambda's own way out")
        assertEquals(code.branchTarget(8), code.branchTarget(code.indexOfLast { it.opcode == Opcode.IF_EQZ }), "Both paths share that exit")
        // The count's "under the limit" branch still goes past all of it to Messenger's own pin.
        assertEquals(code.size - 3, code.branchTarget(4))
    }

    @Test fun aChangedAnswerSiteIsRefusedBeforeAnyEdit() {
        val cases = mapOf(
            "no dialog" to pinFull(PIN_FULL_BODY.replace("invoke-static/range {v4 .. v9}, $PIN_DIALOG\n", "")),
            "another class's dialog" to pinFull(PIN_FULL_BODY.replace(PIN_DIALOG, PIN_DIALOG.replace("$PIN_OWNER->A00", "LX/Jj0;->A00"))),
            "no key read" to pinFull(PIN_FULL_BODY.replace("check-cast v1, $THREAD_KEY_TYPE\n", "")),
            "the dialog's check gone" to pinFull(PIN_FULL_BODY.replace("if-eqz v3, :done\n", "")),
            "an exit that isn't the lambda's" to pinFull(PIN_FULL_BODY.replace("sget-object v0, LX/04C;->A00:LX/04C;", "const/4 v0, 0x0")),
            "the first read overwrites self" to pinFull(PIN_FULL_BODY.replace("iget-object v4, p0, $PIN_LAMBDA->A00", "iget-object p0, p0, $PIN_LAMBDA->A00")),
            "a second answer in the same method" to pinFull(pinAnswer(":second") + "\n:second\n" + PIN_FULL_BODY),
        )
        for ((case, bad) in cases) {
            val before = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(PIN_FULL, mapOf(PIN_FULL to listOf(bad))) }
            assertEquals(before, bad.code(), case)
        }
    }

    @Test fun theListHookGoesRightAfterTheTraceWhicheverPatchComesFirst() {
        val orders = listOf(listOf(INBOX_REFRESH_HOOK, PIN_LIST), listOf(PIN_LIST, INBOX_REFRESH_HOOK))
        val results = orders.map { order ->
            val items = inboxItemsMethod()
            for (hook in order) injectControl(hook, mapOf(hook to listOf(items)))
            items.code()
        }
        for (code in results) {
            assertEquals(INBOX_ITEMS_CALL, (code[0] as ReferenceInstruction).reference.toString())
            assertEquals(INBOX_ITEMS_TRACE, ((code[1] as ReferenceInstruction).reference as StringReference).string)
            assertEquals(PIN_ARRANGE_CALL, (code[2] as ReferenceInstruction).reference.toString())
            assertEquals(2, (code[2] as RegisterRangeInstruction).startRegister)
        }
    }

    @Test fun aListReadWithoutItsRowsOrTraceIsRefused() {
        val cases = mapOf(
            "no list read" to inboxItemsMethod().also { items -> items.removeInstruction(items.code().indexOfFirst { it.opcode == Opcode.IGET_OBJECT }) },
            "another trace" to inboxItemsMethod(trace = "ThreadListItemSupplierImplementation.getOtherItems"),
            "a jump to its start" to inboxItemsMethod(jumpToStart = true),
            "static" to inboxItemsMethod(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
        )
        for ((case, bad) in cases) assertFailsWith<PatchException>(case) { injectControl(PIN_LIST, mapOf(PIN_LIST to listOf(bad))) }
    }

    @Test fun theRouteNamesTheKeyBothFlagsTheListAndTheRefresh() {
        val classes = listOf(inboxSupplierClass(), inboxObserverClass())
        val route = resolvePinnedChatRoute(pinRow(), inboxItemsMethod()) { type -> classes.firstOrNull { it.type == type } }
        assertEquals("$PIN_KEY_FIELD|$PIN_FLAG|$PIN_OTHER_FLAG|$PIN_LIST_FIELD|$INBOX_ROUTE", route.toString())
    }

    @Test fun oneMissingPieceOffersNoPinHooksOfItsKind() {
        val base = pinnedChatsFixture()
        val found = mirroredControls(base.filter { it.type != PIN_LAMBDA } + pinnedChatLimitFixture())
        assertTrue(found.getValue(PIN_FULL).isEmpty())
        assertFailsWith<PatchException> { validateControls(found, setOf(PIN_FULL)) }
        val oneRow = mirroredControls(base.filter { it.type != UNPIN_MENU_ITEM } + pinnedChatLimitFixture())
        assertTrue(oneRow.getValue(PIN_ROWS).isEmpty())
        assertFailsWith<PatchException> { validateControls(oneRow, setOf(PIN_ROWS)) }
    }

    // A read that only looks like the limit's would raise some other number, so anything off the exact shape is refused,
    // and one odd reader spoils them all rather than leave a check that still uses Messenger's own limit.
    @Test fun anythingButAStraightReadOfTheLimitIsLeftAlone() {
        val cases = mapOf(
            "another config id" to pinnedChatLimitFixture(reader(READ_BODY.replace("0x8205ad0002101eL", "0x8205b900021070L"))),
            "the id loaded twice" to pinnedChatLimitFixture(reader(READ_BODY.replace("const-wide v0, 0x8205ad0002101eL",
                "const-wide v0, 0x8205ad0002101eL\nconst-wide v0, 0x8205ad0002101eL"))),
            "something between the id and the read" to pinnedChatLimitFixture(reader(READ_BODY.replace("invoke-static {p0, v0, v1}",
                "nop\ninvoke-static {p0, v0, v1}"))),
            "a long read" to pinnedChatLimitFixture(reader(READ_BODY.replace(CONFIG_READ, "LX/17P;->A0G(Ljava/lang/Object;J)J")
                .replace("move-result v0", "move-result-wide v0\nlong-to-int v0, v0"))),
            "an answer nobody takes" to pinnedChatLimitFixture(reader(READ_BODY.replace("move-result v0\n", ""))),
            "one odd reader beside a good one" to pinnedChatLimitFixture(reader(),
                reader(READ_BODY.replace("move-result v0\n", ""), id = "LX/2nb;->A00($FB_USER_SESSION)I")),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(PINNED_CHATS)) }
        }
    }

    @Test fun theReadAsksTheSwitchRightAfterItsAnswerAndKeepsEverythingElse() {
        val method = reader()
        val before = method.code()
        val taken = before.indexOfFirst { it.opcode == Opcode.MOVE_RESULT }
        injectControl(PINNED_CHATS, mapOf(PINNED_CHATS to listOf(method)))
        val code = method.code()
        assertEquals(before.size + 2, code.size)
        assertEquals(before.take(taken + 1), code.take(taken + 1))
        assertEquals(before.drop(taken + 1).map { it.opcode }, code.drop(taken + 3).map { it.opcode })
        val ask = code[taken + 1] as RegisterRangeInstruction
        assertEquals(Opcode.INVOKE_STATIC_RANGE, ask.opcode)
        assertEquals(PINNED_CHAT_LIMIT_GATE, (ask as ReferenceInstruction).reference.toString())
        // The read's own answer goes in and the switch's answer comes back in the register the method compares.
        assertEquals(listOf(1, 0), listOf(ask.registerCount, ask.startRegister))
        assertEquals(Opcode.MOVE_RESULT, code[taken + 2].opcode)
        assertEquals(0, (code[taken + 2] as OneRegisterInstruction).registerA)
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "another config id" to reader(READ_BODY.replace("0x8205ad0002101eL", "0x1L")),
            "no answer taken" to reader(READ_BODY.replace("move-result v0\n", "")),
            "another method" to fixtureMethod("LX/2na;->A01($FB_USER_SESSION)I", "const/4 v0, 0x3\nreturn v0", registers = 3, flags = STATIC),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(PINNED_CHATS, mapOf(PINNED_CHATS to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildHooksEachRead() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val pins = findPinnedChats(classes)
            val hooks = pins.getValue(PINNED_CHATS)
            assertEquals(activeProfile.hooks.getValue(PINNED_CHATS), hooks.map { it.hookId() }.toSet(), code)
            checkThePinHooks(code, classes, pins)
            validateControls(mapOf(PINNED_CHATS to hooks), setOf(PINNED_CHATS))
            for (hook in hooks) {
                val method = MutableMethod(hook)
                val taken = method.pinnedChatLimitRead()!!
                val before = method.code()
                method.injectPinnedChatLimit()
                val after = method.code()
                assertEquals(PINNED_CHAT_LIMIT_GATE, (after[taken + 1] as ReferenceInstruction).reference.toString(), code)
                assertEquals(before.drop(taken + 1).map { it.opcode }, after.drop(taken + 3).map { it.opcode }, code)
            }
        }
    }

    private fun checkThePinHooks(code: String, classes: List<ClassDef>, pins: Map<String, List<Method>>) {
        val byType = classes.associateBy { it.type }
        for (hook in listOf(PIN_ROWS, PIN_ASK, PIN_DROP, PIN_FULL)) {
            assertEquals(activeProfile.hooks.getValue(hook), pins.getValue(hook).map { it.hookId() }.toSet(), "$code $hook")
            validateControls(pins, setOf(hook))
            for (method in pins.getValue(hook)) {
                val mutable = MutableMethod(method)
                val before = mutable.code()
                injectControl(hook, mapOf(hook to listOf(mutable)))
                assertTrue(mutable.code().size > before.size, "$code $hook")
            }
        }
        val items = byType.getValue(INBOX_SUPPLIER).methods.single { it.hookId() == activeProfile.hooks.getValue(PIN_LIST).single() }
        validateControls(mapOf(PIN_LIST to listOf(items)), setOf(PIN_LIST))
        val row = pins.getValue(PIN_ROWS).single { it.definingClass == PIN_MENU_ITEM }
        val route = resolvePinnedChatRoute(row, items) { byType[it] }
        assertTrue(route.key.startsWith("$THREAD_SUMMARY->") && route.key.endsWith(":$THREAD_KEY_TYPE"), "$code $route")
        assertEquals(listOf(":Z", ":Z"), listOf(route.flag, route.otherFlag).map { it.takeLast(2) }, "$code $route")
        assertTrue(route.flag != route.otherFlag, "$code $route")
        assertTrue(route.list.startsWith("$INBOX_SUPPLIER->") && route.list.endsWith(":$IMMUTABLE_LIST"), "$code $route")
        // The chat row's check and the unpin row's read the same two flags, so what one marks the other sees.
        val other = pins.getValue(PIN_ROWS).single { it.definingClass == UNPIN_MENU_ITEM }
        assertEquals(setOf(route.flag, route.otherFlag), other.code().mapNotNull { i ->
            ((i as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { i.opcode == Opcode.IGET_BOOLEAN && it.definingClass == THREAD_SUMMARY }?.toString()
        }.take(2).toSet(), code)
    }
}
