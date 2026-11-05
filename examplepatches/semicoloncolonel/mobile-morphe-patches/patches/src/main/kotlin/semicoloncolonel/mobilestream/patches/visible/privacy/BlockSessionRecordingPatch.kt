package semicoloncolonel.mobilestream.patches.visible.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.visible.shared.Constants

// Visible 3.0.5 starts Quantum Metric from three places (the app, its newer
// code, and the home internet module). It records each session and the
// app's network calls, and is sent the phone number. All three go through
// the builder's start(), which now returns at once, and events are dropped.

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
                    ((method.name == "start" && method.parameterTypes.isEmpty()) || method.name == "sendEvent")
            },
        ) { it.returnEarly("return-void") }
        if (count < 3) throw PatchException("Quantum Metric entry points not found ($count)")
    }
}
