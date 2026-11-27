package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertSame
import kotlin.test.assertTrue

private const val SOCKET = "LX/PTu;"
private const val SEARCH_SOCKET = "LX/PTt;"
private const val SOCKET_FACE = "LX/Q7Z;"
internal const val SYNTHETIC_REMOVE_CONTACT_ROWS = "$SOCKET->BLt()Ljava/util/ArrayList;"
internal const val SYNTHETIC_REMOVE_CONTACT_TAP = "$SOCKET->EW9(I)V"
private const val TRACER = "LX/1cF;"
private const val SPEC = "messaging.graph.contactinfomenuitem.ContactInfoMenuItemInterfaceSpec"
private const val START_OWNER = "LX/KMO;"
private const val START = "$START_OWNER->EY5()V"
private const val CALLBACK = "LX/HsH;"
private const val HELPER = "LX/KCL;"
private const val FETCHER = "LX/BTl;"
private const val MODE = "LX/5xz;"
private const val SETTABLE_OWNER = "LX/68W;"
private const val KEY_OWNER = "LX/4HW;"
private const val FUNCTION_OWNER = "LX/DGR;"
private const val TRANSFORM = "LX/Y7s;"
private const val REGISTRAR_OWNER = "LX/1JE;"
private const val CONTEXT = "Landroid/content/Context;"
private const val USER = "Lcom/facebook/user/model/User;"
private const val CALLER = "Lcom/facebook/common/callercontext/CallerContext;"
private const val EXECUTOR_SERVICE = "Ljava/util/concurrent/ExecutorService;"
private const val SETTABLE_CALL = "$SETTABLE_OWNER->A05()Lcom/google/common/util/concurrent/SettableFuture;"
private const val KEY_CALL = "$KEY_OWNER->A0U(Ljava/lang/String;)Lcom/facebook/user/model/UserKey;"
private const val FETCH_CALL = "$FETCHER->A00($CALLER$FETCHER${MODE}Lcom/google/common/collect/ImmutableSet;Z)LX/4Nn;"
private const val REGISTRAR_CALL = "$REGISTRAR_OWNER->A0G(LX/655;${CONTACT_FUTURE}Ljava/util/concurrent/Executor;)V"
private const val CALLBACK_INIT = "$CALLBACK-><init>$CONTACT_CALLBACK_INIT"
private const val HELPER_INIT = "$HELPER-><init>()V"
private const val TRANSFORM_INIT = "$TRANSFORM-><init>($CONTACT_FUNCTION$CONTACT_FUTURE)V"
private const val SINGLE_SET_INIT = "$CONTACT_SINGLE_SET-><init>(Ljava/lang/Object;)V"
private const val FETCHER_FIELD = "$HELPER->A00:$FETCHER"
private const val EXECUTOR_FIELD = "$HELPER->A02:$EXECUTOR_SERVICE"
private const val CALLER_FIELD = "$HELPER->A03:$CALLER"
private const val MODE_FIELD = "$MODE->A05:$MODE"
private const val FUNCTION_FIELD = "$FUNCTION_OWNER->A00:$FUNCTION_OWNER"
private const val PUBLIC = 0x1
private const val STATIC = 0x8
private val CONTACT_TABLES = setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH, Opcode.FILL_ARRAY_DATA)

/** PTu.BLt on 503, cut down: Hide contact's row when the socket allows it, then the tracer's end and the list. */
private const val ROWS_RETURN = "return-object v4"
private val ROWS_BODY = """
    invoke-static {}, LX/18k;->A18()Ljava/util/concurrent/atomic/AtomicInteger;
    move-result-object v2
    iget-object v3, p0, $SOCKET->A0A:$TRACER
    const-string v0, "$SPEC"
    const-string v1, "$CONTACT_ROWS_NAME"
    invoke-virtual {v3, v0, v1}, $TRACER->A05(Ljava/lang/String;Ljava/lang/String;)V
    const/4 v0, 0x2
    invoke-static {v0}, LX/001;->A10(I)Ljava/util/ArrayList;
    move-result-object v4
    invoke-direct {p0}, $SOCKET->A01()Z
    move-result v0
    if-eqz v0, :done
    const-string v0, "$CONTACT_HIDE_ROW"
    invoke-virtual {v3, v0, v1}, $TRACER->A04(Ljava/lang/String;Ljava/lang/String;)V
    const/4 v6, 0x0
    invoke-virtual {v4, v6}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z
    :done
    invoke-virtual {v3}, $TRACER->A00()V
    $ROWS_RETURN
""".trimIndent()

