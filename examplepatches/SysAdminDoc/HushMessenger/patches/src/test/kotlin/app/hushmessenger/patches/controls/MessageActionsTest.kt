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
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
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
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

private const val BAR_OWNER = "LX/5TH;"
private const val HELD = "LX/AM6;"
private const val ACTION_ROW = "LX/5QT;"
private const val SENT_TYPE = "LX/6pX;"
private const val SENT_FIELD = "$ACTION_ROW->A00:$SENT_TYPE"
private const val SENT_CALL = "$SENT_TYPE->DFH()Z"
private const val MORE_OWNER = "LX/63p;"
private const val LIST_BUILDER = "Lcom/google/common/collect/ImmutableList\$Builder;"
private const val COPY = "$IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST"
private const val BUILD = "$IMMUTABLE_LIST->A01($LIST_BUILDER)$IMMUTABLE_LIST"
private const val LIST_SIZE = "Ljava/util/List;->size()I"
private const val SHEET_BUILDER = "LX/PAB;"

/** The synthetic labels for the two hooks, named after the build they were found in. */
internal const val ACTIONS_BAR = "$BAR_OWNER->AYM(${HELD}Ljava/util/EnumMap;)LX/6Og;"
internal const val ACTIONS_MORE = "$MORE_OWNER->E6x(LX/1Vl;LX/5Hx;LX/DMu;$HELD)V"

/**
 * The held message's action builder cut down to what 586 shares: the sent flag read off the held message, a copy that
 * isn't measured, and the full list's copy measured right where the other branch joins it. p1 is v8.
 */
private val BAR_BODY = """
    move-object v2, v8
    check-cast v2, $ACTION_ROW
    iget-object v3, v2, $SENT_FIELD
    invoke-interface {v3}, $SENT_CALL
    move-result v4
    const-string v0, "$MESSAGE_ACTIONS_MARK"
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V
    invoke-static {v5}, $COPY
    move-result-object v6
    const/4 v2, 0x3
    if-nez v4, :sent
    invoke-static {v5}, $COPY
    move-result-object v1
    :measure
    invoke-interface {v1}, $LIST_SIZE
    move-result v0
    if-le v0, v2, :fits
    const/4 v6, 0x0
    :fits
    return-object v6
    :sent
    move-object v1, v5
    goto :measure
""".trimIndent()

/**
 * The More sheet cut down the same way: its list read off its own field and copied, Messenger's own sort when its flag
 * is on, and the sheet's builder made where both ways meet. p0 is v19.
 */
private val MORE_BODY = """
    invoke-static {}, LX/1vK;->A00()Z
    move-result v17
    move-object/from16 v2, v19
    iget-object v1, v2, $MORE_OWNER->A00:$IMMUTABLE_LIST
    move-object/from16 v18, v1
    if-eqz v17, :build
    new-instance v3, $LIST_BUILDER
    invoke-direct {v3}, $LIST_BUILDER-><init>()V
    invoke-static {v3}, $BUILD
    move-result-object v1
    :build
    new-instance v8, $SHEET_BUILDER
    invoke-direct {v8}, $SHEET_BUILDER-><init>()V
    const-string v0, "$MORE_SHEET_TAG"
    return-void
""".trimIndent()

/** 586's real More sheet is also save_voice_menu's: the same method makes MenuDialogParams with that builder. */
private val SHARED_SHEET_BODY = """
    move-object/from16 v4, v23
    invoke-static {}, LX/1vK;->A00()Z
    move-result v17
    move-object/from16 v2, v19
    iget-object v1, v2, $MORE_OWNER->A00:$IMMUTABLE_LIST
    move-object/from16 v18, v1
    if-eqz v17, :build
    new-instance v3, $LIST_BUILDER
    invoke-direct {v3}, $LIST_BUILDER-><init>()V
    invoke-static {v3}, $BUILD
    move-result-object v1
    :build
    new-instance v8, $SHEET_BUILDER
    invoke-direct {v8}, $SHEET_BUILDER-><init>()V
    new-instance v0, $MENU_PARAMS
    invoke-direct {v0, v8}, $MENU_PARAMS-><init>($SHEET_BUILDER)V
    const-string v0, "$MORE_SHEET_TAG"
    return-void
""".trimIndent()

