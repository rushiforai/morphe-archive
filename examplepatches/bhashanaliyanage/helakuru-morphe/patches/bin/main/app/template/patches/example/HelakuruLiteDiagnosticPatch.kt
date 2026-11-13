package app.template.patches.example

import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_HELAKURU_LITE

/** Diagnostic only: check Morphe's XAPK processing without changing Helakuru Lite code. */
@Suppress("unused")
val helakuruLiteDiagnosticNoOpPatch = patch(
    name = "Helakuru Lite Diagnostic No-op (no app changes)",
    description = "Creates a comparison build without modifying Helakuru Lite code.",
    default = false
) {
    compatibleWith(COMPATIBILITY_HELAKURU_LITE)

    execute {
        // Intentionally empty; this keeps one patch selected for the packaging comparison.
    }
}
