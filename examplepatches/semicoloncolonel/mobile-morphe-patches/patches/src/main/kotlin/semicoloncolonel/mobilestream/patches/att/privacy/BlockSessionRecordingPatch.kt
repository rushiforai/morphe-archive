package semicoloncolonel.mobilestream.patches.att.privacy

import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// myAT&T 2026.10.1 runs Quantum Metric, which records each session and the
// app's API traffic, and is sent the AT&T login ID. Its builder's start()
// is the only way it starts, from native code or JavaScript, and it now
// returns at once. The login ID is no longer passed to it either.

private const val QUANTUM_METRIC = "Lcom/quantummetric/instrument/QuantumMetric"

// Part of blockAnalyticsPatch: runs only when its "sessionRecording" option is on.
internal val blockSessionRecordingPatch = bytecodePatch {
    execute {
        if (!isOptionOn(blockAnalyticsPatch, "sessionRecording")) return@execute
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
