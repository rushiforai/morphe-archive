package app.template.patches.truecaller.layout

import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls
import app.template.patches.truecaller.shared.overrideReadFeatureToggles

private const val FEATURE = "truecaller.hide_after_call_contacts"

// A Heval Controls feature: the overrides apply only while it is on.
@Suppress("unused")
val hideAfterCallForContactsPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Hide after-call screen for contacts",
        description = "Hides the after-call screen for saved contacts.",
        category = TruecallerControlsCategory.CONTACTS,
    ),
    default = false,
) {
    // The after-call rules show the screen for a phonebook contact only when the user's
    // "afterCallForPbContacts" setting AND "featureShowACSAllIncoming" (incoming) or
    // "featureShowACSAllOutgoing" (outgoing) are on. Both toggles now read as off, so
    // contacts never get it. Missed calls, unknown numbers and the user's settings
    // ("afterCall", "afterCallForPbContacts", "afterCallForNonPbContacts") are untouched.
    overrideReadFeatureToggles(
        listOf("featureShowACSAllIncoming", "featureShowACSAllOutgoing"),
        false,
        FEATURE,
    )
}
