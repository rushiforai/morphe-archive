package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertNull

private const val REPLY = "LX/ArReply;"
private const val SESSIONS = "LX/ArSessions;"
private const val SENDER = "LX/ArSender;"
private const val KIND = "LX/ArKind;"
private const val TRIGGER = "LX/ArTrigger;"
private const val READER = "LX/ArReader;"
private const val BUILDER = "LX/ArBuilder;"
private const val TYPE = "LX/ArType;"
private const val SENDING = "LX/ArSending;"
private const val UNRELATED_HANDLER = "LX/ArOtherService;"
private const val INTENT = "Landroid/content/Intent;"
private const val STRING = "Ljava/lang/String;"
private const val MAP = "Lcom/google/common/collect/ImmutableMap;"
private const val REPLY_SEND = "$REPLY->A00($INTENT$FB_USER_SESSION$REPLY$STRING${STRING}Z)$SENDING"
private const val SESSION_GET = "$SESSIONS->A02()$FB_USER_SESSION"
private const val SEND = "$SENDER->A02($KIND$MESSAGE${TRIGGER}Z)$SENDING"
private const val SENDER_INIT = "$SENDER-><init>($FB_USER_SESSION)V"
private const val TRIGGER_OF = "$TRIGGER->A05($STRING)$TRIGGER"
private const val READ = "$READER->A00($INTENT)$THREAD_KEY_TYPE"
private const val PARSE = "$THREAD_KEY_TYPE->A0a($STRING)$THREAD_KEY_TYPE"
private const val KIND_FIELD = "$KIND->A19:$KIND"
private const val URI_FIELD = "$BUILDER->A0H:Landroid/net/Uri;"
private const val TYPE_FIELD = "$BUILDER->A0R:$TYPE"
private const val THREAD_FIELD = "$BUILDER->A0K:$THREAD_KEY_TYPE"
private const val PHOTO_FIELD = "$TYPE->A0F:$TYPE"
private const val EMPTY_MAP = "$AUTO_REPLY_EMPTY_MAPS->A03:$MAP"
private const val FACTORY_INIT = "$AUTO_REPLY_FACTORY-><init>(Landroid/content/Context;)V"
private const val CAPABILITIES_INIT = "$AUTO_REPLY_CAPABILITIES-><init>(Ljava/util/BitSet;)V"
private const val MEDIA_INIT = "$AUTO_REPLY_MEDIA-><init>($BUILDER)V"
private const val FACTORY_BUILD = "$AUTO_REPLY_FACTORY->A00(Landroid/content/Context;$FB_USER_SESSION$KIND$AUTO_REPLY_FACTORY$THREAD_KEY_TYPE" +
    "Lcom/facebook/messaging/model/threads/ThreadSummary;Lcom/facebook/share/model/ComposerAppAttribution;$AUTO_REPLY_CAPABILITIES" +
    "$MAP$MAP$STRING${STRING}Ljava/util/List;I)LX/ArBuilt;"
private const val NULL_BODY = "const/4 v0, 0x0\nreturn-object v0"
private val PUBLIC = AccessFlags.PUBLIC.value
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
private val CONSTANT = STATIC or AccessFlags.FINAL.value
private val CONSTRUCTOR = AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value

internal fun autoReplyMessagesStub(flags: Int = STATIC, body: String = NULL_BODY) = fixtureMethod(AUTO_REPLY_PICTURE_MESSAGES, body, 4, flags)
internal fun autoReplySendStub(flags: Int = STATIC, body: String = NULL_BODY) = fixtureMethod(AUTO_REPLY_SEND_MESSAGE, body, 2, flags)
internal fun autoReplyPicturesStub(flags: Int = STATIC, body: String = "const/4 v0, 0x0\nreturn v0") = fixtureMethod(AUTO_REPLY_PICTURES, body, 1, flags)

/** The notification Reply action's service handing the reply to its send, as 584 does: account, helper, text, trigger, flag. */
private fun serviceBody(trigger: String = "const-string v7, \"direct_reply_intent\"", flag: String = "const/4 v8, 0x1") = """
    invoke-static {}, $SESSION_GET
    move-result-object v4
    const/4 v5, 0x0
    move-object/from16 v3, p1
    const/4 v6, 0x0
    $trigger
    $flag
    invoke-static/range {v3 .. v8}, $REPLY_SEND
    return-void
""".trimIndent()

