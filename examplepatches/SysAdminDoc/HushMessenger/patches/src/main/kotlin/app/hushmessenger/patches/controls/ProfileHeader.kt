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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** The View profile button on an empty chat's header, in the button row under the person's name and picture. */
internal const val FACEBOOK_PROFILE_HEADER = "facebook_profile_header"

/** The header's button row names itself this in every supported build. */
internal const val HEADER_ROW = "ThreadHeaderMessageActionRowComponent"

/** The action constant the row's View profile button stands for, by the name its enum declares. */
internal const val VIEW_PROFILE = "VIEW_PROFILE"

internal const val PROFILE_HEADER_HELPER = "$SETTINGS->withoutViewProfile(Ljava/util/List;)Ljava/util/List;"
private const val LIST = "Ljava/util/List;"
private const val LIST_CONTAINS = "$LIST->contains(Ljava/lang/Object;)Z"
private const val ENUM = "Ljava/lang/Enum;"

private fun headerChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the empty chat header's buttons moved ($detail)")

/** Where the row's render reads its action list, and the action constants it then asks the list for. */
internal data class HeaderActions(val read: Int, val checked: List<FieldReference>)

private fun Instruction.headerWrites(register: Int) = opcode.setsRegister() && this is OneRegisterInstruction &&
    (registerA == register || (opcode.setsWideRegister() && registerA + 1 == register))

/**
 * The header row's render reads its own action list once, then asks it for each action it may draw:
 *
 *     iget-object vL, vRow, <row>-><actions>:Ljava/util/List;
 *     ...                                              (vL left alone)
 *     sget-object vA, <action>-><constant>:<action>
 *     invoke-interface {vL, vA}, List->contains(Object)Z
 *
 * Null when the method isn't that render: no row name, not exactly one read of its own list, or no check on it.
 */
internal fun Method.headerActions(): HeaderActions? {
    if (AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.size != 1) return null
    val instructions = implementation?.instructions ?: return null
    // Named first, so the thousands of other one-argument methods aren't copied into a list on the phone.
    if (instructions.none { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == HEADER_ROW }) return null
    val code = instructions.toList()
    val read = code.indices.singleOrNull { at ->
        val field = (code[at] as? ReferenceInstruction)?.reference as? FieldReference
        code[at].opcode == Opcode.IGET_OBJECT && field?.definingClass == definingClass && field.type == LIST
    } ?: return null
    val list = (code[read] as TwoRegisterInstruction).registerA
    val checked = mutableListOf<FieldReference>()
    for (at in read + 2 until code.size) {
        if (code[at - 1].headerWrites(list)) break
        val call = code[at] as? FiveRegisterInstruction ?: continue
        val action = code[at - 1]
        val constant = (action as? ReferenceInstruction)?.reference as? FieldReference ?: continue
        if (call.opcode != Opcode.INVOKE_INTERFACE || (call as ReferenceInstruction).reference.toString() != LIST_CONTAINS ||
            call.registerCount != 2 || call.registerC != list || action.opcode != Opcode.SGET_OBJECT ||
            (action as OneRegisterInstruction).registerA != call.registerD || constant.type != constant.definingClass) continue
        checked.add(constant)
    }
    return if (checked.isEmpty()) null else HeaderActions(read, checked)
}

/** The name [constant]'s enum initializer gives it: the one string loaded since the previous constant was stored. */
private fun ClassDef.headerEnumName(constant: FieldReference): String? {
    if (superclass != ENUM) return null
    val code = methods.singleOrNull { it.name == "<clinit>" }?.implementation?.instructions?.toList() ?: return null
    val stores = code.indices.filter { code[it].opcode == Opcode.SPUT_OBJECT }
    val store = stores.singleOrNull { (code[it] as ReferenceInstruction).reference.toString() == constant.toString() } ?: return null
    val previous = stores.lastOrNull { it < store } ?: -1
    return (previous + 1 until store).mapNotNull { ((code[it] as? ReferenceInstruction)?.reference as? StringReference)?.string }
        .singleOrNull()
}

/** The one header row render that asks its list for View profile, or none when more than one looks like it. */
internal fun findProfileHeader(classes: Iterable<ClassDef>): List<Method> {
    val renders = classes.flatMap { it.methods }.mapNotNull { method -> method.headerActions()?.let { method to it } }
    if (renders.isEmpty()) return emptyList()
    val wanted = renders.flatMap { (_, actions) -> actions.checked.map { it.definingClass } }.toSet()
    val enums = classes.filter { it.type in wanted }.associateBy { it.type }
    return renders.filter { (_, actions) -> actions.checked.any { enums[it.definingClass]?.headerEnumName(it) == VIEW_PROFILE } }
        .map { it.first }.let { if (it.size == 1) it else emptyList() }
}

internal fun MutableMethod.validateProfileHeader(): Int {
    val actions = headerActions() ?: headerChanged("unexpected header row ${hookId()}")
    // Only the read itself may reach the list, or a path could skip the extension.
    if ((actions.read + 1) in jumpTargets()) headerChanged("a jump past the action list read")
    return actions.read
}

/**
 * Hands the row's action list through the extension right after the render reads it. While the Profile button is hidden
 * the extension answers with a copy that has no View profile, so neither of the row's two paths draws that button.
 */
internal fun MutableMethod.injectProfileHeader() {
    val read = validateProfileHeader()
    // iget-object only takes v0 to v15, so the list fits the helper call's short form.
    val list = (implementation!!.instructions.elementAt(read) as TwoRegisterInstruction).registerA
    addInstructions(read + 1, """
        invoke-static {v$list}, $PROFILE_HEADER_HELPER
        move-result-object v$list
    """.trimIndent())
}
