package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * #213: a bar under a chat's name with the chat's newest pinned message, which a tap jumps to.
 *
 * Messenger's own pinned bar is an open banner of type 0x3dc, and msys writes those rows only for the chats it picked, so
 * forcing the banner's loader on (the first try at this) gave an encrypted chat nothing to show: the S22's 588 build ran
 * the loader and its callback got no banner. The pinned list behind See all has every pin, though, so the extension
 * draws its own bar from that list.
 *
 * The extension gets the chat fragment and its view at the handover the jump menu takes, and four stubs of its own get
 * bodies built from this build's code:
 * - loadPins starts the list's load the way See all does for an encrypted chat. The sheet's view setup checks the thread
 *   key, then reads its two long ids, and its load asks for 1000 rows of the first id as text and the second as a long,
 *   with the flags true and false. The count helper of community chats shows how the loader is reached and which
 *   options it takes. The load hands its answer to the callback the extension passes in.
 * - pinCount and pinRow read the answer the way the count helper does: the field it counts holds rows of the message
 *   row interface, read with the message id, text and time getters the text hooks already use.
 * - jumpToPin hands the chat's own jump listener what See all hands it: a fragment result under event_publisher_key with
 *   JUMP_TO_MESSAGE_KEY and the message id. The chat's view setup registers that listener on its child fragment manager.
 *
 * The sheet, the count helper, the options, the future and its callback keep their names in every build.
 */
internal const val PINNED_BAR = "pinned_bar"
internal const val PINNED_BAR_HOST = "Lapp/hushmessenger/extension/PinnedBar;"
internal const val PINNED_BAR_CALL = "$PINNED_BAR_HOST->chatShown(Ljava/lang/Object;Landroid/view/View;)V"
internal const val PINNED_BAR_LOAD = "$PINNED_BAR_HOST->loadPins(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"
internal const val PINNED_BAR_COUNT = "$PINNED_BAR_HOST->pinCount(Ljava/lang/Object;)I"
internal const val PINNED_BAR_ROW = "$PINNED_BAR_HOST->pinRow(Ljava/lang/Object;I)[Ljava/lang/Object;"
internal const val PINNED_BAR_JUMP = "$PINNED_BAR_HOST->jumpToPin(Ljava/lang/Object;Ljava/lang/String;)V"
internal val PINNED_BAR_STUBS = listOf(PINNED_BAR_LOAD, PINNED_BAR_COUNT, PINNED_BAR_ROW, PINNED_BAR_JUMP)

internal const val PINNED_SHEET = "Lcom/facebook/messaging/pinnedmessages/bottomsheet/MsysPinnedMessagesListBottomSheet;"
internal const val PINNED_SHEET_VIEW = "$PINNED_SHEET->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V"
internal const val PINNED_COUNT_HELPER =
    "Lcom/facebook/messaging/msys/thread/titlebar/communitymessaging/pinnedmessagescount/fetchconfig/datasource/impl/PinnedMessagesCountMsysHelperImpl;"
internal const val PINNED_LOAD_OPTIONS = "Lcom/facebook/msgorcapinnedmessages/mca/MailboxMSGOrcaPinnedMessages\$LoadViewDataOptions;"
internal const val MAILBOX_FUTURE = "Lcom/facebook/msys/mca/MailboxFutureImpl;"
internal const val MAILBOX_CALLBACK = "Lcom/facebook/msys/mca/MailboxCallback;"
private const val LOAD_PARAMETERS = "${PINNED_LOAD_OPTIONS}Ljava/lang/String;IJZZ"
private const val BUNDLE = "Landroid/os/Bundle;"
private const val STRING = "Ljava/lang/String;"
private const val LIFECYCLE_OWNER = "Landroidx/lifecycle/LifecycleOwner;"
private const val STARTED = "Landroidx/lifecycle/Lifecycle\$State;->STARTED:Landroidx/lifecycle/Lifecycle\$State;"
private const val MAP_GET = "Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;"
internal const val PINNED_RESULT_KEY = "event_publisher_key"
internal const val PINNED_JUMP_EVENT = "JUMP_TO_MESSAGE_KEY"
private val JUMP_STRINGS = setOf("event_name", PINNED_JUMP_EVENT, "MESSAGE_ID")