/** The reply: reads the chat from the intent, makes the trigger from its name, and sends with a kind and its own flag. */
private fun replyBody(
    kind: String = "sget-object v0, $KIND_FIELD",
    flag: String = "move/from16 v4, v13",
    send: String = SEND,
    result: String = "move-result-object v0",
) = """
    invoke-static {v8}, $READ
    move-result-object v5
    invoke-static {v12}, $TRIGGER_OF
    move-result-object v1
    new-instance v2, $SENDER
    invoke-direct {v2, v9}, $SENDER_INIT
    const/4 v3, 0x0
    $kind
    $flag
    invoke-virtual {v2, v0, v3, v1, v4}, $send
    $result
    return-object v0
""".trimIndent()

/** MediaResource's builder constructor: it refuses a resource without a file or a media type, then copies the rest. */
private fun mediaBody(extraCheck: Boolean = false) = """
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iget-object v0, p1, $URI_FIELD
    const-string v1, "Required value was null."
    if-eqz v0, :missing
    iget-object v0, p1, $TYPE_FIELD
    if-eqz v0, :missing
    iget-object v0, p1, $THREAD_FIELD
    ${if (extraCheck) "if-eqz v0, :missing" else "nop"}
    return-void
    :missing
    new-instance v0, Ljava/lang/IllegalArgumentException;
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V
    throw v0
""".trimIndent()

private fun typeInit(photo: String) = """
    const-string v1, "VIDEO"
    const/4 v2, 0x1
    new-instance v0, $TYPE
    invoke-direct {v0, v1, v2, v1}, $TYPE-><init>(${STRING}I$STRING)V
    sput-object v0, $TYPE->A0H:$TYPE
    const-string v1, "$photo"
    const/4 v2, 0x0
    new-instance v0, $TYPE
    invoke-direct {v0, v1, v2, v1}, $TYPE-><init>(${STRING}I$STRING)V
    sput-object v0, $PHOTO_FIELD
    return-void
""".trimIndent()

private fun field(owner: String, name: String, type: String, flags: Int) = ImmutableField(owner, name, type, flags, null, null, null)
private fun nullMethod(id: String, registers: Int, flags: Int) = fixtureMethod(id, NULL_BODY, registers, flags)
private fun ctor(id: String, registers: Int) = fixtureMethod(id, "return-void", registers, CONSTRUCTOR)

