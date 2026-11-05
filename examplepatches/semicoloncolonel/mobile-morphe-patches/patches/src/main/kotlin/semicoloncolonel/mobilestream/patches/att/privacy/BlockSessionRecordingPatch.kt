package semicoloncolonel.mobilestream.patches.att.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.att.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// myAT&T 2026.10.1 runs Quantum Metric, which records each session and the
// app's API traffic, and is sent the AT&T login ID. Its builder's start()
// is the only way it starts, from native code or JavaScript, and it now
// returns at once. The login ID is no longer passed to it either.

private const val QUANTUM_METRIC = "Lcom/quantummetric/instrument/QuantumMetric"

@Suppress("unused")
val blockSessionRecordingPatch = bytecodePatch(
    name = "Block session recording",
    description = "Stops Quantum Metric, which records what you do in the app.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val count = forEachMatchingMethod(
            { it.type == "$QUANTUM_METRIC\$Builder;" || it.type == "$QUANTUM_METRIC;" },
            { method ->
                method.returnType == "V" &&
                    ((method.name == "start" && method.parameterTypes.isEmpty()) || method.name == "setUserEmailAddress")
            },
        ) { it.returnEarly("return-void") }
        if (count < 2) throw PatchException("Quantum Metric entry points not found ($count)")
    }
}
