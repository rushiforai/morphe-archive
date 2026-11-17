package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val LOCAL_READ = "local_read"

/** The chat list's unread count snippet, whose plugin name Redex keeps on every build. */
internal const val UNREAD_SNIPPET = "Lcom/facebook/messaging/threadlist/plugins/core/threadsnippet/" +
    "unreadcount/UnreadCountSnippetImpl;"
internal const val UNREAD_PREDICATE_SIGNATURE = "($THREAD_SUMMARY)Z"
internal const val LONG_MAX = "Ljava/lang/Math;->max(JJ)J"
internal const val READ_LOCALLY_HELPER = "$SETTINGS->chatReadLocally(Ljava/lang/Object;J)Z"

private fun Instruction.localRef() = (this as? ReferenceInstruction)?.reference
private fun Method.localCode() = implementation?.instructions?.toList().orEmpty()

/**
 * Whether a chat counts as unread, which the row's bold text, its "n new messages" snippet and the Chats badge all
 * ask. The last answer it gives compares the newest message's time against the time the chat was read, and that
 * comparison is the one a chat read on this phone has to come out of as read.
 */
internal fun Method.isUnreadPredicate(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z") return false
    if (parameterTypes.map { it.toString() } != listOf(THREAD_SUMMARY)) return false
    val code = localCode()
    // The watermark comparison, the newest-message maximum, and the summary's own time fields it reads.
    if (code.count { it.opcode == Opcode.CMP_LONG } != 3) return false
    if (code.none { (it.localRef() as? MethodReference)?.toString() == LONG_MAX }) return false
    val times = code.filter { it.opcode == Opcode.IGET_WIDE }
        .mapNotNull { it.localRef() as? FieldReference }
        .filter { it.definingClass == THREAD_SUMMARY && it.type == "J" }
    return times.map { it.name }.distinct().size == 5
}

/**
 * The predicate the snippet calls, which is the one the whole chat list shares. Redex renames the class it sits on
 * every build, so it's read out of the one caller whose own name survives rather than named here.
 */
internal fun findLocalRead(classes: Iterable<ClassDef>): List<Method> {
    val snippet = classes.singleOrNull { it.type == UNREAD_SNIPPET } ?: return emptyList()
    val asked = snippet.methods.filter { it.parameterTypes.map { type -> type.toString() } == listOf(THREAD_SUMMARY) }
        .flatMap { it.localCode() }
        .filter { it.opcode == Opcode.INVOKE_STATIC }
        .mapNotNull { (it.localRef() as? MethodReference)?.takeIf { ref -> ref.signature() == UNREAD_PREDICATE_SIGNATURE } }
        .map { it.toString() }
        .distinct()
    val wanted = asked.singleOrNull() ?: return emptyList()
    return classes.flatMap { it.methods }.filter { it.hookId() == wanted && it.isUnreadPredicate() }
}

private fun MethodReference.signature() = "(${parameterTypes.joinToString("")})$returnType"

private fun localRequire(condition: Boolean, detail: String) {
    if (!condition) throw PatchException("Messenger controls: the chat list's unread check changed ($detail)")
}

/**
 * The seam right before the last comparison: the newest message's time is in a wide pair, the time the chat was read
 * in another, and the comparison overwrites the one narrow register left, so the hook borrows that one.
 */
internal class LocalReadSite(val index: Int, val answer: Int, val newest: Int, val threadKey: FieldReference)

/**
 * The comparison has to be the method's last one, reached only after the branches that answer on their own, with the
 * newest-message time coming from the maximum and the watermark straight off the summary.
 */
internal fun MutableMethod.validateLocalRead(): LocalReadSite {
    localRequire(isUnreadPredicate(), "unread predicate")
    val code = localCode()
    val index = code.indices.last { code[it].opcode == Opcode.CMP_LONG }
    val compare = code[index] as ThreeRegisterInstruction
    val answer = compare.registerA
    val newest = compare.registerC
    localRequire(answer < 16 && newest + 1 < 16, "comparison registers")
    // The maximum of the last message and the last snippet update, staged into the comparison's second pair.
    val max = index - 3
    localRequire(max > 0 && (code[max].localRef() as? MethodReference)?.toString() == LONG_MAX, "newest message time")
    localRequire(code[max + 1].opcode == Opcode.MOVE_RESULT_WIDE &&
        (code[max + 1] as OneRegisterInstruction).registerA == newest, "newest message register")
    // The watermark read, the comparison's own branch, and the false it falls through to.
    localRequire(code[index - 1].opcode == Opcode.IGET_WIDE &&
        (code[index - 1] as TwoRegisterInstruction).registerA == compare.registerB, "read watermark")
    localRequire(code[index + 1].opcode == Opcode.IF_GEZ &&
        (code[index + 1] as OneRegisterInstruction).registerA == answer, "comparison branch")
    val flow = ReadFlow(this)
    localRequire(!flow.protected(index) && !flow.protected(index + 1), "unprotected comparison")
    localRequire(jumpTargets().none { it in max..index + 1 }, "comparison seam")
    localRequire(flow.definitionsAt(index, newest) == setOf(max + 1), "newest message dataflow")
    val key = localCode().firstNotNullOfOrNull { insn ->
        (insn.localRef() as? FieldReference)?.takeIf {
            insn.opcode == Opcode.IGET_OBJECT && it.definingClass == THREAD_SUMMARY && it.type == THREAD_KEY_TYPE
        }
    }
    localRequire(key != null, "the chat's key")
    return LocalReadSite(index, answer, newest, key!!)
}

/**
 * A chat read on this phone answers read here, where every unread look ends up. The answer register is the one the
 * stock comparison writes, so the borrowed register is dead either way.
 */
internal fun MutableMethod.injectLocalRead() {
    val site = validateLocalRead()
    val answer = site.answer
    addInstructionsWithLabels(site.index, """
        iget-object v$answer, p0, ${site.threadKey.definingClass}->${site.threadKey.name}:${site.threadKey.type}
        invoke-static {v$answer, v${site.newest}, v${site.newest + 1}}, $READ_LOCALLY_HELPER
        move-result v$answer
        if-eqz v$answer, :stock_unread
        const/4 v$answer, 0x0
        return v$answer
    """.trimIndent(), ExternalLabel("stock_unread", getInstruction(site.index)))
}
