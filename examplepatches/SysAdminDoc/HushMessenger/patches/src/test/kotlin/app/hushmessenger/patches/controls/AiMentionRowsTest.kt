package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNull
import kotlin.test.assertTrue

private const val ROW_CHECKS = "LX/1yQ;"
private const val ROW_PARAMS = "$FB_USER_SESSION$THREAD_KEY_TYPE$CAPABILITIES"
internal const val SYNTHETIC_META_AI_ROW = "$ROW_CHECKS->A0Q()Z"
internal const val SYNTHETIC_META_AI_CHATS_ROW = "$ROW_CHECKS->A13($FB_USER_SESSION$CAPABILITIES)Z"
internal const val SYNTHETIC_META_AI_ENCRYPTED_ROW = "$ROW_CHECKS->A0d($FB_USER_SESSION)Z"
internal const val SYNTHETIC_IMAGINE_ROW = "$ROW_CHECKS->A0y(${ROW_PARAMS}ZZ)Z"
internal const val SYNTHETIC_IMAGINE_YOURSELF_ROW = "$ROW_CHECKS->A0w($ROW_PARAMS)Z"

/** One build's numbering of the five checks' flags. */
private class AiRowFlags(val row: Set<Long>, val chat: Set<Long>, val shared: Long, val encrypted: Long, val imagine: Long, val imagineYourself: Long)
private val AI_ROW_FLAGS = AiRowFlags(META_AI_ROW_FLAGS, META_AI_CHAT_FLAGS, META_AI_SHARED_FLAG, META_AI_ENCRYPTED_FLAG, IMAGINE_ROW_FLAG, IMAGINE_YOURSELF_ROW_FLAG)
/** 583's numbering, which no 584 build reads. */
private val AI_ROW_FLAGS_583 = AiRowFlags(setOf(0x810637011b2d49L, 0x81063701042d42L), setOf(0x810637011b2d49L, 0x81063700042cffL),
    0x810637011b2d49L, 0x81063700052d00L, 0x81063700402d10L, 0x81063700f92d3eL)

/** One server flag read the way 584 writes it, answered into v0. */
private fun flagRead(flag: Long) = """
    invoke-static {}, LX/19a;->A0B()LX/5dD;
    move-result-object v2
    const-wide v0, ${flag}L
    invoke-static {v2, v0, v1}, LX/17Q;->A1Y(Ljava/lang/Object;J)Z
    move-result v0
""".trimIndent()

private const val SHARED_FLAG_GETTER = "$ROW_CHECKS->A07()Z"

/** Family B's read: the shared flag through the checks' own static getter, every other flag in place. */
private fun familyBRead(flag: Long) =
    if (flag == META_AI_SHARED_FLAG) "invoke-static {}, $SHARED_FLAG_GETTER\nmove-result v0" else flagRead(flag)

/** The Meta AI row check: either of its two flags turns the row on. */
private fun metaAiRow(id: String = SYNTHETIC_META_AI_ROW, flags: List<Long> = META_AI_ROW_FLAGS.toList(), read: (Long) -> String = ::flagRead) =
    fixtureMethod(id, """
    const/4 v3, 0x0
    ${read(flags[0])}
    if-nez v0, :on
    ${flags.getOrNull(1)?.let { read(it) } ?: "const/4 v0, 0x0"}
    if-eqz v0, :off
    :on
    const/4 v3, 0x1
    :off
    return v3
""".trimIndent(), registers = 5)

/** The regular-chat Meta AI check: a capability, then both of its flags. */
private fun metaAiChatsRow(id: String = SYNTHETIC_META_AI_CHATS_ROW, flags: List<Long> = META_AI_CHAT_FLAGS.toList(), read: (Long) -> String = ::flagRead) =
    fixtureMethod(id, """
    const/4 v4, 0x0
    const/16 v0, 0x148
    invoke-virtual {v7, v0}, $CAPABILITIES->A00(I)Z
    move-result v0
    if-eqz v0, :off
    ${read(flags[0])}
    if-nez v0, :off
    ${flags.getOrNull(1)?.let { read(it) } ?: "const/4 v0, 0x0"}
    if-eqz v0, :off
    const/4 v4, 0x1
    :off
    return v4
""".trimIndent(), registers = 8)

/** The encrypted-chat Meta AI check: the shared Meta AI flag, then the encrypted flag. */
private fun metaAiEncryptedRow(id: String = SYNTHETIC_META_AI_ENCRYPTED_ROW, flags: List<Long> = listOf(META_AI_SHARED_FLAG, META_AI_ENCRYPTED_FLAG),
    read: (Long) -> String = ::flagRead) =
    fixtureMethod(id, """
        const/4 v3, 0x0
        ${read(flags[0])}
        if-eqz v0, :off
        ${read(flags[1])}
        if-eqz v0, :off
        const/4 v3, 0x1
        :off
        return v3
    """.trimIndent(), registers = 6)

