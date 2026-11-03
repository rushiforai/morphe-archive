package semicoloncolonel.mobilestream.patches.tlife.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.tlife.shared.Constants

// T-Life 12.3.1 runs Quantum Metric, which records each session (screens,
// taps, and typing) and is sent the phone number, email, billing account
// number, and device ID. It is never started, and its event and user calls
// return at once.

private const val QUANTUM_METRIC = "Lcom/quantummetric/instrument/QuantumMetric"

@Suppress("unused")
val blockSessionRecordingPatch = bytecodePatch(
    name = "Block session recording",
    description = "Stops Quantum Metric, which records what you do in T-Life and is sent your " +
        "phone number, email, and billing account number.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val count = forEachMatchingMethod(
            { it.type == "$QUANTUM_METRIC;" || it.type == "$QUANTUM_METRIC\$Builder;" },
            { method ->
                method.returnType == "V" &&
                    method.name in setOf("start", "sendEvent", "setUserIdentifier", "resume")
            },
        ) { it.returnEarly("return-void") }
        if (count < 3) throw PatchException("Quantum Metric entry points not found ($count)")
    }
}
