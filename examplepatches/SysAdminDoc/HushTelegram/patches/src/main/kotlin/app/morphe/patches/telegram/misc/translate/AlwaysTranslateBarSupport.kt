/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.translate

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val BAR_SHOWN = "$TRANSLATE_BAR->alwaysShown(Ljava/lang/Object;)Z"
private const val BAR_TAPPED = "$TRANSLATE_BAR->barTapped(Ljava/lang/Object;)Z"
private const val BAR_CLOSED = "$TRANSLATE_BAR->barClosed(Ljava/lang/Object;)V"
private const val BAR_LABEL = "$TRANSLATE_BAR->barTranslating(Ljava/lang/Object;J)Z"
private const val BAR_OFFERED = "$TRANSLATE_CONTROLLER->isDialogTranslatable(J)Z"
private const val BAR_AVAILABLE = "$TRANSLATE_CONTROLLER->isFeatureAvailable(J)Z"
private const val BAR_HIDE = "$TRANSLATE_CONTROLLER->setHideTranslateDialog(JZZ)V"
private const val BAR_TOGGLE = "$TRANSLATE_CONTROLLER->toggleTranslatingDialog(JZ)Z"
private const val BAR_TARGET = "$TRANSLATE_CONTROLLER->getDialogTranslateTo(J)Ljava/lang/String;"
private const val BAR_COUNTER = "dialog_show_translate_count"
/** What the bar's close writes to [BAR_COUNTER]. Its tap writes a smaller number. */
private const val BAR_CLOSED_COUNT = 140L
private const val BAR_VIEW = "Landroid/view/View;"
private const val BAR_OBJECT = "Ljava/lang/Object;"
private const val BAR_MESSAGES = "Lorg/telegram/messenger/MessagesController;"
private const val BAR_ACCOUNT = "Lorg/telegram/messenger/UserConfig;"
private const val BAR_BASE = "Lorg/telegram/messenger/BaseController;"
private const val BAR_DIALOGS = "Lorg/telegram/messenger/DialogObject;"
private val BAR_GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

/** A change to Telegram's code, tried on a copy first and then made on [method]. */
internal class AlwaysBarEdit(val method: MutableMethod, val change: (MutableMethod) -> Unit)

/** A stub of the runtime's that reaches Telegram once patched. */
internal class AlwaysBarStub(val name: String, val registers: Int, val smali: String)

/** Everything the Always show translate bar switch changes, or why this build can't have it. */
internal class AlwaysBar(private val edits: List<AlwaysBarEdit>, private val stubs: List<AlwaysBarStub>, private val missing: String?) {
    /** Why the switch has to stay out, with the app untouched, or null when every site takes its hook. */
    fun rehearse(): String? {
        if (missing != null) return missing
        return try {
            edits.forEach { it.change(MutableMethod(ImmutableMethod.of(it.method))) }
            null
        } catch (refused: PatchException) {
            "the always shown bar can't take its hooks (${refused.message})"
        }
    }

    fun install(context: BytecodePatchContext) {
        stubs.forEach { context.writeStub(TRANSLATE_BAR, it.name, it.registers, it.smali) }
        edits.forEach { it.change(it.method) }
    }
}

/**
 * Telegram offers its translate bar only for a chat it found another language in, and the chat
 * screen settles that in one place, so that place is all the bar needs in order to appear. The other
 * four sites make the bar work where Telegram wouldn't have put it: the chat menu's Translate brings
 * a closed bar back, and when only the outside service can translate the chat, the bar's tap, close
 * and label go to that service.
 *
 * A missing hook means a broken build and refuses. A screen shaped another way only leaves this one
 * switch out, so that case comes back as the reason.
 */
