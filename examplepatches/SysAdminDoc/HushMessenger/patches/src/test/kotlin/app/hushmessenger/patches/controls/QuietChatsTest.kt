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
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

private const val SENDER_FIELD = "$MESSAGE->A0U:$PARTICIPANT_INFO"
private const val NAME_FIELD = "$PARTICIPANT_INFO->A0A:$SECRET_STRING"
private const val NOTIFICATION_MESSAGE = "$NEW_MESSAGE_NOTIFICATION->A0K:$MESSAGE"
private const val JSON_WRITER = "LX/Qs1;"
private const val JSON_PUT = "Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;"
private const val FOLDER_CALL = "$SETTINGS->notificationFolder(Ljava/lang/Object;)Ljava/lang/Object;"
private const val QUIET_CHAT_CALL = "$SETTINGS->quietChat(Ljava/lang/Object;)Z"
private const val LOUD_CHAT_CALL = "$SETTINGS->loudChat(Ljava/lang/Object;)V"
private const val LOG_QUIET_CALL = "$SETTINGS->logQuietChats()Z"
private const val DROP_QUIET_CALL = "$SETTINGS->dropQuiet(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Z"
private const val UNSENT_RECALL_CALL = "$SETTINGS->unsentRecall(Ljava/lang/String;)Z"
private const val MUTE_ANSWER = "move-result v0\nif-nez v0, :inbox"
private const val THREAD_KEY_READ = "iget-object v1, p0, $THREAD_LEVEL_RESULT->A01:$THREAD_KEY_TYPE"
private const val MERGED_KEY_READ = "iget-object v1, p0, $MERGED_THREAD_CHECK->A09:Ljava/lang/Object;\ncheck-cast v1, $THREAD_KEY_TYPE"

/**
 * 587's mute check: the answer flipped into whether the chat is muted, then a snooze check that may hand over its own
 * muted answer, and the branch on it where both ways meet.
 */
private val FLIPPED_MUTE = """
    move-result v0
    xor-int/lit8 v4, v0, 0x1
    const/4 v3, 0x0
    if-eq v3, v4, :decided
    if-eqz p1, :decided
    move v4, v3
    :decided
    if-eqz v4, :inbox
""".trimIndent()

/** The thread check as 587 has it, merged into a shared coroutine class that keeps its ThreadKey in an Object field. */
private val MERGED_CHECK_BODY = edited(THREAD_CHECK_BODY, MUTE_ANSWER to FLIPPED_MUTE, THREAD_KEY_READ to MERGED_KEY_READ)
    .replace(THREAD_LEVEL_RESULT, MERGED_THREAD_CHECK)

/**
 * Messenger writing a message as JSON: its sender goes in under "senderInfo". The recipient beside it is another
 * ParticipantInfo under another key, so only the key names the sender.
 */
private val SENDER_WRITER_BODY = """
    new-instance v0, Lorg/json/JSONObject;
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
    const-string v1, "senderInfo"
    iget-object v2, p0, $SENDER_FIELD
    invoke-virtual {v0, v1, v2}, $JSON_PUT
    const-string v1, "recipientInfo"
    iget-object v2, p0, $MESSAGE->A0V:$PARTICIPANT_INFO
    invoke-virtual {v0, v1, v2}, $JSON_PUT
    return-object v0
""".trimIndent()

/** ParticipantInfo's toString: the person's name under "name", then their id under another key. */
private val PARTICIPANT_TO_STRING_BODY = """
    const-string v0, "name"
    iget-object v1, p0, $NAME_FIELD
    const-string v0, "userKey"
    iget-object v1, p0, $PARTICIPANT_INFO->A0B:$SECRET_STRING
    const-string v0, ""
    return-object v0
""".trimIndent()

