/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.util.names.loadsInt
import app.morphe.util.names.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.chattypefolders.CLIENT_USER_ID
import app.morphe.patches.telegram.misc.chattypefolders.LOCAL_FILTER
import app.morphe.patches.telegram.misc.chattypefolders.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.chattypefolders.SELECTED_ACCOUNT
import app.morphe.patches.telegram.misc.chattypefolders.USER_CONFIG
import app.morphe.patches.telegram.misc.chattypefolders.USER_CONFIG_INSTANCE
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

internal const val ALL_CHATS_PLACE = "$EXTENSION_PACKAGE/misc/AllChatsPlace;"
internal const val PLACE_REQUEST = "Lorg/telegram/tgnet/TLRPC\$TL_messages_updateDialogFiltersOrder;"
internal const val PLACE_SEND = "Lorg/telegram/tgnet/ConnectionsManager;->sendRequest(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/RequestDelegate;)I"
internal const val PLACE_PREMIUM = "$USER_CONFIG->isPremium()Z"
internal const val PLACE_DRAGGING = "Lorg/telegram/messenger/R\$id;->dragging:I"
internal const val PLACE_SETUP = "Lorg/telegram/ui/FiltersSetupActivity;"
internal const val PLACE_FILTERS = "$MESSAGES_CONTROLLER->dialogFilters:Ljava/util/ArrayList;"
private const val PLACE_IS_DEFAULT = "$LOCAL_FILTER->isDefault()Z"
internal const val PLACE_SORT = "Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V"
private const val PLACE_REVERSE = "Ljava/util/Collections;->reverse(Ljava/util/List;)V"
private const val PLACE_GET_CONFIG = "Lorg/telegram/messenger/BaseController;->getUserConfig()$USER_CONFIG"
internal const val PLACE_KEEPS = "$ALL_CHATS_PLACE->keeps(I)Z"
internal const val PLACE_SERVER_ORDER = "$ALL_CHATS_PLACE->serverOrder(Ljava/lang/Object;)V"
internal const val PLACE_LOADED = "$ALL_CHATS_PLACE->loaded(Ljava/lang/Object;Ljava/util/List;)V"
internal const val PLACE_LOCK_ORDER = "$ALL_CHATS_PLACE->lockOrder(Ljava/util/List;)V"

private class Unplaced(message: String) : Exception(message)

private fun placeFits(condition: Boolean, why: String) {
    if (!condition) throw Unplaced(why)
}

/** One hook: what goes in, and the instruction it goes in front of. */
internal class AllChatsSite(val method: MutableMethod, val at: Int, val smali: String)

/** Every site sits in its own method, so applying one never moves another's index. */
internal class AllChatsPlacePlan(val sites: List<AllChatsSite>, val missing: String?) {
    fun apply() = sites.forEach { it.method.addInstructions(it.at, it.smali) }
}

/**
 * Resolve this right before applying it: another hook in one of these methods, like Hide All Chats'
 * in the strip's setIsEditing, would move the indices.
 */
internal fun BytecodePatchContext.resolveAllChatsPlace(): AllChatsPlacePlan = try {
    requireStatusMethod("allChatsPlace")
    val orders = orderSites()
    val sites = orders + dragSites(stripOf(orders)) + firstCheckSite() + loadSite() + lockSite()
    placeFits(sites.map { it.method }.distinct().size == sites.size, "two of All Chats' hooks share a method")
    AllChatsPlacePlan(sites, null)
} catch (failed: Unplaced) {
    AllChatsPlacePlan(emptyList(), failed.message)
}

