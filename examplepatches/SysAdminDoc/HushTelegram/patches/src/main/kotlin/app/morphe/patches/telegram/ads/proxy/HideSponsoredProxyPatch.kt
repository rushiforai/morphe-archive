/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.ads.proxy

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Hide sponsored proxy channel"
internal const val PROXY_PROMOTIONS = "$EXTENSION_PACKAGE/ads/ProxyPromotions;"
internal const val MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
internal const val PROXY_DIALOG = "Lorg/telegram/tgnet/TLRPC\$Dialog;"
internal const val PROXY_CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
internal const val SHARED_PROMO_REQUEST = "Lorg/telegram/tgnet/TLRPC\$TL_help_getPromoData;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"

@Suppress("unused")
val hideSponsoredProxyPatch = bytecodePatch(
    name = PATCH,
    description = "Hides the sponsored channel a proxy adds to your chat list and folders. Your proxy settings aren't " +
        "touched. On by default. Turn it off in HushTelegram settings > Chats.",
    default = true,
) {
    category("Ads")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("hideSponsoredProxy")
        ProxyTarget.entries.forEach { requireStatusMethod(it.capability) }
        val plan = resolveProxyHooks()
        // Both sites share sortDialogs. Freeze their geometry before editing, then work backwards.
        writeStub(PROXY_PROMOTIONS, "isSponsoredProxyDialog", 6, plan.scope)
        for (hook in plan.hooks.sortedByDescending { it.index }) {
            val labels = hook.jump?.let {
                arrayOf(ExternalLabel("hush_keep", hook.method.getInstruction(it)))
            } ?: emptyArray()
            hook.method.addInstructionsAtControlFlowLabel(hook.index, hook.code, *labels)
            when (hook.target) {
                ProxyTarget.CHAT_LIST -> enableCapability("cachedProxyDialog")
                ProxyTarget.FILTERS -> enableCapability("cachedProxyFilters")
            }
        }
        enableStatus("hideSponsoredProxy")
    }
}

internal enum class ProxyTarget(val capability: String) {
    CHAT_LIST("cachedProxyDialog"), FILTERS("cachedProxyFilters"),
}
internal data class ProxyHook(
    val target: ProxyTarget, val method: MutableMethod, val index: Int, val code: String, val jump: Int? = null,
)
internal data class ProxyPlan(val hooks: List<ProxyHook>, val scope: String)