private fun barMethod(body: String = BAR_BODY, id: String = ACTIONS_BAR, flags: Int = AccessFlags.PUBLIC.value) = fixtureMethod(id, body, 10, flags)
private fun moreMethod(body: String = MORE_BODY, id: String = ACTIONS_MORE, flags: Int = AccessFlags.PUBLIC.value) = fixtureMethod(id, body, 24, flags)
private fun barClass(method: Method = barMethod()) = fixtureClass(BAR_OWNER, listOf(method))
private fun moreClass(method: Method = moreMethod()) = fixtureClass(MORE_OWNER, listOf(method))

/** Both hooks, each in its own class. */
internal fun messageActionsFixture(): List<MutableClass> = listOf(barClass(), moreClass())

private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()
private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.arguments() = (this as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD, it.registerE, it.registerF, it.registerG).take(it.registerCount) }
private fun Instruction.target() = (this as OneRegisterInstruction).registerA

class MessageActionsTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
        saveVoiceMenuRecipe = null
    }

    private fun found(classes: List<MutableClass>, key: String) = mirroredControls(classes).getValue(key).map { it.hookId() }.toSet()

    private fun changed(body: String, old: String, new: String): String {
        val replaced = body.replace(old, new)
        assertTrue(replaced != body, "A lookalike that changes nothing proves nothing: $old")
        return replaced
    }

    @Test fun bothHooksAreFoundByTheirShape() {
        assertEquals(setOf(ACTIONS_BAR), found(messageActionsFixture(), MESSAGE_ACTIONS))
        assertEquals(setOf(ACTIONS_MORE), found(messageActionsFixture(), MESSAGE_ACTIONS_MORE))
        validateControls(mirroredControls(messageActionsFixture()), setOf(MESSAGE_ACTIONS, MESSAGE_ACTIONS_MORE))
    }

    @Test fun aSentFlagReadOffACopyOfTheCopyStillCounts() {
        val body = changed(BAR_BODY, "move-object v2, v8\n", "move-object v6, v8\nmove-object v2, v6\n")
        assertEquals(setOf(ACTIONS_BAR), found(listOf(barClass(barMethod(body)), moreClass()), MESSAGE_ACTIONS))
    }

    @Test fun lookalikesAreNotTheActionBuilder() {
        val cases = mapOf(
            "no menuItems" to changed(BAR_BODY, "\"$MESSAGE_ACTIONS_MARK\"", "\"items\""),
            "a list it never measures" to changed(BAR_BODY, "invoke-interface {v1}, $LIST_SIZE", "invoke-interface {v1}, Ljava/util/List;->isEmpty()Z"),
            "two copies measured right away" to changed(BAR_BODY, "move-result-object v6\n", "move-result-object v6\ninvoke-interface {v6}, $LIST_SIZE\n"),
            "a size compared the other way" to changed(BAR_BODY, "if-le v0, v2, :fits", "if-ge v0, v2, :fits"),
            "a compare that doesn't start from the size" to changed(BAR_BODY, "if-le v0, v2, :fits", "if-le v2, v0, :fits"),
            "a size read into the list's register" to changed(BAR_BODY, "move-result v0\nif-le v0, v2", "move-result v1\nif-le v1, v2"),
            "a held message written over" to "const/4 v8, 0x0\n$BAR_BODY",
            "a flag read off something else" to changed(BAR_BODY, "move-object v2, v8\n", "move-object v2, v7\n"),
            "a flag that isn't a boolean" to BAR_BODY.replace(SENT_CALL, "$SENT_TYPE->DFH()I"),
            "two different flags" to changed(BAR_BODY, "move-result v4\n", "move-result v4\nmove-object v2, v8\ncheck-cast v2, LX/5QU;\n" +
                "iget-object v3, v2, LX/5QU;->A00:$SENT_TYPE\ninvoke-interface {v3}, $SENT_CALL\nmove-result v4\n"),
            "a size measured with no compare after" to changed(BAR_BODY, "if-le v0, v2, :fits\nconst/4 v6, 0x0\n:fits\n", ""),
        )
        for ((case, body) in cases) {
            val classes = listOf(barClass(barMethod(body)), moreClass())
            assertEquals(emptySet(), found(classes, MESSAGE_ACTIONS), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(MESSAGE_ACTIONS)) }
        }
        val static = listOf(barClass(barMethod(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)), moreClass())
        assertEquals(emptySet(), found(static, MESSAGE_ACTIONS), "a static builder")
        val noMap = listOf(barClass(barMethod(id = ACTIONS_BAR.replace("Ljava/util/EnumMap;", "Ljava/util/HashMap;"))), moreClass())
        assertEquals(emptySet(), found(noMap, MESSAGE_ACTIONS), "no EnumMap")
    }

    @Test fun lookalikesAreNotTheMoreSheet() {
        val cases = mapOf(
            "another tag" to changed(MORE_BODY, MORE_SHEET_TAG, "OTHER_TAG"),
            "its list read twice" to changed(MORE_BODY, "move-object/from16 v2, v19\n", "move-object/from16 v2, v19\niget-object v3, v2, $MORE_OWNER->A01:$IMMUTABLE_LIST\n"),
            "no copy of the list" to changed(MORE_BODY, "move-object/from16 v18, v1", "move-object/from16 v18, v2"),
            "a sort that isn't skipped by a test" to changed(MORE_BODY, "if-eqz v17, :build", "if-gez v17, :build"),
            "the sorted list in another register" to changed(MORE_BODY, "invoke-static {v3}, $BUILD\nmove-result-object v1", "invoke-static {v3}, $BUILD\nmove-result-object v3"),
            "a sorted list made some other way" to changed(MORE_BODY, "invoke-static {v3}, $BUILD", "invoke-static {v3}, $IMMUTABLE_LIST->of(Ljava/lang/Object;)$IMMUTABLE_LIST"),
            "the copy written over before the builder" to changed(MORE_BODY, "invoke-direct {v3}, $LIST_BUILDER-><init>()V\n", "invoke-direct {v3}, $LIST_BUILDER-><init>()V\nconst/16 v18, 0x0\n"),
            "a second way into the builder" to changed(MORE_BODY, "if-eqz v17, :build\n", "if-eqz v17, :build\nif-nez v2, :build\n"),
            "the copy in the builder's register" to changed(MORE_BODY, "move-object/from16 v18, v1", "move-object v8, v1"),
            "no builder where both ways meet" to changed(MORE_BODY, ":build\nnew-instance v8, $SHEET_BUILDER", ":build\nconst/4 v8, 0x0\nnew-instance v8, $SHEET_BUILDER"),
        )
        for ((case, body) in cases) {
            val classes = listOf(barClass(), moreClass(moreMethod(body)))
            assertEquals(emptySet(), found(classes, MESSAGE_ACTIONS_MORE), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(MESSAGE_ACTIONS_MORE)) }
        }
        val static = listOf(barClass(), moreClass(moreMethod(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)))
        assertEquals(emptySet(), found(static, MESSAGE_ACTIONS_MORE), "a static sheet")
        val foreign = listOf(barClass(), fixtureClass("LX/63q;", listOf(moreMethod(id = ACTIONS_MORE.replace(MORE_OWNER, "LX/63q;")))))
        assertEquals(emptySet(), found(foreign, MESSAGE_ACTIONS_MORE), "a list read off another class's field")
    }

    @Test fun twoOfEitherAreTooManyToTrust() {
        val bar = fixtureClass("LX/5TI;", listOf(barMethod(id = ACTIONS_BAR.replace(BAR_OWNER, "LX/5TI;"))))
        assertEquals(emptySet(), found(messageActionsFixture() + bar, MESSAGE_ACTIONS))
        val other = "LX/63q;"
        val more = fixtureClass(other, listOf(moreMethod(MORE_BODY.replace(MORE_OWNER, other), ACTIONS_MORE.replace(MORE_OWNER, other))))
        assertEquals(emptySet(), found(messageActionsFixture() + more, MESSAGE_ACTIONS_MORE))
    }

    @Test fun theFullListPassesTheExtensionOnEveryWayIntoTheCut() {
        val method = barMethod()
        val before = method.code()
        val at = before.indexOfFirst { it.reference() == LIST_SIZE }
        injectControl(MESSAGE_ACTIONS, mapOf(MESSAGE_ACTIONS to listOf(method)))
        val code = method.code()
        assertEquals(before.size + 14, code.size)

        assertEquals(Opcode.MOVE_OBJECT_FROM16, code[at].opcode)
        assertEquals(0, code[at].target(), "The size's result register holds nothing yet")
        assertEquals(8, (code[at] as TwoRegisterInstruction).registerB, "The held message")
        assertEquals(Opcode.INSTANCE_OF, code[at + 1].opcode)
        assertEquals(ACTION_ROW, code[at + 1].reference())
        assertEquals(Opcode.IF_NEZ, code[at + 2].opcode)
        assertEquals(at + 5, code.branchTarget(at + 2))
        assertEquals(Opcode.CONST_4, code[at + 3].opcode)
        assertEquals(-1, (code[at + 3] as NarrowLiteralInstruction).narrowLiteral, "Not a message row: the extension leaves it be")
        assertEquals(Opcode.GOTO, code[at + 4].opcode)
        assertEquals(at + 10, code.branchTarget(at + 4))
        assertEquals(Opcode.MOVE_OBJECT_FROM16, code[at + 5].opcode)
        assertEquals(ACTION_ROW, code[at + 6].reference())
        assertEquals(SENT_FIELD, code[at + 7].reference())
        assertEquals(SENT_CALL, code[at + 8].reference())
        assertEquals(Opcode.MOVE_RESULT, code[at + 9].opcode)
        assertEquals(MESSAGE_ACTIONS_ARRANGE, code[at + 10].reference())
        assertEquals(listOf(1, 0), code[at + 10].arguments(), "The list and the side")
        assertEquals(1, code[at + 11].target())
        assertEquals(COPY, code[at + 12].reference())
        assertEquals(listOf(1), code[at + 12].arguments(), "Messenger reads it back as an ImmutableList")
        assertEquals(1, code[at + 13].target())
        assertEquals(Opcode.INVOKE_INTERFACE, code[at + 14].opcode)
        assertEquals(LIST_SIZE, code[at + 14].reference())
        assertEquals(listOf(1), code[at + 14].arguments())
        assertEquals(Opcode.MOVE_RESULT, code[at + 15].opcode)
        // The branch from the sent side joins at the hook, not past it.
        assertEquals(at, code.branchTarget(code.indexOfLast { it.opcode == Opcode.GOTO }))
        assertEquals(code.indexOfFirst { it.opcode == Opcode.MOVE_OBJECT && it.target() == 1 }, code.branchTarget(code.indexOfFirst { it.opcode == Opcode.IF_NEZ }))
        // Everything else is Messenger's own code, unchanged, the size call included.
        assertEquals(before.map { it.opcode }, code.filterIndexed { i, _ -> i !in at..at + 13 }.map { it.opcode })
    }

    @Test fun aSizeAskedOfTheImmutableListItselfIsAskedTheSameWay() {
        val size = "$IMMUTABLE_LIST->size()I"
        val method = barMethod(changed(BAR_BODY, "invoke-interface {v1}, $LIST_SIZE", "invoke-virtual {v1}, $size"))
        val at = method.code().indexOfFirst { it.reference() == size }
        injectControl(MESSAGE_ACTIONS, mapOf(MESSAGE_ACTIONS to listOf(method)))
        val code = method.code()
        assertEquals(Opcode.INVOKE_VIRTUAL, code[at + 14].opcode)
        assertEquals(size, code[at + 14].reference())
    }

    @Test fun theSheetKeepsTheOrderOnlyWhenMessengerSortsIt() {
        val method = moreMethod()
        val before = method.code()
        val at = before.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.reference() == SHEET_BUILDER }
        injectControl(MESSAGE_ACTIONS_MORE, mapOf(MESSAGE_ACTIONS_MORE to listOf(method)))
        val code = method.code()
        assertEquals(before.size + 5, code.size)
        assertEquals(Opcode.MOVE_OBJECT_FROM16, code[at].opcode)
        assertEquals(8, code[at].target(), "The builder's register, free until it's made")
        assertEquals(18, (code[at] as TwoRegisterInstruction).registerB, "The list the sheet was handed")
        assertEquals(MESSAGE_ACTIONS_REORDER, code[at + 1].reference())
        assertEquals(listOf(1, 8), code[at + 1].arguments(), "Messenger's sorted list and the handed one")
        assertEquals(1, code[at + 2].target())
        assertEquals(COPY, code[at + 3].reference())
        assertEquals(1, code[at + 4].target())
        assertEquals(Opcode.NEW_INSTANCE, code[at + 5].opcode)
        val skip = code.indexOfFirst { it.opcode == Opcode.IF_EQZ }
        assertEquals(at + 5, code.branchTarget(skip), "Without the sort the handed list is already in order")
        assertEquals(before.map { it.opcode }, code.filterIndexed { i, _ -> i !in at until at + 5 }.map { it.opcode })
    }

    @Test fun theSharedSheetTakesBothHooksInEitherOrder() {
        for (first in listOf(MESSAGE_ACTIONS_MORE, SAVE_VOICE_MENU)) {
            val method = fixtureMethod(ACTIONS_MORE, SHARED_SHEET_BODY, 24)
            val before = method.code()
            for (key in if (first == SAVE_VOICE_MENU) listOf(SAVE_VOICE_MENU, MESSAGE_ACTIONS_MORE) else listOf(MESSAGE_ACTIONS_MORE, SAVE_VOICE_MENU))
                injectControl(key, mapOf(key to listOf(method)))
            val code = method.code()
            assertEquals(before.size + 6, code.size, first)
            val reorder = code.indexOfFirst { it.reference() == MESSAGE_ACTIONS_REORDER }
            val made = code.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.reference() == SHEET_BUILDER }
            val row = code.indexOfFirst { it.reference() == SAVE_VOICE_MENU_SHEET_ROW }
            assertEquals(made - 4, reorder, first)
            assertEquals(made + 2, row, first)
            assertEquals(listOf(8, 4), code[row].arguments(), "$first: the builder and the copy of the hold")
            assertEquals(made, code.branchTarget(code.indexOfFirst { it.opcode == Opcode.IF_EQZ }), first)
        }
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            MESSAGE_ACTIONS to barMethod(BAR_BODY.replace("\"$MESSAGE_ACTIONS_MARK\"", "\"items\"")),
            MESSAGE_ACTIONS_MORE to moreMethod(MORE_BODY.replace(MORE_SHEET_TAG, "OTHER_TAG")),
        )
        for ((key, bad) in cases) {
            val before = bad.code()
            assertFailsWith<PatchException>(key) { injectControl(key, mapOf(key to listOf(bad))) }
            assertEquals(before, bad.code(), key)
        }
        // The builder's own method for the sheet's key, and the other way round, are refused too.
        assertFailsWith<PatchException> { injectControl(MESSAGE_ACTIONS_MORE, mapOf(MESSAGE_ACTIONS_MORE to listOf(barMethod()))) }
        assertFailsWith<PatchException> { injectControl(MESSAGE_ACTIONS, mapOf(MESSAGE_ACTIONS to listOf(moreMethod()))) }
    }

    @Test fun everySupportedBuildReadsBothHooks() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val bar = findMessageActions(classes)
            val more = findMessageActionsMore(classes)
            assertEquals(activeProfile.hooks.getValue(MESSAGE_ACTIONS), bar.map { it.hookId() }.toSet(), code)
            assertEquals(activeProfile.hooks.getValue(MESSAGE_ACTIONS_MORE), more.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(MESSAGE_ACTIONS to bar, MESSAGE_ACTIONS_MORE to more), setOf(MESSAGE_ACTIONS, MESSAGE_ACTIONS_MORE))
            for (site in bar) MutableMethod(site).injectMessageActions()
            // The real sheet is save_voice_menu's too, so both go in, in both orders.
            val sheets = findSaveVoiceMenu(classes)
            assertNotNull(saveVoiceMenuRecipe, code)
            val shared = sheets.single { it.hookId() == more.single().hookId() }
            MutableMethod(shared).apply { injectMessageActionsMore(); injectSaveVoiceMenu() }
            MutableMethod(shared).apply { injectSaveVoiceMenu(); injectMessageActionsMore() }
        }
    }
}
