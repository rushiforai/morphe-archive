package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Show Remove contact (#253). Messenger dropped Remove contact from the menu you get by holding someone in People, the
 * contact list or search, but still has the removal itself: the code behind its old row fetches the contact and queues
 * delete_contact with it. Each of those menus is a socket class with a rows method and a tap method. The rows method
 * hands its finished list to the extension, which adds a Remove contact row for a person who isn't a friend, and the tap
 * method asks the extension first, which runs Messenger's own removal for that row and leaves every other row alone.
 */
internal const val REMOVE_CONTACT = "remove_contact"
internal const val REMOVE_CONTACT_HOST = "Lapp/hushmessenger/extension/RemoveContact;"
internal const val REMOVE_CONTACT_ROWS = "$REMOVE_CONTACT_HOST->contactRows(Ljava/lang/Object;Ljava/lang/Object;)V"
internal const val REMOVE_CONTACT_TAPPED = "$REMOVE_CONTACT_HOST->contactTapped(Ljava/lang/Object;I)Z"
internal const val REMOVE_CONTACT_START = "$REMOVE_CONTACT_HOST->startRemoval(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)[Ljava/lang/Object;"

/** What every contact menu socket says it builds and taps, and the two old rows only these menus carry. */
internal const val CONTACT_ROWS_NAME = "getContactMenuItem"
internal const val CONTACT_TAP_NAME = "onContactMenuItemSelected"
internal const val CONTACT_HIDE_ROW = "messaging.graph.contactinfomenu.hidecontactmenuitem.HideContactMenuItemImplementation"
internal const val CONTACT_BLOCK_ROW = "messaging.graph.contactinfomenu.blockcontactmenuitem.BlockContactMenuItemImplementation"
/** The removal's callback says this when the contact it fetched is gone, and only that callback says it. */
internal const val CONTACT_DELETE_MISSING = "Unable to fetch contact for deletion."
internal const val CONTACT_DELETE_PARAMS = "Lcom/facebook/contacts/server/DeleteContactParams;"

private const val CONTACT_LIST = "Ljava/util/ArrayList;"
private const val CONTACT_USER = "Lcom/facebook/user/model/User;"
private const val CONTACT_CONTEXT = "Landroid/content/Context;"
private const val CONTACT_STRING = "Ljava/lang/String;"
private const val CONTACT_USER_KEY = "Lcom/facebook/user/model/UserKey;"
private const val CONTACT_SETTABLE = "Lcom/google/common/util/concurrent/SettableFuture;"
internal const val CONTACT_FUTURE = "Lcom/google/common/util/concurrent/ListenableFuture;"
internal const val CONTACT_FUNCTION = "Lcom/google/common/base/Function;"
private const val CONTACT_CALLER = "Lcom/facebook/common/callercontext/CallerContext;"
private const val CONTACT_SET = "Lcom/google/common/collect/ImmutableSet;"
internal const val CONTACT_SINGLE_SET = "Lcom/google/common/collect/SingletonImmutableSet;"
private const val CONTACT_EXECUTOR = "Ljava/util/concurrent/Executor;"
private const val CONTACT_EXECUTOR_SERVICE = "Ljava/util/concurrent/ExecutorService;"
private const val CONTACT_OBJECT = "Ljava/lang/Object;"
/** The removal callback's constructor: which case it runs, then four values it keeps. */
internal const val CONTACT_CALLBACK_INIT = "(I$CONTACT_OBJECT$CONTACT_OBJECT$CONTACT_OBJECT$CONTACT_OBJECT)V"

/** What each of the callback's four kept values is, in the order its constructor takes them. */
internal enum class RemovalSlot { CONTEXT, HELPER, SESSION, SETTABLE }

/** Everything this build calls the pieces of its removal. References are smali, ready to use. */
internal class RemoveContactRecipe(
    val sites: List<Method>,
    val builder: Method,
    val helper: String,
    val settable: String,
    val userKey: String,
    val fetcher: String,
    val mode: String,
    val caller: String,
    val fetch: String,
    val flag: Int,
    val function: String,
    val transform: String,
    val callback: String,
    val case: Int,
    val slots: List<RemovalSlot>,
    val executor: String,
    val registrar: String,
)

internal var removeContactRecipe: RemoveContactRecipe? = null

private fun Instruction.contactRef() = (this as? ReferenceInstruction)?.reference
private fun Instruction.contactField() = contactRef() as? FieldReference
private fun Instruction.contactCall() = contactRef() as? MethodReference
private fun Instruction.contactType() = (contactRef() as? TypeReference)?.type
private fun Instruction.contactString() = (contactRef() as? StringReference)?.string
private fun Method.contactCode() = implementation?.instructions?.toList().orEmpty()
private fun MethodReference.contactParams() = parameterTypes.map { it.toString() }
private fun Method.contactParamList() = parameterTypes.map { it.toString() }
private fun Instruction.contactArgs(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}
private fun Instruction.contactWrites(register: Int): Boolean {
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    return opcode.setsRegister() && (written == register || (opcode.setsWideRegister() && written + 1 == register))
}
private fun Instruction.contactLiteral(): Int? =
    if (opcode == Opcode.CONST_4 || opcode == Opcode.CONST_16 || opcode == Opcode.CONST) (this as NarrowLiteralInstruction).narrowLiteral else null
private fun List<Instruction>.contactAddresses(): IntArray {
    val addresses = IntArray(size + 1)
    for (i in indices) addresses[i + 1] = addresses[i] + this[i].codeUnits
    return addresses
}
private val CONTACT_SWITCHES = setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH)
private val CONTACT_EXITS = setOf(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_OBJECT, Opcode.RETURN_WIDE, Opcode.THROW,
    Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32, Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH)