/** Fills the stubs. Only after a plan with nothing missing. */
internal fun BytecodePatchContext.writeAllChatsPlaceStubs() {
    listOf(SELECTED_ACCOUNT, USER_CONFIG_INSTANCE).forEach { requireReachable(it, true) }
    listOf(PLACE_GET_CONFIG, PLACE_PREMIUM, CLIENT_USER_ID, "$LOCAL_FILTER->id:I", "$PLACE_REQUEST->order:Ljava/util/ArrayList;")
        .forEach { requireReachable(it, false) }
    writeStub(ALL_CHATS_PLACE, "selectedConfig", 1, """
        sget v0, $SELECTED_ACCOUNT
        invoke-static {v0}, $USER_CONFIG_INSTANCE
        move-result-object v0
        return-object v0
    """)
    writeStub(ALL_CHATS_PLACE, "config", 1, """
        check-cast p0, $MESSAGES_CONTROLLER
        invoke-virtual {p0}, $PLACE_GET_CONFIG
        move-result-object p0
        return-object p0
    """)
    writeStub(ALL_CHATS_PLACE, "premium", 1, """
        check-cast p0, $USER_CONFIG
        invoke-virtual {p0}, $PLACE_PREMIUM
        move-result p0
        return p0
    """)
    writeStub(ALL_CHATS_PLACE, "userId", 3, """
        check-cast p0, $USER_CONFIG
        invoke-virtual {p0}, $CLIENT_USER_ID
        move-result-wide v0
        return-wide v0
    """)
    writeStub(ALL_CHATS_PLACE, "folderId", 1, """
        check-cast p0, $LOCAL_FILTER
        iget p0, p0, $LOCAL_FILTER->id:I
        return p0
    """)
    writeStub(ALL_CHATS_PLACE, "order", 1, """
        check-cast p0, $PLACE_REQUEST
        iget-object p0, p0, $PLACE_REQUEST->order:Ljava/util/ArrayList;
        return-object p0
    """)
}

/** Nothing else reaches [at], so a hook inserted there runs on the only way in. */
private fun onlyFromAbove(method: Method, at: Int): Boolean = try {
    val flow = ControlFlow.of(method)
    flow.normal.withIndex().none { (index, next) -> at in next && index != at - 1 } && flow.exceptional.none { at in it }
} catch (failed: IllegalArgumentException) {
    false
}

private fun Method.key() = toString()

private fun Method.isRun() = origName == "run" && parameterTypes.isEmpty() && origReturnType == "V"

/**
 * The three places in Telegram that tell the server the folder order. Each builds the request and
 * sends it. Folders by chat type's stub sends one too once it's written, which depends on patch
 * order, so the extension's classes don't count; that stub hands its request to the same hook itself.
 */
private fun BytecodePatchContext.orderSites(): List<AllChatsSite> {
    val found = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.type(PLACE_REQUEST)) { cls ->
        if (cls.origType == PLACE_REQUEST || cls.type.startsWith("$EXTENSION_PACKAGE/")) return@forEachClassMentioning
        cls.methods.filter { m -> m.controlBody().any { it.opcode == Opcode.NEW_INSTANCE && it.controlRef() == PLACE_REQUEST } }
            .forEach { found += cls.type to it.key() }
    }
    placeFits(found.size == 3, "the folder order is no longer sent from three places")
    return found.map { (type, key) ->
        val method = tgMutableClassDefBy(type).methods.single { it.key() == key }
        val body = method.controlBody()
        val created = body.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.controlRef() == PLACE_REQUEST }
        val request = (body[created] as OneRegisterInstruction).registerA
        val at = (created until body.size).firstOrNull {
            body[it].opcode == Opcode.INVOKE_VIRTUAL && body[it].controlRef() == PLACE_SEND && body[it].namedRegisters().getOrNull(1) == request
        }
        placeFits(at != null && request <= 15, "a folder order request isn't sent the way it was")
        placeFits(onlyFromAbove(method, at!!), "something jumps into a folder order's send")
        AllChatsSite(method, at, "invoke-static {v$request}, $PLACE_SERVER_ORDER")
    }
}

