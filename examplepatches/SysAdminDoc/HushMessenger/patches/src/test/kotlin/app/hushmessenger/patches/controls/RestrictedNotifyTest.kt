package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
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

/** The thread check's own class up to 586. */
internal const val THREAD_LEVEL_RESULT =
    "Lcom/facebook/messaging/msys/pushnotifications/protobufparsing/MsysNotificationParser\$getThreadLevelResult\$2;"

/** 587's coroutine class the thread check is merged into. */
internal const val MERGED_THREAD_CHECK = "LX/CxP;"

/** The thread check under its 586 class name. */
internal const val SYNTHETIC_RESTRICTED_NOTIFY = "$THREAD_LEVEL_RESULT->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;"

private const val FOLDER = "LX/204;"
private const val NOTIFY_SETTING = "Lcom/facebook/messaging/model/threads/NotificationSetting;"
private const val FOLDER_READ = "iget-object v5, v2, $THREAD_SUMMARY->A10:$FOLDER"

/** The folder enum's type in each stock build. */
private val NATIVE_FOLDERS = mapOf(PROFILE_347415280 to "LX/19t;", PROFILE_347415262 to "LX/1AJ;", PROFILE_347415302 to "LX/19t;",
    PROFILE_347415354 to "LX/19t;")

/**
 * The thread check cut down from 586: a chat or sender it can't load fails it, Other, Spam and Restricted end it, a
 * muted chat ends it, and only Inbox gets a notification (the null at the end). The resumed path lands on the folder
 * read itself.
 */
internal val THREAD_CHECK_BODY = """
    iget-object v2, p0, $THREAD_LEVEL_RESULT->L${'$'}3:Ljava/lang/Object;
    check-cast v2, $THREAD_SUMMARY
    if-nez p1, :summary
    const/4 v1, 0x0
    if-eqz v2, :no_sender
    const-string v1, "thread_summary_fetch_failed"
    return-object v1
    :no_sender
    const-string v1, "sender_user_fetch_failed"
    return-object v1
    :summary
    $FOLDER_READ
    sget-object v0, $FOLDER->A0V:$FOLDER
    if-eq v5, v0, :dropped
    sget-object v0, $FOLDER->A0c:$FOLDER
    if-eq v5, v0, :dropped
    sget-object v0, $FOLDER->A0b:$FOLDER
    if-ne v5, v0, :muted
    :dropped
    const-string v0, "dropped"
    return-object v0
    :muted
    invoke-virtual {v2}, $THREAD_SUMMARY->A05()$NOTIFY_SETTING
    move-result-object v0
    invoke-virtual {v0}, $NOTIFY_SETTING->A03()Z
    move-result v0
    if-nez v0, :inbox
    const-string v0, "muted"
    return-object v0
    :inbox
    iget-object v1, p0, $THREAD_LEVEL_RESULT->A01:$THREAD_KEY_TYPE
    sget-object v0, $FOLDER->A0K:$FOLDER
    if-eq v5, v0, :notify
    const-string v0, "not inbox"
    return-object v0
    :notify
    const/4 v0, 0x0
    return-object v0
""".trimIndent()

private fun constant(name: String, ordinal: Int, field: String) = """
    const-string v1, "${name.lowercase()}"
    const-string v0, "$name"
    const/4 v2, $ordinal
    new-instance v4, $FOLDER
    move-object v3, v4
    invoke-direct {v3, v0, v2, v1}, $FOLDER-><init>(Ljava/lang/String;ILjava/lang/String;)V
    sput-object v4, $FOLDER->$field:$FOLDER
""".trimIndent()

/** The folder enum's initializer, laid out like 348's, the moved instance included. */
private val FOLDER_INIT = listOf(constant("OTHER", 0, "A0V"), constant("INBOX", 1, "A0K"), constant("SPAM", 2, "A0c"),
    constant("RESTRICTED", 3, "A0b"), "return-void").joinToString("\n")

internal fun threadCheck(body: String = THREAD_CHECK_BODY, owner: String = THREAD_LEVEL_RESULT) =
    fixtureMethod("$owner->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", body, registers = 8, flags = 0x11)

