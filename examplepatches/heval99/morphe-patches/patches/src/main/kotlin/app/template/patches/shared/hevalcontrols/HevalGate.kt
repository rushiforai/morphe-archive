// Based on SysAdminDoc/HushMessenger (GPL-3.0), patches/src/main/kotlin/app/hushmessenger/patches/controls/ControlHooks.kt:
// the runtime gate shape (const-string key, invoke-static enabled(String)Z, move-result, if-eqz :stock_behavior)
// and validateScratch (the scratch register must be a local, not a parameter); modified 2026-10-14: any insertion
// index, an explicit or library-found free register, /range invoke so registers above v15 work, and validation of
// the insertion point; 2026-11-03: a skip variant (if-nez to a later instruction). The value helpers below are not
// from HushMessenger.

package app.template.patches.shared.hevalcontrols

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findFreeRegister
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

/**
 * Inserts a runtime gate before instruction [index]:
 * ```
 * const-string vX, "<featureId>"
 * invoke-static/range { vX .. vX }, HevalSettings;->isEnabled(Ljava/lang/String;)Z
 * move-result vX
 * if-eqz vX, :heval_stock
 * <whenEnabled(vX)>          # the patched behaviour; usually ends with a return
 * :heval_stock
 * <original instruction at index>
 * ```
 * `isEnabled` answers false (stock) when the feature is off, paused, in safe mode, unknown, or
 * on any error, so the original code always stays reachable.
 *
 * The scratch register vX must be a local: v0 at index 0 (nothing is live at method entry), else
 * [register] or the first free local found by morphe-patches-library's `findFreeRegister`.
 * Branches elsewhere in the method that target the original instruction at [index] skip the
 * gate, so prefer index 0 or a point with a single entry.
 *
 * @param whenEnabled Smali for the patched path, given the scratch register name (`"v3"`). It may
 *        reuse that register. If it does not end with a return or jump, execution falls through
 *        into the original code.
 */
fun MutableMethod.addHevalGate(
    featureId: String,
    index: Int = 0,
    register: Int? = null,
    whenEnabled: (register: String) -> String,
) = insertHevalGate(featureId, index, register, "if-eqz", whenEnabled)

/**
 * The inverse of [addHevalGate], for code the patch generated itself (a helper method that only
 * exists in the patched app): while [featureId] is off, [whenDisabled] runs instead of the
 * instruction at [index] and what follows; while it is on, execution falls into that code.
 * ```
 * const-string vX, "<featureId>"
 * invoke-static/range { vX .. vX }, HevalSettings;->isEnabled(Ljava/lang/String;)Z
 * move-result vX
 * if-nez vX, :heval_stock
 * <whenDisabled(vX)>         # the stock behaviour; must end with a return, throw or goto
 * :heval_stock
 * <original instruction at index>
 * ```
 * The label keeps its name: it marks the original instruction in both helpers. Register rules are
 * those of [addHevalGate].
 */
fun MutableMethod.addHevalStockPath(
    featureId: String,
    index: Int = 0,
    register: Int? = null,
    whenDisabled: (register: String) -> String,
) = insertHevalGate(featureId, index, register, "if-nez") { v ->
    val path = whenDisabled(v).trimIndent()
    val last = path.lineSequence().map(String::trim).lastOrNull(String::isNotEmpty).orEmpty()
    if (STOCK_PATH_ENDS.none { last.startsWith(it) }) {
        throw PatchException("$definingClass->$name: the stock path must end with a return, throw or goto, not \"$last\"")
    }
    path
}

private val STOCK_PATH_ENDS = listOf("return", "throw ", "goto")

/**
 * Skips the instructions from [index] up to (not including) [target] while [featureId] is on:
 * ```
 * const-string vX, "<featureId>"
 * invoke-static/range { vX .. vX }, HevalSettings;->isEnabled(Ljava/lang/String;)Z
 * move-result vX
 * if-nez vX, :heval_skip            # the instruction at target
 * <original instruction at index>   # the stock path falls through
 * ```
 * For code the stock app always runs, such as a call that must not happen while the feature is
 * on. vX is [register] or the first free local found by `findFreeRegister(index)`, so it must be
 * dead on both paths: pick an index whose own code already reaches [target] (a branch to it, or
 * the instruction right before it), so that analysis covers the skip path too.
 */
fun MutableMethod.addHevalSkip(featureId: String, index: Int, target: Int, register: Int? = null) {
    val size = implementation?.instructions?.size ?: 0
    if (target !in index + 1 until size) {
        throw PatchException("$definingClass->$name: skip target $target is not after $index inside the method")
    }
    insertHevalGate(featureId, index, register, "if-nez", target, "heval_skip") { "" }
}

private fun MutableMethod.insertHevalGate(
    featureId: String,
    index: Int,
    register: Int?,
    branch: String,
    body: (register: String) -> String,
) = insertHevalGate(featureId, index, register, branch, index, "heval_stock", body)

