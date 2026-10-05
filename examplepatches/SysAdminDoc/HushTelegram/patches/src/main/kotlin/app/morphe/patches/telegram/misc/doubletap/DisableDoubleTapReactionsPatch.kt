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
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val DOUBLE_TAP_REACTIONS = "$EXTENSION_PACKAGE/misc/DoubleTapReactions;"
internal const val DOUBLE_TAP_CHOICE = "Lorg/telegram/messenger/MediaDataController;->getDoubleTapReaction()Ljava/lang/String;"

@Suppress("unused")
val disableDoubleTapReactionsPatch = bytecodePatch(
    name = "Disable double-tap reactions",
    description = "Adds a switch, off by default, that stops reactions from a double tap in chats and the reaction-settings preview. Scrolling, taps, selection and explicit reaction menus keep their usual behavior.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val sites = resolveDoubleTapReactions()
        sites.forEach { it.insert(MutableMethod(ImmutableMethod.of(it.method))) }
        sites.forEach { it.insert(it.method) }
        enableCapability("chatDoubleTapReaction")
        enableCapability("previewDoubleTapReaction")
        enableStatus("disableDoubleTapReactions")
    }
}

internal data class DoubleTapSite(val method: MutableMethod, val capability: String, val dispatcher: MutableMethod? = null) {
    fun insert(target: MutableMethod) = target.returnEarlyWhen("Disable double-tap reactions",
        "$DOUBLE_TAP_REACTIONS->stopReaction()Z", if (method.returnType == "V") "return-void" else "const/4 v0, 0x0\nreturn v0")
}

internal fun BytecodePatchContext.resolveDoubleTapReactions(): List<DoubleTapSite> {
    listOf("disableDoubleTapReactions", "chatDoubleTapReaction", "previewDoubleTapReaction").forEach(::requireStatusMethod)
    controlHook(DOUBLE_TAP_REACTIONS, "stopReaction", emptyList(), "Z")
    val found = mutableListOf<Method>()
    classDefForEach { cls -> cls.methods.filterTo(found) { method ->
        (method.controlShape(listOf("Landroid/view/View;", "F", "F"), "V") ||
            (method.name == "onDoubleTap" && method.controlShape(listOf("Landroid/view/MotionEvent;"), "Z"))) &&
            method.controlBody().any { it.controlRef() == DOUBLE_TAP_CHOICE }
    } }
    controlShape(found.size == 2, "reaction gesture census changed")
    return listOf("chatDoubleTapReaction", "previewDoubleTapReaction").map { capability ->
        val match = found.filter { (it.returnType == "V") == (capability == "chatDoubleTapReaction") }.controlSingle(capability)
        val owner = mutableClassDefBy(match.definingClass)
        val method = owner.methods.filter { it.toString() == match.toString() }.controlSingle("$capability mutable method")
        val body = method.controlBody()
        var dispatcher: MutableMethod? = null
        controlShape(method.controlCallable(false) && method.localRegisterCount() >= 1 &&
            body.none { it.controlRef()?.startsWith(DOUBLE_TAP_REACTIONS) == true }, "$capability callable shape changed")
        if (capability == "chatDoubleTapReaction") {
            val interfaces = owner.interfaces.mapNotNull(::classDefByOrNull)
            val delegate = interfaces.filter { cls -> cls.methods.any { it.name == method.name && it.controlShape(listOf("Landroid/view/View;", "F", "F"), "V") } &&
                cls.methods.any { it.controlShape(listOf("Landroid/view/View;"), "Z") } }.controlSingle("chat double-tap delegate")
            val callers = mutableListOf<Method>()
            classDefForEach { cls -> cls.methods.filterTo(callers) { caller -> caller.controlBody().any { instruction ->
                instruction.controlCall()?.let { call -> call.definingClass in listOf(delegate.type, owner.type) && call.name == method.name &&
                    call.controlShape(listOf("Landroid/view/View;", "F", "F"), "V") } == true
            } } }
            val caller = callers.controlSingle("chat reaction gesture caller")
            val callerOwner = mutableClassDefBy(caller.definingClass)
            val callerBody = caller.controlBody()
            controlShape(caller.name == "onDoubleTap" && caller.controlCallable(false) && caller.controlShape(listOf("Landroid/view/MotionEvent;"), "Z") &&
                "Landroid/view/GestureDetector\$SimpleOnGestureListener;" in superclassChain(callerOwner.type).toList() &&
                callerBody.count { it.controlCall()?.let { call -> call.definingClass == delegate.type && call.name == method.name &&
                    call.controlShape(listOf("Landroid/view/View;", "F", "F"), "V") } == true } == 1 &&
                callerBody.count { it.controlCall()?.let { call -> call.definingClass == delegate.type && call.controlShape(listOf("Landroid/view/View;"), "Z") } == true } == 1 &&
                listOf("getX", "getY").all { coordinate -> callerBody.count { it.controlRef() == "Landroid/view/MotionEvent;->$coordinate()F" } == 1 },
                "chat reaction is no longer confined to the native double-tap gesture")
            dispatcher = callerOwner.methods.filter { it.toString() == caller.toString() }.controlSingle("chat gesture dispatcher")
            controlShape(body.count { it.controlRef() == DOUBLE_TAP_CHOICE } == 1 &&
                body.count { it.controlCall()?.let { call -> call.parameterTypes.take(2).map { p -> p.toString() } ==
                    listOf("Landroid/view/View;", "Lorg/telegram/messenger/MessageObject;") && call.returnType == "V" } == true } == 2 &&
                body.last().opcode == Opcode.RETURN_VOID, "chat reaction sinks changed")
        } else {
            controlShape(owner.superclass == "Landroid/view/GestureDetector\$SimpleOnGestureListener;" &&
                body.count { it.controlRef() == DOUBLE_TAP_CHOICE } == 3 && body.count { it.controlCall()?.let { call ->
                    call.definingClass == "Lorg/telegram/messenger/MessageObject;" && call.name == "selectReaction" } == true } == 1,
                "reaction preview gesture changed")
        }
        DoubleTapSite(method, capability, dispatcher)
    }
}
