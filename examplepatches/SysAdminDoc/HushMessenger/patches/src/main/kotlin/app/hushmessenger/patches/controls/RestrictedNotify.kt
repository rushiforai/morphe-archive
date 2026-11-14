package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Notifications for chats you restricted. Each message notification goes through a thread check that reads the chat's
 * folder off its ThreadSummary. The Other, Spam and Restricted folders end the check with no notification. Any other
 * folder goes on to the muted chat, sender and old message checks, and only the Inbox folder gets through them.
 */
internal const val RESTRICTED_NOTIFY = "restricted_notify"

/** What the thread check fails with when it can't load the chat or its sender, which names it on every build. */
private val FETCH_FAILURES = setOf("thread_summary_fetch_failed", "sender_user_fetch_failed")

/** The folder enum's constant names, which its initializer hands to the enum constructor. */
internal const val RESTRICTED_FOLDER = "RESTRICTED"
internal const val INBOX_FOLDER = "INBOX"

private const val ENUM_CLASS = "Ljava/lang/Enum;"
private const val STRING_TYPE = "Ljava/lang/String;"

private val FOLDER_CHECKS = setOf(Opcode.IF_EQ, Opcode.IF_NE)
private val ENUM_CONSTRUCTORS = setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE)

private fun Instruction.writes(register: Int) = opcode.setsRegister() && this is OneRegisterInstruction &&
    (registerA == register || (opcode.setsWideRegister() && registerA + 1 == register))

