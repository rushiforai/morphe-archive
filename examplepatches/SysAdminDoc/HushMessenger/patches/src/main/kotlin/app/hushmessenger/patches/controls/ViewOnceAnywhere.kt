package app.hushmessenger.patches.controls

import app.hushmessenger.patches.coexist.registers
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Offer View once in every chat (#192). Messenger's gallery in the message box shows the View once toggle only where the
 * server's capability vector allows it, which leaves it out of group chats, so a photo meant to be seen once can only go
 * to one person. The chat composer's gallery plugin computes the toggle's prop as
 *
 *     showViewOnceToggle = capabilities.has(299) && Boolean.TRUE.equals(this.oneToOne)
 *
 * and hands the same answer on to the gallery's footer. The hook passes that answer through the extension right before
 * it reaches the prop, so the toggle is offered wherever the switch is on. It can only turn the prop on, never off, so
 * every path Messenger already allows keeps what it had.
 */
internal const val VIEW_ONCE_ANYWHERE = "view_once_anywhere"
internal const val VIEW_ONCE_OFFERED = "$SETTINGS->viewOnceOffered(Z)Z"

private const val VIEW_ONCE_PROP = "showViewOnceToggle"
private const val STRING_ARRAY = "[Ljava/lang/String;"
private const val BIT_SET = "Ljava/util/BitSet;"
private const val BIT_SET_SET = "$BIT_SET->set(I)V"
private val VIEW_ONCE_CONSTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST)

/**
 * How the gallery's View once prop is reached, read at discovery: the generated builder that counts the prop, the
 * component it builds and the prop's index, which is both its place in the builder's required prop names and the bit the
 * component's write sets.
 */
internal data class ViewOnceGate(val builder: String, val component: String, val prop: Int)

/** Set by [findViewOnceAnywhere] and cleared once the controls are in. */
internal var viewOnceGate: ViewOnceGate? = null

private fun viewOnceChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the gallery's View once toggle moved ($detail)")

private fun Instruction.viewOnceField() = (this as? ReferenceInstruction)?.reference as? FieldReference

/**
 * The required prop names a generated Litho builder's constructor packs into one string array, in the order the array
 * takes them rather than the order Redex loaded them:
 *
 *     const-string v16, "showViewOnceToggle"
 *     ...
 *     const-string v3, "albumCursorParams"
 *     filled-new-array/range {v3 .. v17}, [Ljava/lang/String;
 *
 * Null for a constructor that packs no string array, or one whose registers aren't all names it loaded itself.
 */
private fun Method.requiredProps(): List<String>? {
    val code = implementation?.instructions?.toList() ?: return null
    val loaded = mutableMapOf<Int, String>()
    for (instruction in code) {
        if (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) {
            val name = ((instruction as ReferenceInstruction).reference as? StringReference)?.string ?: return null
            loaded[(instruction as OneRegisterInstruction).registerA] = name
            continue
        }
        if (instruction.opcode != Opcode.FILLED_NEW_ARRAY && instruction.opcode != Opcode.FILLED_NEW_ARRAY_RANGE) continue
        if (((instruction as ReferenceInstruction).reference as? TypeReference)?.type != STRING_ARRAY) continue
        return instruction.registers().map { loaded[it] ?: return null }
    }
    return null
}

/** A constructor that keeps what it counted: the prop names and the BitSet for them, each in a field of its own class. */
private fun Method.keepsProps(): Boolean {
    val kept = implementation?.instructions?.filter { it.opcode == Opcode.IPUT_OBJECT }?.mapNotNull { it.viewOnceField() }
        ?.filter { it.definingClass == definingClass }?.map { it.type }.orEmpty()
    return STRING_ARRAY in kept && BIT_SET in kept
}

/**
 * The one generated builder that counts the View once prop, with the component it builds and the prop's index. The
 * component is the builder's second constructor parameter, the component the builder was made for. None unless exactly
 * one builder in the app counts the prop, which keeps a later surface's own toggle from being taken for this one.
 */