/** PTu.EW9 on 503, cut down: the tracer's start, Hide contact's id, then the tracer's end. */
private const val TAP_FIRST = "invoke-static {}, LX/18k;->A18()Ljava/util/concurrent/atomic/AtomicInteger;"
private val TAP_BODY = """
    $TAP_FIRST
    move-result-object v2
    iget-object v3, p0, $SOCKET->A0A:$TRACER
    const-string v0, "$SPEC"
    const-string v1, "$CONTACT_TAP_NAME"
    invoke-virtual {v3, v0, v1}, $TRACER->A05(Ljava/lang/String;Ljava/lang/String;)V
    const/16 v0, 0x8
    if-ne p1, v0, :done
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I
    const-string v0, "$CONTACT_HIDE_ROW"
    invoke-virtual {v3, v0, v1}, $TRACER->A04(Ljava/lang/String;Ljava/lang/String;)V
    :done
    invoke-virtual {v3}, $TRACER->A00()V
    return-void
""".trimIndent()

/** HsH.onSuccess on 503, cut down: the switch on its case, and case 12's fetched contact going into DeleteContactParams. */
private val CALLBACK_BODY = """
    iget v0, p0, $CALLBACK->A04:I
    packed-switch v0, :cases
    return-void
    :other
    return-void
    :delete
    check-cast p1, Lcom/facebook/contacts/graphql/Contact;
    if-eqz p1, :missing
    new-instance v1, $CONTACT_DELETE_PARAMS
    return-void
    :missing
    const-string v1, "$CONTACT_DELETE_MISSING"
    return-void
    :cases
    .packed-switch 0xb
        :other
        :delete
    .end packed-switch
""".trimIndent()

/** KMO.EY5 on 503 up to the callback's registration, with the helper read off a field instead of its provider. */
private const val START_SETTABLE = "invoke-static {}, $SETTABLE_CALL"
private const val START_CASE = "const/16 v7, 0xc"
private const val START_REGISTER = "invoke-static {v6, v1, v0}, $REGISTRAR_CALL"
private const val START_EXECUTOR = "iget-object v0, v9, $EXECUTOR_FIELD"
private const val START_CONTEXT = "iget-object v8, p0, $START_OWNER->A00:$CONTEXT"
private const val START_SESSION = "iget-object v10, p0, $START_OWNER->A01:$FB_USER_SESSION"
private const val START_TRANSFORM = "invoke-direct {v1, v0, v2}, $TRANSFORM_INIT"
private val START_BODY = """
    iget-object v2, p0, $START_OWNER->A04:Ljava/lang/String;
    iget-object v9, p0, $START_OWNER->A05:Ljava/lang/Object;
    check-cast v9, $HELPER
    $START_CONTEXT
    $START_SESSION
    $START_SETTABLE
    move-result-object v11
    invoke-static {v2}, $KEY_CALL
    move-result-object v7
    iget-object v6, v9, $FETCHER_FIELD
    sget-object v5, $MODE_FIELD
    sget-object v2, $CALLER_FIELD
    const/4 v1, 0x0
    new-instance v0, $CONTACT_SINGLE_SET
    invoke-direct {v0, v7}, $SINGLE_SET_INIT
    invoke-static {v2, v6, v5, v0, v1}, $FETCH_CALL
    move-result-object v2
    sget-object v0, $FUNCTION_FIELD
    new-instance v1, $TRANSFORM
    $START_TRANSFORM
    $START_CASE
    new-instance v6, $CALLBACK
    invoke-direct/range {v6 .. v11}, $CALLBACK_INIT
    $START_EXECUTOR
    $START_REGISTER
    return-void
""".trimIndent()

private fun contactField(owner: String, name: String, type: String, flags: Int = PUBLIC or AccessFlags.FINAL.value): Field =
    ImmutableField(owner, name, type, flags, null, null, null)

private fun socketFields(owner: String, extra: List<Field> = emptyList(), without: String? = null) = listOf(
    contactField(owner, "A0A", TRACER),
    contactField(owner, "A02", CONTEXT),
    contactField(owner, "A05", FB_USER_SESSION),
    contactField(owner, "A0C", USER),
    contactField(owner, "A0D", "Ljava/lang/String;"),
    contactField(owner, "A01", "I"),
).filter { it.type != without } + extra

private fun rowsMethod(body: String = ROWS_BODY, registers: Int = 9, owner: String = SOCKET, flags: Int = PUBLIC) =
    fixtureMethod("$owner->BLt()Ljava/util/ArrayList;", body.replace(SOCKET, owner), registers, flags)

private fun tapMethod(body: String = TAP_BODY, registers: Int = 6, owner: String = SOCKET, id: String = "$owner->EW9(I)V") =
    fixtureMethod(id, body.replace(SOCKET, owner), registers)

