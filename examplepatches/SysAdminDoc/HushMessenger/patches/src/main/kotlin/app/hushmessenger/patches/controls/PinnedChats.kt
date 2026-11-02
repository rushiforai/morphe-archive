package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/** How many chats Messenger lets you pin above the chat list. */
internal const val PINNED_CHATS = "pinned_chats"
/** Facebook's servers refuse a pin past the account's cap whatever the app sends, so those pins stay on the phone. */
internal const val PIN_ROWS = "pin_rows"
internal const val PIN_ASK = "pin_ask"
internal const val PIN_DROP = "pin_drop"
internal const val PIN_FULL = "pin_full"
internal const val PIN_LIST = "pin_list"

internal const val PIN_MENU_ITEM = "Lcom/facebook/messaging/threadlist/threaditemmenu/plugins/core/pinmenuitem/PinMenuItemImplementation;"
internal const val UNPIN_MENU_ITEM = "Lcom/facebook/messaging/threadlist/threaditemmenu/plugins/core/unpinmenuitem/UnpinMenuItemImplementation;"
internal const val LOCAL_PINS = "Lapp/hushmessenger/extension/LocalPins;"
internal const val PIN_ROW_CALL = "$LOCAL_PINS->pinRow(ZLjava/lang/Object;)Z"
internal const val UNPIN_ROW_CALL = "$LOCAL_PINS->unpinRow(ZLjava/lang/Object;)Z"
internal const val PINNING_CALL = "$LOCAL_PINS->pinning(Ljava/lang/Object;)Z"
internal const val UNPINNING_CALL = "$LOCAL_PINS->unpinning(Ljava/lang/Object;)Z"
internal const val PIN_FULL_CALL = "$LOCAL_PINS->pinFull(Ljava/lang/Object;)Z"
internal const val PIN_ARRANGE_CALL = "$LOCAL_PINS->arrange(Ljava/lang/Object;)V"
internal const val PINNED_CHAT_ROUTE = "$HOST_SCREENS->pinnedChatRoute()Ljava/lang/String;"

/**
 * The config number Messenger reads its pinned chat limit from. 585 dropped the getter 584 had and reads it in place
 * wherever the pinned count is compared with it: the Pin row's check before a pin, the recount after one, the chat
 * list's fetch of pinned chats and the thread details' Pin state.
 */
internal const val PINNED_CHAT_LIMIT_CONFIG = 0x8205ad0002101eL

internal const val PINNED_CHAT_LIMIT_GATE = "$SETTINGS->pinnedChatLimit(I)I"

private fun pinLimitChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the pinned chat limit changed ($detail)")

private fun Method.limitLoads(): List<Int> = implementation?.instructions?.withIndex()
    ?.filter { (_, i) -> i.opcode == Opcode.CONST_WIDE && (i as WideLiteralInstruction).wideLiteral == PINNED_CHAT_LIMIT_CONFIG }
    ?.map { it.index }.orEmpty()

/**
 * Index of the `move-result` that takes the limit, or null when this method doesn't read it that way. The read loads
 * the limit's config id once and hands that register pair straight to a static (Object, J)I config read, whose answer
 * the next instruction takes.
 */
internal fun Method.pinnedChatLimitRead(): Int? {
    val loads = limitLoads()
    if (loads.size != 1) return null
    val code = implementation!!.instructions.toList()
    val at = loads.single()
    val id = (code[at] as OneRegisterInstruction).registerA
    val read = code.getOrNull(at + 1) as? FiveRegisterInstruction ?: return null
    val target = (read as ReferenceInstruction).reference as? MethodReference ?: return null
    if (read.opcode != Opcode.INVOKE_STATIC || target.returnType != "I" ||
        target.parameterTypes.map { it.toString() } != listOf("Ljava/lang/Object;", "J")) return null
    if (read.registerCount != 3 || read.registerD != id || read.registerE != id + 1) return null
    return if (code.getOrNull(at + 2)?.opcode == Opcode.MOVE_RESULT) at + 2 else null
}

