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

/**
 * Special contacts (#163): people picked with Track this person in a chat's long-press menu get a history of when they
 * came online, went offline and started typing. Presence comes from PresenceItem's constructor, which every presence
 * update Messenger reads goes through, and typing from the two presence managers' typing handlers.
 */
internal const val SPECIAL_CONTACTS = "special_contacts"
internal const val SPECIAL_CONTACTS_EXT = "Lapp/hushmessenger/extension/SpecialContacts;"

/** The hook takes the constructor's parameters as they are, the active flag as an int. */
internal const val PRESENCE_CALL =
    "$SPECIAL_CONTACTS_EXT->presence(Ljava/lang/Object;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;IJI)V"
internal const val TYPING_CALL = "$SPECIAL_CONTACTS_EXT->typing(Landroid/content/Intent;)V"

internal const val PRESENCE_ITEM = "Lcom/facebook/presence/model/PresenceItem;"
private const val PRESENCE_INTENT = "Landroid/content/Intent;"
private const val PRESENCE_INT_EXTRA = "Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I"

/** Both managers take the typing broadcast; which one runs depends on Messenger's config. */
internal val PRESENCE_MANAGERS = setOf("Lcom/facebook/presence/DefaultPresenceManager;", "Lcom/facebook/presence/PresenceManagerV2;")

/** The user, capability bits, proxy id, correlation id, publish id, active client bits, last active and the active flag. */
private val PRESENCE_ITEM_PARAMS = listOf(USER_KEY, "Ljava/lang/Long;", "Ljava/lang/Long;", "Ljava/lang/String;", "Ljava/lang/String;", "I", "J", "Z")

/** Parameter words after `this`: the long takes two. */
private const val PRESENCE_WORDS = 9

private fun presenceChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: Messenger's presence code changed ($detail)")

private fun Instruction.presenceRef(): String? = (this as? ReferenceInstruction)?.reference?.toString()

private fun Instruction.writesPresenceRegister(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    return written == register || (opcode.setsWideRegister() && written + 1 == register)
}

internal fun Method.isPresenceItemInit(): Boolean =
    definingClass == PRESENCE_ITEM && name == "<init>" && returnType == "V" && implementation != null &&
        !AccessFlags.STATIC.isSet(accessFlags) && parameterTypes.map { it.toString() } == PRESENCE_ITEM_PARAMS

/**
 * Where the presence hook goes: the constructor's one return-void, its last instruction. Straight-line code with no try
 * and no parameter register written, so every field it stored is still in its parameter. Null when that isn't the shape.
 */
internal fun Method.presenceReturn(): Int? {
    val code = implementation?.instructions?.toList() ?: return null
    if (code.isEmpty() || implementation!!.tryBlocks.isNotEmpty() || jumpTargets().isNotEmpty()) return null
    val last = code.lastIndex
    if (code[last].opcode != Opcode.RETURN_VOID || code.count { it.opcode == Opcode.RETURN_VOID } != 1) return null
    val first = parameterRegister(1)
    if (code.any { i -> (first until first + PRESENCE_WORDS).any(i::writesPresenceRegister) }) return null
    return last
}

/**
 * A presence manager's typing handler: its one static (Intent, the manager)V. It reads the new state with getIntExtra
 * and casts an extra to a UserKey, and nothing jumps back to its start, where the hook reads the Intent.
 */
internal fun Method.isTypingHandler(): Boolean {
    if (definingClass !in PRESENCE_MANAGERS || !AccessFlags.STATIC.isSet(accessFlags) || returnType != "V") return false
    if (parameterTypes.map { it.toString() } != listOf(PRESENCE_INTENT, definingClass)) return false
    val code = implementation?.instructions?.toList() ?: return false
    return code.any { it.opcode == Opcode.INVOKE_VIRTUAL && it.presenceRef() == PRESENCE_INT_EXTRA } &&
        code.any { it.opcode == Opcode.CHECK_CAST && it.presenceRef() == USER_KEY }
}

/**
 * PresenceItem's constructor and each manager's typing handler. Without the presence half there's nothing to track, so
 * it takes the constructor and at least one handler, each manager's only one, or nothing.
 */
internal fun findSpecialContacts(classes: Iterable<ClassDef>): List<Method> {
    val methods = classes.filter { it.type == PRESENCE_ITEM || it.type in PRESENCE_MANAGERS }.flatMap { it.methods }
    val presence = methods.filter { it.isPresenceItemInit() }
    val typing = methods.filter { it.isTypingHandler() }
    if (presence.size != 1 || presence.single().presenceReturn() == null) return emptyList()
    if (typing.isEmpty() || typing.map { it.definingClass }.toSet().size != typing.size || typing.any { 0 in it.jumpTargets() }) return emptyList()
    return presence + typing
}

internal fun MutableMethod.validateSpecialContacts() {
    when {
        isPresenceItemInit() -> presenceReturn() ?: presenceChanged("PresenceItem's constructor isn't plain in ${hookId()}")
        isTypingHandler() -> if (0 in jumpTargets()) presenceChanged("a jump back to the start of ${hookId()}")
        else -> presenceChanged("unexpected method ${hookId()}")
    }
}

/**
 * The constructor hands the extension what it stored, right before it returns, and each typing handler hands over its
 * Intent before anything else, so the extension reads the state and the user from it. Neither changes what Messenger
 * does: the extension only writes the history of people you track, and Off, Pause and safe mode write nothing.
 */
internal fun MutableMethod.injectSpecialContacts() {
    validateSpecialContacts()
    if (isPresenceItemInit()) {
        val first = parameterRegister(1)
        addInstructions(presenceReturn()!!, "invoke-static/range {v$first .. v${first + PRESENCE_WORDS - 1}}, $PRESENCE_CALL")
        return
    }
    val intent = parameterRegister(0)
    addInstructions(0, "invoke-static/range {v$intent .. v$intent}, $TYPING_CALL")
}
