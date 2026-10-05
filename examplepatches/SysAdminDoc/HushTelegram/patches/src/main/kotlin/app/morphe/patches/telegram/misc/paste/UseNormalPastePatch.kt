/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.paste

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.*
import app.morphe.patches.telegram.misc.localcontrols.*
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val NORMAL_PASTE = "$EXTENSION_PACKAGE/misc/NormalPaste;"
private const val HTML = "Landroid/content/ClipData\$Item;->getHtmlText()Ljava/lang/String;"

@Suppress("unused")
val useNormalPastePatch = bytecodePatch(
    name = "Use normal paste",
    description = "Adds a switch, off by default, that pastes text with Android's plain-text action. Whitespace and URLs stay intact without Telegram's HTML, table or monospace conversion. Other clipboard actions stay available.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val sites = resolveNormalPaste()
        sites.forEach { it.insert(MutableMethod(ImmutableMethod.of(it.method))) }
        sites.forEach { it.insert(it.method) }
        enableCapability("composePlainPaste")
        enableCapability("captionPlainPaste")
        enableStatus("normalPaste")
    }
}

internal data class NormalPasteSite(val method: MutableMethod, val capability: String) {
    fun insert(target: MutableMethod) = target.addInstructionsAtControlFlowLabel(0,
        "invoke-static {p0, p1}, $NORMAL_PASTE->contextMenuAction(Landroid/view/View;I)I\nmove-result p1")
}

internal fun BytecodePatchContext.resolveNormalPaste(): List<NormalPasteSite> {
    listOf("normalPaste", "composePlainPaste", "captionPlainPaste").forEach(::requireStatusMethod)
    controlHook(NORMAL_PASTE, "contextMenuAction", listOf("Landroid/view/View;", "I"), "I")
    val found = mutableListOf<Method>()
    classDefForEach { cls -> cls.methods.filterTo(found) { method ->
        method.name == "onTextContextMenuItem" && method.controlBody().any { it.controlRef() == HTML }
    } }
    controlShape(found.size == 2, "plain paste editor census changed")
    val compose = found.filter { it.controlBody().any { instruction -> instruction.controlCall()?.let {
        it.definingClass == "Lorg/telegram/messenger/MessagesController;" && it.name == "richEditorAvailable"
    } == true } }.controlSingle("compose HTML editor")
    val caption = found.filter { it != compose }.controlSingle("caption HTML editor")
    val sites = listOf(compose to "composePlainPaste", caption to "captionPlainPaste").map { (foundMethod, capability) ->
        val method = mutableClassDefBy(foundMethod.definingClass).methods.filter { it.toString() == foundMethod.toString() }.controlSingle(capability)
        controlShape(method.controlShape(listOf("I"), "Z") && method.controlCallable(false), "$capability editor changed")
        controlShape("Lorg/telegram/ui/Components/EditTextBoldCursor;" in superclassChain(method.definingClass).toList(), "$capability is no longer a Telegram editor")
        val body = method.controlBody()
        val action = method.parameterRegisterNumber(0)
        val self = method.localRegisterCount()
        controlShape(action <= 15 && self <= 15, "$capability parameter registers moved")
        val literal = body.indices.filter { body[it].opcode == Opcode.CONST && (body[it] as? NarrowLiteralInstruction)?.narrowLiteral == androidPaste }
            .controlSingle("$capability paste action")
        val branch = if (capability == "composePlainPaste") literal + 1 else literal + 3
        controlShape(literal == if (capability == "composePlainPaste") 0 else 1, "$capability paste question moved")
        controlShape(body[branch].opcode == Opcode.IF_NE && body[branch].namedRegisters() == listOf(action, body[literal].namedRegisters().single()), "$capability paste question changed")
        val fallback = body.indices.filter { body[it].opcode == Opcode.INVOKE_SUPER && body[it].controlCall()?.let {
            it.name == "onTextContextMenuItem" && it.controlShape(listOf("I"), "Z")
        } == true }.controlSingle("$capability stock clipboard fallback")
        val flow = ControlFlow.of(method)
        controlShape(fallback == body.size - 3 && (capability != "composePlainPaste" || fallback in flow.normal[branch]) &&
            body[fallback].namedRegisters() == listOf(self, action) && body[fallback + 1].opcode == Opcode.MOVE_RESULT &&
            body[fallback + 1].namedRegisters() == listOf(action) && body.last().opcode == Opcode.RETURN &&
            body.last().namedRegisters() == listOf(action), "$capability stock clipboard fallback changed")
        if (capability == "captionPlainPaste") {
            val copy = flow.normal[branch].single { it != branch + 1 }
            controlShape(body[copy].opcode == Opcode.CONST && (body[copy] as? NarrowLiteralInstruction)?.narrowLiteral == 0x1020021 &&
                body.any { it.opcode == Opcode.CONST && (it as? NarrowLiteralInstruction)?.narrowLiteral == 0x1020020 },
                "caption copy or cut dispatch changed")
        }
        controlShape(body.count { it.controlRef() == HTML } == 1 && body.any { it.controlString() == "text/html" } &&
            body.any { it.controlRef() == "Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;" }, "$capability HTML conversion changed")
        NormalPasteSite(method, capability)
    }
    return sites
}

private const val androidPaste = 0x1020022
