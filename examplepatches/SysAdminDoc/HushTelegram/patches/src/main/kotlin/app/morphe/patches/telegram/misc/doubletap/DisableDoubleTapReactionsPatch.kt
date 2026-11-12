/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.doubletap

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.*
import app.morphe.patches.telegram.misc.localcontrols.*
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.call
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origSuperclass
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

internal const val DOUBLE_TAP_REACTIONS = "$EXTENSION_PACKAGE/misc/DoubleTapReactions;"
internal const val DOUBLE_TAP_CHOICE = "Lorg/telegram/messenger/MediaDataController;->getDoubleTapReaction()Ljava/lang/String;"

@Suppress("unused")
val disableDoubleTapReactionsPatch = bytecodePatch(
    name = "Disable double-tap reactions",
    description = "Stops a double tap on a message from adding a reaction, handy if you keep reacting by accident. " +
        "Starts off. Turn it on in HushTelegram settings > Conversations.",
    default = true,
) {
    category("Conversations")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val sites = resolveDoubleTapReactions()
        listOf("reactionRows", "reactionPicker", "reactionSelection", "emojiPackNote").forEach(::requireStatusMethod)
        controlHook(DOUBLE_TAP_REACTIONS, "rows", listOf("Ljava/lang/Object;", "Z", "Z"), "Ljava/lang/Object;")
        controlHook(DOUBLE_TAP_REACTIONS, "picker", listOf("Z"), "Z")
        controlHook(DOUBLE_TAP_REACTIONS, "spoken", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;")
        controlHook(DOUBLE_TAP_REACTIONS, "selection", listOf("Ljava/util/List;"), "Ljava/util/List;")
        controlHook(DOUBLE_TAP_REACTIONS, "packNote", listOf("I"), "Z")
        controlHook(DOUBLE_TAP_REACTIONS, "unreadRow", listOf("I"), "Z")
        controlHook(DOUBLE_TAP_REACTIONS, "hideEffect", emptyList(), "Z")
        val rows = resolveReactionRows()
        val unread = resolveHiddenRowUnread()
        val effect = resolveReactionEffect()
        val speech = resolveReactionSpeech()
        val picker = resolveReactionPicker()
        val selection = resolveReactionSelection()
        val packNote = resolveEmojiPackNote()
        sites.forEach { it.insert(MutableMethod(ImmutableMethod.of(it.method))) }
        sites.forEach { it.insert(it.method) }
        enableCapability("chatDoubleTapReaction")
        enableCapability("previewDoubleTapReaction")
        if (rows.missing == null) {
            rows.apply()
            enableCapability("reactionRows")
            if (unread.missing == null) unread.apply()
            else patchLog.warning("Disable double-tap reactions: ${unread.missing}. Reactions on a hidden row may stay unread.")
            if (effect.missing == null) effect.apply()
            else patchLog.warning("Disable double-tap reactions: ${effect.missing}. A reaction's animation may still play over a hidden row.")
            if (speech.missing == null) speech.apply()
            else patchLog.warning("Disable double-tap reactions: ${speech.missing}. Hidden reaction rows still show in what TalkBack reads.")
        } else {
            patchLog.warning("Disable double-tap reactions: ${rows.missing}. The patch goes on without the reaction rows switch.")
        }
        if (picker.missing == null) {
            picker.apply()
            enableCapability("reactionPicker")
        } else {
            patchLog.warning("Disable double-tap reactions: ${picker.missing}. The patch goes on without the reaction picker switch.")
        }
        if (selection.missing == null) {
            selection.apply()
            enableCapability("reactionSelection")
        } else {
            patchLog.warning("Disable double-tap reactions: ${selection.missing}. The reaction picker switch leaves the selection's bubble alone.")
        }
        if (packNote.missing == null) {
            packNote.apply()
            enableCapability("emojiPackNote")
        } else {
            patchLog.warning("Disable double-tap reactions: ${packNote.missing}. The patch goes on without the emoji pack line switch.")
        }
        enableStatus("disableDoubleTapReactions")
    }
}

internal data class DoubleTapSite(val method: MutableMethod, val capability: String, val dispatcher: MutableMethod? = null) {
    fun insert(target: MutableMethod) = target.returnEarlyWhen("Disable double-tap reactions",
        "$DOUBLE_TAP_REACTIONS->stopReaction()Z", if (method.origReturnType == "V") "return-void" else "const/4 v0, 0x0\nreturn v0")
}