/** The classes the drop takes a quiet chat's sender from, beside [messageLogFixture]. */
internal fun quietSenderFixture(
    writer: String = SENDER_WRITER_BODY,
    toString: String = PARTICIPANT_TO_STRING_BODY,
    nameFlags: Int = AccessFlags.PUBLIC.value,
): List<MutableClass> = listOf(
    fixtureClass(PARTICIPANT_INFO, listOf(fixtureMethod("$PARTICIPANT_INFO->toString()Ljava/lang/String;", toString, 3)),
        extraFields = listOf(ImmutableField(PARTICIPANT_INFO, "A0A", SECRET_STRING, nameFlags, null, null, null),
            ImmutableField(PARTICIPANT_INFO, "A0B", SECRET_STRING, AccessFlags.PUBLIC.value, null, null, null))),
    fixtureClass(JSON_WRITER, listOf(fixtureMethod("$JSON_WRITER->A00($MESSAGE)Lorg/json/JSONObject;", writer, 4,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value))),
)

private fun Method.code() = implementation!!.instructions.toList()
private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference?.toString()

private fun edited(text: String, vararg edits: Pair<String, String>) =
    edits.fold(text) { body, (from, to) -> body.replace(from, to).also { check(it != body) { from } } }

private fun quietDropOf(classes: List<MutableClass>) = classes.single { it.type == MESSAGES_NOTIFICATION_MANAGER }
    .methods.single { it.hookId() == SYNTHETIC_QUIET_DROP }

class QuietChatsTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
        messageLogContract = null
        quietChatContract = null
    }

    @Test fun theCheckAndTheDropAreFoundWithTheirFields() {
        val classes = restrictedNotifyFixture() + messageLogFixture() + quietSenderFixture()
        val found = mirroredControls(classes)
        assertEquals(listOf(SYNTHETIC_RESTRICTED_NOTIFY), found.getValue(QUIET_LOG_CHECK).map { it.hookId() })
        assertEquals(listOf(SYNTHETIC_QUIET_DROP), found.getValue(QUIET_LOG_DROP).map { it.hookId() })
        validateControls(found, setOf(RESTRICTED_NOTIFY, QUIET_LOG_CHECK, QUIET_LOG_DROP))
        val contract = assertNotNull(quietChatContract)
        assertEquals(NOTIFICATION_MESSAGE, contract.notificationMessage)
        assertEquals(SENDER_FIELD, contract.senderField)
        assertEquals(NAME_FIELD, contract.nameField)
        val site = assertNotNull(threadCheck().muteCheck())
        assertEquals("$THREAD_LEVEL_RESULT->A01:$THREAD_KEY_TYPE", site.threadKey)
        assertEquals(0 to 6, site.register to site.self)
    }

    // A mute check that isn't exactly the chat's own setting, asked once and branched on straight away, could let the
    // wrong chats through, or the guard couldn't put the answer back, so the switch gets no check at all.
    @Test fun aMuteCheckOfAnotherShapeIsNotTaken() {
        fun changed(vararg edits: Pair<String, String>) = restrictedNotifyFixture(threadCheck(edited(THREAD_CHECK_BODY, *edits)))
        val cases = mapOf(
            "the setting comes from something else" to changed("$THREAD_SUMMARY->A05()" to "LX/Zt3;->A05()"),
            "the setting is asked for a number" to changed("->A03()Z" to "->A03()I"),
            "the answer is asked of another object" to changed("invoke-virtual {v0}, " to "invoke-virtual {v2}, "),
            "something runs before the branch" to changed(MUTE_ANSWER to "move-result v0\nconst/4 v3, 0x0\nif-nez v0, :inbox"),
            "the branch tests another register" to changed(MUTE_ANSWER to "move-result v0\nif-nez v3, :inbox"),
            "two mute checks" to changed(":muted\n" to ":muted\ninvoke-virtual {v2}, $THREAD_SUMMARY->A06()Lcom/facebook/messaging/model/threads/NotificationSetting;\n" +
                "move-result-object v0\ninvoke-virtual {v0}, Lcom/facebook/messaging/model/threads/NotificationSetting;->A04()Z\nmove-result v0\nif-eqz v0, :dropped\n"),
            "a jump lands on the branch" to changed(MUTE_ANSWER to "move-result v0\n:asked\nif-nez v0, :inbox",
                "const-string v0, \"dropped\"" to "if-eqz v5, :asked\nconst-string v0, \"dropped\""),
            "no ThreadKey of the check is read" to changed(THREAD_KEY_READ to "const/4 v1, 0x0"),
            "two ThreadKeys of the check are read" to changed(THREAD_KEY_READ to "$THREAD_KEY_READ\niget-object v1, p0, $THREAD_LEVEL_RESULT->A02:$THREAD_KEY_TYPE"),
            "the check's own register is written" to changed(":notify\n" to ":notify\nconst/4 v6, 0x0\n"),
            "the answer is past v15" to restrictedNotifyFixture(fixtureMethod(SYNTHETIC_RESTRICTED_NOTIFY,
                edited(THREAD_CHECK_BODY, MUTE_ANSWER to "move-result v16\nif-nez v16, :inbox"), registers = 20, flags = 0x11)),
        )
        for ((case, classes) in cases) {
            val found = mirroredControls(classes)
            // Each case breaks only the mute check: the folder read Notify for restricted chats goes after stays.
            assertEquals(listOf(SYNTHETIC_RESTRICTED_NOTIFY), found.getValue(RESTRICTED_NOTIFY).map { it.hookId() }, case)
            assertTrue(found.getValue(QUIET_LOG_CHECK).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(found, setOf(QUIET_LOG_CHECK)) }
            val method = classes.first().methods.single()
            val before = method.code()
            assertFailsWith<PatchException>(case) { injectControl("message_log", mapOf(QUIET_LOG_CHECK to listOf(method))) }
            assertEquals(before, method.code(), case)
        }
    }

    /**
     * The folder guard goes in first, then at the mute check a muted chat's answer comes from the extension and a chat
     * that notifies tells the extension so, both landing back on Messenger's own branch with a plain Z.
     */
    @Test fun aMutedChatAsksTheExtensionAndALoudOneTellsIt() {
        val method = threadCheck()
        val site = method.muteCheck()!!
        val before = method.code()
        val stockTarget = before.branchTarget(site.branch)
        injectControl("message_log", mapOf(QUIET_LOG_CHECK to listOf(method)))
        val code = method.code()
        assertEquals(1, code.count { it.ref() == FOLDER_CALL })
        val branch = site.branch + 3
        assertEquals(Opcode.IF_NEZ, code[branch].opcode)
        assertEquals(0, (code[branch] as OneRegisterInstruction).registerA)
        assertEquals(branch + 6, code.branchTarget(branch))
        for (path in listOf(branch + 1, branch + 6)) {
            assertEquals(Opcode.MOVE_OBJECT_FROM16, code[path].opcode)
            assertEquals(0 to 6, (code[path] as TwoRegisterInstruction).let { it.registerA to it.registerB })
            assertEquals(site.threadKey, code[path + 1].ref())
        }
        assertEquals(QUIET_CHAT_CALL, code[branch + 3].ref())
        assertEquals(Opcode.MOVE_RESULT, code[branch + 4].opcode)
        assertEquals(Opcode.GOTO, code[branch + 5].opcode)
        assertEquals(branch + 10, code.branchTarget(branch + 5))
        assertEquals(LOUD_CHAT_CALL, code[branch + 8].ref())
        assertEquals(1, (code[branch + 9] as NarrowLiteralInstruction).narrowLiteral)
        // Messenger's own branch, untouched, still lands where it did.
        assertEquals(before[site.branch].opcode, code[branch + 10].opcode)
        assertEquals(stockTarget + 13, code.branchTarget(branch + 10))
        val folder = code.indexOfFirst { it.ref() == FOLDER_CALL }
        val added = (folder until folder + 3) + (branch until branch + 10)
        assertEquals(before.map { it.opcode }, code.filterIndexed { i, _ -> i !in added }.map { it.opcode })
        injectControl("message_log", mapOf(QUIET_LOG_CHECK to listOf(method)))
        assertEquals(code, method.code())
    }

    /**
     * 587 decides on whether the chat is muted only after its snooze check, so the guard goes on that deciding branch:
     * both ways into it land on the guard, and the extension's answer goes back flipped into the muted sense.
     */
    @Test fun a587MutedChatIsAskedWhereTheMuteIsDecided() {
        val method = threadCheck(MERGED_CHECK_BODY, MERGED_THREAD_CHECK)
        assertEquals(listOf(method.hookId()), mirroredControls(restrictedNotifyFixture(method)).getValue(QUIET_LOG_CHECK).map { it.hookId() })
        val site = assertNotNull(method.muteCheck())
        assertEquals(Triple(4, true, "$MERGED_THREAD_CHECK->A09:Ljava/lang/Object;"), Triple(site.register, site.muted, site.threadKey))
        val before = method.code()
        val jumps = before.indices.filter { before.branchTarget(it) == site.branch }
        assertEquals(2, jumps.size)
        val stockTarget = before.branchTarget(site.branch)
        injectControl("message_log", mapOf(QUIET_LOG_CHECK to listOf(method)))
        val code = method.code()
        val guard = site.branch + 3
        for (jump in jumps) assertEquals(guard, code.branchTarget(jump + 3))
        assertEquals(Opcode.IF_EQZ, code[guard].opcode)
        assertEquals(4, (code[guard] as OneRegisterInstruction).registerA)
        assertEquals(guard + 7, code.branchTarget(guard))
        for (path in listOf(guard + 1, guard + 7)) {
            assertEquals(4 to 6, (code[path] as TwoRegisterInstruction).let { it.registerA to it.registerB })
            assertEquals(site.threadKey, code[path + 1].ref())
        }
        assertEquals(QUIET_CHAT_CALL, code[guard + 3].ref())
        assertEquals(Opcode.XOR_INT_LIT8, code[guard + 5].opcode)
        assertEquals(guard + 11, code.branchTarget(guard + 6))
        assertEquals(LOUD_CHAT_CALL, code[guard + 9].ref())
        assertEquals(0, (code[guard + 10] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(before[site.branch].opcode, code[guard + 11].opcode)
        assertEquals(stockTarget + 14, code.branchTarget(guard + 11))
        val folder = code.indexOfFirst { it.ref() == FOLDER_CALL }
        val added = (folder until folder + 3) + (guard until guard + 11)
        assertEquals(before.map { it.opcode }, code.filterIndexed { i, _ -> i !in added }.map { it.opcode })
    }

    // A flipped answer that something other than the snooze check's own answer can overwrite, or that no branch decides
    // on, isn't the muted answer any more, so the switch gets no check.
    @Test fun a587MuteCheckOfAnotherShapeIsNotTaken() {
        fun changed(vararg edits: Pair<String, String>) = restrictedNotifyFixture(threadCheck(edited(MERGED_CHECK_BODY, *edits), MERGED_THREAD_CHECK))
        val cases = mapOf(
            "the answer is flipped by another literal" to changed("v0, 0x1" to "v0, 0x2"),
            "a constant overwrites the muted answer" to changed("move v4, v3" to "const/4 v4, 0x1"),
            "no branch decides on the muted answer" to changed("if-eqz v4, :inbox" to "if-eqz v3, :inbox"),
            "the Object field is cast to something else" to changed("check-cast v1, $THREAD_KEY_TYPE" to "check-cast v1, $THREAD_SUMMARY"),
        )
        for ((case, classes) in cases) {
            val found = mirroredControls(classes)
            assertEquals(1, found.getValue(RESTRICTED_NOTIFY).size, case)
            assertTrue(found.getValue(QUIET_LOG_CHECK).isEmpty(), case)
        }
    }

    // Notify for restricted chats and this switch share the folder guard, whichever goes in first.
    @Test fun theFolderGuardGoesInOnceInEitherOrder() {
        for (order in listOf(listOf(RESTRICTED_NOTIFY, QUIET_LOG_CHECK), listOf(QUIET_LOG_CHECK, RESTRICTED_NOTIFY))) {
            val method = threadCheck()
            for (hook in order) injectControl(hook, mapOf(hook to listOf(method)))
            val refs = method.code().map { it.ref() }
            assertEquals(1, refs.count { it == FOLDER_CALL }, "$order")
            assertEquals(1, refs.count { it == QUIET_CHAT_CALL }, "$order")
            assertEquals(1, refs.count { it == LOUD_CHAT_CALL }, "$order")
        }
    }

    /**
     * At the top of the new-message method: the switch, the notification's message, the unsent check, then the chat, id
     * and sender's name go to the extension, and a quiet chat's notification returns before anything goes up.
     */
    @Test fun theDropHandsTheQuietMessageOverBeforeAnythingElse() {
        val classes = messageLogFixture() + quietSenderFixture()
        validateControls(mirroredControls(classes), setOf(QUIET_LOG_DROP))
        val log = messageLogContract!!
        val method = quietDropOf(classes)
        val before = method.code()
        injectControl("message_log", mapOf(QUIET_LOG_DROP to listOf(method)))
        val code = method.code()
        val stock = 22
        assertEquals(LOG_QUIET_CALL, code[0].ref())
        assertEquals(Opcode.MOVE_OBJECT_FROM16, code[3].opcode)
        // p2, the notification, in a ten-register method.
        assertEquals(0 to 9, (code[3] as TwoRegisterInstruction).let { it.registerA to it.registerB })
        assertEquals(NOTIFICATION_MESSAGE, code[4].ref())
        assertEquals(log.unsentCheck, code[6].ref())
        assertEquals(listOf(log.threadKeyField, log.messageIdField, SENDER_FIELD), (9..11).map { code[it].ref() })
        assertEquals(NAME_FIELD, code[13].ref())
        assertEquals(log.secretField, code[15].ref())
        assertEquals(DROP_QUIET_CALL, code[18].ref())
        assertEquals(Opcode.RETURN_VOID, code[21].opcode)
        for (exit in listOf(2, 5, 8, 20)) assertEquals(stock, code.branchTarget(exit), "exit $exit")
        assertEquals(17, code.branchTarget(12))
        assertEquals(17, code.branchTarget(14))
        assertEquals(18, code.branchTarget(16))
        assertEquals(before, code.drop(stock))
        injectControl("message_log", mapOf(QUIET_LOG_DROP to listOf(method)))
        assertEquals(code, method.code())
    }

    // On every supported build the drop and the unsend clear are the same method, so each must leave the other's site be.
    @Test fun theDropAndTheUnsendClearShareOneMethodInEitherOrder() {
        for (order in listOf(listOf(UNSENT_CLEAR, QUIET_LOG_DROP), listOf(QUIET_LOG_DROP, UNSENT_CLEAR))) {
            findControls(messageLogFixture() + quietSenderFixture())
            val method = fixtureMethod(SYNTHETIC_QUIET_DROP,
                "const-string v0, \"$NOTIFY_NEW_MESSAGE\"\niget-object v1, p2, $NOTIFICATION_MESSAGE\n$UNSENT_CLEAR_BODY", 10)
            val before = method.code()
            for (hook in order) injectControl("message_log", mapOf(hook to listOf(method)))
            val code = method.code()
            assertEquals(LOG_QUIET_CALL, code[0].ref(), "$order")
            assertEquals(1, code.count { it.ref() == DROP_QUIET_CALL }, "$order")
            assertEquals(1, code.count { it.ref() == UNSENT_RECALL_CALL }, "$order")
            assertEquals(before.size + 22 + 5, code.size, "$order")
        }
    }

    // A drop that can't read every field it needs from the notification manager would fail the verifier on every
    // notification, and one that isn't the new-message method would drop the wrong thing, so both refuse the switch.
    @Test fun aDropThatDoesNotMatchIsRefusedBeforeAnyEdit() {
        val cases = mapOf(
            "the method doesn't log as notifyNewMessageInternal" to messageLogFixture(quietDrop = QUIET_DROP_BODY.replace(NOTIFY_NEW_MESSAGE, "notifyNewMessage")) + quietSenderFixture(),
            "two of the notification's messages are read" to messageLogFixture(quietDrop = QUIET_DROP_BODY.replace("return-void",
                "iget-object v2, p2, $NEW_MESSAGE_NOTIFICATION->A0L:$MESSAGE\nreturn-void")) + quietSenderFixture(),
            "no sender in the message's JSON" to messageLogFixture() + quietSenderFixture(writer = SENDER_WRITER_BODY.replace("\"senderInfo\"", "\"authorInfo\"")),
            "two senders in the message's JSON" to messageLogFixture() + quietSenderFixture(writer = SENDER_WRITER_BODY.replace("\"recipientInfo\"", "\"senderInfo\"")),
            "a sender put into another register" to messageLogFixture() + quietSenderFixture(writer = SENDER_WRITER_BODY.replaceFirst("invoke-virtual {v0, v1, v2}", "invoke-virtual {v0, v1, v1}")),
            "a sender field the manager can't read" to messageLogFixture(senderFlags = AccessFlags.PRIVATE.value) + quietSenderFixture(),
            "no name in the sender's toString" to messageLogFixture() + quietSenderFixture(toString = PARTICIPANT_TO_STRING_BODY.replace("\"name\"", "\"displayName\"")),
            "a name field the manager can't read" to messageLogFixture() + quietSenderFixture(nameFlags = 0),
            "no message log" to messageLogFixture(retraction = "messenger_android_notification_retraction") + quietSenderFixture(),
        )
        for ((case, classes) in cases) {
            val found = mirroredControls(classes)
            val method = quietDropOf(classes)
            val before = method.code()
            assertFailsWith<PatchException>(case) {
                validateControls(found, setOf(QUIET_LOG_DROP))
                injectControl("message_log", mapOf(QUIET_LOG_DROP to listOf(method)))
            }
            assertEquals(before, method.code(), case)
            reset()
        }
    }

    @Test fun aDropWithoutRoomForItsLocalsIsRefused() {
        val classes = messageLogFixture() + quietSenderFixture()
        val manager = classes.single { it.type == MESSAGES_NOTIFICATION_MANAGER }
        manager.methods.removeIf { it.hookId() == SYNTHETIC_QUIET_DROP }
        manager.methods.add(fixtureMethod(SYNTHETIC_QUIET_DROP, QUIET_DROP_BODY, 6))
        val found = mirroredControls(classes)
        val method = quietDropOf(classes)
        assertEquals(listOf(SYNTHETIC_QUIET_DROP), found.getValue(QUIET_LOG_DROP).map { it.hookId() })
        val before = method.code()
        assertFailsWith<PatchException> { injectControl("message_log", mapOf(QUIET_LOG_DROP to listOf(method))) }
        assertEquals(before, method.code())
    }

    @Test fun everySupportedBuildTakesTheCheckAndTheDrop() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val check = findQuietLogCheck(classes)
            val drop = findQuietLogDrop(classes)
            assertEquals(activeProfile.hooks.getValue(QUIET_LOG_CHECK), check.map { it.hookId() }.toSet(), code)
            assertEquals(activeProfile.hooks.getValue(QUIET_LOG_DROP), drop.map { it.hookId() }.toSet(), code)
            messageLogContract = resolveMessageLogContract(classes)
            val quiet = assertNotNull(resolveQuietChatContract(classes, messageLogContract), code)
            quietChatContract = quiet
            assertEquals(NEW_MESSAGE_NOTIFICATION, quiet.notificationMessage.substringBefore("->"), code)
            assertTrue(quiet.senderField.startsWith("$MESSAGE->") && quiet.senderField.endsWith(":$PARTICIPANT_INFO"), code)
            assertTrue(quiet.nameField.startsWith("$PARTICIPANT_INFO->") && quiet.nameField.endsWith(":$SECRET_STRING"), code)
            for (restrictedFirst in listOf(true, false)) {
                val method = MutableMethod(check.single())
                assertTrue(method.muteCheck()!!.register <= 15, code)
                if (restrictedFirst) method.injectRestrictedNotify()
                method.injectQuietLogCheck()
                if (!restrictedFirst) method.injectRestrictedNotify()
                val refs = method.code().map { it.ref() }
                assertEquals(listOf(1, 1, 1), listOf(FOLDER_CALL, QUIET_CHAT_CALL, LOUD_CHAT_CALL).map { call -> refs.count { it == call } }, code)
            }
            val clear = findUnsentClear(classes).single()
            for (clearFirst in listOf(true, false)) {
                val method = MutableMethod(drop.single())
                val shared = clear.hookId() == method.hookId()
                if (clearFirst && shared) method.injectUnsentClear()
                method.injectQuietLogDrop()
                if (!clearFirst && shared) method.injectUnsentClear()
                val after = method.code()
                assertEquals(LOG_QUIET_CALL, after[0].ref(), code)
                assertEquals(DROP_QUIET_CALL, after[18].ref(), code)
                assertEquals(quiet.senderField, after[11].ref(), code)
                if (shared) assertEquals(1, after.count { it.ref() == UNSENT_RECALL_CALL }, code)
            }
            reset()
        }
    }
}