/** See all's encrypted load asks for this many rows. */
internal const val PINNED_LIST_ROWS = 1000

/** Everything the four stubs' bodies name, from the build being patched. */
internal class PinnedBarRecipe(
    val chat: String,
    val session: String,
    val threadKey: String,
    val encrypted: String,
    val keyId: String,
    val keyLong: String,
    val locator: String,
    val locatorId: Int,
    val sessionType: String,
    val unwrap: String,
    val loader: String,
    val options: String,
    val load: String,
    val listen: String,
    val result: String,
    val rows: String,
    val row: String,
    val childManager: String,
    val setResult: String,
)

/** The recipe of the build being patched, found with the hooks. */
internal var pinnedBarRecipe: PinnedBarRecipe? = null

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.method() = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.text() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun MethodReference.params() = parameterTypes.map { it.toString() }
private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

/** The thread key check of See all's view setup, and the two ids it reads for an encrypted chat. */
internal class PinnedKeyCheck(val encrypted: String, val keyId: String, val keyLong: String)

/**
 * The first thread key yes-or-no check that the sheet branches on, and the two long ids it reads from the same key right
 * after, while the answer is yes. They must be two different fields.
 */
internal fun Method.pinnedKeyCheck(): PinnedKeyCheck? {
    val code = code()
    val at = code.indices.firstOrNull {
        val call = code[it].method()
        code[it].opcode == Opcode.INVOKE_VIRTUAL && call != null && call.definingClass == THREAD_KEY_TYPE &&
            call.returnType == "Z" && call.parameterTypes.isEmpty()
    } ?: return null
    val key = (code[at] as FiveRegisterInstruction).registerC
    val result = code.getOrNull(at + 1) as? OneRegisterInstruction ?: return null
    val branch = code.getOrNull(at + 2) as? OneRegisterInstruction ?: return null
    if (code[at + 1].opcode != Opcode.MOVE_RESULT || code[at + 2].opcode != Opcode.IF_EQZ || branch.registerA != result.registerA) return null
    val reads = code.drop(at + 3).take(8).filter {
        val field = it.field()
        it.opcode == Opcode.IGET_WIDE && field != null && field.definingClass == THREAD_KEY_TYPE && field.type == "J"
    }.take(2)
    if (reads.size != 2 || reads.any { (it as TwoRegisterInstruction).registerB != key }) return null
    val (id, long) = reads.map { it.field().toString() }
    if (id == long) return null
    return PinnedKeyCheck(code[at].method().toString(), id, long)
}

/** How the count helper reaches the loader and reads its answer. */
internal class PinnedLoadSite(val locator: String, val locatorId: Int, val sessionType: String, val unwrap: String, val loader: String,
    val options: String, val load: String, val result: String, val rows: String)

private fun Instruction.isPinnedLoad(): Boolean {
    val call = method() ?: return false
    return (opcode == Opcode.INVOKE_VIRTUAL_RANGE || opcode == Opcode.INVOKE_VIRTUAL) && call.returnType == MAILBOX_FUTURE &&
        call.parameterTypes.joinToString("") == LOAD_PARAMETERS
}

/** A static method that makes the list's load options from nothing. */
internal fun Method.isPinnedOptionsMaker(): Boolean =
    isStatic() && returnType == PINNED_LOAD_OPTIONS && parameterTypes.isEmpty() &&
        code().any { it.opcode == Opcode.NEW_INSTANCE && (it as ReferenceInstruction).reference.toString() == PINNED_LOAD_OPTIONS }

/**
 * The count helper's load: the loader it unwraps from the account's locator (a numbered lookup, then a static unwrap and
 * a cast to the loader), the options, and the field of the answer it counts, whose type serves the message row interface.
 * The options come from the maker the helper calls, one of [makers]. The armv7 builds' helper fills its own in place, and
 * then the build's one maker, which See all calls, makes the same. Null when the method has no load or any part of that
 * changed.
 */
