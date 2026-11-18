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
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val LOADER_CLASS = "LX/2EU;"
internal const val SYNTHETIC_INBOX_TYPING = "$LOADER_CLASS->A0B($LOADER_CLASS)Z"
private const val STORE_CLASS = "LX/2g8;"
private const val STORE = "$STORE_CLASS->A03(Ljava/util/List;)V"
private const val CONFIG = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;"
private const val FLAG = "const-wide v2, ${INBOX_TYPING_FLAG}L"
private const val READ = "invoke-interface {v4, v2, v3}, $CONFIG->B3T(J)Z"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

/**
 * The inbox loader's gate as Messenger 587 writes it: the plugin's context cast to the config interface, the flag loaded
 * into a pair, the long check of it, and a branch on the answer that decides whether the loader subscribes for typing.
 */
private val LOADER_BODY = """
    const/4 v4, 0x0
    iget-object v4, p0, $LOADER_CLASS->A00:Ljava/lang/Object;
    $FLAG
    check-cast v4, $CONFIG
    $READ
    move-result v0
    if-eqz v0, :off
    const/4 v0, 0x1
    return v0
    :off
    const/4 v0, 0x0
    return v0
""".trimIndent()

/** The typing store's read, which branches the other way: a yes drops into the work, a no returns. */
private val STORE_BODY = """
    const/4 v4, 0x0
    move-object v4, p1
    $FLAG
    $READ
    move-result v0
    if-nez v0, :subscribe
    return-void
    :subscribe
    invoke-interface {p1}, Ljava/util/List;->size()I
    return-void
""".trimIndent()

private fun loader(body: String = LOADER_BODY) = fixtureMethod(SYNTHETIC_INBOX_TYPING, body, 8, STATIC)

private fun store(body: String = STORE_BODY) = fixtureMethod(STORE, body, 8)

/** The loader with the first [from] swapped for [to]. */
private fun changed(from: String, to: String) =
    loader(LOADER_BODY.replaceFirst(from, to).also { check(it != LOADER_BODY) })

internal fun inboxTypingFixture(method: MutableMethod = loader()): List<MutableClass> =
    listOf(fixtureClass(LOADER_CLASS, listOf(method)))

private fun storeClass(method: MutableMethod = store()) = fixtureClass(STORE_CLASS, listOf(method))

private fun Method.code() = implementation!!.instructions.toList()

/** Two instructions going in can push a jump that was already there past 127 code units, which smali widens. */
private fun Instruction.jump() = if (opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)) Opcode.GOTO else opcode

private fun Method.helperCalls() =
    code().indices.filter { (code()[it] as? ReferenceInstruction)?.reference?.toString() == INBOX_TYPING_HELPER }

class InboxTypingTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(INBOX_TYPING).map { it.hookId() }.toSet()

    @Test fun theInboxLoaderIsFoundWhereItAsksForTheTypingFlag() {
        assertEquals(setOf(SYNTHETIC_INBOX_TYPING), found(inboxTypingFixture()))
        validateControls(mirroredControls(inboxTypingFixture()), setOf(INBOX_TYPING))
        assertEquals(1, loader().inboxTypingSites().size)
    }

    // Four plugins read the one flag, and the switch has to answer all of them: the loader's subscription, the store,
    // the teardown and the snippet that writes the words over a chat's last message.
    @Test fun everyOtherReaderOfTheFlagIsTakenWithIt() {
        val classes = inboxTypingFixture() + storeClass()
        assertEquals(setOf(SYNTHETIC_INBOX_TYPING, STORE), found(classes))
        activeProfile = syntheticProfileWith(INBOX_TYPING to setOf(SYNTHETIC_INBOX_TYPING, STORE))
        validateControls(mirroredControls(classes), setOf(INBOX_TYPING))
        assertEquals(1, store().inboxTypingSites().size)
    }

    @Test fun eachMappingHooksItsOwnPlugins() {
        assertEquals(setOf(SYNTHETIC_INBOX_TYPING), SYNTHETIC_PROFILE.hooks.getValue(INBOX_TYPING))
        assertEquals(4, BASE_PROFILE.hooks.getValue(INBOX_TYPING).size)
    }

    // The switch says the chat list shows typing. A read it can't answer would leave one plugin on Meta's no while the
    // rest ran, so a build whose reads don't all match gets no hook and the switch stays unapplied.
    @Test fun anyOtherShapeLeavesTheControlUnapplied() {
        val readers = mapOf(
            "a read on another class" to changed(READ, "invoke-interface {v4, v2, v3}, LX/4qO;->B3T(J)Z"),
            "a read that isn't a yes or no" to changed(READ, "invoke-interface {v4, v2, v3}, $CONFIG->B3T(J)I"),
            "a read that takes another kind of argument" to
                changed(READ, "invoke-interface {v4, v2, v3}, $CONFIG->B3T(LX/30w;)Z"),
            "a read that doesn't take the flag" to changed(READ, "invoke-interface {v4, v0, v1}, $CONFIG->B3T(J)Z"),
            "a read that isn't through the interface" to changed(READ, "invoke-static {v4, v2, v3}, $CONFIG->B3T(J)Z"),
            "an answer nothing takes" to changed("move-result v0", "const/4 v0, 0x1"),
            "an answer nothing branches on" to changed("if-eqz v0, :off", "if-eqz v4, :off"),
            "a step between that isn't a move or a cast" to changed("check-cast v4, $CONFIG", "invoke-static {v4}, LX/01Q;->A00(Ljava/lang/Object;)V"),
            "a step that overwrites the flag" to changed("check-cast v4, $CONFIG", "move-object v2, v4"),
            "a jump onto the branch" to loader(LOADER_BODY.replaceFirst("if-eqz v0, :off", ":again\n    if-eqz v0, :off")
                .replaceFirst("const/4 v0, 0x1", "const/4 v0, 0x1\n    if-nez v0, :again")),
        )
        val cases = readers.mapValues { (_, method) -> inboxTypingFixture(method) } + mapOf(
            "one reader the switch can't answer" to
                inboxTypingFixture() + storeClass(store(STORE_BODY.replaceFirst("move-result v0", "const/4 v0, 0x1"))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(INBOX_TYPING)) }
        }
    }

    @Test fun everyAnswerPassesThroughTheSwitchBeforeTheBranchReadsIt() {
        val method = loader()
        val before = method.code()
        injectControl(INBOX_TYPING, mapOf(INBOX_TYPING to listOf(method)))
        val code = method.code()
        val calls = method.helperCalls()
        assertEquals(1, calls.size)
        val at = calls.single()
        // The flag's own answer goes in, and the switch's answer comes back to the same register the branch reads.
        val answer = (code[at - 1] as OneRegisterInstruction).registerA
        assertEquals(Opcode.MOVE_RESULT, code[at - 1].opcode)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, code[at].opcode)
        assertEquals(Opcode.MOVE_RESULT, code[at + 1].opcode)
        assertEquals(answer, (code[at + 1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_EQZ, code[at + 2].opcode)
        assertEquals(answer, (code[at + 2] as OneRegisterInstruction).registerA)
        // Everything else runs as Messenger wrote it.
        assertEquals(before.map { it.opcode }, code.filterIndexed { i, _ -> i != at && i != at + 1 }.map { it.opcode })
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "a method that never asks" to fixtureMethod("$LOADER_CLASS->A00()V", "return-void", 1),
            "a read whose answer nothing takes" to changed("move-result v0", "const/4 v0, 0x1"),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(INBOX_TYPING, mapOf(INBOX_TYPING to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildPassesEveryTypingReadThroughTheSwitch() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val hooks = findInboxTyping(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(INBOX_TYPING), hooks.map { it.hookId() }.toSet(), code)
            assertEquals(4, hooks.size, code)
            validateControls(mapOf(INBOX_TYPING to hooks), setOf(INBOX_TYPING))
            for (hook in hooks) {
                val method = MutableMethod(hook)
                val sites = method.inboxTypingSites().size
                val before = method.code()
                method.injectInboxTyping()
                val calls = method.helperCalls()
                assertEquals(sites, calls.size, code)
                val after = method.code()
                assertTrue(calls.all { after[it - 1].opcode == Opcode.MOVE_RESULT && after[it + 1].opcode == Opcode.MOVE_RESULT }, code)
                assertEquals(before.map { it.jump() }.filter { it != Opcode.NOP },
                    after.filterIndexed { i, _ -> calls.none { i == it || i == it + 1 } }.map { it.jump() }.filter { it != Opcode.NOP }, code)
            }
        }
    }
}