private fun socketClass(
    owner: String = SOCKET,
    rows: MutableMethod = rowsMethod(owner = owner),
    tap: MutableMethod = tapMethod(owner = owner),
    fields: List<Field> = socketFields(owner),
    interfaces: List<String> = listOf(SOCKET_FACE),
) = fixtureClass(owner, listOf(rows, tap), interfaces = interfaces, extraFields = fields)

/** A method with an empty body of the right kind, for the pieces only reached by reference. */
private fun contactStub(id: String, flags: Int = PUBLIC or STATIC): MutableMethod {
    val words = Regex("\\[*(?:L[^;]+;|[ZBSCIFJD])").findAll(id.substringAfter('(').substringBefore(')'))
        .sumOf { if (it.value == "J" || it.value == "D") 2L else 1L }.toInt() + if (flags and STATIC != 0) 0 else 1
    val returns = id.substringAfter(')')
    return fixtureMethod(id, if (returns == "V") "return-void" else "const/4 v0, 0x0\nreturn-object v0", maxOf(words, 1), flags)
}

private fun callbackClass(initFlags: Int = PUBLIC, body: String = CALLBACK_BODY, type: String = CALLBACK) = fixtureClass(type, listOf(
    fixtureMethod("$type-><init>$CONTACT_CALLBACK_INIT", """
        iput p1, p0, $type->A04:I
        iput-object p2, p0, $type->A00:Ljava/lang/Object;
        iput-object p3, p0, $type->A01:Ljava/lang/Object;
        iput-object p4, p0, $type->A02:Ljava/lang/Object;
        iput-object p5, p0, $type->A03:Ljava/lang/Object;
        invoke-direct {p0}, Ljava/lang/Object;-><init>()V
        return-void
    """.trimIndent(), 6, initFlags),
    fixtureMethod("$type->onSuccess(Ljava/lang/Object;)V", body.replace(CALLBACK, type), 4),
))

private fun startClass(body: String = START_BODY, owner: String = START_OWNER) =
    fixtureClass(owner, listOf(fixtureMethod("$owner->EY5()V", body, 13)))

private fun helperClass(initFlags: Int = PUBLIC, fetcherFlags: Int = PUBLIC, executorFlags: Int = PUBLIC, callerFlags: Int = PUBLIC or STATIC) =
    fixtureClass(HELPER, listOf(contactStub(HELPER_INIT, initFlags)), extraFields = listOf(
        contactField(HELPER, "A00", FETCHER, fetcherFlags),
        contactField(HELPER, "A02", EXECUTOR_SERVICE, executorFlags),
        contactField(HELPER, "A03", CALLER, callerFlags),
    ))

private fun ownerOf(id: String, flags: Int = PUBLIC or STATIC, classFlags: Int = PUBLIC) =
    fixtureClass(id.substringBefore("->"), listOf(contactStub(id, flags)), flags = classFlags)

private fun staticHolder(type: String, field: String, flags: Int = PUBLIC or STATIC) =
    fixtureClass(type, extraFields = listOf(contactField(type, field.substringAfter("->").substringBefore(':'), field.substringAfter(':'), flags)))

/** The one contact menu, and every piece of the removal its old row ran. A piece passed in takes the place of the one of its type. */
internal fun removeContactFixture(vararg changed: MutableClass): List<MutableClass> {
    val swapped = changed.associateBy { it.type }
    return listOf(
        socketClass(), callbackClass(), startClass(), helperClass(),
        ownerOf(TRANSFORM_INIT, PUBLIC), ownerOf(SINGLE_SET_INIT, PUBLIC), ownerOf(SETTABLE_CALL), ownerOf(KEY_CALL), ownerOf(FETCH_CALL), ownerOf(REGISTRAR_CALL),
        staticHolder(MODE, MODE_FIELD), staticHolder(FUNCTION_OWNER, FUNCTION_FIELD),
    ).map { swapped[it.type] ?: it } + changed.filter { extra -> extra.type !in setOf(SOCKET, CALLBACK, START_OWNER, HELPER, TRANSFORM, CONTACT_SINGLE_SET,
        SETTABLE_OWNER, KEY_OWNER, FETCHER, REGISTRAR_OWNER, MODE, FUNCTION_OWNER) }
}

/** The extension's removal stub as it ships. */
internal fun removeContactStub(): MutableMethod =
    fixtureMethod(REMOVE_CONTACT_START, "const/4 v0, 0x0\nreturn-object v0", 4, STATIC)

private fun Method.contactInstructions(): List<Instruction> = implementation!!.instructions.toList()
private fun List<Instruction>.noNops() = filter { it.opcode != Opcode.NOP }
private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.args(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}
private fun List<Instruction>.hookCalls() = count { it.ref() == REMOVE_CONTACT_ROWS || it.ref() == REMOVE_CONTACT_TAPPED }

