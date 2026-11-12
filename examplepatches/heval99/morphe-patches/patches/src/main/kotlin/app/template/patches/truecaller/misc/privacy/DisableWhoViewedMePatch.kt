package app.template.patches.truecaller.misc.privacy

import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls
import app.template.patches.truecaller.shared.overrideReadFeatureToggles

private const val FEATURE = "truecaller.disable_who_viewed_me"

/**
 * Turns the Who viewed me feature off by reading "featureWhoViewedMe" as false in every toggle
 * resolver while the Heval Controls feature is on. The feature check (toggle and the Premium
 * WHO_VIEWED_ME entitlement, iba0.f() in 26.43.5) then answers false for all its callers: the worker
 * that reports your own profile views of others never reports, incoming profile views are not
 * processed, and the Privacy settings row and the Who viewed me deep links go away. Opt-in, because
 * it removes a feature some users (and Premium subscribers) want.
 *
 * "No profile view notifications" (Privacy defaults) is separate: it only turns off the local
 * notification about someone viewing your profile and leaves the feature running.
 */
@Suppress("unused")
val disableWhoViewedMePatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Disable Who viewed me",
        description = "Stops Truecaller telling others you viewed their profile.",
        category = TruecallerControlsCategory.PRIVACY,
        default = false,
    ),
    default = false,
) {
    overrideReadFeatureToggles(listOf("featureWhoViewedMe"), false, FEATURE)
}
