package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
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

internal const val SYNTHETIC_TAB_LABELS = "LX/1sm;-><init>(LX/1si;Ljava/lang/String;Ljava/lang/String;Z)V"
private const val HOLDER = "LX/1sm;"
private const val ICON = "LX/1si;"
private const val THROW_NULL = "invoke-static {v0}, LX/0qT;->A00(Ljava/lang/String;)V"
private const val TITLE_STORE = "iput-object v4, v1, $HOLDER->A02:Ljava/lang/String;"

/**
 * A tab's description as the supported builds write it: the icon goes straight on, each of the two words is checked
 * against the name Kotlin throws with and then stored, and the badge flag goes on last.
 */
private fun description(
    id: String = SYNTHETIC_TAB_LABELS,
    check: String = "if-eqz v4, :no_title",
    store: String = TITLE_STORE,
    tail: String = "iput-boolean v5, v1, $HOLDER->A03:Z",
    registers: Int = 6,
    descriptionLiteral: String = "tabIconContentDescription",
    titleLiteral: String = "title",
) = fixtureMethod(id, """
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V
    iput-object v2, v1, $HOLDER->A00:$ICON
    const-string v0, "$descriptionLiteral"
    if-eqz v3, :no_description
    iput-object v3, v1, $HOLDER->A01:Ljava/lang/String;
    const-string v0, "$titleLiteral"
    $check
    $store
    $tail
    return-void
    :no_description
    $THROW_NULL
    return-void
    :no_title
    $THROW_NULL
    return-void
""".trimIndent(), registers = registers)

/** The same holder with a catch over everything up to and including the title store. */
private fun guardedDescription(): MutableMethod {
    val method = description(tail = "iput-boolean v5, v1, $HOLDER->A03:Z\ngoto :done\n:caught\nmove-exception v0\n:done\nnop")
    val code = method.implementation!!.instructions.toList()
    val at = IntArray(code.size + 1).also { a -> for (i in code.indices) a[i + 1] = a[i] + code[i].codeUnits }
    val handler = code.indexOfFirst { it.opcode == Opcode.MOVE_EXCEPTION }
    return MutableMethod(ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
        method.accessFlags, null, null, ImmutableMethodImplementation(method.implementation!!.registerCount, code,
            listOf(ImmutableTryBlock(0, at[8], listOf(ImmutableExceptionHandler(null, at[handler])))), null)))
}

internal fun tabLabelsFixture() = listOf(fixtureClass(HOLDER, listOf(description())))

private fun Method.code() = implementation!!.instructions.toList()

/** Four instructions go in right in front of the store: the switch, its answer, the jump past it and the blank title. */
private fun assertLabelHook(before: List<Instruction>, after: List<Instruction>, store: Int, title: Int, label: String) {
    assertEquals(before.size + 4, after.size, label)
    assertEquals(before.map { it.opcode }, after.filterIndexed { i, _ -> i !in store until store + 4 }.map { it.opcode }, label)
    // Everything that jumped over the store still lands where it did, four instructions further along.
    for (i in before.indices) {
        val target = before.branchTarget(i)
        if (target < 0) continue
        val moved = if (i < store) i else i + 4
        assertEquals(if (target > store) target + 4 else target, after.branchTarget(moved), "$label jump at $i")
    }
    assertEquals(Opcode.INVOKE_STATIC, after[store].opcode, label)
    assertEquals("$SETTINGS->hideTabLabels()Z", (after[store] as ReferenceInstruction).reference.toString(), label)
    assertEquals(Opcode.MOVE_RESULT, after[store + 1].opcode, label)
    assertEquals(Opcode.IF_EQZ, after[store + 2].opcode, label)
    assertEquals(store + 4, after.branchTarget(store + 2), label)
    assertEquals(Opcode.CONST_STRING, after[store + 3].opcode, label)
    assertEquals(title, (after[store + 3] as OneRegisterInstruction).registerA, label)
    assertEquals("", ((after[store + 3] as ReferenceInstruction).reference as StringReference).string, label)
}

class TabLabelsTest {
    @AfterTest fun reset() { activeProfile = SYNTHETIC_PROFILE }

    private fun found(vararg methods: MutableMethod) =
        mirroredControls(methods.groupBy { it.definingClass }.map { (type, group) -> fixtureClass(type, group) })

    @Test fun theTitleGoesInBlankRightWhereMessengerStoresIt() {
        val method = description()
        val hooks = found(method)
        assertEquals(listOf(SYNTHETIC_TAB_LABELS), hooks.getValue(TAB_LABELS).map { it.hookId() })
        validateControls(hooks, setOf(TAB_LABELS))
        val before = method.code()
        val store = method.validateTabLabels()
        assertEquals(7, store)
        injectControl("hide_tab_labels", mapOf(TAB_LABELS to listOf(method)))
        assertLabelHook(before, method.code(), store, 4, "description")
    }

