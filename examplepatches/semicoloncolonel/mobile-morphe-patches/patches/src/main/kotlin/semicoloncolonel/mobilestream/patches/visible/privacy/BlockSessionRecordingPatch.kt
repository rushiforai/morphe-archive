package semicoloncolonel.mobilestream.patches.visible.privacy

import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// Visible 3.0.5 starts Quantum Metric from three places (the app, its newer
// code, and the home internet module). It records each session and the
// app's network calls, and is sent the phone number. All three go through
// the builder's start(), which now returns at once, and events are dropped.

private const val QUANTUM_METRIC = "Lcom/quantummetric/instrument/QuantumMetric"

// Part of blockAnalyticsPatch: runs only when its "sessionRecording" option is on.
internal val blockSessionRecordingPatch = bytecodePatch {
    execute {
        if (!isOptionOn(blockAnalyticsPatch, "sessionRecording")) return@execute
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