/** A rows method: an instance ()ArrayList that says it builds contact menu rows and builds Hide contact or Block. */
private fun Method.isContactRows(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != CONTACT_LIST || parameterTypes.isNotEmpty()) return false
    val strings = contactCode().mapNotNull { it.contactString() }
    return CONTACT_ROWS_NAME in strings && (CONTACT_HIDE_ROW in strings || CONTACT_BLOCK_ROW in strings)
}

/** A tap method: an instance (I)V that says it handles a contact menu row's tap. */
private fun Method.isContactTap(): Boolean =
    !AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" && contactParamList() == listOf("I") &&
        contactCode().any { it.contactString() == CONTACT_TAP_NAME }

/** The rows method's one return and the list it returns, read by the hook from p0 and that register. */
private class ContactRowsSite(val at: Int, val list: Int, val self: Int)

/**
 * The one return-object of a rows method. Nothing jumps onto it and no try block covers it, so a call put in front of
 * it runs on every way out and a throw there can't land in Messenger's own handler. Nothing in the method writes p0,
 * and both registers fit the four-bit call.
 */
private fun Method.contactRowsSite(): ContactRowsSite? {
    if (!isContactRows()) return null
    val implementation = implementation ?: return null
    val code = contactCode()
    val at = code.indices.singleOrNull { code[it].opcode == Opcode.RETURN_OBJECT } ?: return null
    val list = (code[at] as OneRegisterInstruction).registerA
    val self = implementation.registerCount - 1
    if (self > 15 || list > 15 || list == self || code.any { it.contactWrites(self) }) return null
    if (at in jumpTargets()) return null
    val address = code.contactAddresses()[at]
    if (implementation.tryBlocks.any { address >= it.startCodeAddress && address < it.startCodeAddress + it.codeUnitCount }) return null
    return ContactRowsSite(at, list, self)
}

/**
 * The tap method's first parameter register. It has a local for the answer, nothing jumps onto its first instruction,
 * and no switch in it dispatches on an int field of its own class, the tell of a Redex-merged method. The early return
 * only happens for the extension's own row, whose id none of Messenger's rows use.
 */
