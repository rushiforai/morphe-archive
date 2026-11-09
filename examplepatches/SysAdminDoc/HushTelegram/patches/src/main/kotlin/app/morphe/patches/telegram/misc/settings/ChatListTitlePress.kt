/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.settings

import app.morphe.util.names.origRef
import app.morphe.util.names.loadsInt
import app.morphe.util.names.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.util.ControlFlow
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

private const val VIEW = "Landroid/view/View;"
private const val CONTEXT = "Landroid/content/Context;"
private const val TEXT = "Ljava/lang/CharSequence;"
private const val LOGO = "Lorg/telegram/messenger/R\$drawable;->telegram_logo_2:I"

/** How far past the logo read the chat list's title setter may sit. Both fixtures have it 38 in. */
private const val SETTER_REACH = 80

internal const val WATCH_TITLE = "$ENTRY->watchChatListTitle($VIEW)V"

/**
 * The chat list's top bar, right after the chat list makes Telegram's logo its title: [after] is
 * the index just past that title setter in [method], and [bar] the register holding the bar there.
 */
internal class ChatListTitleSite(val method: MutableMethod, val after: Int, val bar: Int)

/**
 * Telegram's chat list has no logo button. Its createView reads Telegram's logo once, puts it as an
 * ImageSpan over the app name and makes that the title of the screen's action bar, so that title
 * stands in for a logo. Nothing else in the chat list reads the logo.
 */
internal fun BytecodePatchContext.resolveChatListTitle(): ChatListTitleSite {
    val watch = tgMutableClassDefBy(ENTRY).methods.filter { it.origName == "watchChatListTitle" }
    titleShape(watch.size == 1 && watch.single().parameterTypes.map(CharSequence::toString) == listOf(VIEW) &&
        watch.single().origReturnType == "V" && AccessFlags.PUBLIC.isSet(watch.single().accessFlags) &&
        AccessFlags.STATIC.isSet(watch.single().accessFlags), "the extension has no watchChatListTitle(View)")

    val screens = mutableListOf<Method>()
    classDefForEach { owner ->
        if (!owner.origType.startsWith(EXTENSION_ROOT)) owner.methods.filterTo(screens) { method ->
            method.origName == "createView" && method.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT) &&
                method.origReturnType == VIEW && method.body().any { it.reference() == LOGO }
        }
    }
    titleShape(screens.size == 1, "the logo is read by ${screens.size} screens instead of the chat list alone")
    val create = tgMutableClassDefBy(screens.single().definingClass).methods.single { it.origName == "createView" &&
        it.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT) && it.origReturnType == VIEW }
    val body = create.body()
    val reads = body.indices.filter { body[it].reference() == LOGO }
    titleShape(reads.size == 1 && body[reads.single()].loadsInt(), "the chat list reads its logo more than once")
    val logo = reads.single()

    // The first call after the logo that hands a CharSequence and one more value to a void method:
    // the spans and bounds in between take other arguments.
    val setterAt = (logo + 1 until minOf(body.size, logo + SETTER_REACH)).firstOrNull { at ->
        val call = body[at].call()
        body[at].opcode == Opcode.INVOKE_VIRTUAL && call != null && call.origReturnType == "V" &&
            call.parameterTypes.size == 2 && call.parameterTypes.first().toString() == TEXT
    } ?: refuseTitle("no title setter follows the logo")
    val setter = body[setterAt].call()!!
    val bar = body[setterAt].namedRegisters().first()
    val loadAt = (logo until setterAt).lastOrNull { body[it].writesRegister(bar) } ?: refuseTitle("the title's bar is never loaded")
    val load = body[loadAt]
    val field = (load as? ReferenceInstruction)?.reference as? FieldReference
    titleShape(load.opcode == Opcode.IGET_OBJECT && field != null && field.origName == "actionBar" &&
        field.origType == setter.origDefiningClass, "the logo is no longer the title of the screen's action bar")
    val chain = superclassChain(setter.definingClass).toList()
    titleShape(chain.last().startsWith("Landroid/widget/") || chain.last().startsWith("Landroid/view/"),
        "the action bar is no longer a View")

    // Between the bar's load and the setter nothing jumps in, so the register still holds the bar
    // when the setter returns. A path that jumps to the instruction after the setter keeps going
    // there, past the added call, because the call goes in without that instruction's label.
    val flow = ControlFlow.of(create)
    for (at in body.indices) if (at !in loadAt until setterAt) {
        titleShape(flow.normal[at].none { it in loadAt + 1..setterAt }, "a branch lands between the bar's load and the title setter")
    }
    titleShape(setterAt + 1 < body.size, "the title setter ends the method")
    return ChatListTitleSite(create, setterAt + 1, bar)
}

/**
 * Hands the chat list's top bar to the extension right after Telegram makes its logo the title, so
 * a long press on the title opens the HushTelegram screen. Optional: when the chat list no longer
 * has that shape, the patch says so and the other ways into settings carry on.
 */
internal val chatListTitlePressPatch = bytecodePatch {
    dependsOn(telegramExtensionPatch)

    execute {
        val site = try {
            resolveChatListTitle()
        } catch (changed: PatchException) {
            patchLog.warning("HushTelegram settings: a long press on the chat list title can't open the settings " +
                "(${changed.message}). The launcher shortcut, Android App info and Telegram's settings row still do.")
            return@execute
        }
        site.method.addInstruction(site.after, "invoke-static/range { v${site.bar} .. v${site.bar} }, $WATCH_TITLE")
    }
}

private fun Instruction.writesRegister(register: Int): Boolean {
    val destination = namedRegisters().firstOrNull() ?: return false
    return opcode.setsRegister() && (destination == register || opcode.setsWideRegister() && destination + 1 == register)
}
private fun Instruction.reference(): String? = origRef()?.takeIf { "->" in it && "(" !in it }
private fun Method.body() = implementation?.instructions?.toList().orEmpty()
private fun titleShape(valid: Boolean, reason: String) { if (!valid) refuseTitle(reason) }
private fun refuseTitle(reason: String): Nothing = throw PatchException("chat list title: $reason")
