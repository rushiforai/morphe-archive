package app.template.patches.truecaller.layout

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.truecaller.shared.overrideReadFeatureToggles

@Suppress("unused")
val hideAfterCallForContactsPatch = bytecodePatch(
    name = "Hide after-call screen for contacts",
    description = "Hides the after-call screen for saved contacts.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // The after-call rules show the screen for a phonebook contact only when the user's
        // "afterCallForPbContacts" setting AND "featureShowACSAllIncoming" (incoming) or
        // "featureShowACSAllOutgoing" (outgoing) are on. Both toggles now read as off, so
        // contacts never get it. Missed calls, unknown numbers and the user's settings
        // ("afterCall", "afterCallForPbContacts", "afterCallForNonPbContacts") are untouched.
        overrideReadFeatureToggles(
            listOf("featureShowACSAllIncoming", "featureShowACSAllOutgoing"),
            false,
        )
    }
}