/** Every method that reads the limit, when each one reads it that way, or none. */
private fun pinLimitReaders(classes: Iterable<ClassDef>): List<Method> {
    val readers = classes.flatMap { it.methods }.filter { it.limitLoads().isNotEmpty() }
    return if (readers.isNotEmpty() && readers.all { it.pinnedChatLimitRead() != null }) readers else emptyList()
}

private fun Method.takesThreadKey() = parameterTypes.any { it.toString() == THREAD_KEY_TYPE }

/**
 * Every hook of the Pin more chats control but the chat list read, which the inbox supplier's search finds. The limit
 * reads get the higher number, except the one that decides a new pin, which takes the chat's ThreadKey and keeps
 * Messenger's own limit: past it the server would refuse the pin, so that's where [PIN_FULL] keeps it on the phone instead.
 */
internal fun findPinnedChats(classes: Iterable<ClassDef>): Map<String, List<Method>> {
    val readers = pinLimitReaders(classes)
    val ask = readers.filter { it.takesThreadKey() }.singleOrNull()
    fun classOf(type: String?) = type?.let { wanted -> classes.firstOrNull { it.type == wanted } }
    val owner = ask?.definingClass
    val result = ask?.implementation?.instructions?.firstOrNull { it.opcode == Opcode.NEW_INSTANCE }
        ?.let { ((it as ReferenceInstruction).reference as TypeReference).type }
    val rows = listOf(PIN_MENU_ITEM, UNPIN_MENU_ITEM).map { row -> classOf(row)?.methods?.filter { it.isPinRow() }?.singleOrNull() }
    return mapOf(
        PINNED_CHATS to readers.filterNot { it.takesThreadKey() },
        PIN_ASK to listOfNotNull(ask),
        PIN_DROP to listOfNotNull(classOf(owner)?.methods?.filter { it.isPinDrop() }?.singleOrNull()),
        PIN_FULL to listOfNotNull(classOf(result)?.methods?.filter { method -> method.pinFullSite()?.let { it.owner == owner } == true }?.singleOrNull()),
        PIN_ROWS to if (null in rows) emptyList() else rows.filterNotNull(),
    )
}

internal fun MutableMethod.validatePinnedChatLimit(): Int =
    pinnedChatLimitRead() ?: pinLimitChanged("unexpected method ${hookId()}")

/**
 * Each read hands Messenger's own limit to the extension right after taking it, and keeps what comes back. With the
 * switch on that's a higher number, so every check that asks sees the same one. Off, Pause and safe mode give the
 * number back unchanged.
 */
internal fun MutableMethod.injectPinnedChatLimit() {
    val taken = validatePinnedChatLimit()
    val register = (implementation!!.instructions.elementAt(taken) as OneRegisterInstruction).registerA
    addInstructions(taken + 1, """
        invoke-static/range {v$register .. v$register}, $PINNED_CHAT_LIMIT_GATE
        move-result v$register
    """.trimIndent())
}

private fun pinRouteChanged(): Nothing =
    throw PatchException("Messenger controls: the pinned chat route no longer matches the tested build")

private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

private fun CharSequence.words() = if (toString() == "J" || toString() == "D") 2 else 1

private fun Method.isPinRow(): Boolean {
    val types = parameterTypes.map { it.toString() }
    return isStatic() && returnType == "Z" && types.size == 3 && types[0] == FB_USER_SESSION && types[1] == THREAD_SUMMARY && types[2].words() == 1
}

/** The chat key field and both pinned flags a menu row's check reads first: it answers no when either flag is set. */
private class PinFields(val key: String, val flag: String, val otherFlag: String)

