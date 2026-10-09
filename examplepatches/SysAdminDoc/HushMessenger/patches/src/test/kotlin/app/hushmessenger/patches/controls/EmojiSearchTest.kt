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
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val WATCHER_581 = "LX/7GD;->A8e(Landroid/text/Editable;Z)V"
private const val WATCHER_580 = "LX/7TX;->A8Y(Landroid/text/Editable;Z)V"

/** 581 loads the search mode itself. The plain mode jumps back to the one call that hands the mode over. */
private fun watcher581(id: String = WATCHER_581, search: String = "const-string v0, \"expression_search\"") = fixtureMethod(id, """
    const-string v6, "afterTextChanged"
    iget-object v1, p0, LX/7GD;->A05:LX/H2g;
    if-eqz v8, :plain
    $search
    :call
    invoke-interface {v1, v0}, LX/H2g;->DVq(Ljava/lang/String;)V
    goto :done
    :plain
    const-string v0, "expression"
    goto :call
    :done
    return-void
""".trimIndent(), registers = 10)

/** 580 asks a generated switch table for the same string by number. */
private fun watcher580(call: String = "invoke-interface {v1, v0}, LX/H7o;->DUX(Ljava/lang/String;)V") = fixtureMethod(WATCHER_580, """
    const-string v2, "afterTextChanged"
    iget-object v1, p0, LX/7Sa;->A05:LX/H7o;
    if-eqz v10, :plain
    const/16 v0, 0x289
    invoke-static {v0}, LX/46q;->A00(I)Ljava/lang/String;
    move-result-object v0
    :call
    $call
    goto :done
    :plain
    const-string v0, "expression"
    goto :call
    :done
    return-void
""".trimIndent(), registers = 12)

/** The watcher in the base 580 mapping, for the catalog-wide discovery fixture. */
internal fun emojiSearchFixture() = listOf(fixtureClass("LX/7TX;", listOf(watcher580())))

private fun Method.code() = implementation!!.instructions.toList()

/**
 * The call gains the helper pair right before it, so the search path runs through the extension. The plain path's jump
 * still lands on the original call, past the pair, because it already holds the plain mode.
 */
private fun assertSearchHook(before: List<Instruction>, after: List<Instruction>, call: Int, label: String) {
    val mode = (before[call] as FiveRegisterInstruction).registerD
    assertEquals(before.size + 2, after.size, label)
    assertEquals(before, after.filterIndexed { i, _ -> i != call && i != call + 1 }, label)
    val helper = after[call] as FiveRegisterInstruction
    assertEquals(Opcode.INVOKE_STATIC, helper.opcode, label)
    assertEquals(EMOJI_SEARCH_HELPER, (helper as ReferenceInstruction).reference.toString(), label)
    assertEquals(listOf(1, mode), listOf(helper.registerCount, helper.registerC), label)
    assertEquals(Opcode.MOVE_RESULT_OBJECT, after[call + 1].opcode, label)
    assertEquals(mode, (after[call + 1] as OneRegisterInstruction).registerA, label)
    assertEquals(before[call], after[call + 2], label)
    val plainJump = after.indices.first { after[it].opcode == Opcode.GOTO && after.branchTarget(it) == call + 2 }
    assertEquals(Opcode.CONST_STRING, after[plainJump - 1].opcode, label)
}

class EmojiSearchTest {
    @AfterTest fun reset() { activeProfile = BASE_PROFILE }

    private fun found(vararg methods: MutableMethod) =
        findControls(methods.map { fixtureClass(it.definingClass, listOf(it)) }).getValue(EMOJI_SEARCH)

    @Test fun bothTheLiteralAnd580sTableLookupGoThroughTheExtensionAndNothingStockMoves() {
        for ((label, method) in mapOf("581" to watcher581(), "580" to watcher580())) {
            assertEquals(listOf(method.hookId()), found(method).map { it.hookId() }, label)
            activeProfile = if (label == "581") PROFILE_346213494 else BASE_PROFILE
            validateControls(findControls(listOf(fixtureClass(method.definingClass, listOf(method)))), setOf(EMOJI_SEARCH))
            val before = method.code()
            val call = method.emojiSearchCall()
            injectControl(EMOJI_SEARCH, mapOf(EMOJI_SEARCH to listOf(method)))
            assertSearchHook(before, method.code(), call, label)
        }
        // Two methods that look like the watcher are ambiguous, so neither is hooked.
        assertTrue(found(watcher581(), watcher581(id = "LX/7GE;->A8e(Landroid/text/Editable;Z)V")).isEmpty())
    }

    @Test fun aShapeThatMovedStopsBeforeAnyEdit() {
        val shapes = mapOf(
            "search path isn't the search mode" to watcher581(search = "const-string v0, \"expression_other\""),
            "search path writes another register" to watcher581(search = "const-string v2, \"expression_search\""),
            "call takes an Object" to watcher580("invoke-interface {v1, v0}, LX/H7o;->DUX(Ljava/lang/Object;)V"),
            "call returns a value" to watcher580("invoke-interface {v1, v0}, LX/H7o;->DUX(Ljava/lang/String;)Z"),
            "call is static" to watcher580("invoke-static {v1, v0}, LX/H7o;->DUX(Ljava/lang/String;)V"),
            "call has a third argument" to watcher580("invoke-interface {v1, v0, v2}, LX/H7o;->DUX(Ljava/lang/String;)V"),
            "another jump into the call" to fixtureMethod(WATCHER_581, """
                const-string v6, "afterTextChanged"
                if-eqz v8, :plain
                const-string v0, "expression_search"
                :call
                invoke-interface {v1, v0}, LX/H2g;->DVq(Ljava/lang/String;)V
                return-void
                :plain
                if-eqz v3, :call
                const-string v0, "expression"
                goto :call
            """.trimIndent(), registers = 10),
            "plain mode doesn't jump" to fixtureMethod(WATCHER_581, """
                const-string v6, "afterTextChanged"
                const-string v0, "expression"
                const-string v0, "expression_search"
                invoke-interface {v1, v0}, LX/H2g;->DVq(Ljava/lang/String;)V
                return-void
            """.trimIndent(), registers = 10),
        )
        for ((case, bad) in shapes) {
            val good = watcher581(id = "LX/7GF;->A8e(Landroid/text/Editable;Z)V")
            val before = good.code()
            val failure = assertFailsWith<PatchException>(case) {
                injectControl(EMOJI_SEARCH, mapOf(EMOJI_SEARCH to listOf(good, bad)))
            }
            assertContains(failure.message.orEmpty(), "emoji search mode call", message = case)
            assertEquals(before, good.code(), case)
        }
    }

    @Test fun everySupportedBuildHooksItsOneTextWatcher() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val watchers = findEmojiSearch(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(EMOJI_SEARCH), watchers.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(EMOJI_SEARCH to watchers), setOf(EMOJI_SEARCH))
            val method = MutableMethod(watchers.single())
            val before = method.code()
            val call = method.emojiSearchCall()
            method.injectEmojiSearch()
            assertSearchHook(before, method.code(), call, code)
        }
    }
}
