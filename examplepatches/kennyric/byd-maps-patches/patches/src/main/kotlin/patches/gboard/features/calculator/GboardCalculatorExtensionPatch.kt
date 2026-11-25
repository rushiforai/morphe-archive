package patches.gboard.features.calculator

import app.morphe.patcher.patch.bytecodePatch
import patches.gboard.shared.mergeBundledExtension

internal val gboardCalculatorExtensionPatch = bytecodePatch(
    description = "Merge the Simple Calculator runtime extension into the target APK.",
) {
    execute {
        mergeBundledExtension(this, "extensions/gboard-calculator.rve")
    }
}