/** Every class the picture send touches, cut down to what discovery reads. Each argument moves one piece. */
private fun pictureClasses(
    send: String = SEND,
    service: String = serviceBody(),
    reply: String = replyBody(send = send),
    media: String = mediaBody(),
    builderFields: Int = PUBLIC,
    senderFlags: Int = PUBLIC,
    photo: String = AUTO_REPLY_PHOTO,
    factory: String = FACTORY_BUILD,
    handlerOn: String = AUTO_REPLY_SERVICE,
): List<ClassDef> {
    val enum = "Ljava/lang/Enum;"
    val parent = "LX/GAt;"
    fun handlers(owner: String) = if (owner == handlerOn) listOf(fixtureMethod("$owner->A03($INTENT)V", service, 11, PUBLIC)) else emptyList()
    return listOf(
        fixtureClass(AUTO_REPLY_SERVICE, handlers(AUTO_REPLY_SERVICE), superclass = parent),
        fixtureClass(parent, handlers(parent), flags = PUBLIC or AccessFlags.ABSTRACT.value),
        fixtureClass(UNRELATED_HANDLER, handlers(UNRELATED_HANDLER)),
        fixtureClass(REPLY, listOf(fixtureMethod(REPLY_SEND, reply, 14, STATIC))),
        fixtureClass(READER, listOf(fixtureMethod(READ, """
            const-string v0, "thread_key_string"
            invoke-virtual {v2, v0}, $INTENT->getStringExtra($STRING)$STRING
            move-result-object v0
            invoke-static {v0}, $PARSE
            move-result-object v0
            return-object v0
        """.trimIndent(), 3, STATIC))),
        fixtureClass(THREAD_KEY_TYPE, listOf(nullMethod(PARSE, 2, STATIC))),
        fixtureClass(SESSIONS, listOf(nullMethod(SESSION_GET, 1, STATIC))),
        fixtureClass(SENDER, listOf(ctor(SENDER_INIT, 2), fixtureMethod(send, if (send.endsWith(")V")) "return-void" else NULL_BODY, 6, PUBLIC)),
            flags = senderFlags),
        fixtureClass(KIND, superclass = enum, extraFields = listOf(field(KIND, "A19", KIND, CONSTANT))),
        fixtureClass(TRIGGER, listOf(nullMethod(TRIGGER_OF, 2, STATIC))),
        fixtureClass(MESSAGE),
        fixtureClass(AUTO_REPLY_MEDIA, listOf(fixtureMethod(MEDIA_INIT, media, 4, CONSTRUCTOR))),
        fixtureClass(BUILDER, listOf(ctor("$BUILDER-><init>()V", 1)), extraFields = listOf(
            field(BUILDER, "A0H", "Landroid/net/Uri;", builderFields), field(BUILDER, "A0R", TYPE, builderFields),
            field(BUILDER, "A0K", THREAD_KEY_TYPE, builderFields))),
        fixtureClass(TYPE, listOf(fixtureMethod("$TYPE-><clinit>()V", typeInit(photo), 3, AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value)),
            superclass = enum, extraFields = listOf(field(TYPE, "A0H", TYPE, CONSTANT), field(TYPE, "A0F", TYPE, CONSTANT))),
        fixtureClass(AUTO_REPLY_FACTORY, listOf(ctor(FACTORY_INIT, 2), nullMethod(factory, 14, STATIC))),
        fixtureClass(AUTO_REPLY_CAPABILITIES, listOf(ctor(CAPABILITIES_INIT, 2))),
        fixtureClass(AUTO_REPLY_EMPTY_MAPS, extraFields = listOf(field(AUTO_REPLY_EMPTY_MAPS, "A03", MAP, CONSTANT))),
    )
}

private fun Method.code() = implementation!!.instructions.toList()
private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference?.toString()

class AutoReplyPictureTest {
    private val recipe = AutoReplyPictureRecipe(SESSION_GET, SENDER, SEND, KIND_FIELD, TRIGGER_OF, "direct_reply_intent", 1, PARSE, BUILDER,
        URI_FIELD, TYPE_FIELD, THREAD_FIELD, PHOTO_FIELD, FACTORY_BUILD, EMPTY_MAP)

    @Test fun theRecipeComesFromTheReplySendAndTheMediaFactory() {
        assertEquals(recipe, resolveAutoReplyPictureRecipe(pictureClasses()))
    }

    /** 584.1's armv7 build keeps the reply handler on the service's abstract parent, its only subclass being the service. */
    @Test fun aHandlerOnTheServicesParentGivesTheSameRecipeButOneOnAnUnrelatedClassDoesNot() {
        assertEquals(recipe, resolveAutoReplyPictureRecipe(pictureClasses(handlerOn = "LX/GAt;")))
        assertNull(resolveAutoReplyPictureRecipe(pictureClasses(handlerOn = UNRELATED_HANDLER)))
    }

    @Test fun aSendThatMovedLeavesThePictureOut() {
        val cases = mapOf(
            "a trigger name that isn't a constant" to pictureClasses(service = serviceBody(trigger = "move-object/from16 v7, p1")),
            "a flag that isn't 0 or 1" to pictureClasses(service = serviceBody(flag = "const/4 v8, 0x2")),
            "a kind that isn't a static field" to pictureClasses(reply = replyBody(kind = "const/4 v0, 0x0")),
            "a flag that isn't the reply's own" to pictureClasses(reply = replyBody(flag = "const/4 v4, 0x1")),
            "a third field the resource can't go without" to pictureClasses(media = mediaBody(extraCheck = true)),
            "private builder fields" to pictureClasses(builderFields = AccessFlags.PRIVATE.value),
            "final builder fields" to pictureClasses(builderFields = PUBLIC or AccessFlags.FINAL.value),
            "a sender outside public reach" to pictureClasses(senderFlags = AccessFlags.FINAL.value),
            "no PHOTO entry" to pictureClasses(photo = "ALBUM"),
            "a factory without its orientation" to pictureClasses(factory = FACTORY_BUILD.replace("Ljava/util/List;I)", "Ljava/util/List;)")),
            // The built stub reads the send's result as an object, so a send that returns nothing would fail verification.
            "a send that returns nothing" to SEND.replace(")$SENDING", ")V").let {
                pictureClasses(send = it, reply = replyBody(send = it, result = "const/4 v0, 0x0"))
            },
        )
        for ((case, classes) in cases) assertNull(resolveAutoReplyPictureRecipe(classes), case)
    }