    /** The content description is the half TalkBack reads, so it goes on the holder as Messenger passed it. */
    @Test fun theContentDescriptionIsLeftAlone() {
        val method = description()
        injectControl("hide_tab_labels", mapOf(TAB_LABELS to listOf(method)))
        val blank = method.code().filter {
            it.opcode == Opcode.CONST_STRING && ((it as ReferenceInstruction).reference as StringReference).string.isEmpty()
        }
        assertEquals(4, (blank.single() as OneRegisterInstruction).registerA)
        assertTrue(method.code().any { it.opcode == Opcode.IPUT_OBJECT && (it as TwoRegisterInstruction).registerA == 3 })
        assertContains(method.code().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string },
            "tabIconContentDescription")
    }

    @Test fun onlyMessengersOwnTabDescriptionIsTaken() {
        assertTrue(found(description(descriptionLiteral = "tabIcon")).getValue(TAB_LABELS).isEmpty())
        assertTrue(found(description(titleLiteral = "label")).getValue(TAB_LABELS).isEmpty())
        // A holder of three words, one that takes the badge as anything but a flag, or a plain method, is another class.
        assertTrue(found(description(id = "$HOLDER-><init>(${ICON}Ljava/lang/String;Ljava/lang/String;)V")).getValue(TAB_LABELS).isEmpty())
        assertTrue(found(description(id = "$HOLDER-><init>(${ICON}Ljava/lang/String;Ljava/lang/String;I)V")).getValue(TAB_LABELS).isEmpty())
        assertTrue(found(description(id = "$HOLDER->A00(${ICON}Ljava/lang/String;Ljava/lang/String;Z)V")).getValue(TAB_LABELS).isEmpty())
    }

    @Test fun aChangedHolderIsRefusedInsteadOfPatched() {
        for ((case, method) in listOf(
            "no title store" to description(store = "nop"),
            "the title stored twice" to description(tail = "iput-object v4, v1, $HOLDER->A04:Ljava/lang/String;"),
            "no null check on the title" to description(check = "nop"),
            "a jump landing on the store" to description(store = ":land\n$TITLE_STORE",
                tail = "iput-boolean v5, v1, $HOLDER->A03:Z\nif-eqz v5, :land"),
            "the store inside a try" to guardedDescription(),
        )) {
            // The finder still names it: a holder that changed shape is refused by the proof, not quietly skipped.
            assertEquals(1, found(method).getValue(TAB_LABELS).size, case)
            val before = method.code().map { it.opcode }
            val failure = assertFailsWith<PatchException>(case) { injectControl("hide_tab_labels", mapOf(TAB_LABELS to listOf(method))) }
            assertContains(failure.message.orEmpty(), "the tab description no longer matches", message = case)
            assertEquals(before, method.code().map { it.opcode }, case)
        }
    }

    /** What the register traffic has to look like, which is the patch's own proof rather than the report's. */
    @Test fun theTitleAndTheScratchRegisterHaveToBeFreeAtTheStore() {
        for ((case, method) in listOf(
            "a check another path gets past" to description(check = "if-eqz v5, :title\nif-eqz v4, :no_title\n:title\nnop"),
            "the title read again" to description(tail = "iput-object v4, v1, $HOLDER->A04:LX/0Rk;"),
            "the scratch still live" to description(tail = "invoke-static {v0}, $HOLDER->A05(Ljava/lang/String;)V"),
        )) {
            val before = method.code().map { it.opcode }
            val failure = assertFailsWith<PatchException>(case) { method.injectTabLabels() }
            assertContains(failure.message.orEmpty(), "the tab description no longer matches", message = case)
            assertEquals(before, method.code().map { it.opcode }, case)
        }
    }

    @Test fun everySupportedBuildBlanksItsTabTitles() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val holders = findTabLabels(classes)
            assertEquals(activeProfile.hooks.getValue(TAB_LABELS), holders.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(TAB_LABELS to holders), setOf(TAB_LABELS))
            for (holder in holders) {
                val method = MutableMethod(holder)
                val before = method.code()
                val store = method.validateTabLabels()
                injectControl("hide_tab_labels", mapOf(TAB_LABELS to listOf(method)))
                assertLabelHook(before, method.code(), store, method.parameterRegister(3), "$code ${holder.hookId()}")
            }
        }
    }
}
