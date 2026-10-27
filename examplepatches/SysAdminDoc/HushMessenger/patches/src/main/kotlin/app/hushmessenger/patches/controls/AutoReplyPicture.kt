package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

/** Builds the photo message for a chat with Messenger's media factory. The extension's stub returns null. */
internal const val AUTO_REPLY_PICTURE_MESSAGES = "$SETTINGS->autoReplyPictureMessages(Landroid/content/Context;Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/Object;"
/** Sends one built message the way the notification Reply action does. The extension's stub returns null. */
internal const val AUTO_REPLY_SEND_MESSAGE = "$SETTINGS->autoReplySendMessage(Ljava/lang/Object;)Ljava/lang/Object;"
/** Whether the two above were filled in. The extension's stub returns false. */
internal const val AUTO_REPLY_PICTURES = "$SETTINGS->autoReplyPictures()Z"
/** The notification Reply action's service, whose send the picture goes through. */
internal const val AUTO_REPLY_SERVICE = "Lcom/facebook/messaging/notify/service/MessengerDirectReplyService;"
internal const val AUTO_REPLY_MEDIA = "Lcom/facebook/ui/media/attachments/model/MediaResource;"
internal const val AUTO_REPLY_FACTORY = "Lcom/facebook/messaging/media/send/MediaMessageFactory;"
internal const val AUTO_REPLY_CAPABILITIES = "Lcom/facebook/xapp/messaging/capability/vector/Capabilities;"
internal const val AUTO_REPLY_EMPTY_MAPS = "Lcom/google/common/collect/RegularImmutableMap;"
/** The name Messenger's media type enum gives a photo. */
internal const val AUTO_REPLY_PHOTO = "PHOTO"
private const val PICTURE_MAP = "Lcom/google/common/collect/ImmutableMap;"
private const val PICTURE_INTENT = "Landroid/content/Intent;"
private const val PICTURE_URI = "Landroid/net/Uri;"
private const val PICTURE_CONTEXT = "Landroid/content/Context;"
private const val PICTURE_STRING = "Ljava/lang/String;"
private const val PICTURE_ENUM = "Ljava/lang/Enum;"

/**
 * How this build sends a photo to a chat from outside the chat screen, each value read from the build at discovery.
 * [session] is the static account getter and [sender], [send], [sendKind], [trigger] with [triggerName] and [flag] the
 * notification Reply action's send. [parse] turns a thread key string back into the chat. [builder] fills a media
 * resource through its [builderUri], [builderType] and [builderThread] fields, with [photo] as the type. [factory] is
 * Messenger's media message factory and [emptyMap] its empty map.
 */
internal data class AutoReplyPictureRecipe(
    val session: String,
    val sender: String,
    val send: String,
    val sendKind: String,
    val trigger: String,
    val triggerName: String,
    val flag: Int,
    val parse: String,
    val builder: String,
    val builderUri: String,
    val builderType: String,
    val builderThread: String,
    val photo: String,
    val factory: String,
    val emptyMap: String,
)

internal var autoReplyPictureRecipe: AutoReplyPictureRecipe? = null

private fun Instruction.pictureRef() = (this as? ReferenceInstruction)?.reference
private fun Method.pictureCode() = implementation?.instructions?.toList().orEmpty()
private fun Instruction.pictureArgs(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}
private fun MethodReference.pictureParams() = parameterTypes.map { it.toString() }
private fun FieldReference.pictureId() = "$definingClass->$name:$type"
private val PICTURE_STATIC_CALLS = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)
private val PICTURE_VIRTUAL_CALLS = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)
private val PICTURE_STRINGS = setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO)
private val PICTURE_MOVES = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)

/** The one instruction that sets [register] wherever the code reaches [at], or null when that's a parameter or more than one. */
private fun ReadFlow.pictureSource(at: Int, register: Int): Int? = definitionsAt(at, register).singleOrNull()?.takeIf { it >= 0 }

/**
 * Reads the recipe from the notification Reply action's send, Messenger's media factory and the media resource, or null
 * when any of them moved. Every class, method and field the generated code names is public, since it runs from the
 * extension's package.
 */
internal fun resolveAutoReplyPictureRecipe(classes: Iterable<ClassDef>): AutoReplyPictureRecipe? = try {
    resolvePictureRecipe(classes.associateBy { it.type })
} catch (_: PatchException) {
    // ReadFlow refuses a branch that lands between instructions.
    null
}