internal fun Method.pinnedLoadSite(classOf: (String) -> ClassDef?, makers: List<String>): PinnedLoadSite? {
    val code = code()
    val at = code.indices.singleOrNull { code[it].isPinnedLoad() } ?: return null
    val load = code[at].method()!!
    val cast = code.indices.singleOrNull {
        it < at && code[it].opcode == Opcode.CHECK_CAST && (code[it] as ReferenceInstruction).reference.toString() == load.definingClass
    } ?: return null
    if (cast < 3 || code[cast - 1].opcode != Opcode.MOVE_RESULT_OBJECT || code[cast - 2].opcode != Opcode.INVOKE_STATIC) return null
    val unwrap = code[cast - 2].method()!!
    if (unwrap.parameterTypes.size != 1 || unwrap.returnType != "Ljava/lang/Object;") return null
    val holder = unwrap.parameterTypes.single().toString()
    val locatorAt = (cast - 3 downTo 0).firstOrNull {
        code[it].opcode == Opcode.INVOKE_STATIC && code[it].method()?.returnType == holder
    } ?: return null
    val locator = code[locatorAt].method()!!
    if (locator.parameterTypes.size != 2 || locator.parameterTypes[1].toString() != "I" ||
        !locator.parameterTypes[0].toString().startsWith("L")) return null
    val idRegister = (code[locatorAt] as FiveRegisterInstruction).registerD
    val id = (locatorAt - 1 downTo 0).firstOrNull {
        (code[it].opcode == Opcode.CONST || code[it].opcode == Opcode.CONST_16 || code[it].opcode == Opcode.CONST_4) &&
            (code[it] as OneRegisterInstruction).registerA == idRegister
    }?.let { (code[it] as NarrowLiteralInstruction).narrowLiteral } ?: return null
    val called = code.mapNotNull { it.method()?.takeIf { call -> it.opcode == Opcode.INVOKE_STATIC && call.returnType == PINNED_LOAD_OPTIONS } }
        .map { it.toString() }.distinct()
    val options = (if (called.isEmpty()) makers.singleOrNull() else called.singleOrNull()?.takeIf { it in makers }) ?: return null
    val rows = code.mapNotNull { insn ->
        insn.field()?.takeIf { field ->
            insn.opcode == Opcode.IGET_OBJECT && classOf(field.type)?.interfaces?.map { it.toString() }?.contains(messageRowInterface) == true
        }
    }.distinctBy { it.toString() }.singleOrNull() ?: return null
    return PinnedLoadSite(locator.toString(), id, locator.parameterTypes[0].toString(), unwrap.toString(), load.definingClass,
        options, load.toString(), rows.definingClass, rows.toString())
}

/** The one public method of the future's classes that takes a callback. Every answer goes to the callbacks it holds. */
internal fun pinnedListenOf(classOf: (String) -> ClassDef?): String? {
    val found = mutableListOf<String>()
    var type: String? = MAILBOX_FUTURE
    var depth = 0
    while (type != null && depth++ < 16) {
        val cls = classOf(type) ?: break
        found += cls.methods.filter {
            AccessFlags.PUBLIC.isSet(it.accessFlags) && !it.isStatic() && it.returnType == "V" &&
                it.parameterTypes.map { p -> p.toString() } == listOf(MAILBOX_CALLBACK)
        }.map { it.hookId() }
        type = cls.superclass
    }
    return found.singleOrNull()
}

/** The fragment manager's setFragmentResult: the result goes to the listener under its key once that one is started. */
internal fun Method.isSetFragmentResult(): Boolean {
    if (isStatic() || returnType != "V" || parameterTypes.map { it.toString() } != listOf(STRING, BUNDLE)) return false
    val code = code()
    if (code.size < 2 || code[0].opcode != Opcode.IGET_OBJECT || code[0].field()?.type != "Ljava/util/Map;") return false
    if (code[1].opcode != Opcode.INVOKE_INTERFACE || code[1].method()?.toString() != MAP_GET) return false
    return code.any { it.opcode == Opcode.SGET_OBJECT && it.field()?.toString() == STARTED }
}

/**
 * Whether the chat's view setup registers, on [manager], a listener under event_publisher_key that turns a
 * JUMP_TO_MESSAGE_KEY result into a jump to its MESSAGE_ID.
 */
