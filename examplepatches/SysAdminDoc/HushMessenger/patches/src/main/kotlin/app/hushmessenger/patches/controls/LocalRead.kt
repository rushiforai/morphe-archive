package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
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
internal const val READ_LOCALLY_HELPER = "$SETTINGS->chatReadHere(Ljava/lang/Object;Ljava/lang/Object;JI)I"

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

/**
 * Mark chats read on this phone and Mark as read stays on this phone both need a chat read here to come out as read:
 * whichever patches first puts the hook in, and the other finds it there.
 */
internal fun Method.localReadHooked() = localCode().any { it.localRef()?.toString() == READ_LOCALLY_HELPER }

private fun localRequire(condition: Boolean, detail: String) {
    if (!condition) throw PatchException("Messenger controls: the chat list's unread check changed ($detail)")
}

/**
 * The seam right after the last comparison: the newest message's time is in a wide pair, the comparison's answer in
 * a narrow register, and the time the chat was read, compared and done with, leaves its pair free for the chat's key.
 */
internal class LocalReadSite(val index: Int, val answer: Int, val newest: Int, val watermark: Int, val threadKey: FieldReference)

/**
 * The comparison has to be the method's last one, reached only after the branches that answer on their own, with the
 * newest-message time coming from the maximum and the watermark straight off the summary. Nothing may read the
 * watermark after it, since the chat's key takes its register.
 */
internal fun MutableMethod.validateLocalRead(): LocalReadSite {
    localRequire(isUnreadPredicate(), "unread predicate")
    val code = localCode()
    val index = code.indices.last { code[it].opcode == Opcode.CMP_LONG }
    val compare = code[index] as ThreeRegisterInstruction
    val answer = compare.registerA
    val newest = compare.registerC
    val watermark = compare.registerB
    localRequire(answer < 16 && newest + 1 < 16 && watermark < 16, "comparison registers")
    // The answer, the newest time and the key each keep their own register through the call.
    localRequire(answer !in newest..newest + 1 && answer !in watermark..watermark + 1 && watermark !in newest - 1..newest + 1,
        "separate comparison registers")
    // The summary goes along too, so the extension can tell a row drawn before a mark from one read back after it.
    localRequire(implementation!!.registerCount - 1 < 16, "summary register")
    // The hook reads the summary out of its parameter register, so nothing before it may have reused that register.
    localRequire(code.none { it.readWrites(implementation!!.registerCount - 1) }, "summary register reused")
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
    localRequire(flow.deadAt(index + 1, watermark) && flow.deadAt(index + 1, watermark + 1), "read watermark reused")
    val key = localCode().firstNotNullOfOrNull { insn ->
        (insn.localRef() as? FieldReference)?.takeIf {
            insn.opcode == Opcode.IGET_OBJECT && it.definingClass == THREAD_SUMMARY && it.type == THREAD_KEY_TYPE
        }
    }
    localRequire(key != null, "the chat's key")
    return LocalReadSite(index, answer, newest, watermark, key!!)
}

/**
 * A chat read on this phone answers read here, where every unread look ends up. Messenger's own answer goes along,
 * so the extension can tell a chat Messenger has unread but this phone read, which comes off the badge, from one
 * Messenger already has read. What comes back is the answer the stock branch reads next.
 */
internal fun MutableMethod.injectLocalRead() {
    if (localReadHooked()) return
    val site = validateLocalRead()
    val key = site.watermark
    addInstructions(site.index + 1, """
        iget-object v$key, p0, ${site.threadKey.definingClass}->${site.threadKey.name}:${site.threadKey.type}
        invoke-static {v$key, p0, v${site.newest}, v${site.newest + 1}, v${site.answer}}, $READ_LOCALLY_HELPER
        move-result v${site.answer}
    """.trimIndent())
}