private fun resolvePictureRecipe(byType: Map<String, ClassDef>): AutoReplyPictureRecipe? {
    fun method(id: String) = byType[id.substringBefore("->")]?.methods?.singleOrNull { it.hookId() == id }
    fun publicMethod(id: String, static: Boolean): Boolean {
        val owner = byType[id.substringBefore("->")] ?: return false
        val m = owner.methods.singleOrNull { it.hookId() == id } ?: return false
        return AccessFlags.PUBLIC.isSet(owner.accessFlags) && AccessFlags.PUBLIC.isSet(m.accessFlags) &&
            AccessFlags.STATIC.isSet(m.accessFlags) == static
    }
    fun publicField(id: String, static: Boolean): Boolean {
        val owner = byType[id.substringBefore("->")] ?: return false
        val name = id.substringAfter("->").substringBefore(':')
        val f = owner.fields.singleOrNull { it.name == name && it.type == id.substringAfter(':') } ?: return false
        // A field the generated code writes can't be final.
        return AccessFlags.PUBLIC.isSet(owner.accessFlags) && AccessFlags.PUBLIC.isSet(f.accessFlags) &&
            AccessFlags.STATIC.isSet(f.accessFlags) == static && (static || !AccessFlags.FINAL.isSet(f.accessFlags))
    }

    // The service's one reply send: a static call given the reply intent, the account, a helper, a text and the trigger name, and a flag.
    // 584.1's armv7 build merges the handler into the service's abstract parent, so its supertypes count too.
    val service = byType[AUTO_REPLY_SERVICE] ?: return null
    val replies = generateSequence(service) { byType[it.superclass] }.flatMap { it.methods }.toList().flatMap { m ->
        m.pictureCode().withIndex().filter { (_, insn) ->
            val p = (insn.pictureRef() as? MethodReference)?.pictureParams()
            insn.opcode in PICTURE_STATIC_CALLS && p != null && p.size == 6 && p[0] == PICTURE_INTENT && p[1] == FB_USER_SESSION &&
                p[2].startsWith("L") && p[3] == PICTURE_STRING && p[4] == PICTURE_STRING && p[5] == "Z"
        }.map { m to it.index }
    }
    val (serviceMethod, replyAt) = replies.singleOrNull() ?: return null
    val serviceCode = serviceMethod.pictureCode()
    val serviceFlow = ReadFlow(serviceMethod)
    val replyArgs = serviceCode[replyAt].pictureArgs()
    val sessionRead = serviceFlow.pictureSource(replyAt, replyArgs[1])?.takeIf { it > 0 } ?: return null
    val sessionCall = serviceCode[sessionRead - 1].pictureRef() as? MethodReference
    if (serviceCode[sessionRead].opcode != Opcode.MOVE_RESULT_OBJECT || serviceCode[sessionRead - 1].opcode != Opcode.INVOKE_STATIC ||
        sessionCall == null || sessionCall.parameterTypes.isNotEmpty() || sessionCall.returnType != FB_USER_SESSION) return null
    val session = sessionCall.toString()
    val triggerName = serviceFlow.pictureSource(replyAt, replyArgs[4])?.let { i ->
        (serviceCode[i].pictureRef() as? StringReference)?.takeIf { serviceCode[i].opcode in PICTURE_STRINGS }?.string
    } ?: return null
    val flag = serviceFlow.pictureSource(replyAt, replyArgs[5])?.let { i ->
        (serviceCode[i] as? NarrowLiteralInstruction)?.takeIf { serviceCode[i].opcode == Opcode.CONST_4 }?.narrowLiteral
    }?.takeIf { it == 0 || it == 1 } ?: return null

    // The reply itself: one send of the built message, with a kind read from a static field and the service's flag passed on.
    val reply = method((serviceCode[replyAt].pictureRef() as MethodReference).toString()) ?: return null
    val replyCode = reply.pictureCode()
    val replyFlow = ReadFlow(reply)
    // The built stub keeps the send's result with move-result-object, so the send must return an object.
    val sends = replyCode.indices.filter { i ->
        val ref = replyCode[i].pictureRef() as? MethodReference
        val p = ref?.pictureParams()
        replyCode[i].opcode in PICTURE_VIRTUAL_CALLS && p != null && p.size == 4 && p[0].startsWith("L") && p[1] == MESSAGE &&
            p[2].startsWith("L") && p[3] == "Z" && ref.returnType.startsWith("L")
    }
    val sendRef = sends.map { replyCode[it].pictureRef() as MethodReference }.distinctBy { it.toString() }.singleOrNull() ?: return null
    val kindType = sendRef.pictureParams()[0]
    val triggerType = sendRef.pictureParams()[2]
    val flagParam = reply.parameterRegister(5)
    if (replyCode.any { insn -> insn.opcode.setsRegister() && insn is OneRegisterInstruction &&
            (insn.registerA == flagParam || (insn.opcode.setsWideRegister() && insn.registerA + 1 == flagParam)) }) return null
    val kinds = sends.map { s ->
        val args = replyCode[s].pictureArgs()
        val kind = replyFlow.pictureSource(s, args[1])?.let { i ->
            (replyCode[i].pictureRef() as? FieldReference)?.takeIf { replyCode[i].opcode == Opcode.SGET_OBJECT && it.type == kindType }?.pictureId()
        } ?: return null
        // The flag is the reply's own last parameter, which the service sets.
        val flagMove = replyFlow.pictureSource(s, args[4]) ?: return null
        if (replyCode[flagMove].opcode !in PICTURE_MOVES || (replyCode[flagMove] as TwoRegisterInstruction).registerB != flagParam) return null
        kind
    }
    val sendKind = kinds.distinct().singleOrNull() ?: return null
    fun staticCalls(code: List<Instruction>, params: List<String>, returns: String) = code.mapNotNull { insn ->
        (insn.pictureRef() as? MethodReference)?.takeIf { insn.opcode in PICTURE_STATIC_CALLS && it.pictureParams() == params && it.returnType == returns }?.toString()
    }.distinct()
    val trigger = staticCalls(replyCode, listOf(PICTURE_STRING), triggerType).singleOrNull() ?: return null
    // The chat comes back from the reply intent's thread key string, the same way the reply reads it.
    val reader = staticCalls(replyCode, listOf(PICTURE_INTENT), THREAD_KEY_TYPE).singleOrNull()?.let(::method) ?: return null
    val parse = staticCalls(reader.pictureCode(), listOf(PICTURE_STRING), THREAD_KEY_TYPE).singleOrNull() ?: return null
    val sender = sendRef.definingClass
    if (method("$sender-><init>($FB_USER_SESSION)V") == null) return null

    // The media resource checks the two values a resource can't go without: its file and its media type.
    val media = byType[AUTO_REPLY_MEDIA] ?: return null
    val shaped = media.methods.filter { it.name == "<init>" && it.parameterTypes.size == 1 }.mapNotNull { ctor ->
        val builderType = ctor.parameterTypes[0].toString()
        val code = ctor.pictureCode()
        val param = ctor.parameterRegister(1)
        val required = code.indices.mapNotNull { i ->
            val read = code[i] as? TwoRegisterInstruction ?: return@mapNotNull null
            val field = code[i].pictureRef() as? FieldReference ?: return@mapNotNull null
            if (code[i].opcode != Opcode.IGET_OBJECT || read.registerB != param || field.definingClass != builderType) return@mapNotNull null
            val check = (i + 1 until code.size).firstOrNull { code[it].opcode !in PICTURE_STRINGS } ?: return@mapNotNull null
            field.takeIf { code[check].opcode == Opcode.IF_EQZ && (code[check] as OneRegisterInstruction).registerA == read.registerA }
        }
        val uri = required.singleOrNull { it.type == PICTURE_URI }
        val kind = required.singleOrNull { it.type != PICTURE_URI && byType[it.type]?.superclass == PICTURE_ENUM }
        if (required.size == 2 && uri != null && kind != null) Triple(builderType, uri, kind) else null
    }
    val (builder, uriField, typeField) = shaped.singleOrNull() ?: return null
    if (method("$builder-><init>()V") == null) return null
    val threadField = byType[builder]?.fields?.singleOrNull { it.type == THREAD_KEY_TYPE && !AccessFlags.STATIC.isSet(it.accessFlags) }
        ?.let { "$builder->${it.name}:${it.type}" } ?: return null
    // The photo constant is the enum entry its initializer names PHOTO.
    val mediaType = typeField.type
    val photo = method("$mediaType-><clinit>()V")?.pictureCode()?.let { c ->
        c.indices.filter { (c[it].pictureRef() as? StringReference)?.string == AUTO_REPLY_PHOTO && c[it].opcode in PICTURE_STRINGS }.mapNotNull { k ->
            val name = (c[k] as OneRegisterInstruction).registerA
            val init = (k + 1 until c.size).firstOrNull { j ->
                val ref = c[j].pictureRef() as? MethodReference
                c[j].opcode == Opcode.INVOKE_DIRECT && ref?.definingClass == mediaType && ref.name == "<init>" && c[j].pictureArgs().getOrNull(1) == name
            } ?: return@mapNotNull null
            if ((k + 1 until init).any { j -> c[j].opcode.setsRegister() && (c[j] as? OneRegisterInstruction)?.registerA == name }) return@mapNotNull null
            val store = (init + 1 until c.size).firstOrNull { j -> c[j].opcode == Opcode.SPUT_OBJECT || c[j].opcode == Opcode.NEW_INSTANCE } ?: return@mapNotNull null
            (c[store].pictureRef() as? FieldReference)?.takeIf { c[store].opcode == Opcode.SPUT_OBJECT && it.definingClass == mediaType && it.type == mediaType }?.pictureId()
        }.distinct().singleOrNull()
    } ?: return null

    // The factory: given the chat, the kind and the list of resources, it builds the messages to send.
    val factoryClass = byType[AUTO_REPLY_FACTORY] ?: return null
    if (method("$AUTO_REPLY_FACTORY-><init>($PICTURE_CONTEXT)V") == null) return null
    val factory = factoryClass.methods.filter { m ->
        val p = m.parameterTypes.map(CharSequence::toString)
        AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType.startsWith("L") && p.size == 14 && p[0] == PICTURE_CONTEXT &&
            p[1] == FB_USER_SESSION && p[2] == kindType && p[3] == AUTO_REPLY_FACTORY && p[4] == THREAD_KEY_TYPE &&
            p[5].startsWith("L") && p[6].startsWith("L") && p[7] == AUTO_REPLY_CAPABILITIES && p[8] == PICTURE_MAP && p[9] == PICTURE_MAP &&
            p[10] == PICTURE_STRING && p[11] == PICTURE_STRING && p[12] == "Ljava/util/List;" && p[13] == "I"
    }.singleOrNull()?.hookId() ?: return null
    if (method("$AUTO_REPLY_CAPABILITIES-><init>(Ljava/util/BitSet;)V") == null) return null
    val emptyMap = byType[AUTO_REPLY_EMPTY_MAPS]?.fields?.singleOrNull { it.type == PICTURE_MAP && AccessFlags.STATIC.isSet(it.accessFlags) }
        ?.let { "$AUTO_REPLY_EMPTY_MAPS->${it.name}:${it.type}" } ?: return null

    val methods = listOf(session to true, "$sender-><init>($FB_USER_SESSION)V" to false, sendRef.toString() to false, trigger to true,
        parse to true, "$builder-><init>()V" to false, "$AUTO_REPLY_MEDIA-><init>($builder)V" to false,
        "$AUTO_REPLY_FACTORY-><init>($PICTURE_CONTEXT)V" to false, factory to true, "$AUTO_REPLY_CAPABILITIES-><init>(Ljava/util/BitSet;)V" to false)
    val fields = listOf(sendKind to true, uriField.pictureId() to false, typeField.pictureId() to false, threadField to false,
        photo to true, emptyMap to true)
    if (methods.any { (id, static) -> !publicMethod(id, static) } || fields.any { (id, static) -> !publicField(id, static) }) return null
    if (byType[MESSAGE]?.let { AccessFlags.PUBLIC.isSet(it.accessFlags) } != true) return null
    return AutoReplyPictureRecipe(session, sender, sendRef.toString(), sendKind, trigger, triggerName, flag, parse, builder,
        uriField.pictureId(), typeField.pictureId(), threadField, photo, factory, emptyMap)
}

