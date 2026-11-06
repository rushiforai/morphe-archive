package semicoloncolonel.mobilestream.patches.mlb.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.mlb.shared.Constants

// MLB 26.21.0.49 shows Qualtrics pop-ups: surveys, and a prompt whose
// positive button opens Google Play's rating sheet. Qualtrics decides on its
// servers when to show them and opens them through its display calls. Every
// display call now reports that nothing was shown, and Qualtrics's own
// setting that allows the Play rating sheet is off.

private const val QUALTRICS = "Lcom/qualtrics/digital/Qualtrics;"

internal object NativeAppReviewsFingerprint : Fingerprint(
    definingClass = "Lcom/qualtrics/digital/Properties;",
    name = "shouldDisplayNativeAppReviews",
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val hideSurveysPatch = bytecodePatch(
    name = "Hide surveys and rating prompt",
    description = "Stops the Qualtrics surveys and the Play Store rating pop-up.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val qualtrics = mutableClassDefBy(QUALTRICS)
        val display = qualtrics.methods.filter {
            it.name in setOf("display", "displayIntercept", "displayTarget") &&
                it.returnType == "Z" && it.implementation != null
        }
        if (display.isEmpty()) throw PatchException("Qualtrics display methods not found")
        display.forEach { it.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }

        NativeAppReviewsFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
