package semicoloncolonel.mobilestream.patches.verizon.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.verizon.shared.Constants

// My Verizon 22.2.5 runs Quantum Metric, which records each session and the
// app's API traffic, and is sent the account's email address and user ID.
// Its builder's start() is the only way it starts, and it now returns at
// once. The email address and user ID are no longer passed to it either.

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
                method.returnType == "V" && (
                    (method.name == "start" && method.parameterTypes.isEmpty()) ||
                        method.name == "setUserEmailAddress" ||
                        method.name == "setUserIdentifier"
                    )
            },
        ) { it.returnEarly("return-void") }
        if (count < 3) throw PatchException("Quantum Metric entry points not found ($count)")
    }
}