private fun Instruction.arguments(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

/**
 * The thread check's folder read: [index] is the instruction after it, where the guard goes, [register] the folder it
 * fills, [type] the folder enum and [compared] the enum's static fields the check compares that folder with.
 */
internal class FolderRead(val index: Int, val register: Int, val type: String, val compared: Set<String>)

/** The enum fields compared with [folder] at each `sget-object vC, E->F` that's straight before an `if-eq`/`if-ne` on both. */
private fun List<Instruction>.folderChecks(folder: Int, type: String): Map<Int, String> =
    indices.drop(1).mapNotNull { i ->
        val check = this[i] as? TwoRegisterInstruction ?: return@mapNotNull null
        if (this[i].opcode !in FOLDER_CHECKS) return@mapNotNull null
        val other = when (folder) { check.registerA -> check.registerB; check.registerB -> check.registerA; else -> return@mapNotNull null }
        val load = this[i - 1]
        val constant = (load as? ReferenceInstruction)?.reference as? FieldReference ?: return@mapNotNull null
        if (load.opcode != Opcode.SGET_OBJECT || (load as OneRegisterInstruction).registerA != other ||
            constant.definingClass != type || constant.type != type) return@mapNotNull null
        i to constant.name
    }.toMap()

/**
 * The coroutine body of MsysNotificationParser's getThreadLevelResult: an instance invokeSuspend(Object)Object that fails
 * with both [FETCH_FAILURES]. Up to 586 it was a class of its own, getThreadLevelResult$2. 587 merges it with unrelated
 * coroutines into one class that switches on which of them it runs, so only its strings still name it.
 */
internal fun Method.isThreadCheck(): Boolean = name == "invokeSuspend" && !AccessFlags.STATIC.isSet(accessFlags) &&
    returnType == "Ljava/lang/Object;" && parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;") &&
    implementation?.instructions?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
        .orEmpty().containsAll(FETCH_FAILURES)

/**
 * The one `iget-object vF, vS, ThreadSummary->field` whose folder the check then compares with two or more constants of
 * the field's own type, with nothing writing vF again before the last of them. Nothing can land on the instruction
 * after the read, so every path that reads the folder goes through a guard placed there.
 */
internal fun Method.folderRead(): FolderRead? {
    if (!isThreadCheck()) return null
    val code = implementation?.instructions?.toList() ?: return null
    val reads = code.indices.mapNotNull { at ->
        if (code[at].opcode != Opcode.IGET_OBJECT) return@mapNotNull null
        val field = (code[at] as ReferenceInstruction).reference as FieldReference
        if (field.definingClass != THREAD_SUMMARY || !field.type.startsWith("L")) return@mapNotNull null
        val folder = (code[at] as OneRegisterInstruction).registerA
        val checks = code.folderChecks(folder, field.type).filterKeys { it > at }
        if (checks.size < 2 || (at + 1 until checks.keys.max()).any { code[it].writes(folder) }) return@mapNotNull null
        FolderRead(at + 1, folder, field.type, checks.values.toSet())
    }
    val read = reads.singleOrNull() ?: return null
    return read.takeIf { it.index < code.size && it.index !in jumpTargets() }
}

/**
 * An enum's constants by name, read from its initializer: the name each `E-><init>(String, ...)` call is handed as a
 * string constant, and the static E field the next `sput-object` stores the new constant in. Empty for a class that
 * isn't an enum.
 */
internal fun ClassDef.enumConstantFields(): Map<String, String> {
    if (superclass != ENUM_CLASS) return emptyMap()
    val init = methods.firstOrNull { it.name == "<clinit>" }?.implementation?.instructions ?: return emptyMap()
    val held = mutableMapOf<Int, String>()
    val constants = mutableMapOf<String, String>()
    var named: String? = null
    for (i in init) {
        val reference = (i as? ReferenceInstruction)?.reference
        when {
            reference is StringReference && i is OneRegisterInstruction -> held[i.registerA] = reference.string
            reference is MethodReference && i.opcode in ENUM_CONSTRUCTORS && reference.definingClass == type &&
                reference.name == "<init>" && reference.parameterTypes.firstOrNull()?.toString() == STRING_TYPE ->
                named = i.arguments().getOrNull(1)?.let(held::get)
            reference is FieldReference && i.opcode == Opcode.SPUT_OBJECT && reference.definingClass == type && reference.type == type -> {
                named?.let { constants.putIfAbsent(it, reference.name) }
                named = null
            }
            i is OneRegisterInstruction && i.opcode.setsRegister() -> {
                held.remove(i.registerA)
                if (i.opcode.setsWideRegister()) held.remove(i.registerA + 1)
            }
        }
    }
    return constants
}

/**
 * The thread check, taken when its folder read compares the folder with both the Restricted and the Inbox constant of
 * the app's one class of that type, an enum.
 */
internal fun findRestrictedNotify(classes: Iterable<ClassDef>): List<Method> {
    val gate = classes.flatMap { it.methods }.filter { it.isThreadCheck() }.singleOrNull() ?: return emptyList()
    val read = gate.folderRead() ?: return emptyList()
    val folders = classes.filter { it.type == read.type }.singleOrNull()?.enumConstantFields() ?: return emptyList()
    val restricted = folders[RESTRICTED_FOLDER] ?: return emptyList()
    val inbox = folders[INBOX_FOLDER] ?: return emptyList()
    return if (restricted in read.compared && inbox in read.compared) listOf(gate) else emptyList()
}

/** Log chats that don't notify puts the same guard in, so either control finds it already there. */
internal fun MutableMethod.validateRestrictedNotify() {
    if (!folderRouted() && folderRead() == null) {
        throw PatchException("Messenger controls: the notification check's folder read changed in ${hookId()}")
    }
}

/**
 * Right after the read, the folder goes through the extension and comes back as the same enum. While the switch is on a
 * Restricted folder comes back as Inbox, so the rest of the check treats the chat like any inbox chat: a muted chat stays
 * quiet and the other checks still run. Every other folder, and Off, Pause and safe mode, keep Messenger's own.
 */
internal fun MutableMethod.injectRestrictedNotify() {
    validateRestrictedNotify()
    if (folderRouted()) return
    val site = folderRead()!!
    val folder = "v${site.register}"
    addInstructions(site.index, """
        invoke-static/range {$folder .. $folder}, $SETTINGS->notificationFolder(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object $folder
        check-cast $folder, ${site.type}
    """.trimIndent())
}
