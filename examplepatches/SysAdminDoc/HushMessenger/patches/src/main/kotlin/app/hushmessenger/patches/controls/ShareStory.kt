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
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Your story in the Send to list Messenger opens when another app shares into it. It's one typed row, the class whose
 * getId() is ADD_TO_STORY_ID, and two section loaders create it: the hoisted more-ways-to-share loader, beside its
 * share-to-Facebook row, and the unhoisted one, as a section holding only that row. Chats and groups come from other
 * loaders and never pass through either gate.
 */
internal const val SHARE_STORY = "share_story"

internal const val STORY_ROW_ID = "ADD_TO_STORY_ID"

internal const val HOISTED_SHARE_LOADER = "Lcom/facebook/messaging/sharing/broadcastflow/mutation/loader/plugins/sections/" +
    "morewaystoshare/hoisted/BroadcastFlowHoistedMoreWaysToShareSectionsLoader;"

/** The trace the unhoisted loader starts its section under; the loader itself is inlined into a plugin wrapper. */
internal const val UNHOISTED_SHARE_TRACE = "messaging.sharing.broadcastflow.mutation.loader.sections.morewaystoshare.unhoisted." +
    "BroadcastFlowUnhoistedMoreWaysToShareSectionsLoader"

private const val LIST_OF_ONE = "$IMMUTABLE_LIST->of(Ljava/lang/Object;)$IMMUTABLE_LIST"

/** The row class findShareStory proved, which the gates are checked against again before any edit. */
internal var shareStoryRow: String = ""

private fun shareStoryChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the Send to list's Your story row changed ($detail)")

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.created() =
    if (opcode == Opcode.NEW_INSTANCE) ((this as ReferenceInstruction).reference as TypeReference).type else null

