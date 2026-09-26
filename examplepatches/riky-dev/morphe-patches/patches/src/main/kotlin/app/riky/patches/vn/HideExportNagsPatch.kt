package app.riky.patches.vn

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_VN

@Suppress("unused")
val hideExportNagsPatch = bytecodePatch(
    name = "Hide export nags",
    description = "Hides the post-export review dialog and the inspiring-tips guidance banner.",
) {
    compatibleWith(COMPATIBILITY_VN)

    execute {
        // Skip DialogFragment.show for ReviewEvaluateDialog (instruction after the tag string).
        val reviewShowIndex = ExportReviewDialogFingerprint.stringMatches.first().index + 1
        ExportReviewDialogFingerprint.method.removeInstruction(reviewShowIndex)

        // Force showGuidanceBanner = false in ExportAdSectionConfig constructor.
        ExportGuidanceBannerFingerprint.method.addInstructions(
            0,
            """
                const/4 p5, 0x0
            """
        )
    }
}
