package app.template.patches.bleacherreport.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.bleacherreport.shared.insns
import app.template.patches.bleacherreport.shared.isStatic
import app.template.patches.bleacherreport.shared.methodRef
import app.template.patches.bleacherreport.shared.returnUnit
import app.template.patches.bleacherreport.shared.single
import app.template.patches.bleacherreport.shared.shortCircuitLaunchTask
import app.template.patches.bleacherreport.shared.stringRef
import app.template.patches.shared.Constants.COMPATIBILITY_BLEACHER_REPORT
import app.template.patches.shared.addInstructionChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

/** Whether this invoke passes [register]. */
private fun Instruction.passes(register: Int): Boolean = when (this) {
    is RegisterRangeInstruction -> register in startRegister until startRegister + registerCount
    is FiveRegisterInstruction ->
        listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount).contains(register)
    else -> false
}

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics, tracking and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_BLEACHER_REPORT)

    execute {
        // 1. The launch tasks that start mParticle (and its only kit, Apptentive), Datadog RUM /
        // logs and comScore report success without starting them. The app null-checks every
        // MParticle.getInstance(), and Datadog falls back to its no-op monitors.
        shortCircuitLaunchTask("MParticleLaunchTask")
        shortCircuitLaunchTask("DatadogLaunchTask")
        shortCircuitLaunchTask("ComScoreLaunchTask")

        // 2. comScore: every Analytics static void (start, notifyUxActive / notifyUxInactive, the
        // view and hidden events, ...) returns at once, should anything call it without the task.
        val comScore = mutableClassDefByOrNull(COMSCORE_ANALYTICS)
            ?: throw PatchException("Disable telemetry: $COMSCORE_ANALYTICS not found")
        val comScoreStatics = comScore.methods.filter {
            it.isStatic() && it.returnType == "V" && it.implementation != null && it.name != "<clinit>"
        }
        if (comScoreStatics.none { it.name == "start" }) {
            throw PatchException("Disable telemetry: no concrete $COMSCORE_ANALYTICS->start")
        }
        comScoreStatics.forEach { it.returnEarly() }

        // 3. Crashlytics: automatic data collection reads as off, so no crash report is sent.
        single(CrashlyticsDataCollectionFingerprint, "CrashlyticsDataCollectionFingerprint").method.returnEarly(false)

        // 4. Branch: the tracking-disabled preference reads as true at every reader, so Branch
        // sends no attribution or install events. Its SDK still starts; shared links come out as
        // long Branch links, which is the SDK's own tracking-disabled path.
        var forced = 0
        val readers = BranchTrackingStateFingerprint.matchAllOrNull().orEmpty()
        for (match in readers) {
            val method = match.method
            val insns = method.insns()
            val reads = insns.indices.filter { insns[it].stringRef() == BRANCH_TRACKING_STATE }.mapNotNull { key ->
                val register = (insns[key] as OneRegisterInstruction).registerA
                val call = (key + 1 until insns.size).firstOrNull { insns[it].passes(register) }
                    ?: throw PatchException("Disable telemetry: ${match.classDef.type}->${method.name} never uses $BRANCH_TRACKING_STATE")
                val ref = insns[call].methodRef()
                when {
                    ref?.returnType == "V" -> null // A writer: nothing to force.
                    ref?.returnType == "Z" && insns.getOrNull(call + 1)?.opcode == Opcode.MOVE_RESULT -> call + 1
                    else -> throw PatchException(
                        "Disable telemetry: ${match.classDef.type}->${method.name} passes $BRANCH_TRACKING_STATE to $ref",
                    )
                }
            }
            for (moveResult in reads.sortedDescending()) {
                val next = method.implementation!!.instructions[moveResult + 1]
                if (next.location.labels.isNotEmpty()) {
                    throw PatchException("Disable telemetry: the Branch read in ${match.classDef.type}->${method.name} is followed by a branch target")
                }
                val register = (insns[moveResult] as OneRegisterInstruction).registerA
                method.addInstructionChecked(
                    moveResult + 1,
                    if (register < 16) "const/4 v$register, 0x1" else "const/16 v$register, 0x1",
                )
                forced++
            }
        }
        if (forced == 0) throw PatchException("Disable telemetry: no Branch $BRANCH_TRACKING_STATE read found")

        // 5. Beam: events are never queued, and the queue monitor never sends a batch.
        single(BeamEventQueueAddFingerprint, "BeamEventQueueAddFingerprint").method.returnUnit()
        single(BeamEventQueueMonitorFingerprint, "BeamEventQueueMonitorFingerprint").method.returnUnit()

        // 6. Braze: app events are not forwarded as Braze custom events. The Braze SDK itself
        // (push, in-app messages) is left alone.
        single(BrazeEventForwardingFingerprint, "BrazeEventForwardingFingerprint").method.returnUnit()
    }
}
