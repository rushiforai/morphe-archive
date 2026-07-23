package io.github.ilikeadofai.vocacolle.patches

import app.morphe.patcher.patch.bytecodePatch
import io.github.ilikeadofai.vocacolle.patches.shared.Constants.VOCACOLLE

@Suppress("unused")
val vocacolleCompatibilityProbePatch = bytecodePatch(
    name = "VocaColle compatibility probe",
    description = "Verifies that VocaColle 7.40.0 can be decoded, rebuilt, and signed without changing app behavior.",
    default = false
) {
    compatibleWith(VOCACOLLE)
}