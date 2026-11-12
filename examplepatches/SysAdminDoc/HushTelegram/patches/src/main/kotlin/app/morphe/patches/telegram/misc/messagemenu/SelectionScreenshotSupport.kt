/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

internal const val SELECTION_SCREENSHOT = "$EXTENSION_PACKAGE/misc/SelectionScreenshot;"
private const val OBJECT = "Ljava/lang/Object;"
private const val VIEW = "Landroid/view/View;"
private const val MESSAGE = "Lorg/telegram/messenger/MessageObject;"
private const val DRAWABLES = "Lorg/telegram/messenger/R\$drawable;"

/**
 * What the selection bar's Screenshot button reaches, or [missing], why this build's can't: the
 * chat screen's view getter [fragmentView], and the message row class [cell] with its message
 * getter [cellMessage]. The button goes in and is answered through Select between's hooks.
 */
internal class SelectionScreenshotSites(
    val missing: String?,
    private val chat: String = "",
    private val fragmentView: String = "",
    private val cell: String = "",
    private val cellMessage: String = "",
) {
    fun apply(context: BytecodePatchContext) = context.writeStubs()

    private fun BytecodePatchContext.writeStubs() {
        writeStub(SELECTION_SCREENSHOT, "fragmentView", 2, """
            check-cast p0, $chat
            invoke-virtual {p0}, $fragmentView
            move-result-object v0
            return-object v0
        """)
        writeStub(SELECTION_SCREENSHOT, "cellMessage", 2, """
            instance-of v0, p0, $cell
            if-eqz v0, :none
            check-cast p0, $cell
            invoke-virtual {p0}, $cellMessage
            move-result-object v0
            return-object v0
            :none
            const/4 v0, 0x0
            return-object v0
        """)
        writeStub(SELECTION_SCREENSHOT, "icon", 1, "sget v0, $DRAWABLES->msg_gallery:I\nreturn v0")
    }
}

/**
 * The chat screen's view comes from the base screen class's public getFragmentView. The message
 * row is the one class the chat checks its rows against that has both a message and an album
 * (date and service rows have only the message), read through its getMessageObject.
 */
internal fun BytecodePatchContext.resolveSelectionScreenshot(chat: String): SelectionScreenshotSites = try {
    selectionScreenshot(chat)
} catch (refused: PatchException) {
    SelectionScreenshotSites(refused.message ?: "the chat's message rows can't be read")
} catch (failed: RuntimeException) {
    SelectionScreenshotSites("the chat's message rows can't be read (${failed.javaClass.simpleName}: ${failed.message})")
}

private fun BytecodePatchContext.selectionScreenshot(chat: String): SelectionScreenshotSites {
    requireStatusMethod("selectionScreenshot")
    controlHook(SELECTION_SCREENSHOT, "fragmentView", listOf(OBJECT), VIEW)
    controlHook(SELECTION_SCREENSHOT, "cellMessage", listOf(OBJECT), OBJECT)
    controlHook(SELECTION_SCREENSHOT, "icon", listOf(), "I")
    controlMembers(DRAWABLES, "static msg_gallery:I")
    val chatClass = tgMutableClassDefBy(chat)
    fun Method.publicInstance() = AccessFlags.PUBLIC.isSet(accessFlags) && !AccessFlags.STATIC.isSet(accessFlags)

    var owner: ClassDef? = chatClass
    var getter: Method? = null
    while (owner != null && getter == null) {
        getter = owner.methods.firstOrNull { it.origName == "getFragmentView" && it.parameterTypes.isEmpty() && it.origReturnType == VIEW && it.publicInstance() }
        owner = owner.superclass?.let { tgClassDefByOrNull(it) }
    }
    controlShape(getter != null, "the chat screen's view getter is gone")
    requireReachable(getter.toString(), false)

    val checked = chatClass.methods.flatMap { it.controlBody() }.filter { it.opcode == Opcode.INSTANCE_OF }.mapNotNull { it.controlRef() }.distinct()
    val (cellType, cell) = checked.mapNotNull { type -> tgClassDefByOrNull(type)?.let { type to it } }.filter { (_, c) ->
        c.methods.any { it.origName == "getMessageObject" && it.parameterTypes.isEmpty() && it.origReturnType == MESSAGE && it.publicInstance() } &&
            c.methods.any { it.origName == "getCurrentMessagesGroup" && it.parameterTypes.isEmpty() }
    }.controlSingle("the chat's message row")
    controlShape(AccessFlags.PUBLIC.isSet(cell.accessFlags), "the chat's message row is inaccessible")
    val message = cell.methods.single { it.origName == "getMessageObject" && it.parameterTypes.isEmpty() && it.origReturnType == MESSAGE }.toString()
    requireReachable(message, false)
    return SelectionScreenshotSites(null, chat, getter.toString(), cellType, message)
}