/** The tab strip: the class of the order site in its setIsEditing. */
private fun stripOf(orders: List<AllChatsSite>): String {
    val strip = orders.singleOrNull { it.method.origName == "setIsEditing" }
    placeFits(strip != null, "the tab strip no longer sends the folder order when editing ends")
    return strip!!.method.definingClass
}

/** After a Premium question, the answer goes through the extension. */
private fun BytecodePatchContext.answerSite(method: MutableMethod, question: Int): AllChatsSite {
    val body = method.controlBody()
    val result = body.getOrNull(question + 1)
    placeFits(result?.opcode == Opcode.MOVE_RESULT, "the answer in ${method.definingClass} isn't read the way it was")
    val answer = (result as OneRegisterInstruction).registerA
    placeFits(answer <= 15, "the answer in ${method.definingClass} sits out of reach")
    placeFits(onlyFromAbove(method, question + 2), "something jumps past the answer in ${method.definingClass}")
    return AllChatsSite(method, question + 2, """
        invoke-static {v$answer}, $PLACE_KEEPS
        move-result v$answer
    """)
}

/**
 * The drag callbacks of the tab strip and of the Folders settings page. Each posts a reset once a
 * drag ends, inside a run() R8 merged with other lambdas, so the callback's cast finds its case. The
 * strip's callback also asks Premium itself where Telegram blocks Premium features. 13.2's R8 merged
 * the two callbacks into one class that holds either page in an Object field and casts it, so a
 * callback serves a page it has a field of or casts to, and posts one reset per page it serves.
 */
private fun BytecodePatchContext.dragSites(strip: String): List<AllChatsSite> {
    val pages = listOf(strip, PLACE_SETUP)
    val callbacks = mutableMapOf<String, List<String>>()
    forEachClassMentioning(Mention.reference(PLACE_DRAGGING)) { cls ->
        val bodies = cls.methods.map { it.controlBody() }
        if (bodies.none { body -> body.any { it.loadsInt() && it.controlRef() == PLACE_DRAGGING } }) return@forEachClassMentioning
        val served = pages.filter { page -> cls.fields.any { it.origType == page } ||
            bodies.any { body -> body.any { it.opcode == Opcode.CHECK_CAST && it.controlRef() == page } } }
        if (served.isNotEmpty()) callbacks[cls.type] = served
    }
    placeFits(callbacks.values.flatten().sorted() == pages.sorted(), "the folders' drag callbacks changed")
    return callbacks.flatMap { (callback, served) ->
        val cls = tgMutableClassDefBy(callback)
        val own = cls.methods.flatMap { method ->
            method.controlBody().withIndex().filter { (_, it) -> it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef() == PLACE_PREMIUM }
                .map { (index, _) -> answerSite(method, index) }
        }
        val runners = (cls.fields.map { it.type } + cls.methods.flatMap { m ->
            m.controlBody().filter { it.opcode == Opcode.NEW_INSTANCE || it.opcode == Opcode.CHECK_CAST }.mapNotNull { it.controlRef() }
        }).distinct().filter { it.startsWith("Lorg/telegram/") && it !in pages }
        val resets = runners.mapNotNull { runner -> resetIn(runner, callback) }
        placeFits(resets.size == served.size, "the drag reset of $callback changed")
        own + resets
    }
}

private fun BytecodePatchContext.resetIn(runner: String, callback: String): AllChatsSite? {
    val run = tgClassDefByOrNull(runner)?.methods?.singleOrNull { it.origName == "run" && it.parameterTypes.isEmpty() && it.origReturnType == "V" } ?: return null
    val body = run.controlBody()
    val cast = body.indexOfFirst { it.opcode == Opcode.CHECK_CAST && it.controlRef() == callback }
    if (cast < 0) return null
    val question = (cast until minOf(cast + 12, body.size)).firstOrNull {
        body[it].opcode == Opcode.INVOKE_VIRTUAL && body[it].controlRef() == PLACE_PREMIUM
    } ?: return null
    val mutable = tgMutableClassDefBy(runner).methods.single { it.origName == "run" && it.parameterTypes.isEmpty() && it.origReturnType == "V" }
    return answerSite(mutable, question)
}

