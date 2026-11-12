/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.textdirection

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.names.TelegramNames
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.numberOfParameterRegisters
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val TEXT_DIRECTION = "$EXTENSION_PACKAGE/misc/TextDirection;"
internal const val EDIT_TEXT = "Lorg/telegram/ui/Components/EditTextBoldCursor;"
private const val MENU = "$TEXT_DIRECTION->menu(Ljava/lang/Object;Landroid/view/ActionMode;)V"
private const val CHOSEN = "$TEXT_DIRECTION->chosen(Ljava/lang/Object;I)Z"
private const val CALLBACK = "Landroid/view/ActionMode\$Callback;"
private const val ACTION_MODE = "Landroid/view/ActionMode;"
private const val MENU_ITEM = "Landroid/view/MenuItem;"
private const val FINISH = "$ACTION_MODE->finish()V"
private const val START = "startActionMode"
private const val OBJECT = "Ljava/lang/Object;"

/** The extension's item numbers, after My messages', which the box's own text menu may never use. */
internal val TEXT_DIRECTION_ITEMS = listOf(0x48545409, 0x4854540A, 0x4854540B)

@Suppress("unused")
val textDirectionPatch = bytecodePatch(
    name = "Text direction",
    description = "Adds Right to left, Left to right and Control character to the text menu of the message box, so you can set " +
        "which way a line reads or add an invisible Unicode mark. Starts off. Turn it on in HushTelegram settings > Conversations.",
    default = true,
) {
    category("Writing")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveTextDirection()
        // Assembled on copies first, so a refusal leaves the app untouched.
        for (start in site.starts) insertMenu(MutableMethod(ImmutableMethod.of(start)))
        insertChosen(MutableMethod(ImmutableMethod.of(site.choose)))
        for (start in site.starts) insertMenu(start)
        insertChosen(site.choose)
        enableStatus("textDirection")
    }
}

/**
 * The message box [box], its two startActionMode overrides [starts], and [choose], the box's own
 * method each chosen item of its text menu goes to first.
 */
internal class TextDirectionSite(val box: String, val starts: List<MutableMethod>, val choose: MutableMethod)

/** The menu the box started is handed to the extension just before the box returns it. */
internal fun insertMenu(target: MutableMethod) {
    val body = target.controlBody()
    val at = body.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
    val self = target.implementation!!.registerCount - target.numberOfParameterRegisters
    val mode = (body[at] as OneRegisterInstruction).registerA
    target.addInstructionsAtControlFlowLabel(at, "invoke-static {v$self, v$mode}, $MENU")
}

/** The chosen item goes to the extension first, and its own items stop there. */
internal fun insertChosen(target: MutableMethod) {
    val first = target.implementation!!.registerCount - 2
    target.addInstructionsWithLabels(0, """
        invoke-static/range {v$first .. v${first + 1}}, $CHOSEN
        move-result v0
        if-eqz v0, :hush_stock
        return v0
    """, ExternalLabel("hush_stock", target.getInstruction(0)))
}

/**
 * Telegram's message and caption box overrides both startActionMode overloads of its editor base,
 * wrapping the menu's callback in one that hands each chosen item to the box first and closes the
 * menu when the box took it. The overrides are where the box's text menu is finished, and the
 * box's method that wrapper asks is where its items are handled.
 */
