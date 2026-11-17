package app.template.patches.sofascore.misc.screen

import app.morphe.patcher.Fingerprint
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.requireNoBranchTargetAt
import app.template.patches.sofascore.controls.SOFASCORE_SCREEN_CALM
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.sofascoreControls
import app.template.patches.sofascore.spoiler.EVENT_ACTIVITY

internal val KEEP_SCREEN_ON = HevalFeature(
    id = "sofascore.keep_screen_on",
    name = "Keep screen on during matches",
    description = "Stops the screen from turning off while a match page is open.",
    category = SofascoreControlsCategory.MATCH_PAGE,
    default = false,
    icon = "eye",
)

// EventActivity is the manifest-declared match page and keeps its name; onResume()V and onPause()V
// are framework overrides, so name, class and descriptor are all stable.
internal object EventActivityOnResumeFingerprint : Fingerprint(
    definingClass = EVENT_ACTIVITY,
    name = "onResume",
    returnType = "V",
    parameters = listOf(),
)

internal object EventActivityOnPauseFingerprint : Fingerprint(
    definingClass = EVENT_ACTIVITY,
    name = "onPause",
    returnType = "V",
    parameters = listOf(),
)

// A Heval Controls feature, off by default: the match page sets FLAG_KEEP_SCREEN_ON on its window in
// onResume while the switch is on and clears it in onPause, so a change applies the next time the page
// resumes. No app code sets the flag itself.
@Suppress("unused")
val keepScreenOnPatch = sofascoreControls.featurePatch(
    KEEP_SCREEN_ON,
    name = "Keep screen on",
    description = "Keeps the screen on while a match page is open.",
    default = false,
) {
    classDefBy(SOFASCORE_SCREEN_CALM)

    // Validate both sites before the first edit.
    val onResume = EventActivityOnResumeFingerprint.method
    val onPause = EventActivityOnPauseFingerprint.method
    onResume.requireNoBranchTargetAt(0, "Keep screen on (onResume)")
    onPause.requireNoBranchTargetAt(0, "Keep screen on (onPause)")

    // p0 is the activity; /range takes it at any register index.
    onResume.addInstructionsChecked(
        0,
        "invoke-static/range {p0 .. p0}, $SOFASCORE_SCREEN_CALM->keepScreenOn(Landroid/app/Activity;)V",
    )
    onPause.addInstructionsChecked(
        0,
        "invoke-static/range {p0 .. p0}, $SOFASCORE_SCREEN_CALM->releaseScreen(Landroid/app/Activity;)V",
    )
}
