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
private const val CONFIG_READ = "LX/17Q;->A06(Ljava/lang/Object;J)I"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

/** The getter as Messenger writes it: the session's config, the limit's id, one read and its answer handed back. */
private val LIMIT_BODY = """
    invoke-static {p0}, LX/19a;->A0E(Ljava/lang/Object;)LX/5dD;
    move-result-object p0
    const-wide v0, 0x8205b900021070L
    invoke-static {p0, v0, v1}, $CONFIG_READ
    move-result v0
    return v0
""".trimIndent()

private fun limit(body: String = LIMIT_BODY, id: String = SYNTHETIC_PINNED_CHAT_LIMIT, flags: Int = STATIC) =
    fixtureMethod(id, body, registers = 3, flags = flags)

internal fun pinnedChatLimitFixture(method: MutableMethod = limit()): List<MutableClass> =
    listOf(fixtureClass(method.definingClass, listOf(method)))

private fun Method.code() = implementation!!.instructions.toList()

class PinnedChatsTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(PINNED_CHATS).map { it.hookId() }.toSet()

    @Test fun theLimitsGetterIsFoundByItsConfigId() {
        assertEquals(setOf(SYNTHETIC_PINNED_CHAT_LIMIT), found(pinnedChatLimitFixture()))
        validateControls(mirroredControls(pinnedChatLimitFixture()), setOf(PINNED_CHATS))
    }

    @Test fun everyProfileHooksItsOwnGetter() {
        val getters = mapOf(SYNTHETIC_PROFILE to "LX/2na;", BASE_PROFILE to "LX/2pm;")
        for ((profile, owner) in getters) {
            val id = SYNTHETIC_PINNED_CHAT_LIMIT.replace("LX/2na;", owner)
            assertEquals(setOf(id), profile.hooks.getValue(PINNED_CHATS))
            activeProfile = profile
            validateControls(mirroredControls(pinnedChatLimitFixture(limit(id = id))), setOf(PINNED_CHATS))
        }
    }

    // A getter that only looks like the limit's would raise some other number, so anything off the exact shape is refused.
    @Test fun anythingButTheOneStraightLineGetterIsLeftAlone() {
        val cases = mapOf(
            "another config id" to pinnedChatLimitFixture(limit(LIMIT_BODY.replace("0x8205b900021070L", "0x8205c10002107cL"))),
            "an instance method" to pinnedChatLimitFixture(limit(flags = AccessFlags.PUBLIC.value)),
            "a boolean getter" to pinnedChatLimitFixture(limit(id = SYNTHETIC_PINNED_CHAT_LIMIT.dropLast(1) + "Z")),
            "no session parameter" to pinnedChatLimitFixture(limit(id = "LX/2na;->A00(Ljava/lang/Object;)I")),
            "a branch around the read" to pinnedChatLimitFixture(limit(LIMIT_BODY.replace("const-wide v0,", "if-eqz p0, :done\nconst-wide v0,")
                .replace("return v0", ":done\nreturn v0"))),
            "an answer that isn't the read's" to pinnedChatLimitFixture(limit(LIMIT_BODY.replace("return v0", "const/4 v0, 0x3\nreturn v0"))),
            "the id loaded twice" to pinnedChatLimitFixture(limit(LIMIT_BODY.replace("const-wide v0, 0x8205b900021070L", "const-wide v0, 0x8205b900021070L\nconst-wide v0, 0x8205b900021070L"))),
            "two getters" to pinnedChatLimitFixture() + pinnedChatLimitFixture(limit(id = SYNTHETIC_PINNED_CHAT_LIMIT.replace("LX/2na;", "LX/2nb;"))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(PINNED_CHATS)) }
        }
    }

    @Test fun theGetterAsksTheSwitchJustBeforeItReturnsAndKeepsEverythingElse() {
        val method = limit()
        val before = method.code()
        injectControl(PINNED_CHATS, mapOf(PINNED_CHATS to listOf(method)))
        val code = method.code()
        assertEquals(before.size + 2, code.size)
        assertEquals(before.dropLast(1), code.take(before.size - 1))
        val ask = code[before.size - 1] as RegisterRangeInstruction
        assertEquals(Opcode.INVOKE_STATIC_RANGE, ask.opcode)
        assertEquals(PINNED_CHAT_LIMIT_GATE, (ask as ReferenceInstruction).reference.toString())
        // The read's own answer goes in and the switch's answer comes back in the register the getter returns.
        assertEquals(listOf(1, 0), listOf(ask.registerCount, ask.startRegister))
        assertEquals(Opcode.MOVE_RESULT, code[before.size].opcode)
        assertEquals(0, (code[before.size] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.RETURN, code.last().opcode)
        assertEquals(0, (code.last() as OneRegisterInstruction).registerA)
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "another config id" to limit(LIMIT_BODY.replace("0x8205b900021070L", "0x1L")),
            "a branch" to limit(LIMIT_BODY.replace("const-wide v0,", "if-eqz p0, :done\nconst-wide v0,").replace("return v0", ":done\nreturn v0")),
            "another method" to fixtureMethod("LX/2na;->A01($FB_USER_SESSION)I", "const/4 v0, 0x3\nreturn v0", registers = 3, flags = STATIC),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(PINNED_CHATS, mapOf(PINNED_CHATS to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildHooksItsOneGetter() {
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
            val method = MutableMethod(hooks.single())
            val before = method.code()
            method.injectPinnedChatLimit()
            val after = method.code()
            assertEquals(PINNED_CHAT_LIMIT_GATE, (after[before.size - 1] as ReferenceInstruction).reference.toString(), code)
            assertEquals(before.dropLast(1).map { it.opcode }, after.take(before.size - 1).map { it.opcode }, code)
            assertEquals(Opcode.RETURN, after.last().opcode, code)
        }
    }
}
