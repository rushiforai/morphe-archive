package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
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
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val INBOX_REFRESH_HOOK = "people_inbox_refresh"
/** The chat list's item supplier keeps its name in every supported build. */
internal const val INBOX_SUPPLIER =
    "Lcom/facebook/messaging/msys/threadlist/plugins/core/itemsupplier/ThreadListItemSupplierImplementation;"
/** The supplier's items read starts by tracing under this name. */
internal const val INBOX_ITEMS_TRACE = "ThreadListItemSupplierImplementation.getInboxItems"
/** Only the supplier's static subscribe call warns with this, before it creates the list observer. */
internal const val INBOX_SUBSCRIBE_WARNING =
    "useSecondaryParentThreadKey set without a parentThreadKey; folder read falls back to the full Meta AI inbox"
internal const val INBOX_REFRESH = "Lapp/hushmessenger/extension/InboxRefresh;"
internal const val INBOX_ITEMS_CALL = "$INBOX_REFRESH->onInboxItems(Ljava/lang/Object;)V"
internal const val INBOX_REFRESH_ROUTE = "$HOST_SCREENS->inboxRefreshRoute()Ljava/lang/String;"
/** The list observer has a class of its own, built from the supplier and the subscription's generation number. */
private const val OBSERVER_INIT = "<init>(${INBOX_SUPPLIER}I)V"
/** 585's subscribe call takes the supplier and a flag; stock's retries pass true, and so does the extension. */
private val SUBSCRIBE_PARAMS = listOf(INBOX_SUPPLIER, "Z")

/** The supplier's static subscribe call and the int its list observer sets once rows arrive, as the extension reads them. */
internal data class InboxRefreshRoute(val subscribe: String, val listed: String) {
    override fun toString() = "$subscribe|$listed"
}

private fun routeChanged(): Nothing =
    throw PatchException("Messenger controls: the chat list refresh route no longer matches the tested build")

private fun extensionChanged(): Nothing =
    throw PatchException("Messenger controls: the extension's chat list refresh differs from this patch version")

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

/** The items read: an instance call with no arguments whose first instruction, never a branch target, names its trace. */
internal fun Method.validateInboxItems() {
    val code = implementation?.instructions?.toList() ?: routeChanged()
    val first = code.firstOrNull()
    if (definingClass != INBOX_SUPPLIER || AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.isNotEmpty() ||
        returnType != IMMUTABLE_LIST || (first?.opcode != Opcode.CONST_STRING && first?.opcode != Opcode.CONST_STRING_JUMBO) ||
        first?.string() != INBOX_ITEMS_TRACE || 0 in jumpTargets()) routeChanged()
}

/** Every items read reports its supplier first; the extension decides whether this one needs a second subscribe. */
internal fun MutableMethod.injectInboxItems() {
    validateInboxItems()
    addInstructions(0, "invoke-static/range {p0 .. p0}, $INBOX_ITEMS_CALL")
}

/**
 * Where a cold start's first subscribe call never delivers, the listed count the items read checks stays 0 and the list
 * keeps its load-more footer. Proves the supplier's one static subscribe call, the observer it creates, and the one int
 * that observer's list callback sets to 5 or 1 once rows arrive, which the items read checks.
 */
internal fun resolveInboxRefresh(items: Method, classOf: (String) -> ClassDef?): InboxRefreshRoute {
    items.validateInboxItems()
    val supplier = classOf(INBOX_SUPPLIER) ?: routeChanged()
    if (!AccessFlags.FINAL.isSet(supplier.accessFlags)) routeChanged()
    val subscribe = supplier.methods.filter { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && method.parameterTypes == SUBSCRIBE_PARAMS &&
            method.implementation?.instructions?.any { it.string() == INBOX_SUBSCRIBE_WARNING } == true
    }.singleOrNull() ?: routeChanged()
    val code = subscribe.implementation!!.instructions.toList()
    fun signature(i: Instruction) = ((i as? ReferenceInstruction)?.reference as? MethodReference)?.let {
        "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}"
    }
    val at = code.indices.filter { i -> code[i].opcode == Opcode.INVOKE_DIRECT && signature(code[i]) == OBSERVER_INIT }.singleOrNull()
        ?: routeChanged()
    val init = code[at] as FiveRegisterInstruction
    val created = code.getOrNull(at - 1)
    val observerType = ((created as? ReferenceInstruction)?.reference as? TypeReference)?.type
    if (created?.opcode != Opcode.NEW_INSTANCE || init.registerCount != 3 ||
        (created as OneRegisterInstruction).registerA != init.registerC ||
        observerType != ((code[at] as ReferenceInstruction).reference as MethodReference).definingClass) routeChanged()
    val observer = classOf(observerType!!) ?: routeChanged()
    val callback = observer.methods.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" && it.parameterTypes == listOf("Ljava/util/List;")
    }.singleOrNull() ?: routeChanged()
    val body = callback.implementation?.instructions?.toList() ?: routeChanged()
    val targets = callback.jumpTargets()
    val site = body.indices.filter { body.isListedWrite(it, targets) }.singleOrNull() ?: routeChanged()
    val field = (body[site] as ReferenceInstruction).reference as FieldReference
    val listed = "$INBOX_SUPPLIER->${field.name}:I"
    if (supplier.fields.singleOrNull { it.name == field.name && it.type == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) } == null ||
        items.implementation!!.instructions.none { it.opcode == Opcode.IGET && (it as ReferenceInstruction).reference.toString() == listed }) {
        routeChanged()
    }
    return InboxRefreshRoute(subscribe.hookId(), listed)
}