internal fun BytecodePatchContext.resolveDoubleTapReactions(): List<DoubleTapSite> {
    listOf("disableDoubleTapReactions", "chatDoubleTapReaction", "previewDoubleTapReaction").forEach(::requireStatusMethod)
    controlHook(DOUBLE_TAP_REACTIONS, "stopReaction", emptyList(), "Z")
    val found = mutableListOf<Method>()
    forEachClassMentioning(Mention.reference(DOUBLE_TAP_CHOICE)) { cls -> cls.methods.filterTo(found) { method ->
        (method.controlShape(listOf("Landroid/view/View;", "F", "F"), "V") ||
            (method.origName == "onDoubleTap" && method.controlShape(listOf("Landroid/view/MotionEvent;"), "Z"))) &&
            method.controlBody().any { it.controlRef() == DOUBLE_TAP_CHOICE }
    } }
    controlShape(found.size == 2, "reaction gesture census changed")
    return listOf("chatDoubleTapReaction", "previewDoubleTapReaction").map { capability ->
        val match = found.filter { (it.origReturnType == "V") == (capability == "chatDoubleTapReaction") }.controlSingle(capability)
        val owner = tgMutableClassDefBy(match.definingClass)
        val method = owner.methods.filter { it.toString() == match.toString() }.controlSingle("$capability mutable method")
        val body = method.controlBody()
        var dispatcher: MutableMethod? = null
        controlShape(method.controlCallable(false) && method.localRegisterCount() >= 1 &&
            body.none { it.controlRef()?.startsWith(DOUBLE_TAP_REACTIONS) == true }, "$capability callable shape changed")
        if (capability == "chatDoubleTapReaction") {
            val interfaces = owner.interfaces.mapNotNull(::classDefByOrNull)
            val delegate = interfaces.filter { cls -> cls.methods.any { it.origName == method.origName && it.controlShape(listOf("Landroid/view/View;", "F", "F"), "V") } &&
                cls.methods.any { it.controlShape(listOf("Landroid/view/View;"), "Z") } }.controlSingle("chat double-tap delegate")
            val callers = mutableListOf<Method>()
            val calls = Mention.member(method.name) and (Mention.type(delegate.type) or Mention.type(owner.type))
            forEachClassMentioning(calls) { cls -> cls.methods.filterTo(callers) { caller -> caller.controlBody().any { instruction ->
                instruction.call()?.let { call -> call.origDefiningClass in listOf(delegate.type, owner.type) && call.origName == method.origName &&
                    call.controlShape(listOf("Landroid/view/View;", "F", "F"), "V") } == true
            } } }
            val caller = callers.controlSingle("chat reaction gesture caller")
            val callerOwner = tgMutableClassDefBy(caller.definingClass)
            val callerBody = caller.controlBody()
            controlShape(caller.origName == "onDoubleTap" && caller.controlCallable(false) && caller.controlShape(listOf("Landroid/view/MotionEvent;"), "Z") &&
                "Landroid/view/GestureDetector\$SimpleOnGestureListener;" in superclassChain(callerOwner.type).toList() &&
                callerBody.count { it.call()?.let { call -> call.origDefiningClass == delegate.origType && call.origName == method.origName &&
                    call.controlShape(listOf("Landroid/view/View;", "F", "F"), "V") } == true } == 1 &&
                callerBody.count { it.call()?.let { call -> call.origDefiningClass == delegate.origType && call.controlShape(listOf("Landroid/view/View;"), "Z") } == true } == 1 &&
                listOf("getX", "getY").all { coordinate -> callerBody.count { it.controlRef() == "Landroid/view/MotionEvent;->$coordinate()F" } == 1 },
                "chat reaction is no longer confined to the native double-tap gesture")
            dispatcher = callerOwner.methods.filter { it.toString() == caller.toString() }.controlSingle("chat gesture dispatcher")
            controlShape(body.count { it.controlRef() == DOUBLE_TAP_CHOICE } == 1 &&
                body.count { it.call()?.let { call -> call.origParameterTypes.take(2) ==
                    listOf("Landroid/view/View;", "Lorg/telegram/messenger/MessageObject;") && call.origReturnType == "V" } == true } == 2 &&
                body.last().opcode == Opcode.RETURN_VOID, "chat reaction sinks changed")
        } else {
            controlShape(owner.origSuperclass == "Landroid/view/GestureDetector\$SimpleOnGestureListener;" &&
                body.count { it.controlRef() == DOUBLE_TAP_CHOICE } == 3 && body.count { it.call()?.let { call ->
                    call.origDefiningClass == "Lorg/telegram/messenger/MessageObject;" && call.origName == "selectReaction" } == true } == 1,
                "reaction preview gesture changed")
        }
        DoubleTapSite(method, capability, dispatcher)
    }
}
