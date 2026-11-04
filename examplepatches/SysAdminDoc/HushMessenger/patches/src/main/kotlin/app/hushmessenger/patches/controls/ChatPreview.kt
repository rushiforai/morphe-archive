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

/** Meta's server flag for the preview, as 586 numbers it. */
internal const val CHAT_PREVIEW_FLAG = 0x1010535000040deL

/** The second flag the handler asks for end-to-end encrypted chats, as 586 numbers it. */
internal const val CHAT_PREVIEW_ENCRYPTED_FLAG = 0x101055b0000432fL

internal const val CHAT_PREVIEW_HELPER = "$SETTINGS->chatPreview(Z)Z"

private val CHAT_PREVIEW_FLAGS = setOf(CHAT_PREVIEW_FLAG, CHAT_PREVIEW_ENCRYPTED_FLAG)

/** One flag read: which flag, the move-result that takes the answer and the register it fills. */
internal class ChatPreviewSite(val flag: Long, val result: Int, val register: Int)

private fun Method.buildsChatPreview() = implementation?.instructions?.any {
    it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == CHAT_PREVIEW_FRAGMENT
} == true

/**
 * Each read loads its flag into a register pair, passes the pair as the last two arguments of a static boolean (…J)Z
 * check, moves the answer into a register and branches on it with if-eqz. Nothing may jump into that sequence, so the
 * branch always sees the flag's answer. The preview flag is read once and the encrypted-chat flag at least once; any
 * other shape refuses the switch.
 */
internal fun Method.chatPreviewSites(): List<ChatPreviewSite> {
    fun refuse(): Nothing = throw PatchException("Messenger controls: the chat preview check in ${hookId()} no longer matches the tested build")
    val code = implementation?.instructions?.toList() ?: refuse()
    if (!buildsChatPreview()) refuse()
    val targets = jumpTargets()
    val sites = code.indices.filter { at ->
        code[at].opcode == Opcode.CONST_WIDE && (code[at] as WideLiteralInstruction).wideLiteral in CHAT_PREVIEW_FLAGS
    }.map { at ->
        val pair = (code[at] as OneRegisterInstruction).registerA
        val invoke = code.getOrNull(at + 1) as? FiveRegisterInstruction ?: refuse()
        val check = (invoke as ReferenceInstruction).reference as? MethodReference ?: refuse()
        val arguments = listOf(invoke.registerC, invoke.registerD, invoke.registerE, invoke.registerF, invoke.registerG).take(invoke.registerCount)
        val result = code.getOrNull(at + 2)
        val branch = code.getOrNull(at + 3)
        if (invoke.opcode != Opcode.INVOKE_STATIC || check.returnType != "Z" || check.parameterTypes.lastOrNull()?.toString() != "J" ||
            arguments.size < 2 || arguments.takeLast(2) != listOf(pair, pair + 1) || result?.opcode != Opcode.MOVE_RESULT ||
            branch?.opcode != Opcode.IF_EQZ || (branch as OneRegisterInstruction).registerA != (result as OneRegisterInstruction).registerA ||
            (at + 1..at + 3).any { it in targets }) refuse()
        ChatPreviewSite((code[at] as WideLiteralInstruction).wideLiteral, at + 2, result.registerA)
    }
    if (sites.count { it.flag == CHAT_PREVIEW_FLAG } != 1 || sites.none { it.flag == CHAT_PREVIEW_ENCRYPTED_FLAG }) refuse()
    return sites
}

/** The one method that builds the preview, taken only when its flag reads have the tested shape. */
internal fun findChatPreview(classes: Iterable<ClassDef>): List<Method> {
    val builder = classes.flatMap { cls -> cls.methods.filter { it.buildsChatPreview() } }.singleOrNull() ?: return emptyList()
    return if (runCatching { builder.chatPreviewSites() }.isSuccess) listOf(builder) else emptyList()
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