/** Kept controller/protocol members identify the two stock decisions, never a renamed class literal. */
internal fun BytecodePatchContext.resolveProxyHooks(): ProxyPlan {
    val controller = mutableClassDefBy(MESSAGES_CONTROLLER)
    fun member(name: String, type: String) = controller.fields.filter { it.name == name && it.type == type }
        .unique("controller field $name")
    val promo = member("promoDialog", PROXY_DIALOG)
    val left = member("isLeftPromoChannel", "Z")
    val allDialogs = member("allDialogs", ARRAY_LIST)
    val promoType = member("promoDialogType", "I")
    val proxyType = member("PROMO_TYPE_PROXY", "I")
    shape(listOf(promo, left, allDialogs, promoType).none { AccessFlags.STATIC.isSet(it.accessFlags) },
        "cached proxy fields no longer match instance reads")
    shape(AccessFlags.PUBLIC.isSet(controller.accessFlags) && AccessFlags.PUBLIC.isSet(promoType.accessFlags) &&
        AccessFlags.PUBLIC.isSet(proxyType.accessFlags) && AccessFlags.STATIC.isSet(proxyType.accessFlags),
        "proxy type scope is inaccessible")
    val sort = controller.methods.filter { method ->
        method.returnType == "V" && method.parameterTypes.size == 1 && method.parameterTypes[0].startsWith("L") &&
            method.instructions().any { it.field() == promo } && method.instructions().any { it.field() == left } &&
            method.instructions().any { it.call()?.let { call -> call.definingClass == ARRAY_LIST &&
                call.name == "add" && call.hasShape(listOf("I", "Ljava/lang/Object;"), "V") } == true }
    }.unique("cached proxy sorting method")
    val instructions = sort.instructions()
    val flow = ControlFlow.of(sort)
    val add = instructions.indices.filter { index ->
        instructions[index].call()?.let { call -> call.definingClass == ARRAY_LIST && call.name == "add" &&
            call.hasShape(listOf("I", "Ljava/lang/Object;"), "V") } == true &&
            instructions.getOrNull(index - 6)?.field() == promo
    }.unique("left promo reinsertion")
    shape(add >= 6 && add + 4 < instructions.size, "cached insertion has incomplete surroundings")
    val cachedAt = add - 2
    val cachedMerge = add + 4
    val owner = instructions[add - 6].namedRegisters().getOrNull(1)
    val cachedDialog = instructions[add - 6].namedRegisters().firstOrNull()
    val list = instructions[add - 2].namedRegisters().firstOrNull()
    val indexRegister = instructions[add - 1].namedRegisters().firstOrNull()
    val leftRegister = instructions[add - 4].namedRegisters().firstOrNull()
    shape(instructions[add - 6].opcode == Opcode.IGET_OBJECT &&
        instructions[add - 5].opcode == Opcode.IF_EQZ && instructions[add - 5].namedRegisters() == listOf(cachedDialog) &&
        flow.normal[add - 5].contains(cachedMerge) &&
        instructions[add - 4].opcode == Opcode.IGET_BOOLEAN && instructions[add - 4].field() == left &&
        instructions[add - 4].namedRegisters().getOrNull(1) == owner &&
        leftRegister != cachedDialog &&
        instructions[add - 3].opcode == Opcode.IF_EQZ && instructions[add - 3].namedRegisters() == listOf(leftRegister) &&
        flow.normal[add - 3].contains(cachedMerge) &&
        instructions[add - 2].opcode == Opcode.IGET_OBJECT && instructions[add - 2].field() == allDialogs &&
        instructions[add - 2].namedRegisters().getOrNull(1) == owner &&
        instructions[add - 1].literal() == 0 && instructions[add].namedRegisters() == listOf(list, indexRegister, cachedDialog) &&
        instructions[add + 1].literal() == -2 && instructions[add + 2].opcode == Opcode.IGET_OBJECT &&
        instructions[add + 2].field() == promo && instructions[add + 2].namedRegisters().getOrNull(1) == owner &&
        instructions[add + 3].call()?.let { call -> call.definingClass == MESSAGES_CONTROLLER &&
            call.name == "addDialogToItsFolder" && call.hasShape(listOf("I", PROXY_DIALOG), "V") } == true &&
        instructions[add + 3].namedRegisters() == listOf(owner, instructions[add + 1].namedRegisters().firstOrNull(),
            instructions[add + 2].namedRegisters().firstOrNull()), "cached insertion lost its null/left exclusions or folder merge")
    noBypass(sort, cachedAt, add + 3)
    val cachedRegisters = sort.freeLocalsAt(PATCH, cachedAt, 1, targets = listOf(cachedMerge), highest = 15)
    shape(owner != null && cachedDialog != null && owner <= 15 && cachedDialog <= 15 && owner != cachedDialog,
        "cached proxy owner or dialog exceeds invoke encoding")
    shape(instructions[0].opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) &&
        instructions[0].namedRegisters() == listOf(owner, sort.implementation!!.registerCount - 2) &&
        instructions.subList(1, cachedAt + 1).none { instruction ->
            val destination = (instruction as? OneRegisterInstruction)?.registerA
            instruction.opcode.setsRegister() && destination != null &&
                (destination == owner || (instruction.opcode.setsWideRegister() && destination + 1 == owner))
        }, "presentation owner is not the intact sorting controller")

    val include = instructions.indices.filter { index -> instructions[index].call()?.let { call ->
        call.definingClass == MESSAGES_CONTROLLER.dropLast(1) + "\$DialogFilter;" && call.name == "includesDialog" &&
            call.hasShape(listOf("Lorg/telegram/messenger/AccountInstance;", "J", PROXY_DIALOG), "Z")
    } == true }.unique("selected folder inclusion")
    shape(include >= 2 && include + 8 < instructions.size, "selected folder inclusion has incomplete surroundings")
    val filterAt = include + 2
    val visible = instructions[include + 1].namedRegisters().firstOrNull()
    val candidate = instructions[include].namedRegisters().lastOrNull()
    shape(instructions[include - 2].call()?.let { call -> call.name == "getAccountInstance" &&
        call.definingClass == "Lorg/telegram/messenger/BaseController;" && call.hasShape(emptyList(),
            "Lorg/telegram/messenger/AccountInstance;") } == true &&
        instructions[include - 2].namedRegisters() == listOf(owner) &&
        instructions[include - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
        instructions[include].namedRegisters().getOrNull(1) == instructions[include - 1].namedRegisters().firstOrNull() &&
        instructions[include + 1].opcode == Opcode.MOVE_RESULT && instructions[filterAt].opcode == Opcode.IF_EQZ &&
        instructions[filterAt].namedRegisters() == listOf(visible) &&
        instructions[filterAt + 1].call()?.let { call -> call.definingClass == MESSAGES_CONTROLLER &&
            call.name == "canAddToForward" && call.hasShape(listOf(PROXY_DIALOG), "Z") } == true &&
        instructions[filterAt + 1].namedRegisters() == listOf(owner, candidate) &&
        instructions[filterAt + 4].call()?.let { call -> call.definingClass == ARRAY_LIST &&
            call.name == "add" && call.hasShape(listOf("Ljava/lang/Object;"), "Z") } == true &&
        instructions[filterAt + 5].call() == instructions[filterAt + 4].call() &&
        instructions[filterAt + 4].namedRegisters().lastOrNull() == candidate &&
        instructions[filterAt + 5].namedRegisters().lastOrNull() == candidate &&
        flow.normal[filterAt].contains(filterAt + 6) && listOf(visible, owner, candidate).all { it != null && it <= 15 } &&
        listOf(visible, owner, candidate).distinct().size == 3,
        "selected folder inclusion lost its candidate or stock false branch")
    noBypass(sort, filterAt, filterAt + 5)

    val dialog = mutableClassDefBy(PROXY_DIALOG)
    val chat = mutableClassDefBy(PROXY_CHAT)
    val dialogId = dialog.fields.filter { it.name == "id" && it.type == "J" }.unique("dialog id")
    val chatLeft = chat.fields.filter { it.name == "left" && it.type == "Z" }.unique("chat membership")
    val isPromo = controller.methods.filter { it.name == "isPromoDialog" && it.hasShape(listOf("J", "Z"), "Z") }
        .unique("promo identity predicate")
    val getChat = controller.methods.filter { it.name == "getChat" && it.hasShape(listOf("Ljava/lang/Long;"), PROXY_CHAT) }
        .unique("cached chat lookup")
    shape(listOf(dialog.accessFlags, chat.accessFlags, dialogId.accessFlags, chatLeft.accessFlags,
        isPromo.accessFlags, getChat.accessFlags).all { AccessFlags.PUBLIC.isSet(it) } &&
        listOf(dialogId.accessFlags, chatLeft.accessFlags, isPromo.accessFlags, getChat.accessFlags)
            .none { AccessFlags.STATIC.isSet(it) },
        "folder proxy scope cannot access kept host members")
    val runtime = mutableClassDefBy(PROXY_PROMOTIONS)
    shape(AccessFlags.PUBLIC.isSet(runtime.accessFlags), "extension presentation class is inaccessible")
    for ((name, parameters) in listOf(
        "hideCachedProxyDialog" to listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
        "showSelectedDialog" to listOf("Z", "Ljava/lang/Object;", "Ljava/lang/Object;"),
        "isSponsoredProxyDialog" to listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
    )) shape(runtime.methods.count { it.name == name && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
        AccessFlags.STATIC.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
        !AccessFlags.NATIVE.isSet(it.accessFlags) && it.hasShape(parameters, "Z") && it.implementation?.let { body ->
            body.registerCount >= parameters.sumOf { type -> if (type == "J" || type == "D") 2 else 1 } &&
                body.instructions.any { instruction -> !instruction.opcode.format.isPayloadFormat }
        } == true } == 1,
        "extension has no callable $name proxy method")
    val scope = """
        instance-of v0, p0, $MESSAGES_CONTROLLER
        if-eqz v0, :hush_other
        instance-of v0, p1, $PROXY_DIALOG
        if-eqz v0, :hush_other
        check-cast p0, $MESSAGES_CONTROLLER
        check-cast p1, $PROXY_DIALOG
        iget v0, p0, $promoType
        sget v1, $proxyType
        if-ne v0, v1, :hush_other
        iget-wide v0, p1, $dialogId
        const-wide/16 v2, 0x0
        cmp-long v2, v0, v2
        if-gez v2, :hush_other
        const/4 v2, 0x0
        invoke-virtual {p0, v0, v1, v2}, $isPromo
        move-result v2
        if-eqz v2, :hush_other
        neg-long v0, v0
        invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v0
        invoke-virtual {p0, v0}, $getChat
        move-result-object v0
        if-eqz v0, :hush_other
        iget-boolean v0, v0, $chatLeft
        return v0
        :hush_other
        const/4 v0, 0x0
        return v0
    """
    return ProxyPlan(listOf(
        ProxyHook(ProxyTarget.CHAT_LIST, sort, cachedAt, """
            invoke-static {v$owner, v$cachedDialog}, $PROXY_PROMOTIONS->hideCachedProxyDialog(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v${cachedRegisters[0]}
            if-nez v${cachedRegisters[0]}, :hush_keep
        """, cachedMerge),
        ProxyHook(ProxyTarget.FILTERS, sort, filterAt, """
            invoke-static {v$visible, v$owner, v$candidate}, $PROXY_PROMOTIONS->showSelectedDialog(ZLjava/lang/Object;Ljava/lang/Object;)Z
            move-result v$visible
        """),
    ), scope)
}

private fun noBypass(method: Method, first: Int, last: Int) {
    val flow = ControlFlow.of(method)
    shape(flow.normal.indices.none { source -> source !in first..last &&
        (flow.normal[source] + flow.exceptional[source]).any { it in first + 1..last } }, "an external edge bypasses the presentation guard")
}
private fun shape(valid: Boolean, reason: String) {
    if (!valid) throw PatchException("$PATCH: $reason; refuses changed proxy geometry before editing")
}
private fun <T> List<T>.unique(what: String): T {
    shape(size == 1, "$what has $size matches")
    return single()
}
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.literal(): Int? = (this as? NarrowLiteralInstruction)?.narrowLiteral
private fun MethodReference.hasShape(parameters: List<String>, returns: String) = returnType == returns &&
    parameterTypes.map { it.toString() } == parameters