private fun Method.pinFields(): PinFields? {
    val fields = implementation?.instructions?.toList().orEmpty().mapNotNull { i ->
        ((i as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { it.definingClass == THREAD_SUMMARY }?.let { i.opcode to it }
    }
    val key = fields.firstOrNull { (opcode, field) -> opcode == Opcode.IGET_OBJECT && field.type == THREAD_KEY_TYPE }?.second ?: return null
    val flags = fields.filter { (opcode, _) -> opcode == Opcode.IGET_BOOLEAN }.map { it.second.toString() }.distinct()
    return if (flags.size < 2) null else PinFields(key.toString(), flags[1], flags[0])
}

/**
 * The summary's register in a menu row's check, or null when the check can't be hooked: the swap at each return names the
 * answer and the summary in a plain call, so both need low registers, and the summary has to still be there at the end.
 */
internal fun Method.pinRowSummary(): Int? {
    val impl = implementation ?: return null
    if (!isPinRow() || pinFields() == null) return null
    val summary = impl.registerCount - 2
    val code = impl.instructions.toList()
    val returns = code.filter { it.opcode == Opcode.RETURN }
    if (summary !in 0..15 || returns.isEmpty() || returns.any { (it as OneRegisterInstruction).registerA > 15 }) return null
    return summary.takeIf { code.none { it.writesRegister(summary) } }
}

private fun Instruction.writesRegister(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    return written == register || (opcode.setsWideRegister() && written + 1 == register)
}

/** Every answer the Pin and Unpin rows' checks give goes through the extension, one replaced return at a time. */
internal fun MutableMethod.injectPinRow() {
    val summary = pinRowSummary() ?: pinRouteChanged()
    val call = if (definingClass == PIN_MENU_ITEM) PIN_ROW_CALL else UNPIN_ROW_CALL
    val code = implementation!!.instructions.toList()
    for (at in code.indices.reversed()) {
        if (code[at].opcode != Opcode.RETURN) continue
        val answer = (code[at] as OneRegisterInstruction).registerA
        // A branch into this return keeps landing on its first replacement instruction.
        replaceInstruction(at, "invoke-static {v$answer, v$summary}, $call")
        addInstructions(at + 1, "move-result v$answer\nreturn v$answer")
    }
}

/** The pin or unpin call's ThreadKey register, when it can ask first with a scratch local and nothing jumps to its start. */
internal fun Method.pinStepKey(): Int? {
    val impl = implementation ?: return null
    val words = parameterTypes.sumOf { it.words() }
    if (!isStatic() || returnType != "V" || impl.registerCount <= words || 0 in jumpTargets()) return null
    val index = parameterTypes.indexOfFirst { it.toString() == THREAD_KEY_TYPE }
    if (index < 0) return null
    return impl.registerCount - words + parameterTypes.take(index).sumOf { it.words() }
}

internal fun Method.isPinAsk() = pinStepKey() != null && pinnedChatLimitRead() != null

/** The controller's unpin: its static call taking the chat, the controller itself, a location, an optional id and a flag. */
internal fun Method.isPinDrop(): Boolean {
    val types = parameterTypes.map { it.toString() }
    return isStatic() && returnType == "V" && types.size == 5 && types[0] == THREAD_KEY_TYPE && types[1] == definingClass &&
        types[3] == "Ljava/lang/Long;" && types[4] == "Z"
}

internal fun MutableMethod.injectPinStep(call: String) {
    val key = pinStepKey() ?: pinRouteChanged()
    addInstructionsWithLabels(0, """
        invoke-static/range {v$key .. v$key}, $call
        move-result v0
        if-eqz v0, :stock
        return-void
    """.trimIndent(), ExternalLabel("stock", getInstruction(0)))
}

/**
 * Where the pin count's answer comes back, in the lambda the controller's pin builds. The first instruction past the
 * branch runs only at the limit and overwrites its own register, which makes that register free. [done] is where the
 * branch after the "can't pin" dialog goes, the lambda's own way out.
 */
internal class PinFullSite(val at: Int, val self: Int, val free: Int, val key: FieldReference, val done: Int, val owner: String)

internal fun Method.pinFullSite(): PinFullSite? {
    if (isStatic() || name != "invoke" || returnType != "Ljava/lang/Object;" || parameterTypes.map { it.toString() } != listOf("Ljava/lang/Object;")) return null
    val code = implementation?.instructions?.toList() ?: return null
    return code.indices.mapNotNull { code.pinFullSiteAt(it) }.singleOrNull()
}

private val PIN_DIALOG_PARAMS = listOf("Landroid/app/Activity;", "Landroid/content/Context;", "Landroid/content/DialogInterface\$OnClickListener;")

private fun List<Instruction>.pinFullSiteAt(at: Int): PinFullSite? {
    val ask = getOrNull(at) as? FiveRegisterInstruction ?: return null
    val asked = (ask as ReferenceInstruction).reference as? MethodReference ?: return null
    if (ask.opcode != Opcode.INVOKE_STATIC || asked.returnType != "Z" || asked.parameterTypes.map { it.toString() } != listOf("Ljava/lang/Object;")) return null
    val taken = getOrNull(at + 1) as? OneRegisterInstruction ?: return null
    val controller = getOrNull(at + 2) as? TwoRegisterInstruction ?: return null
    val cast = getOrNull(at + 3) as? OneRegisterInstruction ?: return null
    val branch = getOrNull(at + 4) as? OneRegisterInstruction ?: return null
    val first = getOrNull(at + 5) as? TwoRegisterInstruction ?: return null
    if (taken.opcode != Opcode.MOVE_RESULT || controller.opcode != Opcode.IGET_OBJECT || cast.opcode != Opcode.CHECK_CAST ||
        branch.opcode != Opcode.IF_EQZ || branch.registerA != taken.registerA || first.opcode != Opcode.IGET_OBJECT ||
        first.registerA == first.registerB || controller.registerB != first.registerB) return null
    val owner = ((cast as ReferenceInstruction).reference as TypeReference).type
    var key: FieldReference? = null
    for (i in at + 5 until minOf(at + 40, size - 1)) {
        val step = this[i]
        if (key == null && step.opcode == Opcode.CHECK_CAST && ((step as ReferenceInstruction).reference as TypeReference).type == THREAD_KEY_TYPE &&
            this[i - 1].opcode == Opcode.IGET_OBJECT) {
            key = (this[i - 1] as ReferenceInstruction).reference as FieldReference
        }
        val dialog = (step as? ReferenceInstruction)?.reference as? MethodReference ?: continue
        if ((step.opcode != Opcode.INVOKE_STATIC && step.opcode != Opcode.INVOKE_STATIC_RANGE) || dialog.definingClass != owner || dialog.returnType != "V" ||
            dialog.parameterTypes.map { it.toString() } != PIN_DIALOG_PARAMS + listOf(owner, "I", "I")) continue
        if (this[i + 1].opcode != Opcode.IF_EQZ) return null
        val done = branchTarget(i + 1)
        val exit = getOrNull(done) as? OneRegisterInstruction ?: return null
        val out = getOrNull(done + 1) as? OneRegisterInstruction ?: return null
        if (exit.opcode != Opcode.SGET_OBJECT || out.opcode != Opcode.RETURN_OBJECT || out.registerA != exit.registerA) return null
        return PinFullSite(at + 5, first.registerB, first.registerA, key ?: return null, done, owner)
    }
    return null
}

/** At the limit, the extension keeps the pin on the phone and the lambda leaves before its "can't pin" dialog. */
internal fun MutableMethod.injectPinFull() {
    val site = pinFullSite() ?: pinRouteChanged()
    addInstructionsWithLabels(site.at, """
        iget-object v${site.free}, v${site.self}, ${site.key}
        invoke-static/range {v${site.free} .. v${site.free}}, $PIN_FULL_CALL
        move-result v${site.free}
        if-nez v${site.free}, :pin_kept
    """.trimIndent(), ExternalLabel("pin_kept", getInstruction(site.done)))
}

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

/**
 * Index of the items read's trace, which stays where the Hide People You May Know refresh expects it: first, or second
 * when that refresh's own call has gone in. The list hook goes right after it, so neither patch depends on the other's order.
 */
internal fun Method.pinListTrace(): Int? {
    val code = implementation?.instructions?.toList() ?: return null
    if (definingClass != INBOX_SUPPLIER || isStatic() || parameterTypes.isNotEmpty() || returnType != IMMUTABLE_LIST) return null
    val at = if ((code.firstOrNull() as? ReferenceInstruction)?.reference?.toString() == INBOX_ITEMS_CALL) 1 else 0
    val trace = code.getOrNull(at) ?: return null
    if ((trace.opcode != Opcode.CONST_STRING && trace.opcode != Opcode.CONST_STRING_JUMBO) || trace.string() != INBOX_ITEMS_TRACE) return null
    val targets = jumpTargets()
    return at.takeIf { at + 1 < code.size && 0 !in targets && at + 1 !in targets && pinListField() != null }
}

/** The supplier's own list of rows, the first it reads in the items read. */
private fun Method.pinListField(): String? = implementation?.instructions?.firstOrNull { i ->
    i.opcode == Opcode.IGET_OBJECT && ((i as ReferenceInstruction).reference as? FieldReference)?.let { it.definingClass == INBOX_SUPPLIER && it.type == IMMUTABLE_LIST } == true
}?.let { (it as ReferenceInstruction).reference.toString() }

internal fun MutableMethod.injectPinList() {
    val trace = pinListTrace() ?: pinRouteChanged()
    addInstructions(trace + 1, "invoke-static/range {p0 .. p0}, $PIN_ARRANGE_CALL")
}

/** What the extension reads and writes by reflection: "key|flag|otherFlag|list|subscribe|listed". */
internal data class PinnedChatRoute(val key: String, val flag: String, val otherFlag: String, val list: String, val refresh: InboxRefreshRoute) {
    override fun toString() = "$key|$flag|$otherFlag|$list|$refresh"
}

/** Proved on the stock classes before any edit. */
internal fun resolvePinnedChatRoute(row: Method, items: Method, classOf: (String) -> ClassDef?): PinnedChatRoute {
    val fields = row.pinFields() ?: pinRouteChanged()
    val list = items.pinListField() ?: pinRouteChanged()
    return PinnedChatRoute(fields.key, fields.flag, fields.otherFlag, list, resolveInboxRefresh(items, classOf))
}

/** Checks the extension's half before any edit and returns the stub the route goes into. */
internal fun BytecodePatchContext.pinnedChatStub(): MutableMethod {
    val calls = classDefByOrNull(LOCAL_PINS)?.methods?.toList().orEmpty()
    for (id in listOf(PIN_ROW_CALL, UNPIN_ROW_CALL, PINNING_CALL, UNPINNING_CALL, PIN_FULL_CALL, PIN_ARRANGE_CALL)) {
        val call = calls.singleOrNull { it.hookId() == id }
        if (call == null || !AccessFlags.STATIC.isSet(call.accessFlags) || !AccessFlags.PUBLIC.isSet(call.accessFlags)) pinRouteChanged()
    }
    val stub = mutableClassDefBy(HOST_SCREENS).methods.singleOrNull { it.hookId() == PINNED_CHAT_ROUTE } ?: pinRouteChanged()
    stub.validateRouteStub(PINNED_CHAT_ROUTE)
    return stub
}

internal fun MutableMethod.writePinnedChatRoute(route: PinnedChatRoute) {
    validateRouteStub(PINNED_CHAT_ROUTE)
    val register = (implementation!!.instructions.first() as OneRegisterInstruction).registerA
    replaceInstruction(0, "const-string v$register, \"$route\"")
}