    @Test fun thePictureMessageIsOnePhotoForTheChatThroughTheFactory() {
        val built = autoReplyMessagesBuilder(autoReplyMessagesStub(), recipe)
        assertEquals(AUTO_REPLY_PICTURE_MESSAGES, built.hookId())
        val code = built.code()
        assertEquals(listOf(SESSION_GET, KIND_FIELD, AUTO_REPLY_FACTORY, FACTORY_INIT, PARSE, AUTO_REPLY_CAPABILITIES, "Ljava/util/BitSet;",
            "Ljava/util/BitSet;-><init>()V", CAPABILITIES_INIT, EMPTY_MAP, BUILDER, "$BUILDER-><init>()V", URI_FIELD, PHOTO_FIELD, TYPE_FIELD,
            THREAD_FIELD, AUTO_REPLY_MEDIA, MEDIA_INIT, "Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;", FACTORY_BUILD),
            code.mapNotNull { it.ref() })
        val call = code.single { it.ref() == FACTORY_BUILD } as RegisterRangeInstruction
        assertEquals(0 to 14, call.startRegister to call.registerCount)
        // The last argument is the screen orientation, portrait like the camera roll's own sends.
        assertEquals(1, (code[code.indexOf(call as Instruction) - 1] as NarrowLiteralInstruction).narrowLiteral)
    }

    @Test fun theSendIsTheReplyActionsOwn() {
        val built = autoReplySendBuilder(autoReplySendStub(), recipe)
        assertEquals(AUTO_REPLY_SEND_MESSAGE, built.hookId())
        val code = built.code()
        assertEquals(listOf(MESSAGE, SESSION_GET, SENDER, SENDER_INIT, KIND_FIELD, MESSAGE, "direct_reply_intent", TRIGGER_OF, SEND),
            code.mapNotNull { it.ref() })
        val send = code.indexOfFirst { it.ref() == SEND }
        assertEquals(1, (code[send - 1] as NarrowLiteralInstruction).narrowLiteral)
        val flag = autoReplyPicturesFlag(autoReplyPicturesStub()).code()
        assertEquals(listOf(Opcode.CONST_4, Opcode.RETURN), flag.map { it.opcode })
        assertEquals(1, (flag[0] as NarrowLiteralInstruction).narrowLiteral)
    }

    @Test fun aChangedStubStopsThePatchBeforeAnyEdit() {
        assertFailsWith<PatchException> { autoReplyMessagesBuilder(autoReplyMessagesStub(flags = PUBLIC), recipe) }
        assertFailsWith<PatchException> { autoReplySendBuilder(autoReplySendStub(body = "const/4 v0, 0x1\nreturn-object v0"), recipe) }
        assertFailsWith<PatchException> { autoReplySendBuilder(autoReplyMessagesStub(), recipe) }
        assertFailsWith<PatchException> { autoReplyPicturesFlag(autoReplyPicturesStub(body = "const/4 v0, 0x1\nreturn v0")) }
    }

    @Test fun everySupportedBuildGivesThePictureItsRecipe() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val found = resolveAutoReplyPictureRecipe(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertNotNull(found, code)
            assertEquals("direct_reply_intent" to 1, found.triggerName to found.flag, code)
            assertEquals(found.builderType.substringAfter(':'), found.photo.substringAfter(':'), code)
            assertEquals("$THREAD_KEY_TYPE->", found.parse.substringBefore("->") + "->", code)
            autoReplyMessagesBuilder(autoReplyMessagesStub(), found)
            autoReplySendBuilder(autoReplySendStub(), found)
        }
    }
}