/** One of the extension's picture stubs as shipped: static, not private, and returning null or false. */
internal fun MutableMethod.validateAutoReplyPictureStub(id: String) {
    val code = pictureCode()
    val returns = if (id == AUTO_REPLY_PICTURES) Opcode.RETURN else Opcode.RETURN_OBJECT
    if (hookId() != id || !AccessFlags.STATIC.isSet(accessFlags) || AccessFlags.PRIVATE.isSet(accessFlags) ||
        code.map { it.opcode } != listOf(Opcode.CONST_4, returns) || (code[0] as? NarrowLiteralInstruction)?.narrowLiteral != 0 ||
        implementation!!.tryBlocks.isNotEmpty())
        throw PatchException("Messenger controls: the auto reply picture's extension stub changed")
}

private fun MutableMethod.pictureCopy(registers: Int) = MutableMethod(ImmutableMethod(definingClass, name, parameters, returnType, accessFlags,
    annotations, hiddenApiRestrictions, ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())))

/**
 * The autoReplyPictureMessages(context, thread, picture) stub's replacement: one photo resource for the chat, handed to
 * Messenger's media factory with the reply's kind, no caption and portrait orientation. Returns the factory's future of
 * built messages, or null when there's no account or the thread key doesn't parse.
 */
internal fun autoReplyMessagesBuilder(stub: MutableMethod, recipe: AutoReplyPictureRecipe): MutableMethod {
    stub.validateAutoReplyPictureStub(AUTO_REPLY_PICTURE_MESSAGES)
    // Fourteen locals for the factory's range call, then the three parameters.
    val built = stub.pictureCopy(17)
    built.addInstructionsWithLabels(0, """
        move-object/from16 v0, p0
        invoke-static {}, ${recipe.session}
        move-result-object v1
        if-eqz v1, :none
        sget-object v2, ${recipe.sendKind}
        new-instance v3, $AUTO_REPLY_FACTORY
        invoke-direct {v3, v0}, $AUTO_REPLY_FACTORY-><init>($PICTURE_CONTEXT)V
        move-object/from16 v4, p1
        invoke-static {v4}, ${recipe.parse}
        move-result-object v4
        if-eqz v4, :none
        const/4 v5, 0x0
        const/4 v6, 0x0
        new-instance v7, $AUTO_REPLY_CAPABILITIES
        new-instance v8, Ljava/util/BitSet;
        invoke-direct {v8}, Ljava/util/BitSet;-><init>()V
        invoke-direct {v7, v8}, $AUTO_REPLY_CAPABILITIES-><init>(Ljava/util/BitSet;)V
        sget-object v8, ${recipe.emptyMap}
        move-object v9, v8
        const/4 v10, 0x0
        const/4 v11, 0x0
        new-instance v12, ${recipe.builder}
        invoke-direct {v12}, ${recipe.builder}-><init>()V
        move-object/from16 v13, p2
        iput-object v13, v12, ${recipe.builderUri}
        sget-object v13, ${recipe.photo}
        iput-object v13, v12, ${recipe.builderType}
        iput-object v4, v12, ${recipe.builderThread}
        new-instance v13, $AUTO_REPLY_MEDIA
        invoke-direct {v13, v12}, $AUTO_REPLY_MEDIA-><init>(${recipe.builder})V
        invoke-static {v13}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;
        move-result-object v12
        const/4 v13, 0x1
        invoke-static/range {v0 .. v13}, ${recipe.factory}
        move-result-object v0
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
    """.trimIndent())
    return built
}