private fun Method.contactTapFirst(): Int? {
    if (!isContactTap()) return null
    val implementation = implementation ?: return null
    val first = implementation.registerCount - 2
    if (first < 1) return null
    if (0 in jumpTargets()) return null
    val code = contactCode()
    val merged = code.indices.any { i ->
        code[i].opcode in CONTACT_SWITCHES && code.subList(0, i).any {
            it.opcode == Opcode.IGET && it.contactField()?.definingClass == definingClass &&
                it.contactWrites((code[i] as OneRegisterInstruction).registerA)
        }
    }
    return first.takeIf { !merged }
}

/** A socket class: one interface, one rows method and one tap method, and one User, Context and account each. */
private fun ClassDef.contactSocket(): List<Method>? {
    if (interfaces.size != 1) return null
    val rows = methods.filter { it.isContactRows() }.singleOrNull() ?: return null
    val tap = methods.filter { it.isContactTap() }.singleOrNull() ?: return null
    val instance = fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
    if (listOf(CONTACT_USER, CONTACT_CONTEXT, FB_USER_SESSION).any { type -> instance.count { it.type == type } != 1 }) return null
    if (rows.contactRowsSite() == null || tap.contactTapFirst() == null) return null
    return listOf(rows, tap)
}

internal val contactMenuRows = methodCheck { _, m -> m.isContactRows() }

internal val contactDeleteCallbacks = MethodCheck(loadsString(CONTACT_DELETE_MISSING))

/** The instruction before [at] that last wrote [register], in a method with no branches. */
private fun List<Instruction>.contactWriter(at: Int, register: Int): Int? = (at - 1 downTo 0).firstOrNull { this[it].contactWrites(register) }

/**
 * The case's code in the callback's onSuccess: the switch on the callback's own case field sends [case] to its own
 * block, or past the switch when the case has no entry. That block must make DeleteContactParams before anything leaves it.
 */
private fun Method.deletesContactIn(case: Int): Boolean {
    val code = contactCode()
    val addresses = code.contactAddresses()
    val indexAt = code.indices.associateBy { addresses[it] }
    val switch = code.indices.firstOrNull { code[it].opcode in CONTACT_SWITCHES } ?: return false
    val caseRead = code.contactWriter(switch, (code[switch] as OneRegisterInstruction).registerA)?.let(code::get) ?: return false
    if (caseRead.opcode != Opcode.IGET || caseRead.contactField()?.definingClass != definingClass) return false
    val payload = indexAt[addresses[switch] + (code[switch] as OffsetInstruction).codeOffset]?.let(code::get) as? SwitchPayload ?: return false
    val entry = payload.switchElements.firstOrNull { it.key == case }
    val start = if (entry != null) indexAt[addresses[switch] + entry.offset] ?: return false else switch + 1
    for (i in start until code.size) {
        if (code[i].opcode == Opcode.NEW_INSTANCE && code[i].contactType() == CONTACT_DELETE_PARAMS) return true
        if (code[i].opcode in CONTACT_EXITS) return false
    }
    return false
}

/**
 * This build's recipe, or null when any piece of it doesn't read as expected. The pieces come from the one method that
 * starts Messenger's removal: it makes the helper that holds the contact fetcher, fetches the contact by the user's id,
 * and hands the fetch to the callback with its delete case, the screen, the helper, the account and the future the
 * delete finishes. Every class and member the stub names must be public, since it reaches them from the extension.
 */
