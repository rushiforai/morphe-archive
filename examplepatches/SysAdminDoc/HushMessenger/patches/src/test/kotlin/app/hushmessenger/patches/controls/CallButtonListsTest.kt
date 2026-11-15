package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.BeforeTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/** The call button base the builders' wrapper takes, and the helper the New message screen turns its array into a List with. */
private const val CALL_BASE = "LX/5cC;"
private const val AS_LIST = "LX/2rd;->A0J([Ljava/lang/Object;)Ljava/util/List;"
private const val COPY_OF = "$IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
internal const val SYNTHETIC_BUSINESS_CALLS = "LX/50E;->A00(LX/0XT;$THREAD_KEY_TYPE$MIG_SCHEME)$IMMUTABLE_LIST"
internal const val SYNTHETIC_NEW_MESSAGE_CALLS = "LX/Okr;->A00(LX/Okr;)V"
private const val TOP_BAR_CALLS = "LX/7Nx;->FDi($THREAD_KEY_TYPE)V"

/** Both buttons built, as every caller starts. */
private val BUILT = """
    invoke-static {v2, v3, v4, v5, v6}, $SYNTHETIC_AUDIO_BUILDER
    move-result-object v0
    invoke-static {v2, v3, v4, v5}, $SYNTHETIC_VIDEO_BUILDER
    move-result-object v1
""".trimIndent()

/** The business chat's bar, cut down: both buttons into an ImmutableList, returned. */
private val BUSINESS_BODY = BUILT + "\n" + """
    invoke-static {v0, v1}, $IMMUTABLE_LIST->of(Ljava/lang/Object;Ljava/lang/Object;)$IMMUTABLE_LIST
    move-result-object v0
    return-object v0
""".trimIndent()

/** The New message screen, cut down: both buttons into an array of their base, a List of that, and none when it's empty. */
private val NEW_MESSAGE_BODY = BUILT + "\n" + """
    filled-new-array {v0, v1}, [$CALL_BASE
    move-result-object v0
    invoke-static {v0}, $AS_LIST
    move-result-object v0
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :keep
    const/4 v0, 0x0
    :keep
    iput-object v0, p0, LX/Okr;->A00:Ljava/util/List;
    return-void
""".trimIndent()

/** The top bar calls both builders too, but hands the buttons on one by one. */
private val TOP_BAR_BODY = BUILT + "\n" + """
    invoke-virtual {p0, v0}, LX/7Nx;->A01(Ljava/lang/Object;)V
    invoke-virtual {p0, v1}, LX/7Nx;->A01(Ljava/lang/Object;)V
    return-void
""".trimIndent()

private fun business(body: String = BUSINESS_BODY, id: String = SYNTHETIC_BUSINESS_CALLS) = fixtureMethod(id, body, 10, STATIC)
private fun newMessage(body: String = NEW_MESSAGE_BODY, id: String = SYNTHETIC_NEW_MESSAGE_CALLS) = fixtureMethod(id, body, 10, STATIC)

/**
 * The business bar, the New message screen and the top bar, plus Guava's ImmutableList.copyOf unless [immutableList] is
 * false (the complete discovery fixture brings its own).
 */
internal fun callButtonListsFixture(
    businessMethod: MutableMethod? = business(),
    newMessageMethod: MutableMethod? = newMessage(),
    immutableList: Boolean = true,
    copyFlags: Int = STATIC,
    extra: List<MutableMethod> = emptyList(),
): List<MutableClass> = (listOfNotNull(businessMethod, newMessageMethod) + extra +
    fixtureMethod(TOP_BAR_CALLS, TOP_BAR_BODY, 10)).groupBy { it.definingClass }.map { (type, methods) -> fixtureClass(type, methods) } +
    listOfNotNull(fixtureClass(IMMUTABLE_LIST, listOf(fixtureMethod(COPY_OF, "const/4 v0, 0x0\nreturn-object v0", 3, copyFlags)))
        .takeIf { immutableList })

private fun classes(
    businessMethod: MutableMethod? = business(),
    newMessageMethod: MutableMethod? = newMessage(),
    immutableList: Boolean = true,
    copyFlags: Int = STATIC,
    extra: List<MutableMethod> = emptyList(),
) = callButtonBuiltFixture() + callButtonListsFixture(businessMethod, newMessageMethod, immutableList, copyFlags, extra)

private fun builders(classes: List<MutableClass>) = findCallButtonBuilt(classes, emptyMap())
private fun Method.code() = implementation!!.instructions.toList()
private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()

class CallButtonListsTest {
    @BeforeTest @AfterTest fun synthetic() { activeProfile = SYNTHETIC_PROFILE }