/**
 * The observer's listed-count update, `size < limit ? 5 : 1`, as 585 compiles it: `const/4 vR, 1` earlier in the same
 * straight run (it also feeds a flag write), then `if-ge ..., <the write>; const/4 vR, 5; iput vR, supplier->F:I`.
 * Between that `const/4 vR, 1` and the branch nothing writes vR and no jump lands, so vR is 1 whenever the branch is taken.
 */
private fun List<Instruction>.isListedWrite(at: Int, targets: Set<Int>): Boolean {
    val write = this[at]
    if (at < 3 || write.opcode != Opcode.IPUT) return false
    val field = (write as ReferenceInstruction).reference as? FieldReference ?: return false
    val value = (write as TwoRegisterInstruction).registerA
    fun constant(index: Int, literal: Int) = this[index].opcode == Opcode.CONST_4 &&
        (this[index] as OneRegisterInstruction).registerA == value && (this[index] as NarrowLiteralInstruction).narrowLiteral == literal
    if (field.definingClass != INBOX_SUPPLIER || field.type != "I" || this[at - 2].opcode != Opcode.IF_GE ||
        branchTarget(at - 2) != at || !constant(at - 1, 5)) return false
    for (i in at - 3 downTo 0) {
        if (i + 1 in targets) return false
        val sets = this[i].opcode
        val register = (this[i] as? OneRegisterInstruction)?.registerA ?: continue
        if (sets.setsRegister() && (register == value || (sets.setsWideRegister() && register + 1 == value))) return constant(i, 1)
    }
    return false
}

/** The extension stub the route is written into: `const-string vX, ""` then `return-object vX`. */
internal fun Method.validateInboxRefreshStub() = validateRouteStub(INBOX_REFRESH_ROUTE)

internal fun Method.validateRouteStub(id: String) {
    val code = implementation?.instructions?.toList().orEmpty()
    if (hookId() != id || !AccessFlags.STATIC.isSet(accessFlags) || code.size != 2 ||
        code[0].opcode != Opcode.CONST_STRING || code[0].string() != "" || code[1].opcode != Opcode.RETURN_OBJECT ||
        (code[0] as OneRegisterInstruction).registerA != (code[1] as OneRegisterInstruction).registerA) extensionChanged()
}

internal fun MutableMethod.writeInboxRefreshRoute(route: InboxRefreshRoute) {
    validateInboxRefreshStub()
    val register = (implementation!!.instructions.first() as OneRegisterInstruction).registerA
    replaceInstruction(0, "const-string v$register, \"$route\"")
}

/** Checks the extension's half before any edit and returns the stub the route goes into. */
internal fun BytecodePatchContext.inboxRefreshStub(): MutableMethod {
    val call = classDefByOrNull(INBOX_REFRESH)?.methods?.singleOrNull { it.hookId() == INBOX_ITEMS_CALL }
    if (call == null || !AccessFlags.STATIC.isSet(call.accessFlags) || !AccessFlags.PUBLIC.isSet(call.accessFlags)) extensionChanged()
    val stub = mutableClassDefBy(HOST_SCREENS).methods.singleOrNull { it.hookId() == INBOX_REFRESH_ROUTE } ?: extensionChanged()
    stub.validateInboxRefreshStub()
    return stub
}
