/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * The Save to sheet a pin opens when you save it: your boards in a grid, the board Pinterest
 * suggests for the pin under them, then Profile. It's one fragment, and the only one that builds a
 * suggested board's cell. 14.44.0 opens it at 73 percent of the screen.
 */

/** The start of the text the suggested board's cell model reads as. */
internal const val SUGGESTED_BOARD_STATE = "SuggestedBoardItemVMState(itemId="

/** The start of the text the Save to sheet's opening height reads as, "Custom(percentage=73)" in 14.44.0. */
internal const val SHEET_HEIGHT_STATE = "Custom(percentage="

internal const val VIEW_CREATED_PARAMETERS = "Landroid/view/View;,Landroid/os/Bundle;"

private val MOVE_RESULTS = setOf(Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_RESULT_WIDE)

/** The list the suggested board goes into after your boards: the [method], the add's [index], and its [list] and [board] registers. */
internal data class SuggestedBoardAdd(val method: Method, val index: Int, val list: Int, val board: Int)

/** The suggested board cell's model: the one class whose toString starts with [SUGGESTED_BOARD_STATE]. */
internal fun BytecodePatchContext.suggestedBoardModel(what: String): String =
    methodsWithString(SUGGESTED_BOARD_STATE).filter { it.name == "toString" }.map { it.definingClass }.distinct()
        .one("$what: suggested board model")

/** Each of Pinterest's methods that builds a [type], with the index of each new-instance. The class itself is left out. */
internal fun BytecodePatchContext.builders(type: String): List<Pair<Method, Int>> {
    val sites = mutableListOf<Pair<Method, Int>>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT) || owner.type == type) return@classDefForEach
        for (method in owner.methods) {
            method.instructions().forEachIndexed { index, instruction ->
                if (instruction.opcode == Opcode.NEW_INSTANCE && builtType(instruction) == type) sites += method to index
            }
        }
    }
    return sites
}

/**
 * The Save to sheet: the one fragment that builds a suggested board's cell and lays out its own
 * view in onViewCreated(View, Bundle). The cell's loader builds one too, but it's no fragment.
 */
internal fun BytecodePatchContext.boardPicker(what: String): ClassDef =
    builders(suggestedBoardModel(what)).map { it.first.definingClass }.distinct()
        .mapNotNull { classDefByOrNull(it) }.filter { owner -> owner.viewCreated() != null }
        .one("$what: Save to sheet")

/** The Save to sheet's onViewCreated(View, Bundle), which gets the whole sheet once it's built. */
internal fun BytecodePatchContext.boardPickerViewCreated(what: String): Method =
    boardPicker(what).viewCreated() ?: throw PatchException("$what: the Save to sheet has no onViewCreated")

private fun ClassDef.viewCreated(): Method? = methods.singleOrNull {
    it.name == "onViewCreated" && it.returnType == "V" && it.implementation != null &&
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.parameters().joinToString(",") == VIEW_CREATED_PARAMETERS
}

/**
 * The method the Save to sheet's opening height is read through, in percent of the screen: the
 * one int getter of the height the sheet's fragment builds, whose toString starts with
 * [SHEET_HEIGHT_STATE]. Pinterest opens the sheet part way up for 1 to 99 and all the way for 100.
 */
internal fun BytecodePatchContext.boardPickerHeight(what: String): Method {
    val picker = boardPicker(what)
    val heights = picker.methods.flatMap { it.instructions() }.filter { it.opcode == Opcode.NEW_INSTANCE }
        .mapNotNull { builtType(it) }.distinct().mapNotNull { classDefByOrNull(it) }
        .filter { owner -> owner.methods.any { it.name == "toString" && it.strings().any { text -> text.startsWith(SHEET_HEIGHT_STATE) } } }
    val height = heights.one("$what: Save to sheet height")
    return height.methods.filter {
        it.name != "hashCode" && it.returnType == "I" && it.parameterTypes.isEmpty() && it.implementation != null &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    }.one("$what: Save to sheet height percentage")
}

/**
 * The one place the suggested board's cell goes into the list of cells: right after the cell is
 * built, a plain add(Object) whose answer nothing reads, on a list and that cell. The fragment
 * builds a cell too, but only to register its view type, and adds it nowhere.
 */
internal fun BytecodePatchContext.suggestedBoardAdd(what: String): SuggestedBoardAdd {
    val model = suggestedBoardModel(what)
    val adds = builders(model).mapNotNull { (method, at) -> addAfter(method, at, model) }
    val add = adds.one("$what: suggested board add")
    val list = (add.method.instructions()[add.index] as ReferenceInstruction).reference as MethodReference
    if (!isCollection(list.definingClass)) {
        throw PatchException("$what: the suggested board goes into ${list.definingClass}, which isn't a list")
    }
    return add
}

private fun addAfter(method: Method, at: Int, model: String): SuggestedBoardAdd? {
    val body = method.instructions()
    val built = (body[at] as OneRegisterInstruction).registerA
    val init = (at + 1 until body.size).firstOrNull { index ->
        val call = (body[index] as? ReferenceInstruction)?.reference as? MethodReference
        call != null && call.definingClass == model && call.name == "<init>"
    } ?: return null
    if (firstRegister(body[init]) != built) return null
    val add = body.getOrNull(init + 1) as? FiveRegisterInstruction ?: return null
    val call = (add as ReferenceInstruction).reference as? MethodReference ?: return null
    if (add.opcode != Opcode.INVOKE_VIRTUAL && add.opcode != Opcode.INVOKE_INTERFACE) return null
    if (call.name != "add" || call.parameters() != listOf("Ljava/lang/Object;") || call.returnType != "Z") return null
    if (add.registerCount != 2 || add.registerD != built) return null
    if (body.getOrNull(init + 2)?.opcode in MOVE_RESULTS) return null
    return SuggestedBoardAdd(method, init + 1, add.registerC, add.registerD)
}

private val COLLECTIONS = setOf(
    "Ljava/util/Collection;", "Ljava/util/List;", "Ljava/util/AbstractCollection;", "Ljava/util/AbstractList;",
    "Ljava/util/ArrayList;",
)

/** Whether [type] is one of Java's lists, or a class of the app's built on one. */
private fun BytecodePatchContext.isCollection(type: String): Boolean {
    val seen = mutableSetOf<String>()
    val queue = ArrayDeque(listOf(type))
    while (queue.isNotEmpty()) {
        val at = queue.removeFirst()
        if (at in COLLECTIONS) return true
        if (!seen.add(at)) continue
        val owner = classDefByOrNull(at) ?: continue
        owner.superclass?.let(queue::add)
        queue.addAll(owner.interfaces)
    }
    return false
}

private fun builtType(instruction: Instruction): String? =
    ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type

private fun firstRegister(instruction: Instruction): Int = when (instruction) {
    is FiveRegisterInstruction -> instruction.registerC
    is RegisterRangeInstruction -> instruction.startRegister
    else -> -1
}
