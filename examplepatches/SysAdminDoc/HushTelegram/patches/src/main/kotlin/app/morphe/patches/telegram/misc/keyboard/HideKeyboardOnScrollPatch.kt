/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.keyboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.settings.settingsPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val SCROLL_KEYBOARD = "$EXTENSION_PACKAGE/misc/ScrollKeyboard;"
internal const val RECYCLER_VIEW = "Landroidx/recyclerview/widget/RecyclerView;"
internal const val START_SPOILERS = "Lorg/telegram/messenger/NotificationCenter;->startSpoilers:I"
internal const val STOP_SPOILERS = "Lorg/telegram/messenger/NotificationCenter;->stopSpoilers:I"
private const val HIDE_KEYBOARD = "Lorg/telegram/messenger/AndroidUtilities;->hideKeyboard(Landroid/view/View;)V"

@Suppress("unused")
val hideKeyboardOnScrollPatch = bytecodePatch(
    name = "Hide keyboard on scroll",
    description = "Closes the on-screen keyboard when you start scrolling a chat, so you can read more. Starts off. " +
        "Turn it on in HushTelegram settings > Chats.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val listener = resolveHideKeyboardOnScroll()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        insertScrollHook(MutableMethod(ImmutableMethod.of(listener)))
        insertScrollHook(listener)
        enableStatus("hideKeyboardOnScroll")
    }
}

/** The list and its new scroll state, the listener's two parameters, go to the extension first. */
internal fun insertScrollHook(target: MutableMethod) {
    target.addInstructions(0, "invoke-static/range {p1 .. p2}, $SCROLL_KEYBOARD->chatScrolled(Landroid/view/View;I)V")
}

/**
 * The chat's message list has a scroll listener that pauses spoiler animations while the list moves
 * and starts them again when it stops, which no other list does, and that closes the keyboard while
 * you search the chat. Its scroll state method takes the list and the new state.
 */
internal fun BytecodePatchContext.resolveHideKeyboardOnScroll(): MutableMethod {
    requireStatusMethod("hideKeyboardOnScroll")
    controlHook(SCROLL_KEYBOARD, "chatScrolled", listOf("Landroid/view/View;", "I"), "V")

    val found = mutableListOf<Pair<String, String>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.forEach { method ->
            if (method.parameterTypes.map(CharSequence::toString) == listOf(RECYCLER_VIEW, "I") && method.returnType == "V" &&
                !AccessFlags.STATIC.isSet(method.accessFlags)) {
                val refs = method.controlBody().mapNotNull { it.controlRef() }.toSet()
                if (START_SPOILERS in refs && STOP_SPOILERS in refs) found += cls.type to signature(method)
            }
        }
    }
    val (type, wanted) = found.controlSingle("chat list scroll listener")
    val listener = mutableClassDefBy(type).methods.single { signature(it) == wanted }
    controlShape(listener.controlBody().any { it.controlRef() == HIDE_KEYBOARD },
        "the chat list's scroll listener no longer closes the keyboard during a search")
    return listener
}

private fun signature(method: Method) = "${method.name}${method.parameterTypes.joinToString("", "(", ")")}${method.returnType}"