internal fun Method.publishesPinnedJumps(manager: String, classOf: (String) -> ClassDef?): Boolean {
    val code = code()
    for (i in 1 until code.size) {
        val call = code[i].method() ?: continue
        if (code[i].opcode != Opcode.INVOKE_VIRTUAL || call.definingClass != manager || call.returnType != "V") continue
        val params = call.params()
        if (params.size != 3 || params[1] != LIFECYCLE_OWNER || params[2] != STRING) continue
        val args = code[i] as FiveRegisterInstruction
        val key = code[i - 1]
        if (key.opcode != Opcode.CONST_STRING || key.text() != PINNED_RESULT_KEY || (key as OneRegisterInstruction).registerA != args.registerF) continue
        val made = (i - 1 downTo 0).firstOrNull {
            code[it].opcode == Opcode.NEW_INSTANCE && (code[it] as OneRegisterInstruction).registerA == args.registerD
        } ?: continue
        val listener = classOf((code[made] as ReferenceInstruction).reference.toString()) ?: continue
        if (listener.methods.any { handler ->
                handler.returnType == "V" && handler.parameterTypes.map { it.toString() } == listOf(STRING, BUNDLE) &&
                    handler.code().mapNotNull { it.text() }.containsAll(JUMP_STRINGS)
            }) return true
    }
    return false
}

