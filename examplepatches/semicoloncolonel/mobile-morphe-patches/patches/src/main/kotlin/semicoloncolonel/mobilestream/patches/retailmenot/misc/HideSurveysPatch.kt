package semicoloncolonel.mobilestream.patches.retailmenot.misc

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.shared.misc.disableExpoUpdatesPatch
import semicoloncolonel.mobilestream.patches.retailmenot.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// ─────────────────────────────────────────────────────────────────────────────
// Hide surveys.
//
// RetailMeNot 10.0.6 is an Expo app whose screens are Hermes bytecode
// (version 98) in assets/index.android.bundle. Its in-app survey card is the
// SurveyLayer component, which now renders nothing. Expo updates are turned
// off so the patched bundle stays in use.
//
// Not touched:
//   AdTile        despite the name, the standard coupon card in the feeds.
//   ProductTour   a full screen in the sign-in flow; hiding it leaves a blank
//                 page after sign-in.
// ─────────────────────────────────────────────────────────────────────────────

private val hideSurveysInBundlePatch = rawResourcePatch {
    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.returnAtStart("SurveyLayer", HermesBundle.Value.NULL)
        file.writeBytes(bundle.toByteArray())
    }
}

@Suppress("unused")
val hideSurveysPatch = resourcePatch(
    name = "Hide surveys",
    description = "Removes the in-app survey card.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(hideSurveysInBundlePatch, disableExpoUpdatesPatch)
}