private fun Instruction.reads(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

/** A class whose instance getId() is nothing but the constant ADD_TO_STORY_ID. */
internal fun ClassDef.isStoryRow() = methods.any { method ->
    method.name == "getId" && method.returnType == "Ljava/lang/String;" && method.parameterTypes.isEmpty() &&
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.code().let {
            it.size == 2 && it[0].opcode == Opcode.CONST_STRING && it[0].string() == STORY_ROW_ID && it[1].opcode == Opcode.RETURN_OBJECT
        }
}

/**
 * Where a loader decides on the row. In the hoisted loader it's the if-eqz on the boolean right before the row is
 * created, [value] being that boolean. In the unhoisted one it's the if-eq that compares the section's run state
 * ([value]) with its skip marker ([skip]) and jumps past the whole section.
 */
internal class StoryGate(val index: Int, val hoisted: Boolean, val value: Int, val skip: Int)

/**
 * The hoisted loader's gate: a static boolean helper's result, then an if-eqz on it that jumps forward over the one
 * place the row is created, with nothing else landing on that if-eqz.
 */
private fun Method.hoistedGate(code: List<Instruction>, at: Int): StoryGate? {
    if (definingClass != HOISTED_SHARE_LOADER || AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.isNotEmpty() || returnType != "V") return null
    val gate = at - 1
    val branch = code.getOrNull(gate) as? OneRegisterInstruction ?: return null
    if (code[gate].opcode != Opcode.IF_EQZ || code.branchTarget(gate) <= at) return null
    val result = code.getOrNull(at - 2) as? OneRegisterInstruction ?: return null
    if (code[at - 2].opcode != Opcode.MOVE_RESULT || result.registerA != branch.registerA || branch.registerA > 15) return null
    val call = (code.getOrNull(at - 3) as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    if (code[at - 3].opcode != Opcode.INVOKE_STATIC || call.returnType != "Z") return null
    if (gate in jumpTargets()) return null
    return StoryGate(gate, true, branch.registerA, -1)
}

/**
 * The unhoisted section's gate: the last if-eq before the row, comparing a run state just read from this class's own
 * Object field with the skip marker, jumping past the row. The section's trace starts after it, its one item is the
 * row, and the skip path writes the run state's register before reading it, so handing it the marker changes nothing
 * there.
 */
private fun Method.unhoistedGate(code: List<Instruction>, at: Int): StoryGate? {
    if (code.none { it.string() == UNHOISTED_SHARE_TRACE }) return null
    val gate = (at - 1 downTo 1).firstOrNull { code[it].opcode == Opcode.IF_EQ } ?: return null
    val compare = code[gate] as TwoRegisterInstruction
    if (compare.registerA > 15 || compare.registerB > 15 || compare.registerA == compare.registerB) return null
    val read = code[gate - 1]
    val field = (read as? ReferenceInstruction)?.reference as? FieldReference ?: return null
    if (read.opcode != Opcode.IGET_OBJECT || (read as TwoRegisterInstruction).registerA != compare.registerA ||
        field.definingClass != definingClass || field.type != "Ljava/lang/Object;") return null
    if ((gate + 1 until at).none { code[it].string() == UNHOISTED_SHARE_TRACE }) return null
    val skipTo = code.branchTarget(gate)
    if (skipTo <= at) return null
    val created = (code[at] as OneRegisterInstruction).registerA
    val list = code.getOrNull(at + 2) ?: return null
    if (list.opcode != Opcode.INVOKE_STATIC || (list as ReferenceInstruction).reference.toString() != LIST_OF_ONE || list.reads() != listOf(created)) return null
    val first = code.getOrNull(skipTo) ?: return null
    val write = code.getOrNull(skipTo + 1) as? OneRegisterInstruction ?: return null
    if (first !is FiveRegisterInstruction && first !is RegisterRangeInstruction) return null
    if (compare.registerA in first.reads() || code[skipTo + 1].opcode !in setOf(Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_OBJECT) ||
        write.registerA != compare.registerA) return null
    if (gate in jumpTargets()) return null
    return StoryGate(gate, false, compare.registerA, compare.registerB)
}

/** This method's gate on the row: it must create the row exactly once, in one of the two shapes above. */
internal fun Method.storyGate(row: String = shareStoryRow): StoryGate? {
    val code = code()
    val made = code.indices.filter { code[it].created() == row }
    val at = made.singleOrNull() ?: return null
    return hoistedGate(code, at) ?: unhoistedGate(code, at)
}

/**
 * The one story row class, and the two methods that create it: the hoisted loader and the unhoisted section, each in
 * its proven shape. A second row class, a third creator, or either one in another shape leaves the switch unapplied.
 */
internal fun findShareStory(classes: Iterable<ClassDef>): List<Method> {
    shareStoryRow = ""
    val all = classes.toList()
    val row = all.filter { it.isStoryRow() }.singleOrNull()?.type ?: return emptyList()
    val creators = all.flatMap { cls -> cls.methods.filter { method -> method.code().any { it.created() == row } } }
    val gates = creators.map { it to it.storyGate(row) }
    if (gates.size != 2 || gates.any { it.second == null }) return emptyList()
    val hoisted = gates.filter { it.second!!.hoisted }
    if (hoisted.size != 1) return emptyList()
    shareStoryRow = row
    return gates.map { it.first }
}

internal fun MutableMethod.validateShareStory(): StoryGate =
    storyGate() ?: shareStoryChanged("no gate on the row in ${hookId()}")

/**
 * While the switch is on, the hoisted loader reads its story answer as no, so it adds only its share-to-Facebook row,
 * and the unhoisted section takes its skip path as if Messenger had turned it off. Off, Pause and safe mode keep
 * Messenger's own answers.
 */
internal fun MutableMethod.injectShareStory() {
    val gate = validateShareStory()
    if (gate.hoisted) addInstructions(gate.index, """
        invoke-static {v${gate.value}}, $SETTINGS->keepShareStory(Z)Z
        move-result v${gate.value}
    """.trimIndent())
    else addInstructions(gate.index, """
        invoke-static {v${gate.value}, v${gate.skip}}, $SETTINGS->shareStorySection(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v${gate.value}
    """.trimIndent())
}
