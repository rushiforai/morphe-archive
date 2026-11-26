package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * #194: the floating tab bar's pill, see-through. Messenger paints the pill from the method that logs
 * [FLOATING_PILL_LOG] when the tab it's handed is out of range, inline or through one call. The paint reads its colors
 * into a holder, compares that with the last one, and only on a change sets the pill's fill (its GradientDrawable's
 * setColor), its hairline (setStroke) and its shadow (the bar's ambient and spot shadow colors), each read back out of
 * the holder right before its call.
 * The extension gets each of those colors as it's read back and answers with less alpha, so the chats show through.
 * The selected tab's highlight and the icons are painted after these and keep their own.
 */
internal const val FLOATING_PILL = "floating_pill"
internal const val FLOATING_PILL_LOG = "Selected tab %d is outside the %d tabs"
internal const val FLOATING_PILL_CALL = "Lapp/hushmessenger/extension/SeeThroughTabBar;->color(I)I"
private const val PILL_DRAWABLE = "Landroid/graphics/drawable/GradientDrawable;"

/**
 * The pill's paints, the first call of each in the method, with the argument that holds its color, the drawable or the
 * view being argument 0. The shadow calls are matched by name and shape, whichever class the call names.
 */
internal val PILL_PAINTS = listOf(
    "$PILL_DRAWABLE->setColor(I)V" to 1,
    "$PILL_DRAWABLE->setStroke(II)V" to 2,
    "->setOutlineAmbientShadowColor(I)V" to 1,
    "->setOutlineSpotShadowColor(I)V" to 1,
)

private fun Method.pillCode() = implementation?.instructions?.toList().orEmpty()

private fun Instruction.pillString() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.paints(paint: String): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val called = ((this as ReferenceInstruction).reference as? MethodReference) ?: return false
    val id = "${called.definingClass}->${called.name}(${called.parameterTypes.joinToString("")})${called.returnType}"
    return if (paint.startsWith("->")) id.endsWith(paint) else id == paint
}

/** The register a call passes as its [argument]th, counting the object it's called on as 0. */
private fun Instruction.argumentRegister(argument: Int): Int = when (this) {
    is RegisterRangeInstruction -> startRegister + argument
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG)[argument]
    else -> -1
}

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister() || this !is OneRegisterInstruction) return false
    return registerA == register || (opcode.setsWideRegister() && registerA + 1 == register)
}

private fun Method.logsPillRange() = pillCode().any { it.pillString() == FLOATING_PILL_LOG }

private fun MethodReference.pillKey() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/**
 * Where the pill's colors are read back, ascending: for each paint, the iget of an int field its color came from, with
 * no branch, switch case or catch able to land between the read and the call. Null when a paint is missing or doesn't
 * read that way. The two shadow calls can share one read.
 */
internal fun Method.pillReads(): List<Int>? {
    val code = pillCode()
    if (code.isEmpty()) return null
    val targets = jumpTargets()
    val reads = sortedSetOf<Int>()
    for ((paint, argument) in PILL_PAINTS) {
        val call = code.indexOfFirst { it.paints(paint) }
        if (call < 0) return null
        val register = code[call].argumentRegister(argument)
        if (register !in 0..255) return null
        val read = (call - 1 downTo 0).firstOrNull { code[it].writes(register) } ?: return null
        val load = code[read]
        if (load.opcode != Opcode.IGET || ((load as ReferenceInstruction).reference as FieldReference).type != "I") return null
        if ((read + 1..call).any { it in targets }) return null
        reads += read
    }
    return reads.toList()
}

/**
 * The one pill paint: of the methods that log [FLOATING_PILL_LOG] and the methods they call, the one with the paint's
 * shape. 588.1.0.66.98's builds come two ways, one with the paint inlined into the method that logs, the other with the
 * paint left on the bar's own view and called from there. scripts/compat/Looks.java's floatingPill mirrors it.
 */
internal fun findFloatingPill(classes: Iterable<ClassDef>): List<Method> {
    val logs = classes.flatMap { it.methods }.filter { it.logsPillRange() }
    val called = logs.flatMap { log ->
        log.pillCode().mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.pillKey() }
    }.toSet()
    val owners = called.map { it.substringBefore("->") }.toSet()
    val callees = classes.filter { it.type in owners }.flatMap { it.methods }.filter { it.pillKey() in called }
    val found = (logs + callees).distinct().filter { it.pillReads() != null }
    return if (found.size == 1) found else emptyList()
}

/** Checks the paint's stock shape before anything is changed, and refuses a shape it doesn't know. */
internal fun MutableMethod.validateFloatingPill(): List<Int> =
    pillReads() ?: throw PatchException("Messenger controls: the floating tab bar's paint changed in ${hookId()}")

/** Each color goes to SeeThroughTabBar.color the moment it's read back, and the paint goes on with what it answers. */
internal fun MutableMethod.injectFloatingPill() {
    val reads = validateFloatingPill()
    val code = implementation!!.instructions.toList()
    // Last first, so the earlier reads keep their indexes.
    for (read in reads.sortedDescending()) {
        val register = (code[read] as OneRegisterInstruction).registerA
        addInstructions(read + 1, """
            invoke-static/range {v$register .. v$register}, $FLOATING_PILL_CALL
            move-result v$register
        """.trimIndent())
    }
}