/** Each stock branch with the instruction it lands on. A switch's or array fill's own offset names its table, so it's left out. */
private fun List<Instruction>.landings(): Map<Instruction, Instruction> =
    filter { it is BuilderOffsetInstruction && it.opcode !in CONTACT_TABLES }
        .associateWith { (it as BuilderOffsetInstruction).target.location.instruction!! }

/** Each branch by index, as above. */
private fun List<Instruction>.branchIndices(): Map<Int, Int> = indices
    .filter { this[it] is BuilderOffsetInstruction && this[it].opcode !in CONTACT_TABLES }
    .associateWith { (this[it] as BuilderOffsetInstruction).target.location.index }

/**
 * The rows call sits just in front of the method's one return-object, reading the socket's own register and the list
 * that stock return hands back, and every stock instruction and branch is as it was.
 */
private fun assertRowsHook(method: MutableMethod, before: List<Instruction>, label: String) {
    val after = method.contactInstructions()
    val at = before.indices.single { before[it].opcode == Opcode.RETURN_OBJECT }
    val list = (before[at] as OneRegisterInstruction).registerA
    assertEquals(before.noNops().size + 1, after.noNops().size, label)
    assertEquals(Opcode.INVOKE_STATIC, after[at].opcode, label)
    assertEquals(REMOVE_CONTACT_ROWS, after[at].ref(), label)
    assertEquals(listOf(method.implementation!!.registerCount - 1, list), after[at].args(), "$label: the socket and the list")
    assertSame(before[at], after[at + 1], "$label: the stock return comes right after")
    assertStockKept(before.noNops(), after.filterIndexed { i, _ -> i != at }.noNops(), label)
    assertEquals(before.landings(), after.landings(), "$label: stock branches")
    assertTrue(after.landings().values.none { it === after[at] }, "$label: nothing branches onto the hook")
    assertEquals(1, after.hookCalls(), label)
}

/**
 * The tap asks the extension first with the socket's register and the row's id, returns when it says the row was its
 * own, and otherwise goes on at the stock first instruction. Every stock instruction and branch is as it was.
 */
private fun assertTapHook(method: MutableMethod, before: List<Instruction>, label: String) {
    val after = method.contactInstructions()
    val first = method.implementation!!.registerCount - 2
    assertEquals(before.noNops().size + 4, after.noNops().size, label)
    assertEquals(Opcode.INVOKE_STATIC_RANGE, after[0].opcode, label)
    assertEquals(REMOVE_CONTACT_TAPPED, after[0].ref(), label)
    assertEquals(listOf(first, first + 1), after[0].args(), "$label: the socket and the id")
    assertEquals(Opcode.MOVE_RESULT, after[1].opcode, label)
    assertEquals(0, (after[1] as OneRegisterInstruction).registerA, label)
    assertEquals(Opcode.IF_EQZ, after[2].opcode, label)
    assertEquals(0, (after[2] as OneRegisterInstruction).registerA, label)
    assertEquals(4, (after[2] as BuilderOffsetInstruction).target.location.index, "$label: no goes on at the stock first instruction")
    assertSame(before[0], after[4], label)
    assertEquals(Opcode.RETURN_VOID, after[3].opcode, label)
    assertStockKept(before.noNops(), after.drop(4).noNops(), label)
    assertEquals(before.landings(), after.landings() - after[2], "$label: stock branches")
    assertEquals(1, after.hookCalls(), label)
}

class RemoveContactTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
        removeContactRecipe = null
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(REMOVE_CONTACT).map { it.hookId() }.toSet()

    @Test fun theFinderAndItsMirrorTakeEachMenusRowsAndTap() {
        assertEquals(setOf(SYNTHETIC_REMOVE_CONTACT_ROWS, SYNTHETIC_REMOVE_CONTACT_TAP), found(removeContactFixture()))
        validateControls(mirroredControls(removeContactFixture()), setOf(REMOVE_CONTACT))
        // Search's menu for people who aren't contacts is a socket too. The extension tells it apart at run time.
        val both = removeContactFixture(socketClass(SEARCH_SOCKET))
        assertEquals(setOf(SYNTHETIC_REMOVE_CONTACT_ROWS, SYNTHETIC_REMOVE_CONTACT_TAP, "$SEARCH_SOCKET->BLt()Ljava/util/ArrayList;", "$SEARCH_SOCKET->EW9(I)V"),
            found(both))
    }

    @Test fun everyPieceComesFromMessengersOwnRemoval() {
        val recipe = assertNotNull(resolveRemoveContact(removeContactFixture()))
        assertEquals(listOf(SYNTHETIC_REMOVE_CONTACT_ROWS, SYNTHETIC_REMOVE_CONTACT_TAP), recipe.sites.map { it.hookId() })
        assertEquals(START, recipe.builder.hookId())
        assertEquals(HELPER, recipe.helper)
        assertEquals(SETTABLE_CALL, recipe.settable)
        assertEquals(KEY_CALL, recipe.userKey)
        assertEquals(FETCHER_FIELD, recipe.fetcher)
        assertEquals(MODE_FIELD, recipe.mode)
        assertEquals(CALLER_FIELD, recipe.caller)
        assertEquals(FETCH_CALL, recipe.fetch)
        assertEquals(0, recipe.flag)
        assertEquals(FUNCTION_FIELD, recipe.function)
        assertEquals(TRANSFORM, recipe.transform)
        assertEquals(CALLBACK, recipe.callback)
        assertEquals(12, recipe.case)
        assertEquals(listOf(RemovalSlot.CONTEXT, RemovalSlot.HELPER, RemovalSlot.SESSION, RemovalSlot.SETTABLE), recipe.slots)
        assertEquals(EXECUTOR_FIELD, recipe.executor)
        assertEquals(REGISTRAR_CALL, recipe.registrar)
    }

    @Test fun theRowsGoToTheExtensionJustBeforeTheMenuReturnsThem() {
        val rows = rowsMethod()
        val before = rows.contactInstructions()
        val branches = before.branchIndices()
        assertEquals(mapOf(11 to 16), branches, "Hide contact's skip lands on the tracer's end, in front of the return")
        injectControl(REMOVE_CONTACT, mapOf(REMOVE_CONTACT to listOf(rows)))
        assertRowsHook(rows, before, "fixture")
        assertEquals(branches, rows.contactInstructions().branchIndices(), "The skip still lands on the tracer's end")
        assertEquals(listOf(8, 4), rows.contactInstructions()[17].args())
    }

    @Test fun theRowsCallReadsWhicheverRegistersTheStockReturnAndParametersUse() {
        val body = ROWS_BODY.replace("move-result-object v4", "move-result-object v7").replace("invoke-virtual {v4, v6}", "invoke-virtual {v7, v6}")
            .replace(ROWS_RETURN, "return-object v7")
        val rows = rowsMethod(body, registers = 12)
        val before = rows.contactInstructions()
        rows.injectRemoveContact()
        assertRowsHook(rows, before, "v7 and p0 in v11")
        assertEquals(listOf(11, 7), rows.contactInstructions()[17].args())
    }

    @Test fun theTapAsksTheExtensionFirstAndOtherwiseRunsTheStockTap() {
        val tap = tapMethod()
        val before = tap.contactInstructions()
        val branches = before.branchIndices()
        assertEquals(mapOf(7 to 11), branches, "Hide contact's skip lands on the tracer's end")
        injectControl(REMOVE_CONTACT, mapOf(REMOVE_CONTACT to listOf(tap)))
        assertTapHook(tap, before, "fixture")
        assertEquals(branches.mapKeys { it.key + 4 }.mapValues { it.value + 4 } + (2 to 4), tap.contactInstructions().branchIndices())
        assertEquals(listOf(4, 5), tap.contactInstructions()[0].args())
    }

    @Test fun aTapWithManyRegistersStillPassesItsOwnInARangeCall() {
        val tap = tapMethod(registers = 20)
        val before = tap.contactInstructions()
        tap.injectRemoveContact()
        assertTapHook(tap, before, "p0 in v18")
        assertEquals(listOf(18, 19), tap.contactInstructions()[0].args())
    }

    @Test fun aSecondPassLeavesBothHooksAlone() {
        val rows = rowsMethod()
        val tap = tapMethod()
        injectControl(REMOVE_CONTACT, mapOf(REMOVE_CONTACT to listOf(rows, tap)))
        for (method in listOf(rows, tap)) {
            val once = method.contactInstructions()
            injectControl(REMOVE_CONTACT, mapOf(REMOVE_CONTACT to listOf(method)))
            method.injectRemoveContact()
            val twice = method.contactInstructions()
            assertEquals(once.size, twice.size, method.hookId())
            once.zip(twice).forEachIndexed { i, (a, b) -> assertSame(a, b, "${method.hookId()} instruction $i") }
            assertEquals(1, twice.hookCalls(), method.hookId())
        }
    }

    @Test fun menusOfAnotherShapeAreRefusedAndLeftAsTheyWere() {
        fun rows(from: String, to: String): String {
            assertEquals(1, ROWS_BODY.split(from).size - 1, from)
            return ROWS_BODY.replace(from, to)
        }
        fun tap(from: String, to: String): String {
            assertEquals(1, TAP_BODY.split(from).size - 1, from)
            return TAP_BODY.replace(from, to)
        }
        val badRows = listOf(
            "rows that say another name" to rowsMethod(rows("\"$CONTACT_ROWS_NAME\"", "\"getProfileMenuItem\"")),
            "rows without Hide contact or Block" to rowsMethod(rows("\"$CONTACT_HIDE_ROW\"", "\"messaging.graph.contactinfomenu.Other\"")),
            "static rows" to rowsMethod(ROWS_BODY.replace("p0", "v8"), flags = PUBLIC or STATIC),
            "a branch onto the return" to rowsMethod(rows(ROWS_RETURN, ":out\n$ROWS_RETURN").replace("if-eqz v0, :done", "if-eqz v0, :out")),
            "two returns" to rowsMethod(rows("const/4 v6, 0x0", "if-nez v1, :keep\n$ROWS_RETURN\n:keep\nconst/4 v6, 0x0")),
            "rows that write their own register" to rowsMethod(rows("const/4 v6, 0x0", "const/4 v6, 0x0\nmove-object p0, v3")),
            "the socket handed back as the list" to rowsMethod(rows(ROWS_RETURN, "return-object p0")),
            "the socket's register past v15" to rowsMethod(registers = 17),
        )
        val badTaps = listOf(
            "a tap that says another name" to tapMethod(tap("\"$CONTACT_TAP_NAME\"", "\"onProfileMenuItemSelected\"")),
            "a tap with no local" to tapMethod("const-string p1, \"$CONTACT_TAP_NAME\"\nreturn-void", registers = 2),
            "a tap with two parameters" to tapMethod(id = "$SOCKET->EW9(II)V", registers = 7),
            "a branch onto the tap's first instruction" to tapMethod(tap(TAP_FIRST, ":top\n$TAP_FIRST")
                .replace("invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I", "goto :top")),
            "a tap Redex merged with another class's" to tapMethod(tap("const/16 v0, 0x8", "iget v0, p0, $SOCKET->A01:I\npacked-switch v0, :merged\nconst/16 v0, 0x8") +
                "\n:merged\n.packed-switch 0x0\n:done\n.end packed-switch"),
        )
        for ((case, bad) in badRows + badTaps) {
            val before = bad.contactInstructions()
            val socket = if (bad.name == "BLt") socketClass(rows = bad) else socketClass(tap = bad)
            assertEquals(emptySet(), found(removeContactFixture(socket)), case)
            assertFailsWith<PatchException>(case) { injectControl(REMOVE_CONTACT, mapOf(REMOVE_CONTACT to listOf(bad))) }
            assertEquals(before, bad.contactInstructions(), case)
        }
    }

    @Test fun aSocketWithoutItsScreenAccountOrPersonIsNotAContactMenu() {
        for (missing in listOf(CONTEXT, FB_USER_SESSION, USER)) {
            assertEquals(emptySet(), found(removeContactFixture(socketClass(fields = socketFields(SOCKET, without = missing)))), "no $missing")
            assertEquals(emptySet(), found(removeContactFixture(socketClass(fields = socketFields(SOCKET, extra = listOf(contactField(SOCKET, "A0Z", missing)))))),
                "two $missing")
        }
        assertEquals(emptySet(), found(removeContactFixture(socketClass(interfaces = emptyList()))), "no interface")
        assertEquals(emptySet(), found(removeContactFixture(socketClass(interfaces = listOf(SOCKET_FACE, "LX/Q80;")))), "two interfaces")
        // One socket that doesn't read as one leaves every menu alone, since the removal can't be trusted to match.
        assertEquals(emptySet(), found(removeContactFixture(socketClass(SEARCH_SOCKET, fields = socketFields(SEARCH_SOCKET, without = USER)))), "a second socket with no person")
    }

    @Test fun aRemovalThatDoesntReadAsExpectedLeavesEveryMenuAlone() {
        fun start(from: String, to: String): MutableClass {
            assertEquals(1, START_BODY.split(from).size - 1, from)
            return startClass(START_BODY.replace(from, to))
        }
        val cases = listOf(
            "a helper the extension can't make" to removeContactFixture(helperClass(initFlags = AccessFlags.PRIVATE.value)),
            "a fetcher the extension can't read" to removeContactFixture(helperClass(fetcherFlags = AccessFlags.PRIVATE.value)),
            "an executor the extension can't read" to removeContactFixture(helperClass(executorFlags = 0)),
            "a caller context that isn't static" to removeContactFixture(helperClass(callerFlags = PUBLIC)),
            "a callback the extension can't make" to removeContactFixture(callbackClass(initFlags = 0)),
            "a fetch the extension can't call" to removeContactFixture(ownerOf(FETCH_CALL, classFlags = 0)),
            "a registrar that isn't static" to removeContactFixture(ownerOf(REGISTRAR_CALL, flags = PUBLIC)),
            "a mode the extension can't read" to removeContactFixture(staticHolder(MODE, MODE_FIELD, flags = STATIC)),
            "a transform the extension can't make" to removeContactFixture(ownerOf(TRANSFORM_INIT, flags = AccessFlags.PROTECTED.value)),
            "a case that doesn't delete" to removeContactFixture(start(START_CASE, "const/16 v7, 0xb")),
            "a case the callback doesn't have" to removeContactFixture(start(START_CASE, "const/16 v7, 0xd")),
            "a callback that doesn't delete" to removeContactFixture(callbackClass(body = CALLBACK_BODY.replace("new-instance v1, $CONTACT_DELETE_PARAMS", "const/4 v1, 0x0"))),
            "a second callback" to removeContactFixture(fixtureClass("LX/HsI;", listOf(fixtureMethod("LX/HsI;->onSuccess(Ljava/lang/Object;)V",
                "const-string v0, \"$CONTACT_DELETE_MISSING\"\nreturn-void", 3)))),
            "a second start" to removeContactFixture(startClass(owner = "LX/KMP;")),
            "a settable from somewhere else" to removeContactFixture(start("$START_SETTABLE\nmove-result-object v11", "iget-object v11, p0, $START_OWNER->A06:Lcom/google/common/util/concurrent/SettableFuture;")),
            "a start with a branch" to removeContactFixture(start(START_CASE, "if-eqz v1, :later\n:later\n$START_CASE")),
            "the callback on the bare fetch" to removeContactFixture(start(START_REGISTER, "invoke-static {v6, v2, v0}, $REGISTRAR_CALL")),
            "a transform of something else" to removeContactFixture(start(START_TRANSFORM, "invoke-direct {v1, v0, v11}, $TRANSFORM_INIT")),
            "an executor from somewhere else" to removeContactFixture(start(START_EXECUTOR, "iget-object v0, p0, $START_OWNER->A07:$EXECUTOR_SERVICE")),
            "the screen from somewhere else" to removeContactFixture(start(START_CONTEXT, "sget-object v8, $START_OWNER->A08:$CONTEXT")),
        )
        for ((case, classes) in cases) {
            assertNull(resolveRemoveContact(classes), case)
            assertEquals(emptySet(), found(classes), case)
        }
    }

    @Test fun theStubRunsMessengersOwnRemovalWithWhatItIsGiven() {
        val recipe = assertNotNull(resolveRemoveContact(removeContactFixture()))
        val built = removeContactBuilder(removeContactStub(), recipe)
        val code = built.contactInstructions()
        assertEquals(listOf(HELPER, HELPER_INIT, SETTABLE_CALL, "Ljava/lang/String;", KEY_CALL, FETCHER_FIELD, MODE_FIELD, CALLER_FIELD, CONTACT_SINGLE_SET,
            SINGLE_SET_INIT, FETCH_CALL, FUNCTION_FIELD, TRANSFORM, TRANSFORM_INIT, CONTEXT, FB_USER_SESSION, CALLBACK, CALLBACK_INIT, EXECUTOR_FIELD,
            REGISTRAR_CALL, "[Ljava/lang/Object;"), code.mapNotNull { it.ref() })
        assertEquals(15, built.implementation!!.registerCount)
        assertTrue(AccessFlags.STATIC.isSet(built.accessFlags))
        // The user id is the third parameter, p2 in v14.
        assertEquals(14, (code.single { it.ref() == "Ljava/lang/String;" } as OneRegisterInstruction).registerA)
        assertEquals(listOf(14), code.single { it.ref() == KEY_CALL }.args())
        // The fetch's flag and the callback's case are the start's own.
        val fetch = code.indexOfFirst { it.ref() == FETCH_CALL }
        assertEquals(0, (code[fetch - 1] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(code[fetch].args()[4], (code[fetch - 1] as OneRegisterInstruction).registerA)
        // The callback takes its case, then the screen (p0), the helper, the account (p1) and the settable, in the start's order.
        val made = code.indexOfFirst { it.ref() == CALLBACK_INIT }
        assertEquals(listOf(6, 7, 8, 9, 10, 11), code[made].args())
        assertEquals(12, (code[made - 5] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(listOf(8 to 12, 9 to 0, 10 to 13, 11 to 1), (made - 4 until made).map { i ->
            assertEquals(Opcode.MOVE_OBJECT, code[i].opcode)
            (code[i] as TwoRegisterInstruction).let { it.registerA to it.registerB }
        })
        // The callback goes on the transformed fetch with the helper's executor, and the answer is the settable then that fetch.
        val register = code.indexOfFirst { it.ref() == REGISTRAR_CALL }
        assertEquals(listOf(6, 5, 2), code[register].args())
        assertEquals(listOf(5, 4, 3), code.single { it.ref() == TRANSFORM_INIT }.args())
        val stores = code.filter { it.opcode == Opcode.APUT_OBJECT }.map { (it as TwoRegisterInstruction).registerA }
        assertEquals(listOf(1, 5), stores)
        assertEquals(Opcode.RETURN_OBJECT, code.last().opcode)
    }

    @Test fun theStubPassesTheCallbackItsValuesInTheOrderThisBuildsStartDoes() {
        val swapped = START_BODY.replace(START_CONTEXT, "iget-object v10, p0, $START_OWNER->A00:$CONTEXT")
            .replace(START_SESSION, "iget-object v8, p0, $START_OWNER->A01:$FB_USER_SESSION")
        val recipe = assertNotNull(resolveRemoveContact(removeContactFixture(startClass(swapped))))
        assertEquals(listOf(RemovalSlot.SESSION, RemovalSlot.HELPER, RemovalSlot.CONTEXT, RemovalSlot.SETTABLE), recipe.slots)
        val code = removeContactBuilder(removeContactStub(), recipe).contactInstructions()
        val made = code.indexOfFirst { it.ref() == CALLBACK_INIT }
        assertEquals(listOf(8 to 13, 9 to 0, 10 to 12, 11 to 1), (made - 4 until made).map { i ->
            (code[i] as TwoRegisterInstruction).let { it.registerA to it.registerB }
        })
    }

    @Test fun aChangedStubStopsThePatch() {
        val recipe = assertNotNull(resolveRemoveContact(removeContactFixture()))
        val cases = mapOf(
            "a real body" to fixtureMethod(REMOVE_CONTACT_START, "const/4 v0, 0x1\nreturn-object v0", 4, STATIC),
            "a longer body" to fixtureMethod(REMOVE_CONTACT_START, "const/4 v0, 0x0\nconst/4 v0, 0x0\nreturn-object v0", 4, STATIC),
            "not static" to fixtureMethod(REMOVE_CONTACT_START, "const/4 v0, 0x0\nreturn-object v0", 5, PUBLIC),
            "private" to fixtureMethod(REMOVE_CONTACT_START, "const/4 v0, 0x0\nreturn-object v0", 4, STATIC or AccessFlags.PRIVATE.value),
            "another method" to fixtureMethod("$REMOVE_CONTACT_HOST->other()[Ljava/lang/Object;", "const/4 v0, 0x0\nreturn-object v0", 1, STATIC),
        )
        for ((case, stub) in cases) assertFailsWith<PatchException>(case) { removeContactBuilder(stub, recipe) }
    }

    @Test fun withoutARecipeNothingIsFound() {
        removeContactRecipe = assertNotNull(resolveRemoveContact(removeContactFixture()))
        assertTrue(findRemoveContact(removeContactFixture().filter { it.type != HELPER }).isEmpty())
        assertNull(removeContactRecipe, "A build it can't read leaves no recipe behind from an earlier one")
    }

    @Test fun everySupportedBuildHooksEachContactMenuAndReadsItsRemoval() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val sites = findRemoveContact(classes)
            assertEquals(activeProfile.hooks.getValue(REMOVE_CONTACT), sites.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(REMOVE_CONTACT to sites), setOf(REMOVE_CONTACT))
            val recipe = assertNotNull(removeContactRecipe, code)
            assertEquals(RemovalSlot.entries.toSet(), recipe.slots.toSet(), code)
            // Every menu is a rows method and a tap method of one class, one pair per class.
            assertEquals(sites.size / 2, sites.map { it.definingClass }.toSet().size, code)
            assertEquals(sites.size / 2, sites.count { it.returnType == "Ljava/util/ArrayList;" }, code)
            removeContactBuilder(removeContactStub(), recipe)
            for (site in sites) {
                val method = MutableMethod(site)
                val before = method.contactInstructions()
                method.injectRemoveContact()
                if (site.returnType == "V") assertTapHook(method, before, "$code ${site.hookId()}")
                else assertRowsHook(method, before, "$code ${site.hookId()}")
                val once = method.contactInstructions()
                method.injectRemoveContact()
                val twice = method.contactInstructions()
                assertEquals(once.size, twice.size, "$code ${site.hookId()} second pass")
                once.zip(twice).forEach { (a, b) -> assertSame(a, b, "$code ${site.hookId()} second pass") }
            }
        }
    }
}