internal fun BytecodePatchContext.resolveAlwaysBar(sites: List<TranslateBarSite>): AlwaysBar {
    requireStatusMethod("alwaysTranslateBar")
    val onObject = listOf(BAR_OBJECT)
    val onChat = listOf(BAR_OBJECT, "J")
    controlHook(TRANSLATE_BAR, "alwaysShown", onObject, "Z")
    controlHook(TRANSLATE_BAR, "offered", onChat, "Z")
    controlHook(TRANSLATE_BAR, "barTapped", onObject, "Z")
    controlHook(TRANSLATE_BAR, "barClosed", onObject, "V")
    controlHook(TRANSLATE_BAR, "barTranslating", onChat, "Z")
    controlHook(TRANSLATE_BAR, "stockOffered", onChat, "Z")
    controlHook(TRANSLATE_BAR, "available", onChat, "Z")
    controlHook(TRANSLATE_BAR, "hideDialog", onChat, "V")
    controlHook(TRANSLATE_BAR, "chatController", onObject, BAR_OBJECT)
    controlHook(TRANSLATE_BAR, "chatDialog", onObject, "J")
    controlHook(TRANSLATE_BAR, "controllerOwner", onObject, "J")
    controlHook(TRANSLATE_BAR, "encrypted", listOf("J"), "Z")

    return try {
        val screen = sites.first().method.definingClass
        controlShape(tgClassDefByOrNull(screen)?.let { AccessFlags.PUBLIC.isSet(it.accessFlags) } == true, "the chat screen isn't public")
        val panel = sites.filter { it.method.origReturnType == "V" && it.method.parameterTypes.map(CharSequence::toString) == listOf("Z") }
            .controlSingle("the chat's top panel")
        val updater = sites.filter { it.method.origReturnType == "V" && it.method.parameterTypes.isEmpty() }
            .controlSingle("the translate item updater")
        val clicks = barMethods(Mention.string(BAR_COUNTER)) { it.isBarClick() }
        val tap = clicks.filter { click -> click.controlBody().any { it.controlRef() == BAR_TOGGLE } }.controlSingle("the translate bar's tap")
        val close = clicks.filter { click ->
            val body = click.controlBody()
            body.none { it.controlRef() == BAR_TOGGLE } && body.any { (it as? WideLiteralInstruction)?.wideLiteral == BAR_CLOSED_COUNT }
        }.controlSingle("the translate bar's close")
        val label = barMethods(Mention.reference(TRANSLATING)) { it.isBarLabel() }.controlSingle("the translate bar's label")

        val (panelChange, dialogGetter) = panelEdit(panel, screen)
        val edits = listOf(
            panelChange,
            callEdit(updater.method, BAR_OFFERED, BAR_OFFERED_HOOK, "the translate item updater"),
            tapEdit(tap, screen),
            closeEdit(close, screen),
            callEdit(label, TRANSLATING, BAR_LABEL, "the translate bar's label"),
        )
        val stubs = barStubs(screen, dialogGetter, chatAccountGetter(screen))
        stubs.forEach { writeStub(TRANSLATE_BAR, it.name, it.registers, it.smali, install = false) }
        AlwaysBar(edits, stubs, null)
    } catch (refused: PatchException) {
        AlwaysBar(emptyList(), emptyList(), "the translate bar is built another way (${refused.message})")
    } catch (unreadable: IllegalArgumentException) {
        AlwaysBar(emptyList(), emptyList(), "the translate bar's code can't be read (${unreadable.message})")
    }
}

private fun Method.isBarClick() = origName == "onClick" && origReturnType == "V" &&
    parameterTypes.map(CharSequence::toString) == listOf(BAR_VIEW) && controlBody().any { it.controlString() == BAR_COUNTER }

private fun Method.isBarLabel() = parameterTypes.isEmpty() && origReturnType == "V" &&
    controlBody().map { it.controlRef() }.let { TRANSLATING in it && BAR_TARGET in it }

/** The methods [wanted] picks out of Telegram's classes that [query] narrows down to. */
private fun BytecodePatchContext.barMethods(query: Mention, wanted: (Method) -> Boolean): List<MutableMethod> {
    val types = mutableListOf<String>()
    forEachClassMentioning(query) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/") || cls.origType == TRANSLATE_CONTROLLER || cls.origType == MESSAGE_OBJECT) return@forEachClassMentioning
        if (cls.methods.any(wanted)) types += cls.type
    }
    return types.flatMap { type -> tgMutableClassDefBy(type).methods.filter(wanted) }
}

/**
 * The top panel turns Telegram's answer into a one or a zero in a register, and the two ways meet at
 * the instruction after the zero. The question goes there, and only a zero asks it.
 *
 * @return the edit, and the chat ID getter the panel calls, for the stubs
 */
