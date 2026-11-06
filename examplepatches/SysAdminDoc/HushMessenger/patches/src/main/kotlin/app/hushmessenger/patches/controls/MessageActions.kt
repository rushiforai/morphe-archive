package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * The order of the actions you get by holding a message, and which ones show (#144). Messenger builds the whole list
 * for the held message in one method, then cuts it into the row under the message (the first few plus More) and the
 * More sheet's list. The extension reorders the whole list just before that cut, so both parts follow the saved order.
 * The More sheet sorts its list again when Messenger's own sheet order is on, so the extension puts its order back there.
 */
internal const val MESSAGE_ACTIONS = "message_actions"
internal const val MESSAGE_ACTIONS_MORE = "message_actions_more"
internal const val MESSAGE_ACTIONS_HOST = "Lapp/hushmessenger/extension/MessageActions;"
internal const val MESSAGE_ACTIONS_ARRANGE = "$MESSAGE_ACTIONS_HOST->arrange(Ljava/util/List;I)Ljava/util/List;"
internal const val MESSAGE_ACTIONS_REORDER = "$MESSAGE_ACTIONS_HOST->more(Ljava/util/List;Ljava/util/List;)Ljava/util/List;"

/** The key the held message's action list is logged under, which only the method that builds it names. */
internal const val MESSAGE_ACTIONS_MARK = "menuItems"
private const val ACTIONS_COPY = "Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;"
private const val ACTIONS_LIST = "Lcom/google/common/collect/ImmutableList;"
private const val ACTIONS_LIST_BUILDER = "Lcom/google/common/collect/ImmutableList\$Builder;"
private const val ACTIONS_ENUM_MAP = "Ljava/util/EnumMap;"
private val ACTIONS_MOVES = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

private fun Instruction.actionRef() = (this as? ReferenceInstruction)?.reference
private fun Instruction.actionField() = actionRef() as? FieldReference
private fun Instruction.actionCall() = actionRef() as? MethodReference
private fun Instruction.actionString() = (actionRef() as? StringReference)?.string
private fun Method.actionCode() = implementation?.instructions?.toList().orEmpty()
private fun Instruction.actionArgs(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}
private fun Instruction.actionWrites(register: Int) = this is OneRegisterInstruction &&
    (opcode.setsRegister() && registerA == register || opcode.setsWideRegister() && registerA + 1 == register)
private fun Instruction.actionMoveSource(): Int? = if (opcode in ACTIONS_MOVES) (this as TwoRegisterInstruction).registerB else null

/** Whether any try block covers the instruction at [index], since a handler there could read a register the hook uses. */
private fun Method.actionCovered(index: Int): Boolean {
    val address = actionCode().take(index).sumOf { it.codeUnits }
    return implementation!!.tryBlocks.any { address >= it.startCodeAddress && address < it.startCodeAddress + it.codeUnitCount }
}

private class ActionsBarSite(val at: Int, val list: Int, val scratch: Int, val held: Int, val sizeCall: String, val sizeOnInterface: Boolean,
    val holdType: String, val sentField: String, val sentCall: String)

/**
 * The method that builds a held message's actions: an instance method of (held message, EnumMap) that names
 * [MESSAGE_ACTIONS_MARK]. Its only copy that's measured right away is the full list just before the cut: copyOf, its
 * result, its size, and a compare against how many fit in the row. The size's result register is free at the size call,
 * the held message is still in its parameter register, and the message's own sent flag is the boolean read off it as
 * (held message cast to its row type).field.call().
 */
private fun Method.actionsBarSite(): ActionsBarSite? {
    if (AccessFlags.STATIC.isSet(accessFlags) || !returnType.startsWith("L") || parameterTypes.size != 2 ||
        parameterTypes[1].toString() != ACTIONS_ENUM_MAP) return null
    val code = actionCode()
    if (code.none { it.actionString() == MESSAGE_ACTIONS_MARK }) return null
    val copy = code.indices.singleOrNull { i ->
        code[i].actionRef()?.toString() == ACTIONS_COPY && code.getOrNull(i + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
            code.getOrNull(i + 2)?.actionCall()?.let { it.name == "size" && it.returnType == "I" && it.parameterTypes.isEmpty() } == true
    } ?: return null
    val list = (code[copy + 1] as OneRegisterInstruction).registerA
    val at = copy + 2
    val size = code[at]
    if (size.opcode != Opcode.INVOKE_VIRTUAL && size.opcode != Opcode.INVOKE_INTERFACE || size.actionArgs() != listOf(list)) return null
    val result = code.getOrNull(at + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT } as? OneRegisterInstruction ?: return null
    val scratch = result.registerA
    val compare = code.getOrNull(at + 2) as? TwoRegisterInstruction ?: return null
    if (code[at + 2].opcode != Opcode.IF_LE || compare.registerA != scratch) return null
    if (list > 15 || scratch > 15 || list == scratch || actionCovered(at)) return null
    val held = parameterRegister(1)
    if (code.any { it.actionWrites(held) }) return null

    // A copy of the held message, made straight from its parameter or from one earlier copy of it.
    fun copiesHeld(move: Int): Boolean {
        val source = code.getOrNull(move)?.actionMoveSource() ?: return false
        if (source == held) return true
        val first = code.indices.firstOrNull { code[it].actionWrites(source) } ?: return false
        return first < move && code[first].actionMoveSource() == held
    }
    val reads = code.indices.filter { j ->
        if (j < 1 || j + 3 >= code.size || code[j].opcode != Opcode.CHECK_CAST) return@filter false
        val cast = code[j] as OneRegisterInstruction
        val type = code[j].actionRef()?.toString()
        val field = code[j + 1].actionField()
        val call = code[j + 2].actionCall()
        (code[j - 1] as? OneRegisterInstruction)?.registerA == cast.registerA && copiesHeld(j - 1) &&
            code[j + 1].opcode == Opcode.IGET_OBJECT && (code[j + 1] as TwoRegisterInstruction).registerB == cast.registerA &&
            field?.definingClass == type && code[j + 2].opcode == Opcode.INVOKE_INTERFACE && call?.definingClass == field?.type &&
            call?.returnType == "Z" && call.parameterTypes.isEmpty() && code[j + 2].actionArgs() == listOf((code[j + 1] as TwoRegisterInstruction).registerA) &&
            code[j + 3].opcode == Opcode.MOVE_RESULT
    }
    val sent = reads.map { Triple(code[it].actionRef().toString(), code[it + 1].actionRef().toString(), code[it + 2].actionRef().toString()) }
        .distinct().singleOrNull() ?: return null
    return ActionsBarSite(at, list, scratch, held, size.actionRef().toString(), size.opcode == Opcode.INVOKE_INTERFACE, sent.first, sent.second, sent.third)
}

private class ActionsMoreSite(val at: Int, val list: Int, val scratch: Int, val handed: Int)

/**
 * The held message's More sheet, the one method that names [MORE_SHEET_TAG]. It reads the list it was handed off its
 * own ImmutableList field once and keeps a copy, then either sorts it into a new list or goes straight on. Both ways
 * meet at the new row builder, right after the sorted list's result, and only the skip lands there by a branch. The
 * builder's register is free before it's made, and the copy still holds the handed list there.
 */
private fun Method.actionsMoreSite(): ActionsMoreSite? {
    if (returnType != "V" || AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.size != 4) return null
    val code = actionCode()
    if (code.none { it.actionString() == MORE_SHEET_TAG }) return null
    val read = code.indices.singleOrNull {
        code[it].opcode == Opcode.IGET_OBJECT && code[it].actionField()?.definingClass == definingClass && code[it].actionField()?.type == ACTIONS_LIST
    } ?: return null
    if (read + 2 >= code.size) return null
    val list = (code[read] as TwoRegisterInstruction).registerA
    if (code[read + 1].actionMoveSource() != list) return null
    val handed = (code[read + 1] as TwoRegisterInstruction).registerA
    if (code[read + 2].opcode != Opcode.IF_EQZ && code[read + 2].opcode != Opcode.IF_NEZ) return null
    val at = code.branchTarget(read + 2)
    if (at < read + 5) return null
    val made = code[at]
    if (made.opcode != Opcode.NEW_INSTANCE) return null
    val scratch = (made as OneRegisterInstruction).registerA
    val sorted = code[at - 1]
    if (sorted.opcode != Opcode.MOVE_RESULT_OBJECT || (sorted as OneRegisterInstruction).registerA != list) return null
    val built = code[at - 2].actionCall()
    if (code[at - 2].opcode != Opcode.INVOKE_STATIC || built?.returnType != ACTIONS_LIST || built.parameterTypes.map { it.toString() } != listOf(ACTIONS_LIST_BUILDER)) return null
    if (list > 15 || scratch > 15 || setOf(list, scratch, handed).size != 3) return null
    if (code.subList(read + 2, at).any { it.actionWrites(handed) }) return null
    val landings = code.indices.count {
        code[it] is OffsetInstruction && code[it].opcode != Opcode.PACKED_SWITCH && code[it].opcode != Opcode.SPARSE_SWITCH && code.branchTarget(it) == at
    }
    if (landings != 1 || at in jumpTargets(branches = false) || actionCovered(at)) return null
    return ActionsMoreSite(at, list, scratch, handed)
}

/** The method that builds a held message's actions, or none when this build has no single one that reads as expected. */
internal fun findMessageActions(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(classes.flatMap { cls -> cls.methods.filter { it.actionsBarSite() != null } }.singleOrNull())

/** The held message's More sheet, or none. */
internal fun findMessageActionsMore(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(classes.flatMap { cls -> cls.methods.filter { it.actionsMoreSite() != null } }.singleOrNull())

internal fun MutableMethod.validateMessageActions() {
    if (actionsBarSite() == null) throw PatchException("Messenger controls: ${hookId()} isn't the method that builds a held message's actions")
}

internal fun MutableMethod.validateMessageActionsMore() {
    if (actionsMoreSite() == null) throw PatchException("Messenger controls: ${hookId()} isn't the held message's More sheet")
}

/**
 * Hands the full list to the extension on its way to the cut, with 1 for a message you sent, 0 for one you got, and -1
 * when the held thing isn't a message row. The size call is a branch target, so its slot becomes the first step and
 * every way in runs the hook. The list goes back as an ImmutableList, the type the rest of the method reads it as.
 */
internal fun MutableMethod.injectMessageActions() {
    validateMessageActions()
    val site = actionsBarSite()!!
    val s = site.scratch
    val l = site.list
    val size = if (site.sizeOnInterface) "invoke-interface" else "invoke-virtual"
    replaceInstruction(site.at, "move-object/from16 v$s, v${site.held}")
    addInstructionsWithLabels(site.at + 1, """
        instance-of v$s, v$s, ${site.holdType}
        if-nez v$s, :known
        const/4 v$s, -0x1
        goto :side
        :known
        move-object/from16 v$s, v${site.held}
        check-cast v$s, ${site.holdType}
        iget-object v$s, v$s, ${site.sentField}
        invoke-interface {v$s}, ${site.sentCall}
        move-result v$s
        :side
        invoke-static {v$l, v$s}, $MESSAGE_ACTIONS_ARRANGE
        move-result-object v$l
        invoke-static {v$l}, $ACTIONS_COPY
        move-result-object v$l
        $size {v$l}, ${site.sizeCall}
    """.trimIndent())
}

/**
 * When Messenger sorts the More sheet's list itself, hands the sorted list and the list the sheet was given to the
 * extension, which puts back the saved order. The skip lands past the hook, since its list is the one handed in.
 */
internal fun MutableMethod.injectMessageActionsMore() {
    validateMessageActionsMore()
    val site = actionsMoreSite()!!
    addInstructions(site.at, """
        move-object/from16 v${site.scratch}, v${site.handed}
        invoke-static {v${site.list}, v${site.scratch}}, $MESSAGE_ACTIONS_REORDER
        move-result-object v${site.list}
        invoke-static {v${site.list}}, $ACTIONS_COPY
        move-result-object v${site.list}
    """.trimIndent())
}
