package app.hushmessenger.patches.controls

import app.hushmessenger.patches.coexist.registers
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Hide call buttons where 587 lists call buttons outside a chat's top bar (#146, #172): a business chat's call bar and
 * the New message screen. Both call the audio and video builders ([findCallButtonBuilt]) and hand the buttons on as a
 * list. The business bar returns an ImmutableList, which its caller shows as it is or folds into the top bar's. The New
 * message screen packs its two buttons into an array of the buttons' base type and turns that into a List. The hook
 * passes each list through the extension, which drops the call buttons while the switch is on. The top bar calls the
 * builders too, but returns no list and packs no array, and [HIDE_CALL_BAR] already sees its buttons.
 */
internal const val HIDE_CALL_LISTS = "hide_call_lists"
internal const val CALL_BUTTONS_WITHOUT = "Lapp/hushmessenger/extension/CallButtons;->without(Ljava/util/List;)Ljava/util/List;"
private const val CALL_LIST_COPY = "$IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST"
private const val OBJECT_ARRAY = "[Ljava/lang/Object;"
private const val LIST = "Ljava/util/List;"

/** The register a method returns its ImmutableList in: its only return, which nothing jumps to. Null for any other method. */
internal fun Method.callListReturn(): Int? {
    if (returnType != IMMUTABLE_LIST) return null
    val code = implementation?.instructions?.toList() ?: return null
    val at = code.indices.filter { code[it].opcode == Opcode.RETURN_OBJECT }.singleOrNull() ?: return null
    if (at in jumpTargets()) return null
    return (code[at] as OneRegisterInstruction).registerA.takeIf { it <= 255 }
}

/**
 * Where a method turns call buttons into a list: a filled array of [element] (any object type when null, as validation
 * asks of a method discovery already matched), taken straight into a static call that takes an Object array and returns a
 * List. The index is the move-result that takes the list. Null unless there is exactly one such site and nothing jumps
 * into it or onto the instruction after it, where the hook goes.
 */
internal fun Method.callListArray(element: String? = null): Int? {
    val code = implementation?.instructions?.toList() ?: return null
    val sites = code.indices.filter { i ->
        val fill = code[i]
        val type = ((fill as? ReferenceInstruction)?.reference as? TypeReference)?.type
        if (fill.opcode != Opcode.FILLED_NEW_ARRAY && fill.opcode != Opcode.FILLED_NEW_ARRAY_RANGE) return@filter false
        if (type == null || !type.startsWith("[L") || (element != null && type != "[$element")) return@filter false
        val array = code.getOrNull(i + 1)
        val call = code.getOrNull(i + 2)
        val list = code.getOrNull(i + 3)
        val ref = (call as? ReferenceInstruction)?.reference as? MethodReference
        array?.opcode == Opcode.MOVE_RESULT_OBJECT && list?.opcode == Opcode.MOVE_RESULT_OBJECT && ref != null &&
            (call.opcode == Opcode.INVOKE_STATIC || call.opcode == Opcode.INVOKE_STATIC_RANGE) &&
            ref.parameterTypes.map { it.toString() } == listOf(OBJECT_ARRAY) && ref.returnType == LIST &&
            call.registers() == listOf((array as OneRegisterInstruction).registerA)
    }
    val site = sites.singleOrNull()?.plus(3) ?: return null
    if (site + 1 >= code.size || jumpTargets().any { it in site - 2..site + 1 }) return null
    return site
}

/**
 * The business chat's call bar and the New message screen: the methods that call both call button builders and either
 * return an ImmutableList or pack the buttons' base type into an array for a List. Taken only while there is exactly one
 * of each and Messenger's ImmutableList can copy a collection, which the business bar's list goes back through.
 */
internal fun findCallButtonLists(classes: Iterable<ClassDef>, builders: List<Method>): List<Method> {
    if (builders.size != 2) return emptyList()
    val ids = builders.map { it.hookId() }.toSet()
    val owners = builders.map { it.definingClass }.toSet()
    val names = builders.map { it.name }.toSet()
    val base = builders.first().callButtonBase()
    val callers = codeReferrers(classes, methods = ids).map { it.second }.filter { m ->
        val code = m.implementation?.instructions ?: return@filter false
        code.mapNotNull { insn ->
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)
                ?.takeIf { it.definingClass in owners && it.name in names }?.toString()?.takeIf { it in ids }
        }.toSet() == ids
    }
    val lists = callers.filter { it.callListReturn() != null }
    val arrays = callers.filter { it.callListArray(base) != null }
    if (lists.size != 1 || arrays.size != 1 || lists.single() === arrays.single()) return emptyList()
    val copies = classes.firstOrNull { it.type == IMMUTABLE_LIST }?.methods?.any {
        it.hookId() == CALL_LIST_COPY && AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags)
    }
    if (copies != true) return emptyList()
    return lists + arrays
}

private fun callButtonListsChanged(method: Method): Nothing =
    throw PatchException("Messenger controls: the call button list ${method.hookId()} no longer matches the tested build")

internal fun Method.validateCallButtonLists() {
    if (callListReturn() == null && callListArray() == null) callButtonListsChanged(this)
}

/**
 * The business bar's list goes to the extension right before the return and comes back through ImmutableList.copyOf,
 * since its callers take an ImmutableList (a copy of one is the same list). The New message screen's list goes to the
 * extension right after it's made, ahead of the screen's own check that turns an empty list into none.
 */
internal fun MutableMethod.injectCallButtonLists() {
    val returned = callListReturn()
    if (returned != null) {
        val at = implementation!!.instructions.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
        addInstructions(at, """
            invoke-static/range {v$returned .. v$returned}, $CALL_BUTTONS_WITHOUT
            move-result-object v$returned
            invoke-static/range {v$returned .. v$returned}, $CALL_LIST_COPY
            move-result-object v$returned
        """.trimIndent())
        return
    }
    val site = callListArray() ?: callButtonListsChanged(this)
    val list = (implementation!!.instructions.elementAt(site) as OneRegisterInstruction).registerA
    addInstructions(site + 1, """
        invoke-static/range {v$list .. v$list}, $CALL_BUTTONS_WITHOUT
        move-result-object v$list
    """.trimIndent())
}
