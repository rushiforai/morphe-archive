// Based on SysAdminDoc/HushMessenger (GPL-3.0), patches/src/main/kotlin/app/hushmessenger/patches/controls/ControlHooks.kt:
// the runtime gate shape (const-string key, invoke-static enabled(String)Z, move-result, if-eqz :stock_behavior)
// and validateScratch (the scratch register must be a local, not a parameter); modified 2026-10-14: any insertion
// index, an explicit or library-found free register, /range invoke so registers above v15 work, and validation of
// the insertion point.

package app.template.patches.shared.hevalcontrols

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.findFreeRegister
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

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
) {
    require(HevalFeature.ID_REGEX.matches(featureId)) { "Invalid Heval Controls feature id: $featureId" }
    val implementation = implementation
        ?: throw PatchException("$definingClass->$name has no code (abstract or native)")
    if (index !in 0 until implementation.instructions.size) {
        throw PatchException("$definingClass->$name has no instruction at index $index")
    }
    val anchor = getInstruction(index)
    if (anchor.opcode in UNSPLITTABLE_OPCODES) {
        throw PatchException("$definingClass->$name: a gate cannot be inserted before ${anchor.opcode} at $index")
    }

    val locals = implementation.registerCount - parameterRegisterCount()
    val scratch = register ?: when {
        index == 0 && locals >= 1 -> 0
        index == 0 -> throw PatchException(
            "$definingClass->$name has no local register for the Heval Controls gate (registers are all parameters)",
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
            if-eqz $v, :heval_stock
        """.trimIndent() + "\n" + whenEnabled(v).trimIndent(),
        ExternalLabel("heval_stock", anchor),
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