private fun BytecodePatchContext.panelEdit(panel: TranslateBarSite, screen: String): Pair<AlwaysBarEdit, String> {
    val method = panel.method
    val body = method.controlBody()
    val flow = ControlFlow.of(method)
    val ask = panel.index
    fun loads(at: Int, value: Long) = body.getOrNull(at)?.let { it.opcode == Opcode.CONST_4 && (it as WideLiteralInstruction).wideLiteral == value } == true

    val getter = body.getOrNull(ask - 2)?.takeIf { it.opcode == Opcode.INVOKE_VIRTUAL }
    val dialogId = getter?.call()
    controlShape(dialogId != null && dialogId.definingClass == screen && dialogId.parameterTypes.isEmpty() && dialogId.origReturnType == "J" &&
        body.getOrNull(ask - 1)?.opcode == Opcode.MOVE_RESULT_WIDE, "the top panel no longer reads the chat's ID right before it asks")
    val declared = tgClassDefByOrNull(screen)!!.methods.filter { it.name == dialogId!!.name && it.parameterTypes.isEmpty() && it.returnType == "J" }
        .controlSingle("the chat's ID getter")
    controlShape(AccessFlags.PUBLIC.isSet(declared.accessFlags) && !AccessFlags.STATIC.isSet(declared.accessFlags), "the chat's ID getter isn't public")
    val chat = getter!!.namedRegisters().single()

    val answer = body.getOrNull(ask + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT }?.namedRegisters()?.single()
    controlShape(answer != null && body.getOrNull(ask + 2)?.let { it.opcode == Opcode.IF_NEZ && it.namedRegisters() == listOf(answer) } == true,
        "the top panel no longer tests Telegram's answer")
    controlShape(loads(ask + 3, 1) && body.getOrNull(ask + 4)?.opcode in BAR_GOTOS, "the top panel no longer sets a yes after the test")
    val flag = body[ask + 3].namedRegisters().single()
    val landing = flow.normal[ask + 4].single()
    controlShape(flow.normal[ask + 2].first() == landing - 1 && loads(landing - 1, 0) && body[landing - 1].namedRegisters() == listOf(flag),
        "the top panel no longer sets a no right before the two ways meet")
    val next = body.getOrNull(landing)
    controlShape(flag != chat && next?.opcode == Opcode.IGET_OBJECT && (next as TwoRegisterInstruction).registerB == chat &&
        next.controlField()?.definingClass == screen && flow.exceptional[landing].isEmpty(),
        "the top panel no longer goes on with the chat screen where the two ways meet")

    val edit = AlwaysBarEdit(method) { target ->
        target.addInstructionsAtControlFlowLabel(landing, """
            if-nez v$flag, :hush_bar_keep
            invoke-static/range {v$chat .. v$chat}, $BAR_SHOWN
            move-result v$flag
        """, ExternalLabel("hush_bar_keep", target.getInstruction(landing)))
    }
    return edit to "$screen->${dialogId!!.name}()J"
}

/** The one call of [target] in [method] goes to [hook] instead, with the same registers. */
private fun callEdit(method: MutableMethod, target: String, hook: String, what: String): AlwaysBarEdit {
    val body = method.controlBody()
    val at = body.indices.filter { body[it].controlRef() == target }.controlSingle("$what's question")
    controlShape(body[at].opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE) && body.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT,
        "$what no longer reads the answer")
    return AlwaysBarEdit(method) { it.swapForHook(at, hook) }
}

/** Where a click listener has just read the chat screen: the [next] instruction, and the register. */
private class ScreenRead(val next: Int, val chat: Int)

/** The read of the chat screen nearest in front of the listener's count key, reached only one way. */
private fun screenRead(method: MutableMethod, screen: String, what: String): ScreenRead {
    val body = method.controlBody()
    val flow = ControlFlow.of(method)
    val key = body.indices.filter { body[it].controlString() == BAR_COUNTER }.controlSingle("$what's count key")
    val at = (key - 1 downTo 0).firstOrNull { body[it].opcode == Opcode.IGET_OBJECT && body[it].controlField()?.type == screen }
    controlShape(at != null, "$what no longer reads the chat screen")
    val next = at!! + 1
    controlShape(flow.normal[at] == listOf(next) && flow.normal.withIndex().none { (from, targets) -> from != at && next in targets } &&
        flow.exceptional[next].isEmpty(), "$what can be reached another way")
    return ScreenRead(next, (body[at] as TwoRegisterInstruction).registerA)
}