/** MessagesController.updatePremium, which moves All Chats back at startup unless it's already first. */
private fun BytecodePatchContext.firstCheckSite(): AllChatsSite {
    val method = tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.singleOrNull { it.origName == "updatePremium" && it.parameterTypes.map(CharSequence::toString) == listOf("Z") }
    placeFits(method != null, "Telegram's Premium update changed")
    val question = method!!.controlBody().indexOfFirst { it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef() == PLACE_IS_DEFAULT }
    placeFits(question >= 0, "Telegram's Premium update no longer looks for All Chats")
    return answerSite(method, question)
}

/**
 * The sort of a freshly loaded folder list, the one the list field is read for just before. 13.2's
 * R8 inlined the load's lambda into the run() of the Runnable that posts it, which holds the
 * controller in a field, so that run() counts as the lambda.
 */
private fun BytecodePatchContext.loadSite(): AllChatsSite {
    val runners = mutableListOf<String>()
    forEachClassMentioning(Mention.reference(PLACE_FILTERS)) { cls ->
        if (cls.origType != MESSAGES_CONTROLLER && cls.fields.any { it.origType == MESSAGES_CONTROLLER } &&
            cls.methods.any { it.isRun() && it.controlBody().any { op -> op.controlRef() == PLACE_SORT } }) runners += cls.type
    }
    val candidates = tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.filter { it.origName.startsWith("lambda\$processLoadedDialogFilters\$") } +
        runners.map { type -> tgMutableClassDefBy(type).methods.single { it.isRun() } }
    val sites = candidates.mapNotNull { method ->
        val body = method.controlBody()
        body.indices.firstOrNull { index ->
            body[index].opcode == Opcode.INVOKE_STATIC && body[index].controlRef() == PLACE_SORT &&
                (maxOf(0, index - 4) until index).any { read ->
                    body[read].opcode == Opcode.IGET_OBJECT && body[read].controlRef() == PLACE_FILTERS &&
                        (body[read] as TwoRegisterInstruction).registerA == body[index].namedRegisters().first()
                }
        }?.let { sort ->
            val read = (maxOf(0, sort - 4) until sort).last { body[it].opcode == Opcode.IGET_OBJECT && body[it].controlRef() == PLACE_FILTERS }
            val (list, controller) = (body[read] as TwoRegisterInstruction).let { it.registerA to it.registerB }
            placeFits(list <= 15 && controller <= 15, "the folder load's registers sit out of reach")
            placeFits(onlyFromAbove(method, sort + 1), "something jumps past the folder load's sort")
            AllChatsSite(method, sort + 1, "invoke-static {v$controller, v$list}, $PLACE_LOADED")
        }
    }
    placeFits(sites.size == 1, "the folder load's sort changed")
    return sites.single()
}

/** lockFiltersInternal's copy of the folders, right after it's reversed. */
private fun BytecodePatchContext.lockSite(): AllChatsSite {
    val method = tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.singleOrNull { it.origName == "lockFiltersInternal" && it.parameterTypes.isEmpty() }
    placeFits(method != null, "Telegram's folder locking changed")
    val body = method!!.controlBody()
    val reverse = body.indices.filter { body[it].opcode == Opcode.INVOKE_STATIC && body[it].controlRef() == PLACE_REVERSE }
    placeFits(reverse.size == 1, "Telegram's folder locking no longer reverses the folders once")
    val list = body[reverse.single()].namedRegisters().single()
    placeFits(list <= 15, "the folder locking's list sits out of reach")
    placeFits(onlyFromAbove(method, reverse.single() + 1), "something jumps past the folder locking's reverse")
    return AllChatsSite(method, reverse.single() + 1, "invoke-static {v$list}, $PLACE_LOCK_ORDER")
}
