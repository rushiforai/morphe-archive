package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Messenger's own chat preview: press and hold a chat and it opens a peek at the conversation with the chat's menu
 * under it, instead of the menu alone. The chat list's long-press handler builds it, but only when Meta's server says
 * so, and falls back to the plain menu otherwise. The preview's thread view is built not to mark the chat read.
 */
internal const val CHAT_PREVIEW = "chat_preview"

internal const val CHAT_PREVIEW_FRAGMENT = "Lcom/facebook/messaging/threadlist/threaditemmenu/preview/InboxThreadPreviewDialogFragment;"

/** Meta's server flag for the preview, as 587 numbers it (586 read 0x1010535000040de). */
internal const val CHAT_PREVIEW_FLAG = 0x1010536000042fdL

/** The second flag the long-press handler asks for end-to-end encrypted chats, as 587 numbers it (586 read 0x101055b0000432f). */
internal const val CHAT_PREVIEW_ENCRYPTED_FLAG = 0x101055e00004588L

internal const val CHAT_PREVIEW_HELPER = "$SETTINGS->chatPreview(Z)Z"

private val CHAT_PREVIEW_FLAGS = setOf(CHAT_PREVIEW_FLAG, CHAT_PREVIEW_ENCRYPTED_FLAG)

/** One flag read: which flag, the move-result that takes the answer and the register it fills. */
internal class ChatPreviewSite(val flag: Long, val result: Int, val register: Int)

private fun Method.buildsChatPreview() = implementation?.instructions?.any {
    it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == CHAT_PREVIEW_FRAGMENT
} == true

private fun Method.readsChatPreviewFlag() = implementation?.instructions?.any {
    it.opcode == Opcode.CONST_WIDE && (it as WideLiteralInstruction).wideLiteral == CHAT_PREVIEW_FLAG
} == true

/**
 * Each read loads its flag into a register pair, passes the pair as the last two arguments of a boolean (…J) check,
 * a static one or the config interface's right after a cast to it, and moves the answer into a register. Nothing may
 * jump into that sequence, so the answer the switch sees is the flag's. 586 branches on it at once, 587 sometimes a few
 * instructions later or with if-nez. The preview flag is read once; any other shape refuses the switch.
 */
internal fun Method.chatPreviewSites(): List<ChatPreviewSite> {
    fun refuse(): Nothing = throw PatchException("Messenger controls: the chat preview check in ${hookId()} no longer matches the tested build")
    val code = implementation?.instructions?.toList() ?: refuse()
    val targets = jumpTargets()
    val sites = code.indices.filter { at ->
        code[at].opcode == Opcode.CONST_WIDE && (code[at] as WideLiteralInstruction).wideLiteral in CHAT_PREVIEW_FLAGS
    }.map { at ->
        val pair = (code[at] as OneRegisterInstruction).registerA
        val cast = code.getOrNull(at + 1)?.takeIf { it.opcode == Opcode.CHECK_CAST }
        val callAt = if (cast == null) at + 1 else at + 2
        val invoke = code.getOrNull(callAt) as? FiveRegisterInstruction ?: refuse()
        val check = (invoke as ReferenceInstruction).reference as? MethodReference ?: refuse()
        val arguments = listOf(invoke.registerC, invoke.registerD, invoke.registerE, invoke.registerF, invoke.registerG).take(invoke.registerCount)
        val result = code.getOrNull(callAt + 1)
        val form = if (cast == null) invoke.opcode == Opcode.INVOKE_STATIC else invoke.opcode == Opcode.INVOKE_INTERFACE &&
            arguments.firstOrNull() == (cast as OneRegisterInstruction).registerA &&
            (cast as ReferenceInstruction).reference.toString() == check.definingClass
        if (!form || check.returnType != "Z" || check.parameterTypes.lastOrNull()?.toString() != "J" ||
            arguments.size < 2 || arguments.takeLast(2) != listOf(pair, pair + 1) || result?.opcode != Opcode.MOVE_RESULT ||
            (at + 1..callAt + 1).any { it in targets }) refuse()
        ChatPreviewSite((code[at] as WideLiteralInstruction).wideLiteral, callAt + 1, (result as OneRegisterInstruction).registerA)
    }
    if (sites.count { it.flag == CHAT_PREVIEW_FLAG } != 1) refuse()
    return sites
}

/**
 * Every method that reads the preview flag, but only when the one method that builds the preview reads it too, as
 * 586's long-press handler does, or a reader calls it, as 587's do: it builds the preview in a static method that the
 * long-press handler and the chat list's other preview path call after asking the flag. Taken only when every read has
 * the tested shape and one of them asks the encrypted-chat flag too.
 */
internal fun findChatPreview(classes: Iterable<ClassDef>): List<Method> {
    val builders = mutableListOf<Method>()
    val readers = mutableListOf<Method>()
    for (cls in classes) for (method in cls.methods) {
        if (method.buildsChatPreview()) builders.add(method)
        if (method.readsChatPreviewFlag()) readers.add(method)
    }
    val builder = builders.singleOrNull()?.hookId() ?: return emptyList()
    val linked = readers.any { reader ->
        reader.hookId() == builder || reader.implementation!!.instructions.any {
            (it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE) &&
                (it as ReferenceInstruction).reference.toString() == builder
        }
    }
    val sites = readers.map { runCatching { it.chatPreviewSites() }.getOrNull() ?: return emptyList() }.flatten()
    // The long-press handler also asks the encrypted-chat flag, which ties the readers to the chat list.
    if (!linked || sites.none { it.flag == CHAT_PREVIEW_ENCRYPTED_FLAG }) return emptyList()
    return readers.distinctBy { it.hookId() }
}

internal fun MutableMethod.validateChatPreview() {
    chatPreviewSites()
}

/**
 * Each answer passes through the extension, which can only turn a no into a yes. The rest of the handler still runs
 * as Messenger wrote it, so a chat it can't preview still gets the plain menu. Later reads go first.
 */
internal fun MutableMethod.injectChatPreview() {
    for (site in chatPreviewSites().asReversed()) addInstructions(site.result + 1, """
        invoke-static/range {v${site.register} .. v${site.register}}, $CHAT_PREVIEW_HELPER
        move-result v${site.register}
    """.trimIndent())
}
