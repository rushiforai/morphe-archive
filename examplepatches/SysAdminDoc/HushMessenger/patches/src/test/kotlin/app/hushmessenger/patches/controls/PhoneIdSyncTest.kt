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
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val REQUESTER = "LX/1Au;"
internal const val SYNTHETIC_PHONE_ID_LIST = "$REQUESTER->A03($REQUESTER)Ljava/util/ArrayList;"
internal const val SYNTHETIC_PHONE_ID_SYNC = "$REQUESTER->A06(Ljava/lang/String;)V"
private const val QUERY = "$REQUESTER->A01(${REQUESTER}Ljava/lang/String;I)LX/1Aw;"
private const val APP_START = "LX/Init;->A0e($REQUESTER)V"
private const val ORDERED_BROADCAST = "Landroid/content/Context;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;)V"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

/** The app list as Messenger writes it, cut down: every installed app, kept when it's a trusted Meta app. */
private val LIST_BODY = """
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    const/4 v1, 0x0
    invoke-virtual {v1, v1}, $INSTALLED_PACKAGES
    move-result-object v2
    return-object v0
""".trimIndent()

/** One app's phoneid provider query. */
private val QUERY_BODY = """
    const-string v0, "$PHONE_ID_PROVIDER"
    const/4 v0, 0x0
    return-object v0
""".trimIndent()

/** The sync: ask each listed app's provider, then broadcast GET_PHONE_ID to them. */
private val SYNC_BODY = """
    invoke-static {p0}, $SYNTHETIC_PHONE_ID_LIST
    move-result-object v0
    const/4 v1, 0x0
    invoke-static {p0, p1, v1}, $QUERY
    const-string v2, "$GET_PHONE_ID"
    const/4 v3, 0x0
    invoke-virtual {v3, v3, v3}, $ORDERED_BROADCAST
    return-void
""".trimIndent()

/** The copy app start runs: the same list, then the same query for each app. */
private val APP_START_BODY = """
    invoke-static {p0}, $SYNTHETIC_PHONE_ID_LIST
    move-result-object v0
    const/4 v1, 0x0
    invoke-static {p0, v1, v1}, $QUERY
    return-void
""".trimIndent()

private fun list(body: String = LIST_BODY, id: String = SYNTHETIC_PHONE_ID_LIST, registers: Int = 4, flags: Int = STATIC) =
    fixtureMethod(id, body, registers, flags)

private fun sync(body: String = SYNC_BODY, id: String = SYNTHETIC_PHONE_ID_SYNC, registers: Int = 6, flags: Int = AccessFlags.PUBLIC.value) =
    fixtureMethod(id, body, registers, flags)

private fun query() = fixtureMethod(QUERY, QUERY_BODY, 5, STATIC)

private fun appStart(body: String = APP_START_BODY) = fixtureClass("LX/Init;", listOf(fixtureMethod(APP_START, body, 3, STATIC)))

/** The requester with its list, its query and its sync, and app start's copy. */
internal fun phoneIdFixture(
    requester: List<MutableMethod> = listOf(list(), query(), sync()),
    others: List<MutableClass> = listOf(appStart()),
): List<MutableClass> = listOf(fixtureClass(REQUESTER, requester)) + others

private fun Method.code() = implementation!!.instructions.toList()

class PhoneIdSyncTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(PHONE_ID_SYNC).map { it.hookId() }.toSet()

    @Test fun theAppListAndTheSyncAreFoundWhenTheyAreTheWholeExchange() {
        assertEquals(setOf(SYNTHETIC_PHONE_ID_LIST, SYNTHETIC_PHONE_ID_SYNC), found(phoneIdFixture()))
        validateControls(mirroredControls(phoneIdFixture()), setOf(PHONE_ID_SYNC))
    }

    @Test fun eachProfileHooksOneRequestersListAndSync() {
        assertEquals(setOf(SYNTHETIC_PHONE_ID_LIST, SYNTHETIC_PHONE_ID_SYNC), SYNTHETIC_PROFILE.hooks.getValue(PHONE_ID_SYNC))
        // 585 renames the requester.
        assertEquals(setOf("LX/1JA;->A03(LX/1JA;)Ljava/util/ArrayList;", "LX/1JA;->A06(Ljava/lang/String;)V"),
            BASE_PROFILE.hooks.getValue(PHONE_ID_SYNC))
    }

    // The switch says Messenger stops reading the app list and asking Meta's apps for their ID. A build that asks some
    // other way would make that untrue, so it gets no hook at all.
    @Test fun anyOtherWayToAskLeavesTheControlUnapplied() {
        val strayQuery = fixtureClass("LX/Zzq;", listOf(fixtureMethod("LX/Zzq;->A00()V", "const-string v0, \"$PHONE_ID_PROVIDER\"\nreturn-void")))
        val straySender = fixtureClass("LX/Zzs;", listOf(fixtureMethod("LX/Zzs;->A00()V", "const-string v0, \"$GET_PHONE_ID\"\nreturn-void")))
        val listCall = "invoke-static {p0}, $SYNTHETIC_PHONE_ID_LIST\nmove-result-object v0\n"
        val cases = mapOf(
            "no requester" to phoneIdFixture(requester = listOf(list(), sync())),
            "a provider query in a second class" to phoneIdFixture() + strayQuery,
            "a second GET_PHONE_ID sender" to phoneIdFixture() + straySender,
            "app start asking without the list" to phoneIdFixture(others = listOf(appStart(APP_START_BODY.replace(listCall, "")))),
            "a sync that doesn't take the list" to phoneIdFixture(requester = listOf(list(), query(), sync(SYNC_BODY.replace(listCall, "")))),
            "a sync that doesn't broadcast" to phoneIdFixture(requester = listOf(list(), query(), sync(SYNC_BODY.replace("invoke-virtual {v3, v3, v3}, $ORDERED_BROADCAST\n", "")))),
            "an instance list" to phoneIdFixture(requester = listOf(list(flags = AccessFlags.PUBLIC.value, registers = 5), query(), sync())),
            "a list that reads the apps twice" to phoneIdFixture(requester = listOf(
                list(LIST_BODY.replace("move-result-object v2\n", "move-result-object v2\ninvoke-virtual {v1, v1}, $INSTALLED_PACKAGES\n")), query(), sync())),
            "two lists" to phoneIdFixture(requester = listOf(list(), list(id = "$REQUESTER->A04($REQUESTER)Ljava/util/ArrayList;"), query(), sync())),
            "a static sync" to phoneIdFixture(requester = listOf(list(), query(), sync(flags = STATIC))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(PHONE_ID_SYNC)) }
        }
    }

    @Test fun theListComesBackEmptyBeforeMessengerReadsTheApps() {
        val method = list()
        val before = method.code()
        injectControl(PHONE_ID_SYNC, mapOf(PHONE_ID_SYNC to listOf(method)))
        val code = method.code()
        assertEquals("$SETTINGS->stopPhoneIdSync()Z", (code[0] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(6, code.branchTarget(2))
        // On, a new empty list, the answer on a phone with no other Meta app. Callers ask it isEmpty, so never null.
        assertEquals(Opcode.NEW_INSTANCE, code[3].opcode)
        assertEquals("Ljava/util/ArrayList;", (code[3] as ReferenceInstruction).reference.toString())
        assertEquals("Ljava/util/ArrayList;-><init>()V", (code[4] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.RETURN_OBJECT, code[5].opcode)
        assertEquals((code[3] as OneRegisterInstruction).registerA, (code[5] as OneRegisterInstruction).registerA)
        // Off, Pause and safe mode fall through to Messenger's own list, unchanged.
        assertEquals(before, code.drop(6))
    }

    @Test fun theSyncReturnsBeforeItAsksOrBroadcastsAnything() {
        val method = sync()
        val before = method.code()
        injectControl(PHONE_ID_SYNC, mapOf(PHONE_ID_SYNC to listOf(method)))
        val code = method.code()
        assertEquals("$SETTINGS->stopPhoneIdSync()Z", (code[0] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(4, code.branchTarget(2))
        assertEquals(Opcode.RETURN_VOID, code[3].opcode)
        assertEquals(before, code.drop(4))
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            // One register is exactly the list's parameter word, so v0 would be the requester itself.
            "a list with no free register" to list("const/4 p0, 0x0\ninvoke-virtual {p0, p0}, $INSTALLED_PACKAGES\nreturn-object p0", registers = 1),
            "another method" to query(),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(PHONE_ID_SYNC, mapOf(PHONE_ID_SYNC to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildKeepsTheExchangeBehindTheTwoHooks() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val hooks = findPhoneIdSync(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(PHONE_ID_SYNC), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(PHONE_ID_SYNC to hooks), setOf(PHONE_ID_SYNC))
            for (hook in hooks) {
                val method = MutableMethod(hook)
                val before = method.code()
                method.injectPhoneIdSync()
                assertEquals("$SETTINGS->stopPhoneIdSync()Z", (method.code()[0] as ReferenceInstruction).reference.toString(), code)
                val added = if (hook.isPhoneIdAppList()) 6 else 4
                assertEquals(if (added == 6) Opcode.RETURN_OBJECT else Opcode.RETURN_VOID, method.code()[added - 1].opcode, code)
                assertEquals(before.map { it.opcode }.filter { it != Opcode.NOP }, method.code().drop(added).map { it.opcode }.filter { it != Opcode.NOP }, code)
            }
        }
    }
}