/** An imagine check: the row shows while its flag is on. */
private fun imagineRow(id: String, flag: Long, flags: Int = AccessFlags.PUBLIC.value) = fixtureMethod(id, """
    const/4 v4, 0x0
    ${flagRead(flag)}
    if-eqz v0, :off
    const/4 v4, 0x1
    :off
    return v4
""".trimIndent(), registers = 11, flags = flags)

private fun rowChecks(type: String = ROW_CHECKS, build: AiRowFlags = AI_ROW_FLAGS) = listOf(
    metaAiRow(SYNTHETIC_META_AI_ROW.replace(ROW_CHECKS, type), build.row.toList()),
    metaAiChatsRow(SYNTHETIC_META_AI_CHATS_ROW.replace(ROW_CHECKS, type), build.chat.toList()),
    metaAiEncryptedRow(SYNTHETIC_META_AI_ENCRYPTED_ROW.replace(ROW_CHECKS, type), listOf(build.shared, build.encrypted)),
    imagineRow(SYNTHETIC_IMAGINE_ROW.replace(ROW_CHECKS, type), build.imagine),
    imagineRow(SYNTHETIC_IMAGINE_YOURSELF_ROW.replace(ROW_CHECKS, type), build.imagineYourself),
)

/** The five checks on one class. */
private fun rowClass(type: String = ROW_CHECKS, checks: List<Method> = rowChecks(type)) = fixtureClass(type, checks)

/** The five checks for the catalog-wide discovery fixture. */
internal fun aiMentionRowsFixture() = listOf(rowClass())

private fun Method.code() = implementation!!.instructions.toList()

/** The switch prologue answers false ahead of the stock check, which stays as it was. */
private fun assertSwitched(before: List<Instruction>, after: List<Instruction>, label: String) {
    assertEquals(before, after.drop(5), label)
    assertEquals("$SETTINGS->hideMetaAi()Z", (after[0] as ReferenceInstruction).reference.toString(), label)
    assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN), after.subList(1, 5).map { it.opcode }, label)
}

class AiMentionRowsTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
        metaAiFlagGetters = emptySet()
    }

    @Test fun familyBsMetaAiChecksReadTheSharedFlagThroughAGetterOfTheirOwn() {
        fun checks() = listOf(metaAiRow(read = ::familyBRead), metaAiChatsRow(read = ::familyBRead), metaAiEncryptedRow(read = ::familyBRead)) +
            rowChecks().drop(3)
        val getter = fixtureMethod(SHARED_FLAG_GETTER, flagRead(META_AI_SHARED_FLAG) + "\nreturn v0", registers = 3,
            flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        val familyB = checks()
        val found = mirroredControls(listOf(rowClass(checks = familyB + getter)))
        assertEquals(setOf(SYNTHETIC_META_AI_ROW, SYNTHETIC_META_AI_CHATS_ROW, SYNTHETIC_META_AI_ENCRYPTED_ROW, SYNTHETIC_IMAGINE_ROW,
            SYNTHETIC_IMAGINE_YOURSELF_ROW), found.getValue(AI_MENTION_ROWS).map { it.hookId() }.toSet())
        validateControls(found, setOf(AI_MENTION_ROWS))
        val before = familyB.map { it.code() }
        injectControl(AI_MENTION_ROWS, mapOf(AI_MENTION_ROWS to familyB))
        familyB.zip(before).forEach { (method, code) -> assertSwitched(code, method.code(), method.hookId()) }
        // With no getter that reads only the shared flag, the three Meta AI checks don't read it and no row is taken.
        assertTrue(findAiMentionRows(listOf(rowClass(checks = checks()))).isEmpty())
        val mixed = fixtureMethod(SHARED_FLAG_GETTER, flagRead(META_AI_SHARED_FLAG) + "\n" + flagRead(IMAGINE_ROW_FLAG) + "\nreturn v0",
            registers = 3, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        assertTrue(findAiMentionRows(listOf(rowClass(checks = checks() + mixed))).isEmpty())
    }

    @Test fun eachRowCheckAnswersFalseWhileTheSwitchIsOn() {
        val checks = rowChecks()
        val found = mirroredControls(listOf(rowClass(checks = checks)))
        assertEquals(setOf(SYNTHETIC_META_AI_ROW, SYNTHETIC_META_AI_CHATS_ROW, SYNTHETIC_META_AI_ENCRYPTED_ROW, SYNTHETIC_IMAGINE_ROW,
            SYNTHETIC_IMAGINE_YOURSELF_ROW), found.getValue(AI_MENTION_ROWS).map { it.hookId() }.toSet())
        validateControls(found, setOf(AI_MENTION_ROWS))
        val before = checks.map { it.code() }
        injectControl(AI_MENTION_ROWS, mapOf(AI_MENTION_ROWS to checks))
        checks.zip(before).forEach { (method, code) -> assertSwitched(code, method.code(), method.hookId()) }
    }

    @Test fun messenger583sRowFlagsOrAMixOfTheTwoNumberingsAreRefused() {
        val checks583 = rowChecks(build = AI_ROW_FLAGS_583)
        assertTrue(findAiMentionRows(listOf(rowClass(checks = checks583))).isEmpty())
        for (check in checks583) assertNull(check.aiMentionRow(), check.hookId())
        // Five checks that mix the two numberings.
        val mixed = rowChecks().take(3) + checks583.drop(3)
        assertTrue(findAiMentionRows(listOf(rowClass(checks = mixed))).isEmpty())
    }

    @Test fun aCheckThatMovedOrRepeatsLeavesTheRowsUnhooked() {
        val checks = rowChecks()
        val (meta, chats, encrypted) = checks
        val (imagine, yourself) = checks.drop(3)
        // Each check is told apart by its parameters and the flag it reads.
        assertEquals("meta_ai_encrypted", encrypted.aiMentionRow())
        val moved = mapOf(
            "Meta AI check reads one of its two flags" to metaAiRow(flags = META_AI_ROW_FLAGS.take(1)),
            "regular-chat check reads one of its two flags" to metaAiChatsRow(flags = META_AI_CHAT_FLAGS.take(1)),
            "encrypted check misses the shared flag" to metaAiEncryptedRow(flags = listOf(IMAGINE_ROW_FLAG, META_AI_ENCRYPTED_FLAG)),
            "encrypted check misses its own flag" to metaAiEncryptedRow(flags = listOf(META_AI_SHARED_FLAG, IMAGINE_ROW_FLAG)),
            "imagine reads another flag" to imagineRow(SYNTHETIC_IMAGINE_ROW, IMAGINE_YOURSELF_ROW_FLAG),
            "imagine yourself takes the imagine parameters" to imagineRow(SYNTHETIC_IMAGINE_ROW.replace("A0y", "A0z"), IMAGINE_YOURSELF_ROW_FLAG),
            "static check" to imagineRow(SYNTHETIC_IMAGINE_ROW, IMAGINE_ROW_FLAG, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
        )
        for ((case, method) in moved) assertNull(method.aiMentionRow(), case)
        // All five or none: a missing check, a second look-alike, or checks split across classes.
        assertTrue(findAiMentionRows(listOf(rowClass(checks = listOf(meta, chats, encrypted, imagine)))).isEmpty())
        assertTrue(findAiMentionRows(aiMentionRowsFixture() + fixtureClass("LX/1yR;", rowChecks("LX/1yR;").take(1))).isEmpty())
        assertTrue(findAiMentionRows(listOf(rowClass(checks = listOf(meta, chats, encrypted, imagine)),
            fixtureClass("LX/1yR;", listOf(rowChecks("LX/1yR;")[4])))).isEmpty())
        assertEquals(5, findAiMentionRows(listOf(rowClass(checks = listOf(meta, chats, encrypted, imagine, yourself)))).size)
    }

    @Test fun anUnexpectedMethodStopsTheControlBeforeAnyEdit() {
        val checks = rowChecks()
        val stranger = imagineRow(SYNTHETIC_IMAGINE_ROW.replace("A0y", "A0z"), 0x81062d00000001L)
        val before = checks.map { it.code() }
        val failure = assertFailsWith<PatchException> { injectControl(AI_MENTION_ROWS, mapOf(AI_MENTION_ROWS to checks + stranger)) }
        assertContains(failure.message.orEmpty(), "Meta AI checks moved")
        assertEquals(before, checks.map { it.code() })
    }

    @Test fun everySupportedBuildHooksItsFiveRowChecks() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val checks = findAiMentionRows(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(AI_MENTION_ROWS), checks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(AI_MENTION_ROWS to checks), setOf(AI_MENTION_ROWS))
            for (check in checks) {
                val method = MutableMethod(check)
                val before = method.code()
                method.injectAiMentionRows()
                assertSwitched(before, method.code(), "$code ${check.hookId()}")
            }
        }
    }
}
