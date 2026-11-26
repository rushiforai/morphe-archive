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
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val DWELL_TRACKING = "dwell_tracking"

/**
 * The report Messenger's dwell session manager files when a screen's attention session ends. It carries the session's
 * id, how many times you came back to it, and one timestamp per state change, which together say how long your eyes
 * stayed on each thing and in what order.
 */
internal const val DWELL_EVENT = "fb_ads_fine_grained_dwell"
internal const val DWELL_TIMESTAMPS = "fine_grained_dwell_timestamps"

/**
 * The same timestamps again, copied onto the user journey log under its own gate right after the report. 588 dropped
 * the copy, so a report without one is taken with its one gate.
 */
internal const val DWELL_JOURNEY = "ujl_internal_default_journey"

internal const val DWELL_HELPER = "$SETTINGS->dwellLogged(Z)Z"

private fun Instruction.dwellRef() = (this as? ReferenceInstruction)?.reference
private fun Method.dwellCode() = implementation?.instructions?.toList().orEmpty()
private fun Method.dwellStrings() = dwellCode().mapNotNull { (it.dwellRef() as? StringReference)?.string }.toSet()

/** The session manager's own end-of-session method: static (manager, session id, time)V with both report names in it. */
internal fun Method.isDwellReport(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "V") return false
    if (parameterTypes.map { it.toString() } != listOf(definingClass, "Ljava/lang/String;", "J")) return false
    return dwellStrings().containsAll(setOf(DWELL_EVENT, DWELL_TIMESTAMPS))
}

internal fun findDwellTracking(classes: Iterable<ClassDef>): List<Method> =
    classes.flatMap { it.methods }.filter { it.isDwellReport() }

private fun dwellChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the dwell report no longer matches the tested build ($detail)")

/** [branch] is the index of the if-eqz that skips a block, and [answer] the register it reads. */
internal data class DwellGate(val branch: Int, val answer: Int)

/** Where [literal] is read, which has to be the one place in the method that reads it. */
private fun Method.stringAt(literal: String): Int {
    val code = dwellCode()
    return code.indices.singleOrNull { (code[it].dwellRef() as? StringReference)?.string == literal }
        ?: dwellChanged("$literal is read ${code.count { (it.dwellRef() as? StringReference)?.string == literal }} times")
}

/**
 * A gate is a call that answers yes or no, its answer moved into a register, and an if-eqz on that register that skips
 * the block when the answer is no. Those three run together with nothing landing between them.
 */
private fun Method.dwellGates(): List<DwellGate> {
    val code = dwellCode()
    val targets = jumpTargets()
    return code.indices.filter { i ->
        code[i].opcode == Opcode.MOVE_RESULT && i > 0 && i + 1 < code.size &&
            (code[i - 1].dwellRef() as? MethodReference)?.returnType == "Z" &&
            code[i + 1].opcode == Opcode.IF_EQZ &&
            (code[i + 1] as OneRegisterInstruction).registerA == (code[i] as OneRegisterInstruction).registerA &&
            i !in targets && i + 1 !in targets
    }.map { DwellGate(it + 1, (code[it] as OneRegisterInstruction).registerA) }
}

/**
 * The gates the switch answers for: the one right after the report's name is read, which asks whether this report is
 * being sampled at all, and, on a build that still copies the report onto the journey log, the last one before that
 * copy, which asks whether it's turned on. Each skips straight past its block when the answer is no, so a no from here
 * leaves the session's own bookkeeping, its map cleanup and every other report exactly as Messenger wrote them.
 */
internal fun MutableMethod.validateDwellTracking(): List<DwellGate> {
    if (!isDwellReport()) dwellChanged("builder ${hookId()}")
    val code = dwellCode()
    val named = stringAt(DWELL_EVENT)
    val timestamps = stringAt(DWELL_TIMESTAMPS)
    val copies = code.any { (it.dwellRef() as? StringReference)?.string == DWELL_JOURNEY }
    val journey = if (copies) stringAt(DWELL_JOURNEY) else -1
    if (timestamps <= named) dwellChanged("the timestamps are read before the report is named")
    if (copies && journey <= timestamps) dwellChanged("the journey copy comes before the report")
    val gates = dwellGates()
    val report = gates.firstOrNull { it.branch > named } ?: dwellChanged("the report's own gate")
    if (report.branch >= timestamps) dwellChanged("the report's gate sits inside its own block")
    if (code.branchTarget(report.branch) <= timestamps) dwellChanged("the report's gate doesn't skip the report")
    if (!copies) {
        if (report.answer > 15) dwellChanged("a gate's answer is out of reach")
        return listOf(report)
    }
    val copy = gates.lastOrNull { it.branch < journey } ?: dwellChanged("the journey copy's gate")
    if (copy.branch <= report.branch) dwellChanged("one gate answers for both blocks")
    if (code.branchTarget(copy.branch) <= journey) dwellChanged("the journey copy's gate doesn't skip the copy")
    if (report.answer > 15 || copy.answer > 15) dwellChanged("a gate's answer is out of reach")
    return listOf(report, copy)
}

/**
 * Each gate's answer goes through the extension on its way to the branch. On it comes back no and the branch skips the
 * block; off, paused, in safe mode and on every failure it comes back exactly as Messenger answered. The register holds
 * a yes-or-no before and after, so a catch over either gate sees the frame as it was.
 */
internal fun MutableMethod.injectDwellTracking() {
    for (gate in validateDwellTracking().sortedByDescending { it.branch }) {
        addInstructions(gate.branch, """
            invoke-static {v${gate.answer}}, $DWELL_HELPER
            move-result v${gate.answer}
        """.trimIndent())
    }
}
