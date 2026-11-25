package app.salaat.patches.telemetry

import app.salaat.patches.integrity.neutralizeSignatureCheckPatch
import app.salaat.patches.shared.Constants.COMPATIBILITY_SALAAT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disablePartnerSdksPatch = bytecodePatch(
    name = "Disable Partner Data-Collection SDKs",
    description = "Disables the bundled OpenSignal and CellRebel network-measurement SDKs, which " +
        "collect location, cell and network telemetry in the background. Forces each wrapper's " +
        "eligibility check to return false so the SDKs never initialize. Also strips their " +
        "background components from the manifest.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SALAAT)

    dependsOn(
        neutralizeSignatureCheckPatch,
        removePartnerSdkComponentsPatch,
    )

    execute {
        // Force each SDK wrapper's eligibility gate to report "not eligible" so init never runs,
        // regardless of the remote enable_* flag or the user's partners-reporting toggle.
        listOf(
            OpensignalInitFingerprint,
            CellRebelInitFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """,
            )
        }
    }
}