private fun folders(init: String = FOLDER_INIT, superclass: String = "Ljava/lang/Enum;") =
    fixtureClass(FOLDER, listOf(fixtureMethod("$FOLDER-><clinit>()V", init, registers = 6, flags = 0x10008)), superclass = superclass)

internal fun restrictedNotifyFixture(method: MutableMethod = threadCheck(), folderClass: MutableClass? = folders()): List<MutableClass> =
    listOfNotNull(fixtureClass(method.definingClass, listOf(method)), folderClass)

private fun Method.code() = implementation!!.instructions.toList()

private fun edited(text: String, vararg edits: Pair<String, String>) =
    edits.fold(text) { body, (from, to) -> body.replace(from, to).also { check(it != body) { from } } }

class RestrictedNotifyTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(RESTRICTED_NOTIFY).map { it.hookId() }

    @Test fun findsTheThreadCheck() {
        assertEquals(listOf(SYNTHETIC_RESTRICTED_NOTIFY), found(restrictedNotifyFixture()))
        validateControls(mirroredControls(restrictedNotifyFixture()), setOf(RESTRICTED_NOTIFY))
        assertEquals(setOf(SYNTHETIC_RESTRICTED_NOTIFY), SYNTHETIC_PROFILE.hooks.getValue(RESTRICTED_NOTIFY))
        // 587 gives the parser's coroutine an obfuscated name.
        assertEquals(setOf("LX/CxP;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;"), BASE_PROFILE.hooks.getValue(RESTRICTED_NOTIFY))
        assertEquals(mapOf("OTHER" to "A0V", "INBOX" to "A0K", "SPAM" to "A0c", "RESTRICTED" to "A0b"), folders().enumConstantFields())
    }

    // 587 has no getThreadLevelResult class: the check is merged into a coroutine class it shares with unrelated ones.
    @Test fun the587MergedCheckIsFoundByWhatItFailsWith() {
        val merged = threadCheck(THREAD_CHECK_BODY.replace(THREAD_LEVEL_RESULT, MERGED_THREAD_CHECK), MERGED_THREAD_CHECK)
        assertEquals(listOf("$MERGED_THREAD_CHECK->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;"), found(restrictedNotifyFixture(merged)))
        assertEquals(5, merged.folderRead()!!.register)
    }

    // A check that can't be shown to compare this one folder with Restricted and Inbox could turn a chat's folder into
    // the inbox somewhere it shouldn't, or miss a path, so the switch gets no hook at all.
    @Test fun aCheckOfAnotherShapeIsNotTaken() {
        fun changed(vararg edits: Pair<String, String>) = restrictedNotifyFixture(threadCheck(edited(THREAD_CHECK_BODY, *edits)))
        val cases = mapOf(
            "no sender fetch failure" to changed("\"sender_user_fetch_failed\"" to "\"sender_fetch_failed\""),
            "no chat fetch failure" to changed("\"thread_summary_fetch_failed\"" to "\"thread_fetch_failed\""),
            "a second check failing the same way" to restrictedNotifyFixture(threadCheck()) +
                fixtureClass("LX/Zt1;", listOf(threadCheck(owner = "LX/Zt1;"))),
            "no folder class" to restrictedNotifyFixture(folderClass = null),
            "a folder class that isn't an enum" to restrictedNotifyFixture(folderClass = folders(superclass = "Ljava/lang/Object;")),
            "an enum with no Restricted constant" to restrictedNotifyFixture(folderClass = folders(edited(FOLDER_INIT, "\"RESTRICTED\"" to "\"LIMITED\""))),
            "an enum with no Inbox constant" to restrictedNotifyFixture(folderClass = folders(edited(FOLDER_INIT, "\"INBOX\"" to "\"PRIMARY\""))),
            "the check never compares with Restricted" to changed("$FOLDER->A0b:" to "$FOLDER->A09:"),
            "the check never compares with Inbox" to changed("$FOLDER->A0K:" to "$FOLDER->A09:"),
            "the folder is read off something else" to changed(FOLDER_READ to "iget-object v5, v2, LX/Zt2;->A10:$FOLDER"),
            "the folder is overwritten before the Inbox check" to changed(":inbox\n" to ":inbox\nconst/4 v5, 0x0\n"),
            "a second folder read" to changed(":summary\n" to ":summary\niget-object v4, v2, $THREAD_SUMMARY->A11:$FOLDER\n" +
                "sget-object v0, $FOLDER->A0b:$FOLDER\nif-eq v4, v0, :dropped\nsget-object v0, $FOLDER->A0K:$FOLDER\nif-eq v4, v0, :dropped\n"),
            "something lands after the read" to changed("const/4 v1, 0x0\n" to "if-eqz v2, :after\nconst/4 v1, 0x0\n",
                "$FOLDER_READ\n" to "$FOLDER_READ\n:after\n"),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(RESTRICTED_NOTIFY)) }
        }
    }

    @Test fun theFolderGoesThroughTheSwitchRightAfterItsRead() {
        val method = threadCheck()
        val before = method.code()
        val read = before.indexOfFirst { it.opcode == Opcode.IGET_OBJECT && (it as ReferenceInstruction).reference.toString().endsWith(":$FOLDER") }
        val resumed = before.indexOfFirst { it.opcode == Opcode.IF_NEZ }
        injectControl(RESTRICTED_NOTIFY, mapOf(RESTRICTED_NOTIFY to listOf(method)))
        val code = method.code()
        assertEquals(before.take(read + 1), code.take(read + 1))
        // The resumed path still lands on the read, so it runs through the guard too.
        assertEquals(read, code.branchTarget(resumed))
        val call = code[read + 1] as RegisterRangeInstruction
        assertEquals("$SETTINGS->notificationFolder(Ljava/lang/Object;)Ljava/lang/Object;", (call as ReferenceInstruction).reference.toString())
        assertEquals(5 to 1, call.startRegister to call.registerCount)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[read + 2].opcode)
        assertEquals(5, (code[read + 2] as OneRegisterInstruction).registerA)
        // Back to the folder's own type, so every compare after it sees the enum the verifier expects.
        assertEquals(Opcode.CHECK_CAST, code[read + 3].opcode)
        assertEquals(5, (code[read + 3] as OneRegisterInstruction).registerA)
        assertEquals(FOLDER, (code[read + 3] as ReferenceInstruction).reference.toString())
        assertEquals(before.drop(read + 1).map { it.opcode }, code.drop(read + 4).map { it.opcode })
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val bad = threadCheck(edited(THREAD_CHECK_BODY, ":inbox\n" to ":inbox\nconst/4 v5, 0x0\n"))
        val badBefore = bad.code()
        assertFailsWith<PatchException> { injectControl(RESTRICTED_NOTIFY, mapOf(RESTRICTED_NOTIFY to listOf(bad))) }
        assertEquals(badBefore, bad.code())
    }

    @Test fun everySupportedBuildGuardsTheSameFolderRead() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val hooks = findRestrictedNotify(classes)
            assertEquals(activeProfile.hooks.getValue(RESTRICTED_NOTIFY), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(RESTRICTED_NOTIFY to hooks), setOf(RESTRICTED_NOTIFY))
            val folderClass = classes.single { it.type == NATIVE_FOLDERS.getValue(activeProfile) }.enumConstantFields()
            val method = MutableMethod(hooks.single())
            val before = method.code()
            val site = method.folderRead()!!
            assertEquals(NATIVE_FOLDERS.getValue(activeProfile), site.type, code)
            assertEquals(5, site.register, code)
            assertTrue(folderClass.getValue(RESTRICTED_FOLDER) in site.compared && folderClass.getValue(INBOX_FOLDER) in site.compared, code)
            method.injectRestrictedNotify()
            val after = method.code()
            assertEquals("$SETTINGS->notificationFolder(Ljava/lang/Object;)Ljava/lang/Object;",
                (after[site.index] as ReferenceInstruction).reference.toString(), code)
            assertEquals(Opcode.CHECK_CAST, after[site.index + 2].opcode, code)
            assertEquals(before.map { it.opcode }.filter { it != Opcode.NOP },
                (after.take(site.index) + after.drop(site.index + 3)).map { it.opcode }.filter { it != Opcode.NOP }, code)
        }
    }
}
