package semicoloncolonel.mobilestream.patches.recgov.misc

import semicoloncolonel.mobilestream.patches.shared.misc.blockPlayReviewSheet
import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// Recreation.gov 2.2.67 asks for a rating after an order is confirmed, at
// most every 15 days. The check that shows the prompt now returns at once.

// Part of hidePromptsAndPopupsPatch: runs only when its "rating" option is on.
internal val hideRatingPromptPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    // Also stops Google Play's review sheet, where the app calls it by name.

    execute {
        if (!isOptionOn(hidePromptsAndPopupsPatch, "rating")) return@execute
        blockPlayReviewSheet()
        val count = forEachMatchingMethod(
            { it.type == "Lcom/bah/r1smobile/utilities/ExtensionsKt;" },
            { it.name == "checkShowAppReviewPrompt" && it.returnType == "V" && it.parameterTypes.size == 1 },
        ) { it.returnEarly("return-void") }
        if (count != 1) throw PatchException("Rating prompt check not found ($count)")
    }
}
