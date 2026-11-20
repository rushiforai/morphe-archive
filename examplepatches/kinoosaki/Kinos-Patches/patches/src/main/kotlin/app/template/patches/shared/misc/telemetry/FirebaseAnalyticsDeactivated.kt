package app.template.patches.shared.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// Moved here from the Sofascore "Disable telemetry" patch on 2026-10-22 so FotMob can share it
// (unchanged code). Used by Sofascore and FotMob.

// Firebase Analytics' documented manifest switch. The stock manifest does not set it; the read
// is forced to true in the bytecode instead of in AndroidManifest.xml, so no resource patch
// re-encodes the whole resource table.
internal const val ANALYTICS_DEACTIVATED_KEY = "firebase_analytics_collection_deactivated"

// The measurement SDK reads its manifest flags through one config helper, Boolean get(String)
// (zzal.j0 in Sofascore 26.10.05; null when the manifest does not set the key). The deactivated
// flag is read exactly once (zzal.k0 in Sofascore 26.10.05, jrg.L in FotMob 239), which this
// fingerprint finds together with the read's call shape.
internal object AnalyticsDeactivatedReadFingerprint : Fingerprint(
    filters = listOf(
        string(ANALYTICS_DEACTIVATED_KEY),
        methodCall(parameters = listOf("Ljava/lang/String;"), returnType = "Ljava/lang/Boolean;"),
    ),
)

private fun Instruction.string(): String? =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

/** The argument registers of an invoke, in order, or null for other instructions. */
private fun Instruction.arguments(): List<Int>? = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> null
}

/**
 * Forces the "firebase_analytics_collection_deactivated" read to answer Boolean.TRUE, the
 * bytecode approach the Truecaller patch uses: in the single method the fingerprint matches,
 * the const-string key is passed as the first argument (after the config object) of an instance
 * call returning Boolean from a single String parameter, and the value that lands in the
 * move-result-object's register right after it is overwritten with Boolean.TRUE. Measurement
 * then never starts, so no automatic first_open / session_start / screen_view events are sent
 * either, and no AndroidManifest.xml edit re-encodes the whole resource table.
 */
internal fun BytecodePatchContext.forceAnalyticsDeactivated() {
    val method = AnalyticsDeactivatedReadFingerprint.method
    val where = "${method.definingClass}->${method.name}"
    val insns = method.implementation!!.instructions.toList()

    val reads = insns.indices.filter { insns[it].string() == ANALYTICS_DEACTIVATED_KEY }
    if (reads.size != 1) {
        throw PatchException("Disable telemetry: $where holds ${reads.size} \"$ANALYTICS_DEACTIVATED_KEY\" strings")
    }
    val keyRegister = (insns[reads.single()] as OneRegisterInstruction).registerA

    // The first instruction after the const-string that uses or replaces the key register.
    val use = (reads.single() + 1 until insns.size).firstOrNull { index ->
        insns[index].arguments()?.contains(keyRegister) == true ||
            (
                insns[index].opcode.setsRegister() &&
                    (insns[index] as? OneRegisterInstruction)?.registerA == keyRegister
                )
    } ?: throw PatchException("Disable telemetry: $where never uses \"$ANALYTICS_DEACTIVATED_KEY\"")
    val call = (insns[use] as? ReferenceInstruction)?.reference as? MethodReference
    if (call == null ||
        call.returnType != "Ljava/lang/Boolean;" ||
        call.parameterTypes.map(CharSequence::toString) != listOf("Ljava/lang/String;") ||
        insns[use].arguments()?.getOrNull(1) != keyRegister
    ) {
        throw PatchException("Disable telemetry: $where does not read \"$ANALYTICS_DEACTIVATED_KEY\" through a Boolean get(String)")
    }
    if ((reads.single()..use).any { insns[it].location.labels.isNotEmpty() }) {
        throw PatchException("Disable telemetry: $where has a branch target between \"$ANALYTICS_DEACTIVATED_KEY\" and its read")
    }
    val moveResult = insns.getOrNull(use + 1)
    if (moveResult?.opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("Disable telemetry: $where does not keep the \"$ANALYTICS_DEACTIVATED_KEY\" value")
    }
    method.requireNoBranchTargetAt(use + 2, "the \"$ANALYTICS_DEACTIVATED_KEY\" overwrite")
    method.addInstructionChecked(
        use + 2,
        "sget-object v${(moveResult as OneRegisterInstruction).registerA}, " +
            "Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;",
    )
}
