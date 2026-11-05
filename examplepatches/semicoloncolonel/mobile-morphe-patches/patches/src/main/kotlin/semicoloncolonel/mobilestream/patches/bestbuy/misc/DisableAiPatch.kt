package semicoloncolonel.mobilestream.patches.bestbuy.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.bestbuy.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// ─────────────────────────────────────────────────────────────────────────────
// Disable AI (OPT-IN, default OFF).
//
// Best Buy 26.10.10 shows an AI-written summary of a product's reviews
// ("distilled" reviews) on the product page. The native product models
// expose it through getDistilledReviewSummary(), which now returns nothing,
// so the page shows the reviews without the summary.
//
// Not covered: Ask Blue, Best Buy's AI assistant, which runs in the app's
// JavaScript rather than its native code.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Hides the AI-written review summaries on product pages.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {

        val count = forEachMatchingMethod(
            { classDef -> classDef.type.startsWith("Lcom/bestbuy/") },
            { method ->
                method.name == "getDistilledReviewSummary" &&
                    method.parameterTypes.isEmpty() &&
                    method.returnType.startsWith("L") &&
                    !AccessFlags.ABSTRACT.isSet(method.accessFlags)
            },
        ) { method -> method.returnEarly("const/4 v0, 0x0\nreturn-object v0") }
        if (count == 0) throw PatchException("Best Buy review summary getters not found")
    }
}
