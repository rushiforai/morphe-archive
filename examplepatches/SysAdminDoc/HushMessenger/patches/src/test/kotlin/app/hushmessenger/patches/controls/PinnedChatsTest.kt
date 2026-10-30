package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
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

    @Test fun everyBuildReadsTheLimitInItsFourPlaces() {
        for ((code, profile) in controlProfiles) assertEquals(4, profile.hooks.getValue(PINNED_CHATS).size, "$code")
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
            val hooks = findPinnedChatLimit(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(PINNED_CHATS), hooks.map { it.hookId() }.toSet(), code)
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
}