private fun MutableMethod.insertHevalGate(
    featureId: String,
    index: Int,
    register: Int?,
    branch: String,
    target: Int,
    label: String,
    body: (register: String) -> String,
) {
    require(HevalFeature.ID_REGEX.matches(featureId)) { "Invalid Patch settings feature id: $featureId" }
    val implementation = implementation
        ?: throw PatchException("$definingClass->$name has no code (abstract or native)")
    if (index !in 0 until implementation.instructions.size) {
        throw PatchException("$definingClass->$name has no instruction at index $index")
    }
    val anchor = getInstruction(index)
    if (anchor.opcode in UNSPLITTABLE_OPCODES) {
        throw PatchException("$definingClass->$name: a gate cannot be inserted before ${anchor.opcode} at $index")
    }
    val branchTarget = getInstruction(target)

    val locals = implementation.registerCount - parameterRegisterCount()
    val scratch = register ?: when {
        index == 0 && locals >= 1 -> 0
        index == 0 -> throw PatchException(
            "$definingClass->$name has no local register for the Patch settings gate (registers are all parameters)",
        )
        else -> findFreeRegister(index)
    }
    if (scratch !in 0 until minOf(locals, 256)) {
        throw PatchException("$definingClass->$name: v$scratch is not a free local register below v256")
    }

    val v = "v$scratch"
    addInstructionsWithLabelsChecked(
        index,
        """
            const-string $v, "$featureId"
            invoke-static/range { $v .. $v }, $HEVAL_SETTINGS_CLASS->isEnabled(Ljava/lang/String;)Z
            move-result $v
            $branch $v, :$label
        """.trimIndent() + "\n" + body(v).trimIndent(),
        ExternalLabel(label, branchTarget),
    )
}

/**
 * Adds (once) a static `(T)T` helper named [name] to this class: while [featureId] is off it
 * returns its argument unchanged (stock); while it is on, [whenEnabled] runs. Use it with
 * [filterThroughHevalHelper] where the patch changes a value the stock code keeps in a register
 * (a forced flag, a negated offset), so the site needs no free register.
 * ```
 * .method private static synthetic <name>(T)T
 *     .registers 2
 *     <gate on v0>
 *     <whenEnabled(v0)>      # p0 is the argument; must end with a return
 *     :heval_stock
 *     return p0
 * ```
 * @param type `Z`, `I` or `F` (a single-register primitive).
 */
fun MutableClass.addHevalValueHelper(
    featureId: String,
    name: String,
    type: String,
    whenEnabled: (register: String) -> String,
): MethodReference {
    if (type !in setOf("Z", "I", "F")) throw PatchException("Heval value helpers take Z, I or F, not $type")
    val reference = ImmutableMethodReference(this.type, name, listOf(type), type)
    if (methods.any { it.name == name && it.returnType == type && it.parameterTypes.map(CharSequence::toString) == listOf(type) }) {
        return reference
    }

    val helper = ImmutableMethod(
        this.type, name, listOf(ImmutableMethodParameter(type, null, null)), type,
        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
        null, null, MutableMethodImplementation(2),
    ).toMutable()
    helper.addInstructionsChecked(0, "return p0")
    helper.addHevalGate(featureId) { v -> whenEnabled(v) }
    methods.add(helper)
    return reference
}

/**
 * Passes [register] through [helper] (a static `(T)T`, see [addHevalValueHelper]) right before
 * instruction [index]: `invoke-static/range {vR .. vR}, helper`, then `move-result vR`. Jumps to
 * [index] land on the call, so every path into the original instruction gets the helper's value.
 */
fun MutableMethod.filterThroughHevalHelper(index: Int, register: Int, helper: MethodReference) {
    val code = implementation ?: throw PatchException("$definingClass->$name has no code")
    if (register !in 0 until minOf(code.registerCount, 256)) {
        throw PatchException("$definingClass->$name: v$register is not a register below v256")
    }
    if (getInstruction(index).opcode in UNSPLITTABLE_OPCODES) {
        throw PatchException("$definingClass->$name: cannot insert before ${getInstruction(index).opcode} at $index")
    }
    addInstructionsAtControlFlowLabel(
        index,
        """
            invoke-static/range { v$register .. v$register }, $helper
            move-result v$register
        """.trimIndent(),
    )
}

/**
 * A move-result* must directly follow its invoke / filled-new-array and a move-exception must open
 * its catch handler, so no gate may go in front of them. Explicit values: dexlib2's `Opcode.name`
 * field is the lowercase mnemonic ("move-result"), not the enum constant name.
 */
private val UNSPLITTABLE_OPCODES = setOf(
    Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_RESULT_WIDE, Opcode.MOVE_EXCEPTION,
)

/** Runtime `returnEarly()` for a void method: returns at once while [featureId] is on. */
fun MutableMethod.hevalReturnEarly(featureId: String) {
    requireReturnType("V")
    addHevalGate(featureId) { "return-void" }
}

/** Runtime `returnEarly(value)` for a boolean method: answers [value] while [featureId] is on. */
fun MutableMethod.hevalReturnEarly(featureId: String, value: Boolean) {
    requireReturnType("Z")
    addHevalGate(featureId) { v ->
        val literal = if (value) "0x1" else "0x0"
        // const/4 only addresses v0-v15.
        val const = if (v.removePrefix("v").toInt() < 16) "const/4" else "const/16"
        "$const $v, $literal\nreturn $v"
    }
}

/** Runtime early `return null` for an object-returning method while [featureId] is on. */
fun MutableMethod.hevalReturnNull(featureId: String) {
    if (returnType.length < 2 || (returnType[0] != 'L' && returnType[0] != '[')) {
        throw PatchException("$definingClass->$name does not return an object")
    }
    addHevalGate(featureId) { v ->
        val const = if (v.removePrefix("v").toInt() < 16) "const/4" else "const/16"
        "$const $v, 0x0\nreturn-object $v"
    }
}

private fun MutableMethod.requireReturnType(type: String) {
    if (returnType != type) throw PatchException("$definingClass->$name returns $returnType, not $type")
}

/** Registers taken by `this` (instance methods) and the parameters (J and D take two). */
private fun MutableMethod.parameterRegisterCount(): Int {
    val self = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    return self + parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
}