private fun viewOncePropOf(classes: Iterable<ClassDef>): ViewOnceGate? = classes.flatMap { it.methods }
    .filter { it.name == "<init>" && it.parameterTypes.size == 2 && it.parameterTypes[1].startsWith("L") }
    .mapNotNull { init ->
        val props = init.requiredProps()?.takeIf { it.size == it.distinct().size } ?: return@mapNotNull null
        val prop = props.indexOf(VIEW_ONCE_PROP).takeIf { it >= 0 } ?: return@mapNotNull null
        ViewOnceGate(init.definingClass, init.parameterTypes[1].toString(), prop).takeIf { init.keepsProps() }
    }.distinct().singleOrNull()

/**
 * Where a method writes the gallery's View once prop, which is the only place its answer can still be changed:
 *
 *     iput-boolean vValue, vComponent, <component>->?:Z    <- the index
 *     const/16 vBit, <the prop's index>
 *     invoke-virtual {vSet, vBit}, Ljava/util/BitSet;->set(I)V
 *
 * The bit the write sets is what names the prop, since the field's own name is gone. Null unless there is exactly one
 * such write and its value is a local the hook can hand on and take back.
 */
internal fun Method.viewOnceSite(gate: ViewOnceGate): Int? {
    val code = implementation?.instructions?.toList() ?: return null
    val local = parameterRegister(0)
    val sites = code.indices.filter { i ->
        if (code[i].opcode != Opcode.IPUT_BOOLEAN) return@filter false
        val field = code[i].viewOnceField() ?: return@filter false
        if (field.definingClass != gate.component || field.type != "Z") return@filter false
        val index = code.getOrNull(i + 1) ?: return@filter false
        val set = code.getOrNull(i + 2) ?: return@filter false
        if (index.opcode !in VIEW_ONCE_CONSTS || (index as NarrowLiteralInstruction).narrowLiteral != gate.prop) return@filter false
        if (set.opcode != Opcode.INVOKE_VIRTUAL && set.opcode != Opcode.INVOKE_VIRTUAL_RANGE) return@filter false
        if (((set as ReferenceInstruction).reference as? MethodReference)?.toString() != BIT_SET_SET) return@filter false
        set.registers().getOrNull(1) == (index as OneRegisterInstruction).registerA &&
            (code[i] as TwoRegisterInstruction).registerA.let { it <= 15 && it < local }
    }
    return sites.singleOrNull()
}

/**
 * The chat composer's gallery plugin, or none. Three surfaces build the same gallery component, and only the composer's
 * takes the capability vector that decides the toggle, so only it is hooked. The other two write the prop from a plain
 * answer of their own, which the switch has no business changing.
 */
internal fun findViewOnceAnywhere(classes: Iterable<ClassDef>): List<Method> {
    viewOnceGate = null
    val gate = viewOncePropOf(classes) ?: return emptyList()
    if (classes.none { it.type == gate.component }) return emptyList()
    val hosts = classes.flatMap { it.methods }.filter { method ->
        method.parameterTypes.any { it == CAPABILITIES } && method.viewOnceSite(gate) != null &&
            method.implementation!!.instructions.any { it.opcode == Opcode.NEW_INSTANCE &&
                ((it as ReferenceInstruction).reference as? TypeReference)?.type == gate.builder }
    }
    val host = hosts.singleOrNull() ?: return emptyList()
    viewOnceGate = gate
    return listOf(host)
}

internal fun MutableMethod.validateViewOnceAnywhere(): Int {
    val gate = viewOnceGate ?: viewOnceChanged("no gate")
    return viewOnceSite(gate) ?: viewOnceChanged("the prop write in ${hookId()}")
}

/**
 * With the switch on, the gallery offers View once in a chat Messenger's capability vector would leave it out of. Off,
 * Pause or safe mode, and the gallery gets Messenger's own answer, so the toggle is offered exactly where it always was.
 */
internal fun MutableMethod.injectViewOnceAnywhere() {
    val at = validateViewOnceAnywhere()
    val offered = "v${(implementation!!.instructions.elementAt(at) as TwoRegisterInstruction).registerA}"
    addInstructions(at, """
        invoke-static {$offered}, $VIEW_ONCE_OFFERED
        move-result $offered
    """.trimIndent())
}
