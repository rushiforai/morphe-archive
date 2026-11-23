package app.template.patches.truecaller.layout

import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.hevalReturnEarly
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls

private const val FEATURE = "truecaller.hide_surveys"

// A Heval Controls feature (issue #167): applies only while it is on. The check runs each time a
// screen asks for a survey, so no restart is needed.
@Suppress("unused")
val hideSurveysPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Hide surveys",
        description = "Hides Truecaller's feedback surveys, such as \"Did we show the right name?\".",
        category = TruecallerControlsCategory.CONTACTS,
        restartRequired = false,
    ),
) {
    // 1. The survey eligibility check (frequency passed and the per-number cooldown passed) answers
    // false. It has two callers: the "has a survey for this context" check, which the legacy
    // details view's survey fragment and the Compose survey view model use, and the survey start,
    // which only logs "cooldown period is not passed yet" when it answers false. So the details
    // view, block and after-call surveys all stop. The survey text is delivered by the server, so
    // there is no string to anchor on.
    SurveyEligibilityFingerprint.method.hevalReturnEarly(FEATURE, false)
}