/** A yes from the runtime ends the tap, the outside service took it. A no runs Telegram's own. */
private fun tapEdit(method: MutableMethod, screen: String): AlwaysBarEdit {
    val read = screenRead(method, screen, "the translate bar's tap")
    val body = method.controlBody()
    val account = body[read.next]
    val result = body.getOrNull(read.next + 1)
    controlShape(account.opcode == Opcode.INVOKE_VIRTUAL && account.namedRegisters() == listOf(read.chat) &&
        account.controlRef()?.substringAfter("->")?.startsWith("getUserConfig()") == true && result?.opcode == Opcode.MOVE_RESULT_OBJECT,
        "the translate bar's tap no longer starts with the account")
    // Telegram writes this register right after, so it's free for the answer.
    val scratch = result!!.namedRegisters().single()
    controlShape(scratch != read.chat, "the translate bar's tap overwrites the chat screen")
    return AlwaysBarEdit(method) { target ->
        target.addInstructionsWithLabels(read.next, """
            invoke-static/range {v${read.chat} .. v${read.chat}}, $BAR_TAPPED
            move-result v$scratch
            if-eqz v$scratch, :hush_bar_stock
            return-void
        """, ExternalLabel("hush_bar_stock", target.getInstruction(read.next)))
    }
}

/** The close goes on to Telegram's own code either way, which rests the bar and lays the chat out. */
private fun closeEdit(method: MutableMethod, screen: String): AlwaysBarEdit {
    val read = screenRead(method, screen, "the translate bar's close")
    val next = method.controlBody()[read.next]
    controlShape(next.opcode == Opcode.INVOKE_STATIC && read.chat in next.namedRegisters(), "the translate bar's close no longer goes on with the chat screen")
    return AlwaysBarEdit(method) { target ->
        target.addInstructions(read.next, "invoke-static/range {v${read.chat} .. v${read.chat}}, $BAR_CLOSED")
    }
}

private fun BytecodePatchContext.barStubs(screen: String, dialogGetter: String, accountGetter: String): List<AlwaysBarStub> {
    controlMembers(TRANSLATE_CONTROLLER, "isDialogTranslatable(J)Z", "isFeatureAvailable(J)Z", "setHideTranslateDialog(JZZ)V")
    controlMembers(BAR_BASE, "getUserConfig()$BAR_ACCOUNT")
    controlMembers(BAR_ACCOUNT, "getClientUserId()J")
    controlMembers(BAR_MESSAGES, "static getInstance(I)$BAR_MESSAGES", "getTranslateController()$TRANSLATE_CONTROLLER")
    controlMembers(BAR_DIALOGS, "static isEncryptedDialog(J)Z")
    return listOf(
        AlwaysBarStub("stockOffered", 3, controllerBridge(BAR_OFFERED)),
        AlwaysBarStub("available", 3, controllerBridge(BAR_AVAILABLE)),
        // Hidden, and Telegram tells the chat screen, which lays the bar out again.
        AlwaysBarStub("hideDialog", 5, """
            check-cast p0, $TRANSLATE_CONTROLLER
            const/4 v0, 0x1
            const/4 v1, 0x0
            invoke-virtual {p0, p1, p2, v0, v1}, $BAR_HIDE
            return-void
        """),
        AlwaysBarStub("chatController", 2, """
            check-cast p0, $screen
            invoke-virtual {p0}, $accountGetter
            move-result v0
            invoke-static {v0}, $BAR_MESSAGES->getInstance(I)$BAR_MESSAGES
            move-result-object v0
            invoke-virtual {v0}, $BAR_MESSAGES->getTranslateController()$TRANSLATE_CONTROLLER
            move-result-object v0
            return-object v0
        """),
        AlwaysBarStub("chatDialog", 3, """
            check-cast p0, $screen
            invoke-virtual {p0}, $dialogGetter
            move-result-wide v0
            return-wide v0
        """),
        AlwaysBarStub("controllerOwner", 3, """
            check-cast p0, $TRANSLATE_CONTROLLER
            invoke-virtual {p0}, $BAR_BASE->getUserConfig()$BAR_ACCOUNT
            move-result-object v0
            invoke-virtual {v0}, $BAR_ACCOUNT->getClientUserId()J
            move-result-wide v0
            return-wide v0
        """),
        AlwaysBarStub("encrypted", 2, """
            invoke-static {p0, p1}, $BAR_DIALOGS->isEncryptedDialog(J)Z
            move-result p0
            return p0
        """),
    )
}