internal fun resolveRemoveContact(classes: Iterable<ClassDef>): RemoveContactRecipe? {
    val byType = classes.associateBy { it.type }
    fun isPublic(flags: Int) = AccessFlags.PUBLIC.isSet(flags)
    fun openClass(type: String) = byType[type]?.let { isPublic(it.accessFlags) } == true
    fun openField(field: FieldReference, static: Boolean) = byType[field.definingClass]?.takeIf { isPublic(it.accessFlags) }?.fields
        ?.any { it.name == field.name && it.type == field.type && isPublic(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static } == true
    fun openMethod(call: MethodReference) = byType[call.definingClass]?.takeIf { isPublic(it.accessFlags) }?.methods
        ?.any { it.name == call.name && it.returnType == call.returnType && it.contactParamList() == call.contactParams() && isPublic(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) } == true
    fun openConstructor(type: String, vararg params: String) = byType[type]?.takeIf { isPublic(it.accessFlags) }?.methods
        ?.any { it.name == "<init>" && it.contactParamList() == params.toList() && isPublic(it.accessFlags) } == true

    // The sockets, by their rows methods. Each class counts once, and every one of them has to read as a socket.
    val socketClasses = contactMenuRows.sites(classes).map { it.first }.distinctBy { it.type }
    if (socketClasses.isEmpty()) return null
    val sites = socketClasses.flatMap { it.contactSocket() ?: return null }

    val callback = contactDeleteCallbacks.methods(classes).filter { it.name == "onSuccess" && it.contactParamList() == listOf(CONTACT_OBJECT) }
        .singleOrNull() ?: return null
    val callbackType = callback.definingClass
    val callbackInit = "$callbackType-><init>$CONTACT_CALLBACK_INIT"
    if (!openConstructor(callbackType, "I", CONTACT_OBJECT, CONTACT_OBJECT, CONTACT_OBJECT, CONTACT_OBJECT)) return null

    val starts = codeReferrers(classes, methods = listOf(callbackInit)).mapNotNull { (_, method) ->
        method.removalStart(callbackType, callbackInit)?.takeIf { callback.deletesContactIn(it.case) }
    }
    val found = starts.singleOrNull() ?: return null

    // Everything the stub names, reachable from the extension.
    val code = found.builder.contactCode()
    fun call(id: String) = code.firstNotNullOf { i -> i.contactCall()?.takeIf { it.toString() == id } }
    fun field(id: String) = code.firstNotNullOf { i -> i.contactField()?.takeIf { it.toString() == id } }
    if (!openConstructor(found.helper) || !openConstructor(found.transform, CONTACT_FUNCTION, CONTACT_FUTURE) ||
        !openConstructor(CONTACT_SINGLE_SET, CONTACT_OBJECT)) return null
    if (listOf(found.settable, found.userKey, found.fetch, found.registrar).any { !openMethod(call(it)) }) return null
    if (!openField(field(found.fetcher), static = false) || !openField(field(found.executor), static = false)) return null
    if (listOf(found.mode, found.caller, found.function).any { !openField(field(it), static = true) }) return null
    return RemoveContactRecipe(sites, found.builder, found.helper, found.settable, found.userKey, found.fetcher, found.mode, found.caller,
        found.fetch, found.flag, found.function, found.transform, callbackType, found.case, found.slots, found.executor, found.registrar)
}

/** A removal start read from one method, before the callback's case and the access checks. */
private class RemovalStart(val builder: Method, val helper: String, val settable: String, val userKey: String, val fetcher: String,
    val mode: String, val caller: String, val fetch: String, val flag: Int, val function: String, val transform: String,
    val case: Int, val slots: List<RemovalSlot>, val executor: String, val registrar: String)

/**
 * The removal's start in this method, read by which instruction last wrote each register the calls take. The method has
 * no branches or try blocks, so the last write before a call is what the call gets.
 */
private fun Method.removalStart(callbackType: String, callbackInit: String): RemovalStart? {
    val implementation = implementation ?: return null
    val code = contactCode()
    if (implementation.tryBlocks.isNotEmpty() || code.any { it is OffsetInstruction }) return null
    fun writer(at: Int, register: Int) = code.contactWriter(at, register)

    // The callback: made, then given its case and four kept values in one range call.
    val made = code.indices.singleOrNull { code[it].opcode == Opcode.INVOKE_DIRECT_RANGE && code[it].contactCall()?.toString() == callbackInit } ?: return null
    val args = code[made].contactArgs()
    if (args.size != 6) return null
    val callbackMade = writer(made, args[0]) ?: return null
    if (code[callbackMade].opcode != Opcode.NEW_INSTANCE || code[callbackMade].contactType() != callbackType) return null
    val case = writer(made, args[1])?.let { code[it].contactLiteral() } ?: return null

    var helper: String? = null
    var helperWrite = -1
    var settable: String? = null
    val slots = args.drop(2).map { register ->
        val at = writer(made, register) ?: return null
        val wrote = code[at]
        when {
            wrote.opcode == Opcode.IGET_OBJECT && wrote.contactField()?.type == CONTACT_CONTEXT -> RemovalSlot.CONTEXT
            wrote.opcode == Opcode.IGET_OBJECT && wrote.contactField()?.type == FB_USER_SESSION -> RemovalSlot.SESSION
            wrote.opcode == Opcode.CHECK_CAST -> { helper = wrote.contactType(); helperWrite = at; RemovalSlot.HELPER }
            wrote.opcode == Opcode.MOVE_RESULT_OBJECT && at > 0 && code[at - 1].opcode == Opcode.INVOKE_STATIC &&
                code[at - 1].contactCall()?.let { it.returnType == CONTACT_SETTABLE && it.parameterTypes.isEmpty() } == true -> {
                settable = code[at - 1].contactCall().toString()
                RemovalSlot.SETTABLE
            }
            else -> return null
        }
    }
    if (slots.toSet().size != 4) return null
    val helperType = helper ?: return null
    val settableCall = settable ?: return null
    fun readsHelper(at: Int) = (code[at] as? TwoRegisterInstruction)?.let { writer(at, it.registerB) == helperWrite } == true

    // The user key from the id, in a one-element set.
    val keyCall = code.indices.singleOrNull {
        code[it].opcode == Opcode.INVOKE_STATIC && code[it].contactCall()?.let { c -> c.returnType == CONTACT_USER_KEY && c.contactParams() == listOf(CONTACT_STRING) } == true
    } ?: return null
    if (code.getOrNull(keyCall + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val setMade = code.indices.singleOrNull { code[it].opcode == Opcode.INVOKE_DIRECT && code[it].contactCall()?.toString() == "$CONTACT_SINGLE_SET-><init>($CONTACT_OBJECT)V" } ?: return null
    val setArgs = code[setMade].contactArgs()
    if (setArgs.size != 2 || writer(setMade, setArgs[1]) != keyCall + 1) return null

    // The fetch: (caller, fetcher, mode, set, flag). Its answer becomes the contact through a function.
    val fetchAt = code.indices.singleOrNull {
        code[it].opcode == Opcode.INVOKE_STATIC && code[it].contactCall()?.contactParams()?.let { p ->
            p.size == 5 && p[0] == CONTACT_CALLER && p[3] == CONTACT_SET && p[4] == "Z"
        } == true
    } ?: return null
    val fetch = code[fetchAt].contactCall()!!
    val fetchArgs = code[fetchAt].contactArgs()
    val callerRead = writer(fetchAt, fetchArgs[0])?.let(code::get) ?: return null
    val fetcherAt = writer(fetchAt, fetchArgs[1]) ?: return null
    val modeRead = writer(fetchAt, fetchArgs[2])?.let(code::get) ?: return null
    val flag = writer(fetchAt, fetchArgs[4])?.let { code[it].contactLiteral() } ?: return null
    val fetcherRead = code[fetcherAt]
    if (callerRead.opcode != Opcode.SGET_OBJECT || callerRead.contactField()?.type != CONTACT_CALLER) return null
    if (fetcherRead.opcode != Opcode.IGET_OBJECT || fetcherRead.contactField()?.definingClass != helperType ||
        fetcherRead.contactField()?.type != fetch.contactParams()[1] || !readsHelper(fetcherAt)) return null
    if (modeRead.opcode != Opcode.SGET_OBJECT || modeRead.contactField()?.type != fetch.contactParams()[2]) return null
    if (writer(fetchAt, fetchArgs[3]) != writer(setMade, setArgs[0]) || code[writer(setMade, setArgs[0]) ?: return null].contactType() != CONTACT_SINGLE_SET) return null
    if (code.getOrNull(fetchAt + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) return null

    val transformAt = code.indices.singleOrNull {
        code[it].opcode == Opcode.INVOKE_DIRECT && code[it].contactCall()?.let { c -> c.name == "<init>" && c.contactParams() == listOf(CONTACT_FUNCTION, CONTACT_FUTURE) } == true
    } ?: return null
    val transformArgs = code[transformAt].contactArgs()
    val transform = code[transformAt].contactCall()!!.definingClass
    val transformMade = writer(transformAt, transformArgs[0]) ?: return null
    val functionRead = writer(transformAt, transformArgs[1])?.let(code::get) ?: return null
    if (writer(transformAt, transformArgs[2]) != fetchAt + 1 || code[transformMade].opcode != Opcode.NEW_INSTANCE ||
        code[transformMade].contactType() != transform || functionRead.opcode != Opcode.SGET_OBJECT) return null

    // The callback goes on the turned fetch, run by the helper's executor.
    val registerAt = code.indices.singleOrNull {
        code[it].opcode == Opcode.INVOKE_STATIC && code[it].contactArgs().size == 3 &&
            code[it].contactCall()?.let { c -> c.returnType == "V" && c.contactParams().drop(1) == listOf(CONTACT_FUTURE, CONTACT_EXECUTOR) } == true
    } ?: return null
    val registerArgs = code[registerAt].contactArgs()
    if (registerAt < made || writer(registerAt, registerArgs[0]) != callbackMade || writer(registerAt, registerArgs[1]) != transformMade) return null
    val executorAt = writer(registerAt, registerArgs[2]) ?: return null
    val executorRead = code[executorAt]
    if (executorRead.opcode != Opcode.IGET_OBJECT || executorRead.contactField()?.definingClass != helperType ||
        executorRead.contactField()?.type !in setOf(CONTACT_EXECUTOR, CONTACT_EXECUTOR_SERVICE) || !readsHelper(executorAt)) return null

    return RemovalStart(this, helperType, settableCall, code[keyCall].contactCall().toString(), fetcherRead.contactField().toString(),
        modeRead.contactField().toString(), callerRead.contactField().toString(), fetch.toString(), flag, functionRead.contactField().toString(),
        transform, case, slots, executorRead.contactField().toString(), code[registerAt].contactCall().toString())
}

/** Each socket's rows and tap methods, or none when any piece of the removal doesn't resolve. */
internal fun findRemoveContact(classes: Iterable<ClassDef>): List<Method> {
    removeContactRecipe = resolveRemoveContact(classes)
    return removeContactRecipe?.sites ?: emptyList()
}

/** Whether an earlier pass already hands this method's rows or taps to the extension. */
private fun Method.hasRemoveContactHook() =
    contactCode().any { it.contactCall()?.toString().let { call -> call == REMOVE_CONTACT_ROWS || call == REMOVE_CONTACT_TAPPED } }

internal fun MutableMethod.validateRemoveContact() {
    if (!hasRemoveContactHook() && contactRowsSite() == null && contactTapFirst() == null)
        throw PatchException("Messenger controls: ${hookId()} isn't a contact menu's rows or tap method")
}

/** Hands each contact menu's finished rows to the extension, and asks it first about each tap. A second pass changes nothing. */
internal fun MutableMethod.injectRemoveContact() {
    validateRemoveContact()
    if (hasRemoveContactHook()) return
    val rows = contactRowsSite()
    if (rows != null) {
        addInstructions(rows.at, "invoke-static {v${rows.self}, v${rows.list}}, $REMOVE_CONTACT_ROWS")
        return
    }
    val first = contactTapFirst()!!
    addInstructionsWithLabels(0, """
        invoke-static/range {v$first .. v${first + 1}}, $REMOVE_CONTACT_TAPPED
        move-result v0
        if-eqz v0, :stock_tap
        return-void
    """.trimIndent(), ExternalLabel("stock_tap", getInstruction(0)))
}

/** The extension's stub as shipped: static, not private, returning null. */
internal fun MutableMethod.validateRemoveContactStub() {
    val code = contactCode()
    if (hookId() != REMOVE_CONTACT_START || !AccessFlags.STATIC.isSet(accessFlags) || AccessFlags.PRIVATE.isSet(accessFlags) || code.size != 2 ||
        code[0].opcode != Opcode.CONST_4 || code[1].opcode != Opcode.RETURN_OBJECT || (code[0] as? NarrowLiteralInstruction)?.narrowLiteral != 0 ||
        implementation!!.tryBlocks.isNotEmpty())
        throw PatchException("Messenger controls: the Remove contact row's extension stub changed")
}

/**
 * The stub's replacement: Messenger's own removal start with the screen, account and user id it's given. It answers
 * the future the delete finishes and the fetch of the contact, since a failed fetch never finishes the other one.
 */
internal fun removeContactBuilder(stub: MutableMethod, recipe: RemoveContactRecipe): MutableMethod {
    stub.validateRemoveContactStub()
    val moves = recipe.slots.mapIndexed { i, slot ->
        val from = when (slot) {
            RemovalSlot.CONTEXT -> "p0"
            RemovalSlot.HELPER -> "v0"
            RemovalSlot.SESSION -> "p1"
            RemovalSlot.SETTABLE -> "v1"
        }
        "move-object v${8 + i}, $from"
    }
    // Twelve locals and three parameters: p0 is v12, p1 v13 and p2 v14, all within the four-bit forms used here.
    val body = listOf(
        "new-instance v0, ${recipe.helper}",
        "invoke-direct {v0}, ${recipe.helper}-><init>()V",
        "invoke-static {}, ${recipe.settable}",
        "move-result-object v1",
        "check-cast p2, $CONTACT_STRING",
        "invoke-static {p2}, ${recipe.userKey}",
        "move-result-object v2",
        "iget-object v3, v0, ${recipe.fetcher}",
        "sget-object v4, ${recipe.mode}",
        "sget-object v5, ${recipe.caller}",
        "new-instance v6, $CONTACT_SINGLE_SET",
        "invoke-direct {v6, v2}, $CONTACT_SINGLE_SET-><init>($CONTACT_OBJECT)V",
        "const/16 v7, ${recipe.flag}",
        "invoke-static {v5, v3, v4, v6, v7}, ${recipe.fetch}",
        "move-result-object v3",
        "sget-object v4, ${recipe.function}",
        "new-instance v5, ${recipe.transform}",
        "invoke-direct {v5, v4, v3}, ${recipe.transform}-><init>($CONTACT_FUNCTION$CONTACT_FUTURE)V",
        "check-cast p0, $CONTACT_CONTEXT",
        "check-cast p1, $FB_USER_SESSION",
        "new-instance v6, ${recipe.callback}",
        "const/16 v7, ${recipe.case}",
    ) + moves + listOf(
        "invoke-direct/range {v6 .. v11}, ${recipe.callback}-><init>$CONTACT_CALLBACK_INIT",
        "iget-object v2, v0, ${recipe.executor}",
        "invoke-static {v6, v5, v2}, ${recipe.registrar}",
        "const/4 v2, 0x2",
        "new-array v2, v2, [$CONTACT_OBJECT",
        "const/4 v3, 0x0",
        "aput-object v1, v2, v3",
        "const/4 v3, 0x1",
        "aput-object v5, v2, v3",
        "return-object v2",
    )
    val built = stub.emptyCopy(15)
    built.addInstructionsWithLabels(0, body.joinToString("\n"))
    return built
}