/** The recipe, from the chat's view handover the hook takes, or null when any part of it changed. */
internal fun resolvePinnedBar(classes: Iterable<ClassDef>, handover: Method?): PinnedBarRecipe? {
    if (handover == null || messageRowInterface.isEmpty() || messageIdGetterName.isEmpty() || messageTextGetterName.isEmpty() ||
        messageTimestampGetterName.isEmpty()) return null
    val types = classes.associateBy { it.type }
    val classOf = { type: String -> types[type] }
    val chat = types[handover.definingClass] ?: return null
    // jumpToPin reads the chat as the androidx fragment it is.
    if (generateSequence(chat.superclass) { types[it]?.superclass }.take(16).none { it == ANDROIDX_FRAGMENT }) return null
    val session = chat.instanceFields.singleOrNull { it.name == "fbUserSession" && it.type == FB_USER_SESSION } ?: return null
    val key = chat.instanceFields.singleOrNull { it.name == "threadKey" && it.type == THREAD_KEY_TYPE } ?: return null
    val childManager = types[ANDROIDX_FRAGMENT]?.methods?.singleOrNull {
        it.name == "getChildFragmentManager" && it.parameterTypes.isEmpty() && !it.isStatic()
    } ?: return null
    val manager = childManager.returnType
    val setResult = types[manager]?.methods?.filter { it.isSetFragmentResult() }?.singleOrNull() ?: return null
    if (!handover.publishesPinnedJumps(manager, classOf)) return null
    val check = types[PINNED_SHEET]?.methods?.singleOrNull { it.hookId() == PINNED_SHEET_VIEW }?.pinnedKeyCheck() ?: return null
    val makers = classes.flatMap { cls -> cls.methods.filter { it.returnType == PINNED_LOAD_OPTIONS && it.isPinnedOptionsMaker() } }.map { it.hookId() }
    val site = types[PINNED_COUNT_HELPER]?.methods?.mapNotNull { it.pinnedLoadSite(classOf, makers) }?.singleOrNull() ?: return null
    val listen = pinnedListenOf(classOf) ?: return null
    val callback = types[MAILBOX_CALLBACK] ?: return null
    if (!AccessFlags.INTERFACE.isSet(callback.accessFlags) ||
        callback.methods.none { it.name == "onCompletion" && it.returnType == "V" && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/Object;") })
        return null
    val row = types[messageRowInterface] ?: return null
    fun declares(name: String, params: List<String>, ret: String) =
        row.methods.any { it.name == name && it.returnType == ret && it.parameterTypes.map { p -> p.toString() } == params }
    if (!AccessFlags.INTERFACE.isSet(row.accessFlags) || !declares("getCount", emptyList(), "I") ||
        !declares(messageIdGetterName, listOf("I"), STRING) || !declares(messageTextGetterName, listOf("I"), STRING) ||
        !declares(messageTimestampGetterName, listOf("I"), "J")) return null
    val recipe = PinnedBarRecipe(chat.type, "${chat.type}->${session.name}:${session.type}", "${chat.type}->${key.name}:${key.type}",
        check.encrypted, check.keyId, check.keyLong, site.locator, site.locatorId, site.sessionType, site.unwrap, site.loader,
        site.options, site.load, listen, site.result, site.rows, row.type, childManager.hookId(), setResult.hookId())
    return recipe.takeIf { it.reachable(types) }
}

/** Whether every class and member the stubs name is public, since the extension reaches them from its own package. */
private fun PinnedBarRecipe.reachable(types: Map<String, ClassDef>): Boolean {
    fun open(type: String) = types[type]?.let { AccessFlags.PUBLIC.isSet(it.accessFlags) } == true
    fun openMethod(id: String, static: Boolean) = open(id.substringBefore("->")) && types.getValue(id.substringBefore("->")).methods.any {
        it.hookId() == id && AccessFlags.PUBLIC.isSet(it.accessFlags) && it.isStatic() == static
    }
    fun openField(id: String) = open(id.substringBefore("->")) && types.getValue(id.substringBefore("->")).fields.any {
        "${it.definingClass}->${it.name}:${it.type}" == id && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    return listOf(chat, sessionType, loader, result, row, THREAD_KEY_TYPE, PINNED_LOAD_OPTIONS, MAILBOX_FUTURE, MAILBOX_CALLBACK,
        ANDROIDX_FRAGMENT, setResult.substringBefore("->")).all(::open) &&
        listOf(locator, unwrap, options).all { openMethod(it, static = true) } &&
        listOf(encrypted, load, listen, childManager, setResult).all { openMethod(it, static = false) } &&
        listOf(session, threadKey, keyId, keyLong, rows).all(::openField)
}

private fun pinnedChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the pinned message bar's $detail no longer matches the tested build")

/** First thing in the chat's view handover, the extension gets the fragment and its view. */
internal fun MutableMethod.injectPinnedBar() {
    validateChatJump()
    addInstructions(0, "invoke-static/range {p0 .. p1}, $PINNED_BAR_CALL")
}

/** An extension stub as it ships: static, not private, answering nothing, minus one or null. */
internal fun MutableMethod.validatePinnedBarStub(id: String) {
    val code = code()
    val shipped = when (returnType) {
        "V" -> code.size == 1 && code[0].opcode == Opcode.RETURN_VOID
        "I" -> code.size == 2 && code[0].opcode == Opcode.CONST_4 && (code[0] as NarrowLiteralInstruction).narrowLiteral == -1 &&
            code[1].opcode == Opcode.RETURN
        else -> code.size == 2 && code[0].opcode == Opcode.CONST_4 && (code[0] as NarrowLiteralInstruction).narrowLiteral == 0 &&
            code[1].opcode == Opcode.RETURN_OBJECT
    }
    if (hookId() != id || !isStatic() || AccessFlags.PRIVATE.isSet(accessFlags) || !shipped || implementation!!.tryBlocks.isNotEmpty())
        pinnedChanged("extension stub ${hookId()}")
}

/**
 * loadPins(chat, callback): for an encrypted chat with an account, See all's load of its pinned list, the callback added
 * to the future it answers. Null for any other chat. Eleven locals, so p0 is v11 and p1 v12.
 */
internal fun pinnedLoadBuilder(stub: MutableMethod, r: PinnedBarRecipe): MutableMethod {
    stub.validatePinnedBarStub(PINNED_BAR_LOAD)
    return stub.emptyCopy(13).apply {
        addInstructionsWithLabels(0, """
            check-cast p0, ${r.chat}
            iget-object v0, p0, ${r.session}
            if-eqz v0, :none
            iget-object v1, p0, ${r.threadKey}
            if-eqz v1, :none
            invoke-virtual {v1}, ${r.encrypted}
            move-result v2
            if-eqz v2, :none
            check-cast v0, ${r.sessionType}
            const v2, ${r.locatorId}
            invoke-static {v0, v2}, ${r.locator}
            move-result-object v3
            invoke-static {v3}, ${r.unwrap}
            move-result-object v3
            check-cast v3, ${r.loader}
            invoke-static {}, ${r.options}
            move-result-object v4
            iget-wide v5, v1, ${r.keyId}
            invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;
            move-result-object v5
            const/16 v6, $PINNED_LIST_ROWS
            iget-wide v7, v1, ${r.keyLong}
            const/4 v9, 0x1
            const/4 v10, 0x0
            invoke-virtual/range {v3 .. v10}, ${r.load}
            move-result-object v0
            if-eqz v0, :none
            check-cast p1, $MAILBOX_CALLBACK
            invoke-virtual {v0, p1}, ${r.listen}
            return-object v0
            :none
            const/4 v0, 0x0
            return-object v0
        """.trimIndent())
    }
}

/** pinCount(answer): how many rows the answer's pinned list has, the way the count helper counts them, or -1. */
internal fun pinnedCountBuilder(stub: MutableMethod, r: PinnedBarRecipe): MutableMethod {
    stub.validatePinnedBarStub(PINNED_BAR_COUNT)
    return stub.emptyCopy(2).apply {
        addInstructionsWithLabels(0, """
            instance-of v0, p0, ${r.result}
            if-eqz v0, :none
            check-cast p0, ${r.result}
            iget-object p0, p0, ${r.rows}
            if-eqz p0, :none
            check-cast p0, ${r.row}
            invoke-interface {p0}, ${r.row}->getCount()I
            move-result v0
            return v0
            :none
            const/4 v0, -0x1
            return v0
        """.trimIndent())
    }
}

/** pinRow(answer, index): the row's message id, text and time, the time boxed. p0 is v5 and p1 v6. */
internal fun pinnedRowBuilder(stub: MutableMethod, r: PinnedBarRecipe): MutableMethod {
    stub.validatePinnedBarStub(PINNED_BAR_ROW)
    return stub.emptyCopy(7).apply {
        addInstructions(0, """
            check-cast p0, ${r.result}
            iget-object p0, p0, ${r.rows}
            check-cast p0, ${r.row}
            invoke-interface {p0, p1}, ${r.row}->$messageIdGetterName(I)Ljava/lang/String;
            move-result-object v0
            invoke-interface {p0, p1}, ${r.row}->$messageTextGetterName(I)Ljava/lang/String;
            move-result-object v1
            invoke-interface {p0, p1}, ${r.row}->$messageTimestampGetterName(I)J
            move-result-wide v2
            invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
            move-result-object v2
            const/4 v3, 0x3
            new-array v3, v3, [Ljava/lang/Object;
            const/4 v4, 0x0
            aput-object v0, v3, v4
            const/4 v4, 0x1
            aput-object v1, v3, v4
            const/4 v4, 0x2
            aput-object v2, v3, v4
            return-object v3
        """.trimIndent())
    }
}

/** jumpToPin(chat, id): the fragment result See all sends the chat for a tapped pin. p0 is v4 and p1 v5. */
internal fun pinnedJumpBuilder(stub: MutableMethod, r: PinnedBarRecipe): MutableMethod {
    stub.validatePinnedBarStub(PINNED_BAR_JUMP)
    return stub.emptyCopy(6).apply {
        addInstructions(0, """
            check-cast p0, $ANDROIDX_FRAGMENT
            invoke-virtual {p0}, ${r.childManager}
            move-result-object v0
            new-instance v1, $BUNDLE
            invoke-direct {v1}, $BUNDLE-><init>()V
            const-string v2, "event_name"
            const-string v3, "$PINNED_JUMP_EVENT"
            invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
            const-string v2, "MESSAGE_ID"
            invoke-virtual {v1, v2, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
            const-string v2, "$PINNED_RESULT_KEY"
            invoke-virtual {v0, v2, v1}, ${r.setResult}
            return-void
        """.trimIndent())
    }
}

/** Each stub and its replacement, all built before the first edit, so a changed stub stops the patch with Messenger untouched. */
internal fun pinnedBarBuilders(recipe: PinnedBarRecipe, stub: (String) -> MutableMethod?): List<Pair<MutableMethod, MutableMethod>> {
    val builders = listOf(::pinnedLoadBuilder, ::pinnedCountBuilder, ::pinnedRowBuilder, ::pinnedJumpBuilder)
    return PINNED_BAR_STUBS.zip(builders).map { (id, build) ->
        val shipped = stub(id) ?: pinnedChanged("extension stub $id")
        shipped to build(shipped, recipe)
    }
}
