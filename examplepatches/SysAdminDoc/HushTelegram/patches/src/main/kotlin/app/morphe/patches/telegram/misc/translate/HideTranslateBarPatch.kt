/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.translate

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val TRANSLATE_BAR = "$EXTENSION_PACKAGE/misc/TranslateBar;"
internal const val TRANSLATE_CONTROLLER = "Lorg/telegram/messenger/TranslateController;"
internal const val BAR_HIDDEN = "$TRANSLATE_CONTROLLER->isTranslateDialogHidden(J)Z"
internal const val TRANSLATING = "$TRANSLATE_CONTROLLER->isTranslatingDialog(J)Z"
internal const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
private const val SWIPE_BACK = "isSwipeBackEnabled(Landroid/view/MotionEvent;)Z"

@Suppress("unused")
val hideTranslateBarPatch = bytecodePatch(
    name = "Hide translate bar",
    description = "Adds a switch, off by default, that hides the translate bar at the top of chats in another language. Translate moves to the chat's menu, and a chat you're translating keeps its bar so you can go back to the original.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val sites = resolveTranslateBar()
        // Assembled on copies first, so a refusal leaves the app untouched.
        sites.forEach { it.replace(MutableMethod(ImmutableMethod.of(it.method))) }
        writeStub(TRANSLATE_BAR, "stockHidden", 3, bridge(BAR_HIDDEN))
        writeStub(TRANSLATE_BAR, "translating", 3, bridge(TRANSLATING))
        sites.forEach { it.replace(it.method) }
        enableStatus("hideTranslateBar")
    }
}

/** A stub body that asks Telegram's translate controller [target] about the chat. */
private fun bridge(target: String) = """
    check-cast p0, $TRANSLATE_CONTROLLER
    invoke-virtual {p0, p1, p2}, $target
    move-result p0
    return p0
"""

/** One read of whether the bar is hidden on the chat screen, at instruction [index] of [method]. */
internal class TranslateBarSite(val method: MutableMethod, val index: Int) {
    /** The same registers, the controller and the chat id, go to the extension instead. */
    fun replace(target: MutableMethod) {
        val call = target.getInstruction(index)
        val registers = call.namedRegisters()
        val hook = "$TRANSLATE_BAR->hidden(Ljava/lang/Object;J)Z"
        target.replaceInstruction(index, if (call.opcode == Opcode.INVOKE_VIRTUAL_RANGE) {
            "invoke-static/range {v${registers.first()} .. v${registers.last()}}, $hook"
        } else {
            "invoke-static {${registers.joinToString { "v$it" }}}, $hook"
        })
    }
}

/**
 * TranslateController.isTranslateDialogHidden answers both the chat screen, which shows the bar when
 * it's false and the menu's Translate when it's true, and message translation, which stops when it's
 * true. Only the chat screen's reads change: every caller outside the controller and MessageObject
 * is one screen, and each reads the answer.
 */
internal fun BytecodePatchContext.resolveTranslateBar(): List<TranslateBarSite> {
    requireStatusMethod("hideTranslateBar")
    controlHook(TRANSLATE_BAR, "hidden", listOf("Ljava/lang/Object;", "J"), "Z")
    controlHook(TRANSLATE_BAR, "stockHidden", listOf("Ljava/lang/Object;", "J"), "Z")
    controlHook(TRANSLATE_BAR, "translating", listOf("Ljava/lang/Object;", "J"), "Z")

    val controller = mutableClassDefByOrNull(TRANSLATE_CONTROLLER)
    controlShape(controller != null && AccessFlags.PUBLIC.isSet(controller.accessFlags), "TranslateController is missing")
    for (wanted in listOf(BAR_HIDDEN, TRANSLATING)) {
        val method = controller!!.methods.singleOrNull { it.toString() == wanted }
        controlShape(method != null && AccessFlags.PUBLIC.isSet(method.accessFlags) && !AccessFlags.STATIC.isSet(method.accessFlags),
            "${wanted.substringAfter("->")} isn't a public TranslateController method")
    }

    val found = mutableListOf<Pair<String, Pair<String, Int>>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/") || cls.type == TRANSLATE_CONTROLLER || cls.type == MESSAGE_OBJECT) return@classDefForEach
        cls.methods.forEach { method ->
            method.controlBody().forEachIndexed { index, instruction ->
                if (instruction.controlRef() == BAR_HIDDEN) found += cls.type to ("${method.name}${method.parameterTypes.joinToString("", "(", ")")}${method.returnType}" to index)
            }
        }
    }
    controlShape(found.isNotEmpty(), "the chat screen no longer asks whether the translate bar is hidden")
    val screen = found.map { it.first }.distinct().singleOrNull()
    controlShape(screen != null, "the translate bar is read outside the chat screen (${found.map { it.first }.distinct().take(3).joinToString()})")
    val screenClass = mutableClassDefBy(screen!!)
    controlShape(screenClass.methods.any { "${it.name}${it.parameterTypes.joinToString("", "(", ")")}${it.returnType}" == SWIPE_BACK },
        "$screen isn't a screen")

    return found.map { (_, site) ->
        val (signature, index) = site
        val method = screenClass.methods.single { "${it.name}${it.parameterTypes.joinToString("", "(", ")")}${it.returnType}" == signature }
        val body = method.controlBody()
        controlShape(body[index].opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE) && body.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT,
            "the chat screen no longer reads the translate bar answer in ${method.name}")
        TranslateBarSite(method, index)
    }
}