internal fun BytecodePatchContext.resolveTextDirection(): TextDirectionSite {
    requireStatusMethod("textDirection")
    controlHook(TEXT_DIRECTION, "menu", listOf(OBJECT, ACTION_MODE), "V")
    controlHook(TEXT_DIRECTION, "chosen", listOf(OBJECT, "I"), "Z")
    val base = TelegramNames.of(this).type(EDIT_TEXT)

    val boxes = mutableListOf<Pair<String, MethodReference>>()
    forEachClassMentioning(Mention.member(EDIT_TEXT, START)) { cls ->
        if (cls.type == base || base !in superclassChain(cls.type).drop(1)) return@forEachClassMentioning
        val starts = cls.methods.filter { it.isStart() }
        if (starts.size != 2) return@forEachClassMentioning
        val wrappers = starts.map { it.wrapper(cls.type, base) }.distinct()
        val wrapper = wrappers.singleOrNull() ?: return@forEachClassMentioning
        chooser(wrapper, cls.type)?.let { boxes += cls.type to it }
    }
    val (box, chosen) = boxes.controlSingle("the message box's text menu")
    val boxClass = tgMutableClassDefBy(box)
    val starts = boxClass.methods.filter { it.isStart() }
    for (start in starts) {
        val body = start.controlBody()
        val at = body.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
        val self = start.implementation!!.registerCount - start.numberOfParameterRegisters
        val mode = (body[at] as OneRegisterInstruction).registerA
        // The box itself is never overwritten, so the register still holds it at the return.
        controlShape(body.take(at).none { it.writes(self) }, "the box's startActionMode reuses its own register")
        controlShape(self <= 15 && mode <= 15, "the box's startActionMode has no room for the extension's call")
    }
    val choose = boxClass.methods.filter {
        it.name == chosen.name && it.parameterTypes.map(CharSequence::toString) == listOf("I") && it.returnType == "Z"
    }.controlSingle("the box's chosen-item method")
    controlShape(!AccessFlags.STATIC.isSet(choose.accessFlags) && choose.implementation!!.registerCount > 2,
        "the box's chosen-item method has no spare register")
    val handled = choose.controlBody()
    controlShape(handled.filterIsInstance<SwitchPayload>().none { p -> p.switchElements.any { it.key in TEXT_DIRECTION_ITEMS } } &&
        handled.none { (it as? NarrowLiteralInstruction)?.narrowLiteral in TEXT_DIRECTION_ITEMS },
        "the box's text menu already uses the extension's numbers")
    return TextDirectionSite(box, starts, choose)
}

private fun Method.isStart() = name == START && returnType == ACTION_MODE && !AccessFlags.STATIC.isSet(accessFlags) &&
    parameterTypes.map(CharSequence::toString) in listOf(listOf(CALLBACK), listOf(CALLBACK, "I"))

private fun Instruction.writes(register: Int): Boolean {
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    return opcode.setsRegister() && written == register || opcode.setsWideRegister() && written + 1 == register
}

/**
 * The class this override wraps the callback in, built from the box and the callback, when the
 * override then hands the wrapped callback to the base's own startActionMode and returns its menu.
 */
private fun Method.wrapper(box: String, base: String): String? {
    val body = controlBody().filter { it.opcode != Opcode.NOP }
    if (body.size < 3 || body.count { it.opcode == Opcode.RETURN_OBJECT } != 1) return null
    val (call, result, end) = body.takeLast(3)
    val target = call.call() ?: return null
    if (call.opcode != Opcode.INVOKE_SUPER && call.opcode != Opcode.INVOKE_SUPER_RANGE) return null
    if (target.definingClass != base || target.name != START ||
        target.parameterTypes.map(CharSequence::toString) != parameterTypes.map(CharSequence::toString)) return null
    if (result.opcode != Opcode.MOVE_RESULT_OBJECT || end.opcode != Opcode.RETURN_OBJECT ||
        (result as OneRegisterInstruction).registerA != (end as OneRegisterInstruction).registerA) return null
    return body.mapNotNull { it.call() }.filter {
        it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(box, CALLBACK)
    }.map { it.definingClass }.distinct().singleOrNull()
}

/**
 * The box's method [wrapper]'s onActionItemClicked asks with the item's number, which closes the
 * menu when it answers yes.
 */
private fun BytecodePatchContext.chooser(wrapper: String, box: String): MethodReference? {
    val clicked = tgClassDefByOrNull(wrapper)?.methods?.singleOrNull {
        it.name == "onActionItemClicked" && it.returnType == "Z" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(ACTION_MODE, MENU_ITEM)
    } ?: return null
    val body = clicked.controlBody().filter { it.opcode != Opcode.NOP }
    return body.indices.mapNotNull { i ->
        val asked = body[i].call()?.takeIf {
            it.definingClass == box && it.returnType == "Z" && it.parameterTypes.map(CharSequence::toString) == listOf("I")
        } ?: return@mapNotNull null
        asked.takeIf {
            body.getOrNull(i + 1)?.opcode == Opcode.MOVE_RESULT && body.getOrNull(i + 2)?.opcode == Opcode.IF_EQZ &&
                body.getOrNull(i + 3)?.controlRef() == FINISH
        }
    }.distinctBy { it.toString() }.singleOrNull()
}
