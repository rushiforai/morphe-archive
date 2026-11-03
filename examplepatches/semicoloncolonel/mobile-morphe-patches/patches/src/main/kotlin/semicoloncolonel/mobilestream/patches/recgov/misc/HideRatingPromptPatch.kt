package semicoloncolonel.mobilestream.patches.recgov.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.recgov.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// Recreation.gov 2.2.67 asks for a rating after an order is confirmed, at
// most every 15 days. The check that shows the prompt now returns at once.

@Suppress("unused")
val hideRatingPromptPatch = bytecodePatch(
    name = "Hide rating prompt",
    description = "Stops the \"rate this app\" prompt after checkout.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val count = forEachMatchingMethod(
            { it.type == "Lcom/bah/r1smobile/utilities/ExtensionsKt;" },
            { it.name == "checkShowAppReviewPrompt" && it.returnType == "V" && it.parameterTypes.size == 1 },
        ) { it.returnEarly("return-void") }
        if (count != 1) throw PatchException("Rating prompt check not found ($count)")
    }
}