/**
 * The autoReplySendMessage(message) stub's replacement: the notification Reply action's own send, with its kind,
 * trigger and flag. Returns Messenger's send future, or null when it isn't a message or there's no account.
 */
internal fun autoReplySendBuilder(stub: MutableMethod, recipe: AutoReplyPictureRecipe): MutableMethod {
    stub.validateAutoReplyPictureStub(AUTO_REPLY_SEND_MESSAGE)
    val built = stub.pictureCopy(7)
    built.addInstructionsWithLabels(0, """
        instance-of v0, p0, $MESSAGE
        if-eqz v0, :none
        invoke-static {}, ${recipe.session}
        move-result-object v0
        if-eqz v0, :none
        new-instance v1, ${recipe.sender}
        invoke-direct {v1, v0}, ${recipe.sender}-><init>($FB_USER_SESSION)V
        sget-object v2, ${recipe.sendKind}
        move-object v3, p0
        check-cast v3, $MESSAGE
        const-string v4, "${recipe.triggerName}"
        invoke-static {v4}, ${recipe.trigger}
        move-result-object v4
        const/4 v5, 0x${recipe.flag}
        invoke-virtual {v1, v2, v3, v4, v5}, ${recipe.send}
        move-result-object v0
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
    """.trimIndent())
    return built
}

/** The autoReplyPictures() stub's replacement, which tells the settings the picture can be sent on this build. */
internal fun autoReplyPicturesFlag(stub: MutableMethod): MutableMethod {
    stub.validateAutoReplyPictureStub(AUTO_REPLY_PICTURES)
    val built = stub.pictureCopy(1)
    built.addInstructionsWithLabels(0, """
        const/4 v0, 0x1
        return v0
    """.trimIndent())
    return built
}