    @Test fun findsTheBusinessBarAndTheNewMessageScreen() {
        val both = listOf(SYNTHETIC_BUSINESS_CALLS, SYNTHETIC_NEW_MESSAGE_CALLS)
        val fixture = classes()
        assertEquals(both, findCallButtonLists(fixture, builders(fixture)).map { it.hookId() })
        assertEquals(both, mirroredControls(fixture).getValue(HIDE_CALL_LISTS).map { it.hookId() })
        validateControls(mirroredControls(fixture), setOf(HIDE_CALL_LISTS))
        assertEquals(both.toSet(), SYNTHETIC_PROFILE.hooks.getValue(HIDE_CALL_LISTS))
        assertEquals(setOf(HIDE_CALL_BAR, HIDE_CALL_LISTS), controlHooks.getValue("hide_call_buttons"))
        assertEquals(0, business().callListReturn())
        assertEquals(7, newMessage().callListArray(CALL_BASE))
    }

    @Test fun lookalikesAreNotFound() {
        val returnAt = "return-object v0"
        val second = SYNTHETIC_BUSINESS_CALLS.replace("LX/50E;", "LX/50F;")
        val cases = mapOf(
            "no business bar" to classes(businessMethod = null),
            "no New message screen" to classes(newMessageMethod = null),
            "two business bars" to classes(extra = listOf(business(id = second))),
            "two New message screens" to classes(extra = listOf(newMessage(id = SYNTHETIC_NEW_MESSAGE_CALLS.replace("LX/Okr;", "LX/Oks;")))),
            "a business bar with only the audio button" to classes(business(BUSINESS_BODY.replace("invoke-static {v2, v3, v4, v5}, $SYNTHETIC_VIDEO_BUILDER", "const/4 v1, 0x0"))),
            "a New message screen with only the video button" to classes(newMessageMethod = newMessage(NEW_MESSAGE_BODY.replace("invoke-static {v2, v3, v4, v5, v6}, $SYNTHETIC_AUDIO_BUILDER", "const/4 v0, 0x0"))),
            "a branch onto the business return" to classes(business("if-eqz v2, :done\n" + BUSINESS_BODY.replace(returnAt, ":done\n$returnAt"))),
            "two business returns" to classes(business("if-eqz v2, :other\n$BUSINESS_BODY\n:other\nconst/4 v0, 0x0\n$returnAt")),
            "a business bar returning another list" to classes(business(id = SYNTHETIC_BUSINESS_CALLS.replace(")$IMMUTABLE_LIST", ")Ljava/util/List;"))),
            "an array of the wrapper instead of the base" to classes(newMessageMethod = newMessage(NEW_MESSAGE_BODY.replace("[$CALL_BASE", "[LX/9qK;"))),
            "an array of ints" to classes(newMessageMethod = newMessage(NEW_MESSAGE_BODY.replace("filled-new-array {v0, v1}, [$CALL_BASE", "filled-new-array {v2, v3}, [I"))),
            "the array kept as it is" to classes(newMessageMethod = newMessage(NEW_MESSAGE_BODY.replace("invoke-static {v0}, $AS_LIST\nmove-result-object v0\n", ""))),
            "the array listed by a call that takes more" to classes(newMessageMethod = newMessage(NEW_MESSAGE_BODY.replace("invoke-static {v0}, $AS_LIST",
                "invoke-static {v0, v2}, LX/2rd;->A0K([Ljava/lang/Object;I)Ljava/util/List;"))),
            "the array listed by a call that returns no List" to classes(newMessageMethod = newMessage(NEW_MESSAGE_BODY.replace("invoke-static {v0}, $AS_LIST",
                "invoke-static {v0}, LX/2rd;->A0L([Ljava/lang/Object;)Ljava/util/Collection;"))),
            "another register listed" to classes(newMessageMethod = newMessage(NEW_MESSAGE_BODY.replace("invoke-static {v0}, $AS_LIST", "invoke-static {v2}, $AS_LIST"))),
            "something between the array and its list" to classes(newMessageMethod = newMessage(NEW_MESSAGE_BODY.replace("move-result-object v0\ninvoke-static {v0}, $AS_LIST",
                "move-result-object v0\nconst/4 v2, 0x0\ninvoke-static {v0}, $AS_LIST"))),
            "a jump onto the hook's place" to classes(newMessageMethod = newMessage("if-eqz v2, :list\n" + NEW_MESSAGE_BODY.replace(
                "invoke-interface {v0}, Ljava/util/List;->isEmpty()Z", ":list\ninvoke-interface {v0}, Ljava/util/List;->isEmpty()Z"))),
            "two arrays listed" to classes(newMessageMethod = newMessage(NEW_MESSAGE_BODY.replace("return-void",
                "filled-new-array {v0, v1}, [$CALL_BASE\nmove-result-object v0\ninvoke-static {v0}, $AS_LIST\nmove-result-object v0\nreturn-void"))),
            "no ImmutableList.copyOf" to classes(immutableList = false),
            "an ImmutableList.copyOf that isn't static" to classes(copyFlags = AccessFlags.PUBLIC.value),
            "no call button builders" to classes().filter { it.type != "LX/5mw;" },
        )
        for ((case, fixture) in cases) {
            assertTrue(findCallButtonLists(fixture, builders(fixture)).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(fixture), setOf(HIDE_CALL_LISTS)) }
        }
    }

    @Test fun aChangedListIsRefusedAndLeftAsItWas() {
        val cases = listOf(
            business("if-eqz v2, :done\n" + BUSINESS_BODY.replace("return-object v0", ":done\nreturn-object v0")),
            newMessage(NEW_MESSAGE_BODY.replace("invoke-static {v0}, $AS_LIST", "invoke-static {v2}, $AS_LIST")),
        )
        for (method in cases) {
            val before = method.code()
            assertFailsWith<PatchException> { method.validateCallButtonLists() }
            assertFailsWith<PatchException> { method.injectCallButtonLists() }
            assertEquals(before, method.code())
        }
    }

    @Test fun theBusinessListGoesThroughTheExtensionAndBackIntoAnImmutableList() {
        val method = business()
        val before = method.code()
        method.injectCallButtonLists()
        assertBusinessHook(before, method.code(), "business")
    }

    @Test fun theNewMessageListGoesThroughTheExtensionBeforeItsEmptyCheck() {
        val method = newMessage()
        val before = method.code()
        method.injectCallButtonLists()
        assertNewMessageHook(before, method.code(), 7, "new message")
    }

    /** Every build at once, so one run names every build whose lists moved. */
    @Test fun everySupportedBuildHooksBothCallButtonLists() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        val wrong = mutableListOf<String>()
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            activeProfile = controlProfileFor(code)
            val hooks = findCallButtonLists(classes, findCallButtonBuilt(classes, redexStringTables(classes)))
            if (hooks.map { it.hookId() }.toSet() != activeProfile.hooks.getValue(HIDE_CALL_LISTS)) {
                wrong += "$code: ${hooks.map { it.hookId() }}"
                continue
            }
            validateControls(mapOf(HIDE_CALL_LISTS to hooks), setOf(HIDE_CALL_LISTS))
            val (list, array) = hooks
            MutableMethod(list).let { method ->
                val before = method.code()
                method.injectCallButtonLists()
                assertBusinessHook(before, method.code(), "$code ${list.hookId()}")
            }
            MutableMethod(array).let { method ->
                val before = method.code()
                val site = method.callListArray()!!
                method.injectCallButtonLists()
                assertNewMessageHook(before, method.code(), site, "$code ${array.hookId()}")
            }
        }
        assertTrue(wrong.isEmpty(), wrong.joinToString("\n"))
    }

    /** Right before the return: the list to the extension, its answer back, then copyOf, its answer back, nothing stock changed. */
    private fun assertBusinessHook(before: List<Instruction>, after: List<Instruction>, label: String) {
        val at = before.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
        val list = (before[at] as OneRegisterInstruction).registerA
        assertEquals(before.size + 4, after.size, label)
        assertRangeCall(after[at], CALL_BUTTONS_WITHOUT, list, label)
        assertMoveResult(after[at + 1], list, label)
        assertRangeCall(after[at + 2], COPY_OF, list, label)
        assertMoveResult(after[at + 3], list, label)
        assertStockKept(before, after.take(at) + after.drop(at + 4), label)
    }

    /** Right after the List is taken: the list to the extension and its answer back, nothing stock changed. */
    private fun assertNewMessageHook(before: List<Instruction>, after: List<Instruction>, site: Int, label: String) {
        assertEquals(Opcode.MOVE_RESULT_OBJECT, before[site].opcode, label)
        assertTrue(before[site - 1].reference()!!.endsWith("([Ljava/lang/Object;)Ljava/util/List;"), label)
        val list = (before[site] as OneRegisterInstruction).registerA
        assertEquals(before.size + 2, after.size, label)
        assertRangeCall(after[site + 1], CALL_BUTTONS_WITHOUT, list, label)
        assertMoveResult(after[site + 2], list, label)
        assertStockKept(before, after.take(site + 1) + after.drop(site + 3), label)
    }

    private fun assertRangeCall(call: Instruction, reference: String, register: Int, label: String) {
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode, label)
        assertEquals(reference, call.reference(), label)
        val range = call as RegisterRangeInstruction
        assertEquals(listOf(register, 1), listOf(range.startRegister, range.registerCount), label)
    }

    private fun assertMoveResult(move: Instruction, register: Int, label: String) {
        assertEquals(Opcode.MOVE_RESULT_OBJECT, move.opcode, label)
        assertEquals(register, (move as OneRegisterInstruction).registerA, label)
    }
}
